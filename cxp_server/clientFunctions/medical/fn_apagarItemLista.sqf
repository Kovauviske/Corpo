#include "\cxp_server\script_macros.hpp"
/*
	File: fn_apagarItemLista.sqf
	Author: Casperento
	Description:
	Apaga item(paciente) invalido da lista
*/
disableSerialization;

// pre-verific
if ((lbCurSel 52901) isEqualTo -1) exitWith {hint "Selecione algum paciente disponível na lista!"};

private _deft = call compile format ["%1",CONTROL_DATA(52901)];
[(_deft select 1)] remoteExec ["CXPSV_fnc_rmMorteListaSv",RSERV];
