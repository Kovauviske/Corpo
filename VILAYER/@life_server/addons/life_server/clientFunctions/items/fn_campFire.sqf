#include "\life_server\script_macros.hpp"
/*
    File: fn_campFire.sqf
    Author: Fresqo

		Modified : Casperento

    Description:
		creates a camp fire for a period so player can cook food.
		Code Optimization && New Features by Casperento
*/
private _quantiMin = CXP_SETTINGS(getNumber,"quantidade_min_madPfog");
if (cxp_fire) exitWith {hint "Voce ja tem uma fogueira montada em algum lugar."};
if (cxp_inv_firewood < _quantiMin) exitWith {hint format["Você precisa ter o item 'Madeira para fogueira(%1x)' em seu inventário !",_quantiMin]};

private _fogueiraTimer = CXP_SETTINGS(getNumber,"fogueira_timer");
private _fogueiraTimerSTR = _fogueiraTimer / 60;
private _fgTSTR = str _fogueiraTimerSTR;
private _fire = "Land_Campfire_F" createVehicle [0,0,0];
_fire setpos (player modelToWorld [0,2,0]);

if (isNull _fire) exitWith {};

[false,"campFire",1] call cxp_fnc_handleInv;
[false,"firewood",_quantiMin] call cxp_fnc_handleInv;
hint format["Voce montou uma fogueira, agora voce ja pode cozinhar carnes cruas. Esta fogueira sera deletada do mapa daqui %1 min(s)...",_fgTSTR];
cxp_fire = true;

sleep _fogueiraTimer;
if !(isNull _fire) then {
	deleteVehicle _fire;
};

waitUntil {!alive _fire || !isNull _fire};
cxp_fire = false;
