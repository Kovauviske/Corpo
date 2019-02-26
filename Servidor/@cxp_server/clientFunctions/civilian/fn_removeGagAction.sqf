/*
    File: fn_removeGagAction.sqf
    Author: Lowheartrate & Panda
    Modified: Casperento
*/
private _unit = cursorTarget;
if (isNull _unit) exitWith {};
if !(_unit getVariable "gagged") exitWith {};
if (player == _unit) exitWith {};
if !(isPlayer _unit) exitWith {};
_unit setVariable ["gagged",false,true];
[true,"fitaadesiva",1] call cxp_fnc_handleInv;