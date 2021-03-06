#include "\cxp_server\script_macros.hpp"
/*
    File: fn_gangLeave.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    32 hours later...
*/
if (getPlayerUID player isEqualTo (group player getVariable "gang_owner")) exitWith {hint localize "STR_GNOTF_LeaderLeave"};

private _unitID = getPlayerUID player;
private _members = group player getVariable "gang_members";
if (isNil "_members") exitWith {};
if (!(_members isEqualType [])) exitWith {};

_members = _members - [_unitID];
group player setVariable ["gang_members",_members,true];

[player,group player] remoteExec ["CXPSV_fnc_clientGangLeft",player];

if (cxp_CXPHC_isActive) then {
    [4,group player] remoteExec ["CXPHC_fnc_updateGang",CXP_HC]; //Update the database.
} else {
    [4,group player] remoteExec ["CXPSV_fnc_updateGang",RSERV]; //Update the database.
};

closeDialog 0;
