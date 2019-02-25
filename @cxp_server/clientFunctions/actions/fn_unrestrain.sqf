#include "\cxp_server\script_macros.hpp"
/*
    File: fn_unrestrain.sqf
    Author:
    Description:
*/
private _unit = param [0,ObjNull,[ObjNull]];

if (isNull _unit) exitWith {}; //Error check?

_unit setVariable ["restrained",false,true];
_unit setVariable ["Escorting",false,true];
_unit setVariable ["transporting",false,true];
_unit setVariable ["tied", nil, true];
_unit setVariable ["gagged",false,true];
_unit setVariable ["blindfolded", nil, true];
detach _unit;

[_unit,"handcuffs",20,1] remoteExec ["cxp_fnc_say3D",RANY];
[0,"STR_NOTF_Unrestrain",true,[_unit getVariable ["realname",name _unit], profileName]] remoteExecCall ["cxp_fnc_broadcast",RANY];
