#include "\life_server\script_macros.hpp"
/*
    File: fn_hudSetup.sqf
    Author: Casperento

    Description:
    Inicializa procedimeto da HUD do player
*/
disableSerialization;

"cxp_playerHUD" cutRsc ["playerHUD","PLAIN",0.25,false];
[] call cxp_fnc_hudUpdate;

[] spawn {
	for "_i" from 0 to 1 step 0 do {
		_dano = damage player;
		waitUntil {(damage player) != _dano};
		[] call cxp_fnc_hudUpdate;
		if !(player getVariable ["Revive",false]) then {
			"cxp_playerHUD" cutText ["","PLAIN",0.5];
			waitUntil {(player getVariable ["Revive",false]) && !(cxp_respawned)};
			"cxp_playerHUD" cutRsc ["playerHUD","PLAIN",0.25,false];
			[] call cxp_fnc_hudUpdate;
		}; // morreu ? espera ser revivido para recarregar a HUD
	};
};