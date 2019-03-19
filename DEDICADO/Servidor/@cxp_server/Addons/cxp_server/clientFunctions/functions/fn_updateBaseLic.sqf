/*
	File: fn_updateBaseLic.sqf
	Author: Casperento
	Description:
	Atualiza cliente depois de ser manipulado pelo servidor
*/
params [
	["_nBase",0,[0]],
	["_msg","",[""]]
];

player setVariable ["rankgbVip",_nBase,true];
[_nBase] call cxp_fnc_validarBase;
hint _msg;