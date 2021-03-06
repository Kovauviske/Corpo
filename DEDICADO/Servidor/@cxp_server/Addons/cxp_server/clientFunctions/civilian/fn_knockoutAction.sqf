#include "\cxp_server\script_macros.hpp"
/*
    File: fn_knockoutAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Knocks out the target.
*/
private "_target";
_target = param [0,objNull,[objNull]];

//Error checks
if (isNull _target) exitWith {};
if (!isPlayer _target) exitWith {};
if (player distance _target > 4) exitWith {};
cxp_knockout = true;
[player,"AwopPercMstpSgthWrflDnon_End2"] remoteExecCall ["cxp_fnc_animSync",RCLIENT];
sleep 0.08;
[_target,profileName] remoteExec ["cxp_fnc_knockedOut",_target];

sleep 3;
cxp_knockout = false;
