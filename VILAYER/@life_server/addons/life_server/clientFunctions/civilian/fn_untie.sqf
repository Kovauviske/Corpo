#include "\life_server\script_macros.hpp"
/*
	File: fn_untie.sqf
	Modified : Casperento
*/
params [
	["_unit",objNull,[objNull]],
	["_legal",false,[false]]
];

if (cxp_action_inUse) exitWith {hint"Voce nao pode fazer isso no momento..."};
if ((player getVariable ["tied", false]) || (player getVariable ["restrained", false])) exitWith {hintSilent "Voce nao pode fazer isso."};
if (isNull _unit || !isPlayer _unit || !(_unit getVariable ["tied", false])) exitWith {};

if (_legal) exitWith {
	if !(_unit getVariable ["procurado",false]) exitWith {hint "Você não pode desalgemar alvos que não estão na lista de procurados!"};
	if (cxp_inv_kzipties_legal < 1) exitWith {hintSilent "Você precisa ter a chave da algema para poder desalgemar!"};
	if !(license_civ_bHunterLic) exitWith {hintSilent "Você precisa ter uma licença de Bounty Hunter para usar este tipo de algema!"};

	_unit setVariable ["tied", nil, true];
	_unit setVariable ["Escorting",false,true];
	_unit setVariable ["transporting",false,true];

	//colocar algema no inventario do player
	[true,"zipties_legal",1] call cxp_fnc_handleInv;

	[_unit,"handcuffs",20,1] remoteExec ["cxp_fnc_say3D",RANY];
	[0,"STR_NOTF_Unrestrain",true,[_unit getVariable ["realname",name _unit], profileName]] remoteExecCall ["cxp_fnc_broadcast",RANY];
};

if !(_legal) exitWith {
	if (cxp_inv_kzipties < 1) exitWith {hintSilent "Você precisa ter a chave da algema para poder desalgemar!"};
	if !(license_civ_rebellic) exitWith {hintSilent "Você precisa ter uma licença Rebelde para usar este tipo de chave de algema!"};

	_unit setVariable ["tied", nil, true];
	_unit setVariable ["Escorting",false,true];
	_unit setVariable ["transporting",false,true];

	//colocar algema no inventario do player
	[true,"zipties",1] call cxp_fnc_handleInv;

	[_unit,"handcuffs",20,1] remoteExec ["cxp_fnc_say3D",RANY];
	[0,"STR_NOTF_Unrestrain",true,[_unit getVariable ["realname",name _unit], profileName]] remoteExecCall ["cxp_fnc_broadcast",RANY];
};