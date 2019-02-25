#include "\cxp_server\script_macros.hpp"
/*
	File: fn_alvoKilled.sqf
	Author: Casperento
	Description:
	Da a recompensa partida para o BountyHunter
*/
params [
	["_alvo",objNull,[objNull]]
];

if !(getPlayerUID _alvo in cxp_bounty_uid) exitWith {};

titleText ["Você matou seu alvo recompensa...","PLAIN"];

// Da recompensa para o BountyHunter e seus amigos(talvez)
[getPlayerUID _alvo,_alvo,player,true] remoteExecCall ["cxp_fnc_wantedBountyCiv",RSERV];

// remove alvo da lista de procurados
if (cxp_CXPHC_isActive) then {
    [getPlayerUID _alvo] remoteExecCall ["CXPHC_fnc_wantedRemove",CXP_HC];
} else {
    [getPlayerUID _alvo] remoteExecCall ["cxp_fnc_wantedRemove",RSERV];
};