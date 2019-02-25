#include "\cxp_server\script_macros.hpp"
/*
	File: fn_changeCbList.sqf
	Author: Casperento
	Description:
	Atualiza os combolists
*/
params [
	["_tipo","",[""]],
	["_ctrlIdc",-1,[0]]
];
disableSerialization;
if (isNull CONTROL(88000,_ctrlIdc)) exitwith {diag_log "idc invalido inserido no cxp map filter!"};

private _side = switch (playerSide) do {case west : {"west"};case civilian : {"civilian"};case independent : {"independent"};case east : {"east"};};
private _cfg = missionConfigFile >> "CXP_MAP_FILTER_CFG" >> worldName >> _side;
private _selecionado = lbData[_ctrlIdc,lbCurSel _ctrlIdc];

if (_tipo isEqualTo "cat") exitwith {
    private _subcategoria = getArray(_cfg >> _selecionado >> "subcatego_Names");
    private _cbListSubCategoria = CONTROL(88000,88004);
    lbClear _cbListSubCategoria;
    _subcategoria = _subcategoria call BIS_fnc_sortAlphabetically;
    {
        _cbListSubCategoria lbAdd (_x);
        _cbListSubCategoria lbSetData [(lbSize _cbListSubCategoria)-1,(_x)];
    } forEach _subcategoria;
};

if (_tipo isEqualTo "scat") exitwith {
    private _slctCat = lbData[88005,lbCurSel 88005];
    private _mks = getArray(_cfg >> _slctCat >> _selecionado >> "mpfl_mks");
    private _cbListMarcadores = CONTROL(88000,88003);
    lbClear _cbListMarcadores;
    {
        _cbListMarcadores lbAdd (_x select 1);
        _cbListMarcadores lbSetData [(lbSize _cbListMarcadores)-1,(_x select 0)];
    } forEach _mks;
};