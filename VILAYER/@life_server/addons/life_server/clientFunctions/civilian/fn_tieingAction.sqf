#include "\life_server\script_macros.hpp"
/*
	File: fn_tieingAction.sqf

	Modified : Casperento

	Description:
	Acao de algemar
*/
params [
	["_unit",objNull,[objNull]],
	["_legal",false,[false]]
];

if (cxp_action_inUse) exitWith {hint"Voce nao pode fazer isso no momento..."};

//pre-verific _unit
if (isNull _unit) exitWith {}; //Not valid
if !(isPlayer _unit) exitWith {};
if ((_unit getVariable ["tied", false]) || (_unit getVariable ["restrained", false])) exitWith {hint"Alvo ja algemado!"}; // Alvo nao pode estar algemado
if (player isEqualTo _unit) exitWith {hint "Você não pode se algemar, seu imbecil!"};
if ((player getVariable ["tied", false]) || (player getVariable ["restrained", false])) exitWith {hint "Você não pode fazer isso agora..."};

//pre-verific _legal
if (_legal) exitwith {
	if !(_unit getVariable ["procurado",false]) exitWith {hint "Você não pode algemar alvos que não estão na lista de procurados!"};
	if (cxp_inv_zipties_legal < 1) exitWith {hint "Você não tem algemas em seu inventário..."};
	if !(license_civ_bHunterLic) exitWith {hintSilent "Você precisa ter uma licença de Bounty Hunter para usar este tipo de algema!"};
	if (_unit getVariable["downed", false]) exitWith {hint "Nocauteie seu alvo apos ele ter se recuperado do coma da bala de borracha e com uma injeção de adrenalina!"};

	if (animationState _unit != "Incapacitated") exitWith {hint "Seu alvo deve estar nocauteado (SHIFT + G) !"};

	[false,"zipties_legal",1] call cxp_fnc_handleInv;

	titleText ["Algemando alvo...","PLAIN"];
	[_unit,"handcuffs",20,1] remoteExec ["cxp_fnc_say3D",RANY];

	_unit setVariable ["playerSurrender",false,true];
	_unit setVariable ["tied", true, true];
	[player] remoteExecCall ["cxp_fnc_tieing", _unit];
};

if !(_legal) exitWith {
	if (cxp_inv_zipties < 1) exitWith {hint "Você não tem algemas em seu inventário ou nao possui licenca rebelde..."};
	if !(license_civ_rebellic) exitWith {hintSilent "Você precisa ter uma licença rebelde para usar este tipo de algema!"};

	if (side _unit in [west, independent] && cxp_safezone) exitWith {hint "Você não pode algemar autoridades em uma Zona Segura !"};

	if (animationState _unit != "Incapacitated") exitWith {hint "Seu alvo deve estar nocauteado (SHIFT + G) !";};

	[false,"zipties",1] call cxp_fnc_handleInv;

	titleText ["Algemando alvo...","PLAIN"];
	[_unit,"handcuffs",20,1] remoteExec ["cxp_fnc_say3D",RANY];

	_unit setVariable ["playerSurrender",false,true];
	_unit setVariable ["tied", true, true];
	[player] remoteExecCall ["cxp_fnc_tieing", _unit];
};