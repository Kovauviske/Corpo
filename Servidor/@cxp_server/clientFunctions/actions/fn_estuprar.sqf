#include "\cxp_server\script_macros.hpp"
/*
  File : fn_estuprar.sqf
  Author : Casperento
*/
private _playerEstuprado = param [0,ObjNull,[ObjNull]];

if (animationState _playerEstuprado != "Incapacitated") exitWith {hintSilent "Seu alvo deve estar nocauteado (SHIFT + G) !";};

if (isNull _playerEstuprado) exitWith {};
if ((_playerEstuprado getVariable ["plPerdeuCabaco",FALSE])) exitWith {}; // PLAYER JÁ N TEM CU MAIS -- OU FOI CURADO PELO MÉDICO
if ((player getVariable ["podeArrombarCu",FALSE])) exitWith {}; // ESTUPRADOR NAO PODE ESTUPRAR MAIS CUZES AINDA
if (cxp_inv_camisinha < 1 && playerSide isEqualTo civilian) exitWith {hint "Voce nao possui uma camisinha em seu inventario !"};
if (player isEqualTo _playerEstuprado) exitWith {hint"Voce nao pode se estuprar seu ARROMBADO!"};
if !(isPlayer _playerEstuprado) exitWith {hint"Alvo inválido!"};

cxp_action_inUse = true;

player setVariable ["podeArrombarCu",true,true];
player setVariable ["estuprador",true,true];
player playMove "AinvPknlMstpSnonWnonDnon_medic";
_playerEstuprado setVariable["plPerdeuCabaco",true,true];
[_playerEstuprado, "paipara",50] remoteExec ["cxp_fnc_say3D",RANY];

cxp_action_inUse = false;

[player] remoteExec ["cxp_fnc_perdeuRabo", _playerEstuprado];

[false,"camisinha",1] call cxp_fnc_handleInv;
hint "Sua camisinha estourou, sorte a sua ser um homem!";
