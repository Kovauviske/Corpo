#include "\cxp_server\script_macros.hpp"
/*
    File: fn_wantedFetch.sqf
    Author: Bryan "Tonic" Boardwine"
    Database Persistence By: ColinM
    Assistance by: Paronity
    Stress Tests by: Midgetgrimm
    Modified : Casperento
    Description:
    Displays wanted list information sent from the server.
*/
params [
    ["_ret",objNull,[objNull]],
    ["_qrType","",[""]]
];

private _inStatement = "";
private _list = [];
private _units = [];

{
    if (side _x isEqualTo civilian) then {_units pushBack (getPlayerUID _x)};
    false
} count playableUnits;

if (count _units isEqualTo 0 && !(isNull _ret)) exitWith {[_list] remoteExec ["cxp_fnc_wantedList",_ret];};

{
    if (count _units > 1) then {
        if (_inStatement isEqualTo "") then {
            _inStatement = "'" + _x + "'";
        } else {
            _inStatement = _inStatement + ", '" + _x + "'";
        };
    } else {
        _inStatement = _x;
    };
} forEach _units;

private _query = "";
if (_qrType isEqualTo "bounty") then {
    _query = format ["SELECT wantedID, wantedName, wantedBounty FROM wanted WHERE active='1' AND wantedID in (%1)",_inStatement];
} else {
    _query = format ["SELECT wantedID, wantedName FROM wanted WHERE active='1' AND wantedID in (%1)",_inStatement];
};
private _queryResult = [_query,2,true] call CXPDB_fnc_asyncCall;

if (EXTSQLCXP_STNG(getNumber,"DebugMode") isEqualTo 1) then {diag_log format ["Query: %1",_query];};

{
    _list pushBack _x;
    false
} count _queryResult;

// Usado pelos clientes
if !(isNull _ret) then {
    [_list] remoteExec ["cxp_fnc_wantedList",_ret];
} else {
    // Usado pelo servidor
    _list
};