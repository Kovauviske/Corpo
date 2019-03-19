#include "\life_server\script_macros.hpp"
/*
    File: fn_queryRequest.sqf
    Author: Bryan "Tonic" Boardwine

    Modified : Casperento

    Description:
    Handles the incoming request and sends an asynchronous query
    request to the database.

    Return:
    ARRAY - If array has 0 elements it should be handled as an error in client-side files.
    STRING - The request had invalid handles or an unknown error and is logged to the RPT.
*/
params [
    "_uid",
    ["_side",sideUnknown,[civilian]],
    ["_ownerID",objNull,[objNull]]
];

if (isNull _ownerID) exitWith {};
_ownerID = owner _ownerID;

private _query = switch (_side) do {
    // West - 11 entries returned - 0 a 10
    case west: {format ["SELECT pid, name, cash, bankacc, donorlevel, cop_licenses, coplevel, cop_gear, blacklist, cop_stats, playtime FROM players WHERE pid='%1'",_uid];};
    // Civilian - 15 entries returned - 0 a 14
    case civilian: {format ["SELECT pid, name, cash, bankacc, donorlevel, civ_licenses, arrested, civ_gear, civ_stats, civ_alive, civ_position, playtime, gdonorlevel, blacklist, vipExtra, alvo_BH FROM players WHERE pid='%1'",_uid];};
    // Independent - 11 entries returned - 0 a 10
    case independent: {format ["SELECT pid, name, cash, bankacc, donorlevel, med_licenses, mediclevel, med_gear, med_stats, playtime, blacklist FROM players WHERE pid='%1'",_uid];};
};

private _tickTime = diag_tickTime;
private _queryResult = [_query,2] call CXPDB_fnc_asyncCall;

