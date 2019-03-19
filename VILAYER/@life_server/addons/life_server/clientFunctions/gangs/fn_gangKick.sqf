#include "\life_server\script_macros.hpp"
/*
    File: fn_gangKick.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Kicks a player from your gang.
*/
private ["_unit","_unitID","_members"];
disableSerialization;

if ((lbCurSel 2621) isEqualTo -1) exitWith {hint localize "STR_GNOTF_SelectKick"};
_unit = call compile format ["%1",CONTROL_DATA(2621)];

if (isNull _unit) exitWith {}; //Bad unit?
if (_unit == player) exitWith {hint localize "STR_GNOTF_KickSelf"};

_unitID = getPlayerUID _unit;
_members = group player getVariable "gang_members";
if (isNil "_members") exitWith {};
if (!(_members isEqualType [])) exitWith {};

_members = _members - [_unitID];
group player setVariable ["gang_members",_members,true];

[_unit,group player] remoteExec ["CXPSV_fnc_clientGangKick",_unit]; //Boot that bitch!

if (cxp_CXPHC_isActive) then {
    [4,group player] remoteExec ["CXPHC_fnc_updateGang",CXP_HC]; //Update the database.
} else {
    [4,group player] remoteExec ["CXPSV_fnc_updateGang",RSERV]; //Update the database.
};

[] call cxp_fnc_gangMenu;