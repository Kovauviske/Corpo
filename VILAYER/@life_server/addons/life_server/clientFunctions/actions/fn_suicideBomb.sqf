#include "\life_server\script_macros.hpp"
/*
    REMOVE KEBAB
    Author: Casperento
*/
if (playerSide != civilian) exitWith {hint "Medicos/Policiais nao podem se explodir com este colete."};
if (vehicle player != player) exitWith {hint "Voce nao pode se explodir dentro de um veiculo !"};
if (cxp_safezone) exitWith {hint "Voce nao pode se explodir em uma zona segura !"};
if (cxp_isSuicide) exitWith {};
if ((player getVariable "restrained")) exitWith {cxp_isSuiciding = false;}; //He's restrained.
cxp_isSuiciding = true;

[player, "removeKebab", 300, 1] remoteExec ["cxp_fnc_say3D",RANY];
sleep 8;

if (vehicle player != player) exitWith {hint "Voce nao pode se explodir dentro de um veiculo !"};
if (cxp_safezone) exitWith {[1,format["O jogador %1 tentou se explodir dentro de uma Zona Segura.",name player]] remoteExecCall ["cxp_fnc_broadcast",RANY];};
if (vest player != "V_HarnessOGL_gry") exitWith {cxp_isSuiciding = false;hint"Voce retirou seu colete, parabéns campeao !"};

//BOOM
removeVest player;
removeAllWeapons player;
removeAllAssignedItems player;

private _boom = "Bo_Mk82" createVehicle position player;
_boom setDamage 100000;

if(alive player) then {player setDamage 1;};

cxp_isSuicide = false;

player setVariable["restrained", false, true];
[] call CXPSKT_fnc_updateRequest;

[1,format["NOTICIA URGENTE: Um Kebab se explodiu! O sujeito foi identificado pela equipe forense da policia e seu nome era : %1. VIVAA!!",profileName]] remoteExecCall ["cxp_fnc_broadcast",RANY];
