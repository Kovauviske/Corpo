#include "\cxp_server\script_macros.hpp"
/*
    File: fn_robAction.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Casperento
    Description:
    Starts the robbing process?
*/
private _target = cursorObject;

//Error checks
if (isNull _target) exitWith {};
if (!isPlayer _target) exitWith {};

if (animationState _unit != "Incapacitated") exitWith {
	hint "Seu alvo deve estar nocauteado (SHIFT + G) !";
};

if (_target getVariable ["robbed",false]) exitWith {};
[player] remoteExecCall ["cxp_fnc_robPerson",_target];
_target setVariable ["robbed",true,true];