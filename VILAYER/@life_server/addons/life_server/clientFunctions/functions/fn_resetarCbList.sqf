#include "\life_server\script_macros.hpp"
/*
	File: fn_resetarCbList.sqf
	Author: Casperento
	Description:
	Abre/reseta categorias e subcategorias

		Exemplo: (getArray(missionConfigFile >> "CXP_MAP_FILTER_CFG" >> "Altis" >> "civilian" >> "Farms" >> "Processadores" >> "mpfl_mks"))
*/
params [["_init",false,[false]]];
disableSerialization;

private _side = switch (playerSide) do {case west : {"west"};case civilian : {"civilian"};case independent : {"independent"};case east : {"east"};};
private _categorias = getArray(missionConfigFile >> "CXP_MAP_FILTER_CFG" >> worldName >> _side >> "catego_Names");
private _cbListCategoria = CONTROL(88000,88005);
lbClear _cbListCategoria;
_categorias = _categorias call BIS_fnc_sortAlphabetically;
{
	_cbListCategoria lbAdd (_x);
	_cbListCategoria lbSetData [(lbSize _cbListCategoria)-1,(_x)];
} forEach _categorias;
private _cbListSubCategoria = CONTROL(88000,88004);
lbClear _cbListSubCategoria;
private _cbListMarcadores = CONTROL(88000,88003);
lbClear _cbListMarcadores;
if !(_init) then {mapAnimAdd [1,1,(markerPos "cxp_mpfl_center")];mapAnimCommit;};