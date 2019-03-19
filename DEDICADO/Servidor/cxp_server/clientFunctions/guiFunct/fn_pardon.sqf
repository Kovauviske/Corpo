#include "\cxp_server\script_macros.hpp"
/*
    File: fn_pardon.sqf
    Author: Bryan "Tonic" Boardwine

    Modified : Casperento

    Description:
    Pardons the selected player.
*/
disableSerialization;
if !(playerSide isEqualTo west) exitWith {};

private _list = CONTROL(2400,2402);
private _data = lbData[2401,(lbCurSel 2401)];
_data = call compile format ["%1", _data];
if (isNil "_data") exitWith {};
if !(_data isEqualType []) exitWith {};
if (_data isEqualTo []) exitWith {};

if (cxp_CXPHC_isActive) then {
    [(_data select 0)] remoteExecCall ["CXPHC_fnc_wantedRemove",CXP_HC];
} else {
    [(_data select 0)] remoteExecCall ["cxp_fnc_wantedRemove",RSERV];
};
