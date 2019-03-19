/*
	File: fn_initAddActions.sqf
	Author: Casperento
	Description:
	Inicializa todas as plaquinhas do mapa!
*/
{
	private _placaFinal = call compile format["%1",(_x select 0)];
	private _arrAddActs = [];
	for "_i" from 1 to count(_x)-1 do {_arrAddActs pushBack (_x select _i);};
	if (count _arrAddActs < 1) exitWith {diag_log "Array invalido montado no fn_initAddActions!";};
	{_placaFinal addAction (call compile format["%1",_x]);} forEach _arrAddActs;
} forEach getArray(missionConfigFile >> "CfgPlacas" >> "addActions");