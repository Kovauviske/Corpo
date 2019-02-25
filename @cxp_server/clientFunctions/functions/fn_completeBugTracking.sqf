/*
	File: fn_completeBugTracking.sqf
	Author: Casperento
	Description:
	Termina procedimento de reporte de bug..
*/
params ["_result"];
if !(_result in ["sucesso","falhou"]) exitWith {};

if (_result isEqualTo "sucesso") exitWith {
	closeDialog 0;
	hint localize "STR_CXPBT_Thx";
	cxp_bt_timer = time;
	[] call CXPSKT_fnc_updateRequest;
};
if (_result isEqualTo "falhou") exitWith {
	closeDialog 0;
	hint "Tente novamente em breve...";
	[] call CXPSKT_fnc_updateRequest;
};