if (EXTSQLCXP_STNG(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log "------------- Client Query Request -------------";
    diag_log format ["QUERY: %1",_query];
    diag_log format ["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
    diag_log format ["Result: %1",_queryResult];
    diag_log "------------------------------------------------";
};

if (_queryResult isEqualType "") exitWith {
    [true] remoteExecCall ["CXPSKT_fnc_insertPlayerInfo",_ownerID];
};

if (count _queryResult isEqualTo 0) exitWith {
    [true] remoteExecCall ["CXPSKT_fnc_insertPlayerInfo",_ownerID];
};

//Blah conversion thing from a2net->extdb
private _tmp = _queryResult select 2;
_queryResult set[2,[_tmp] call CXPDB_fnc_numberSafe];
_tmp = _queryResult select 3;
_queryResult set[3,[_tmp] call CXPDB_fnc_numberSafe];

//Parse licenses (sempre index 5)
private _new = [(_queryResult select 5)] call CXPDB_fnc_mresToArray;
if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
_queryResult set[5,_new];

//Convert tinyint to boolean
private _old = _queryResult select 5;
for "_i" from 0 to (count _old)-1 do {
    _data = _old select _i;
    _old set[_i,[_data select 0, ([_data select 1,1] call CXPDB_fnc_bool)]];
};

_queryResult set[5,_old];

_new = [(_queryResult select 7)] call CXPDB_fnc_mresToArray;
if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
_queryResult set[7,_new];

//Parse data for specific side.
switch (_side) do {
    case west: {
        _queryResult set[8,([_queryResult select 8,1] call CXPDB_fnc_bool)];

        //Parse Stats
        _new = [(_queryResult select 9)] call CXPDB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _queryResult set[9,_new];

        //Playtime
        _new = [(_queryResult select 10)] call CXPDB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _index = CXPSV_fnc_playtime_values_request find [_uid, _new];
        if (_index != -1) then {
            CXPSV_fnc_playtime_values_request set[_index,-1];
            CXPSV_fnc_playtime_values_request = CXPSV_fnc_playtime_values_request - [-1];
            CXPSV_fnc_playtime_values_request pushBack [_uid, _new];
        } else {
            CXPSV_fnc_playtime_values_request pushBack [_uid, _new];
        };
        if !(isNil {(_new select 0)}) then {[_uid,(_new select 0)] call CXPSV_fnc_setPlayTime;};
    };

    case civilian: {
        _queryResult set[6,([_queryResult select 6,1] call CXPDB_fnc_bool)];

        //Parse Stats
        _new = [(_queryResult select 8)] call CXPDB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _queryResult set[8,_new];

        //Position
        _queryResult set[9,([_queryResult select 9,1] call CXPDB_fnc_bool)];
        _new = [(_queryResult select 10)] call CXPDB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _queryResult set[10,_new];

        //Playtime
        _new = [(_queryResult select 11)] call CXPDB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _index = CXPSV_fnc_playtime_values_request find [_uid, _new];
        if (_index != -1) then {
            CXPSV_fnc_playtime_values_request set[_index,-1];
            CXPSV_fnc_playtime_values_request = CXPSV_fnc_playtime_values_request - [-1];
            CXPSV_fnc_playtime_values_request pushBack [_uid, _new];
        } else {
            CXPSV_fnc_playtime_values_request pushBack [_uid, _new];
        };
		if !(isNil {(_new select 2)}) then {[_uid,(_new select 2)] call CXPSV_fnc_setPlayTime;};

        // Colocando player na lista global de procurados dos BHs novamente, caso precise (by Casperento)
        private _listaProcB = [] call cxp_fnc_wantedFetch;
        private _procuArr = [];
        {
            if ((_x select 0) isEqualTo _uid) exitWith {
                _procuArr pushBack _x;
                {if (getPlayerUID _x isEqualTo _uid) exitWith {_x setVariable ["procurado",true,true];};} forEach allPlayers;
            };
        } forEach _listaProcB;
		
        // Add player na lista de bountys novamente se necessario
        if (_queryResult select 15 isEqualTo 1) then {
            if (count _procuArr > 0) then {
                {if (getPlayerUID _x isEqualTo _uid) exitWith {_x setVariable ["alvo_recompensa",true,true];};} forEach allPlayers;
                [_procuArr,"add",_side] call cxp_fnc_checarGlobal;
            } else {
                [_uid,_side,0,9] call CXPDB_fnc_updatePartial;
            };
        };

        /* Make sure nothing else is added under here */
        _houseData = _uid spawn CXPSV_fnc_fetchPlayerHouses;
        waitUntil {scriptDone _houseData};
        _queryResult pushBack (missionNamespace getVariable [format ["houses_%1",_uid],[]]);
        _gangData = _uid spawn CXPSV_fnc_queryPlayerGang;
        waitUntil{scriptDone _gangData};
        _queryResult pushBack (missionNamespace getVariable [format ["gang_%1",_uid],[]]);
    };

    case independent: {
        //Parse Stats
        _new = [(_queryResult select 8)] call CXPDB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _queryResult set[8,_new];

        //Playtime
        _new = [(_queryResult select 9)] call CXPDB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _index = CXPSV_fnc_playtime_values_request find [_uid, _new];
        if !(_index isEqualTo -1) then {
            CXPSV_fnc_playtime_values_request set[_index,-1];
            CXPSV_fnc_playtime_values_request = CXPSV_fnc_playtime_values_request - [-1];
            CXPSV_fnc_playtime_values_request pushBack [_uid, _new];
        } else {
            CXPSV_fnc_playtime_values_request pushBack [_uid, _new];
        };
        if !(isNil {(_new select 1)}) then {[_uid,(_new select 1)] call CXPSV_fnc_setPlayTime;};
    };
};

publicVariable "CXPSV_fnc_playtime_values_request";

_keyArr = missionNamespace getVariable [format ["%1_KEYS_%2",_uid,_side],[]];
_queryResult pushBack _keyArr;

_queryResult remoteExec ["CXPSKT_fnc_requestReceived",_ownerID];
