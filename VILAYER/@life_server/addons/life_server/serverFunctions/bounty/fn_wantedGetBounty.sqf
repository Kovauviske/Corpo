#include "\life_server\script_macros.hpp"
/*
	File: fn_wantedGetBounty.sqf
	Author: Casperento (BASED ON ASYLUM)
	Description:
	Seleciona qualquer otário da lista de procurado e manda para o Hunter('_unit')
*/
params [
	["_unit",objNull,[objNull]],
	["_existing",[],[[]]]
];

if (count _existing > 0) exitWith {[1,"Você já tem um alvo-recompensa ativo."] remoteExec ["cxp_fnc_broadcast",_unit];};

// Filtrando lista
private _lista = [objNull,"bounty"] call cxp_fnc_wantedFetch;
if !(_lista isEqualType []) exitWith {[1,"Lista de procurados bugada no sistema bounty hunter, contate aos desenvolvedores!"] remoteExec ["cxp_fnc_broadcast",_unit];};
private _bounty = [];
private _sideProc = sideUnknown;
{
	_procurado = objNull;
	_uid = _x select 0;
	{
		if (getPlayerUID _x isEqualTo _uid) exitWith {_procurado = _x};
	} forEach allPlayers;
	if (((_x select 2) >= CXP_SETTINGS(getNumber,"bCFG_alvo_valor_min")) && !(side _procurado isEqualTo sideUnknown) && !(isNull _procurado) && !(_procurado getVariable ["clienteBounty",false]) && !(_procurado getVariable ["prisoner",false]) && !(side _procurado in [independent,west]) && (group _procurado != group _unit) && !(getPlayerUID _procurado in _existing) && ([_uid] call cxpsv_fnc_isUIDActive)) then {
		_x pushBack (side _procurado);
		_bounty pushBack _x;
	};
} forEach _lista;

// Obtendo alvos...
private _alvo = [];
if (count _bounty > 0) then {
	_alvo = ([_bounty] call BIS_fnc_selectRandom);
	[_alvo,"add",((_alvo select 0) select 3)] call cxp_fnc_checarGlobal;
};

[_alvo] remoteExec ["cxp_fnc_setBounty",_unit];