/*
    File: fn_wantedAdd.sqf
    Author: Bryan "Tonic" Boardwine"
    Database Persistence By: ColinM
    Assistance by: Paronity
    Stress Tests by: Midgetgrimm
    Modified: Casperento
    Description:
    Adds or appends a unit to the wanted list.
*/
params [
    ["_uid","",[""]],
    ["_name","",[""]],
    ["_type","",[""]],
    ["_customBounty",-1,[0]]
];

if (_uid isEqualTo "" || {_type isEqualTo ""} || {_name isEqualTo ""}) exitWith {}; //Bad data passed.

//What is the crime?
private _crimesConfig = getArray(missionConfigFile >> "CxpBasic_Settings" >> "crimes");
private _index = [_type,_crimesConfig] call CXPSV_fnc_index;

if (_index isEqualTo -1) exitWith {};

_type = [_type, parseNumber ((_crimesConfig select _index) select 1)];

if (count _type isEqualTo 0) exitWith {}; //Not our information being passed...

//Is there a custom bounty being sent? Set that as the pricing.
if !(_customBounty isEqualTo -1) then {_type set[1,_customBounty];};

//Search the wanted list to make sure they are not on it.
private _query = format ["SELECT wantedID FROM wanted WHERE wantedID='%1'",_uid];
private _queryResult = [_query,2,true] call CXPDB_fnc_asyncCall;
private _val = [_type select 1] call CXPDB_fnc_numberSafe;
private _number = _type select 0;

// Determina que o player esta na lista de procurados
private _player = objNull;
{
    if (getPlayerUID _x isEqualTo _uid) exitWith {
        _player = _x;
        _x setVariable ["procurado",true,true];
    };
} forEach allPlayers;

// Retira licença de BH entrar na lista de procurado
if (!isNull _player && _player getVariable ["clienteBounty",false]) then {[name _player,_player] remoteExecCall ["cxp_fnc_removerBountyLic",_player];};

if !(count _queryResult isEqualTo 0) then {
    _query = format ["SELECT wantedCrimes, wantedBounty FROM wanted WHERE wantedID='%1'",_uid];
    _queryResult = [_query,2] call CXPDB_fnc_asyncCall;
    _pastCrimes = [_queryResult select 0] call CXPDB_fnc_mresToArray;

    if (_pastCrimes isEqualType "") then {_pastCrimes = call compile format ["%1", _pastCrimes];};
    _pastCrimes pushBack _number;
    _pastCrimes = [_pastCrimes] call CXPDB_fnc_mresArray;
    _query = format ["UPDATE wanted SET wantedCrimes = '%1', wantedBounty = wantedBounty + '%2', active = '1' WHERE wantedID='%3'",_pastCrimes,_val,_uid];
    [_query,1] call CXPDB_fnc_asyncCall;
} else {
    _crime = [_type select 0];
    _name = [_name] call CXPDB_fnc_mresString;
    _crime = [_crime] call CXPDB_fnc_mresArray;
    _query = format ["INSERT INTO wanted (wantedID, wantedName, wantedCrimes, wantedBounty, active) VALUES('%1', '%2', '%3', '%4', '1')",_uid,_name,_crime,_val];
    [_query,1] call CXPDB_fnc_asyncCall;
};
