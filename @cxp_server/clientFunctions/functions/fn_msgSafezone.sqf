/*
	File: fn_msgSafezone.sqf
	Author: Casperento
	Description:
	Funcao dos triggers das safezones!
*/
params [
	["_type",0,[0]]
];
switch (_type) do { 
	case 0: {
		if !(playerSide isEqualto independent) then {player allowDamage true;};
		cxp_safezone = false;
		["SafezoneNotifyOut",[format[(localize "STR_SAFEZONE_NTFY_Out")]]] call BIS_fnc_showNotification;
	};
	case 1: {
		if !(playerSide isEqualto independent) then {player allowDamage false;};
		cxp_safezone = true;
		["SafezoneNotifyIn",[format[(localize "STR_SAFEZONE_NTFY_In")]]] call BIS_fnc_showNotification;
	};
};