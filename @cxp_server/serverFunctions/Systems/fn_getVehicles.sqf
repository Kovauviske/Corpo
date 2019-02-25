#include "\cxp_server\script_macros.hpp"
/*
    File: fn_getVehicles.sqf
    Author: Bryan "Tonic" Boardwine

    Modified : Casperento

    Description:
    Sends a request to query the database information and returns vehicles.
*/
private _pid = param [0,"",[""]];
private _side = param [1,sideUnknown,[west]];
private _type = param [2,"",[""]] call BIS_fnc_param;
private _unit = param [3,objNull,[objNull]];

//Error checks
if (_pid isEqualTo "" || _side isEqualTo sideUnknown || _type isEqualTo "" || isNull _unit) exitWith {
    if !(isNull _unit) then {
        [[]] remoteExec ["cxp_fnc_impoundMenu",(owner _unit)];
    };
};

_unit = owner _unit;
_side = switch (_side) do {
    case west:{"cop"};
    case civilian: {"civ"};
    case independent: {"med"};
    default {"Error"};
};

if (_side == "Error") exitWith {
    [[]] remoteExec ["cxp_fnc_impoundMenu",(owner _unit)];
};

private _query = format ["SELECT id, side, classname, type, pid, alive, active, plate, color, insure FROM vehicles WHERE pid='%1' AND alive='1' AND active='0' AND side='%2' AND type='%3'",_pid,_side,_type];

private _tickTime = diag_tickTime;
private _queryResult = [_query,2,true] call CXPDB_fnc_asyncCall;

if (EXTSQLCXP_STNG(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log "------------- Client Query Request -------------";
    diag_log format ["QUERY: %1",_query];
    diag_log format ["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
    diag_log format ["Result: %1",_queryResult];
    diag_log "------------------------------------------------";
};

if (_queryResult isEqualType "") exitWith {
    [[]] remoteExec ["cxp_fnc_impoundMenu",(owner _unit)];
};

[_queryResult] remoteExec ["cxp_fnc_impoundMenu",_unit];
