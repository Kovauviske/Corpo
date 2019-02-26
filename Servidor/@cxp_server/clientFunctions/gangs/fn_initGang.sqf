#include "\cxp_server\script_macros.hpp"
/*
    File: fn_initGang.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Casperento
    Description:
    Main initialization for gangs.
*/
if !(playerSide isEqualTo civilian) exitWith {}; //What in the hell?
if (count cxp_gangData isEqualTo 0) exitWith {}; //Dafuq?

[player] join (createGroup civilian);
private _wait = round(random(8));
sleep _wait;

//Loop through to make sure there is not a group already created with the gang.
private "_group";
private _exitLoop = false;
{
    _groupName = _x getVariable "gang_name";
    if !(isNil "_groupName") then {
        _groupOwner = _x getVariable ["gang_owner",""];
        _groupID = _x getVariable "gang_id";
        if (_groupOwner isEqualTo "" || isNil "_groupID") exitWith {}; //Seriously?
        if ((cxp_gangData select 0) isEqualTo _groupID && {(cxp_gangData select 1) isEqualTo _groupOwner}) exitWith {_group = _x; _exitLoop = true;};
    };
} forEach allGroups;

if !(isNil "_group") then {
    [player] join _group;
    if ((cxp_gangData select 1) isEqualTo getPlayerUID player) then {
        _group selectLeader player;
        [player,_group] remoteExec ["CXPSV_fnc_clientGangLeader",(units _group)];
    };
} else {
    _group = group player;
    _group setVariable ["gang_id",(cxp_gangData select 0),true];
    _group setVariable ["gang_owner",(cxp_gangData select 1),true];
    _group setVariable ["gang_name",(cxp_gangData select 2),true];
    _group setVariable ["gang_maxMembers",(cxp_gangData select 3),true];
    _group setVariable ["gang_bank",(cxp_gangData select 4),true];
    _group setVariable ["gang_members",(cxp_gangData select 5),true];
};
