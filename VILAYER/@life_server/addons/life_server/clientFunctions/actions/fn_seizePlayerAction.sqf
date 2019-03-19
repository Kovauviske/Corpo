#include "\life_server\script_macros.hpp"
/*
    File: fn_seizePlayerAction.sqf
    Author: Bryan "Tonic" Boardwine

	Modified : Casperento
	
    Description:
    Starts the seize process..
*/
params [
    ["_unit",objNull,[objNull]]
];
if (isNull _unit) exitWith {};
if (side _unit != civilian) exitWith {hint"Você não pode apreender armas das autoridades policiais/médicas. Caso esteja em uma situação atípica, contate a um administrador e reporte o jogador !"};
sleep 2;
if (player distance _unit > 5 || !alive player || !alive _unit) exitWith {hint localize "STR_NOTF_CannotSeizePerson"};

switch (playerSide) do {
	case west : {
		[player] remoteExec ["cxp_fnc_seizeClient",_unit];
	};
	case independent : {
		[player] remoteExec ["cxp_fnc_seizeClientMed",_unit];
	};
};

cxp_action_inUse = false;