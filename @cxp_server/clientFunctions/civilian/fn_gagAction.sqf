#include "\cxp_server\script_macros.hpp"
/*
    File: fn_gagAction.sqf
    Author: Lowheartrate & Panda
	Modified : Casperento
*/
private _unit = cursorTarget;

if (cxp_inv_fitaadesiva < 1) exitWith {
	hintSilent "Voce nao tem uma fita adesiva em seu inventario !";
};

if (isNull _unit) exitWith {};
if (player distance _unit > 3) exitWith {};
if (_unit getVariable "gagged") exitWith {};
if (player == _unit) exitWith {};
if !(isPlayer _unit) exitWith {};

if !(_unit getVariable ["tied", false]) exitWith {
	hint "Seu alvo precisa estar algemado!";
};

_unit setVariable["gagged",true,true];
[player] remoteExec ["cxp_fnc_gagged", _unit];
[false,"fitaadesiva",1] call cxp_fnc_handleInv;
hint format ["Voce calou o jogador %1 com sucesso !", _unit getVariable ["realname",_unit]];

