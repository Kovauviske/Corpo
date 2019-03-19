/*
	File: fn_untie.sqf
	Author: ?
	Modified: Casperento
*/
private _unit = cursorTarget;

if ((cxp_action_inUse) || (player getVariable ["tied", false]) || (player getVariable ["restrained", false])) exitWith { 
	hint "Voce nao pode fazer isso.";
}; 

if (isNull _unit || !(_unit getVariable ["blindfolded", false])) exitWith {};

_unit setVariable ["blindfolded",nil,true];
_unit setVariable ["sequestrado",false,true];
[true,"blindfold",1] call cxp_fnc_handleInv;