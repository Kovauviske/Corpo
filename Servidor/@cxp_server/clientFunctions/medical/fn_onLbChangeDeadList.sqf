#include "\cxp_server\script_macros.hpp"
/*
	File: fn_onLbChangeDeadList.sqf
	Author: Casperento
	Description:
	Carrega info do paciente nas labels e mapa
*/
disableSerialization;

private _slctdItem = call compile format ["%1",CONTROL_DATA(52901)];
if !(_slctdItem isEqualType [] || count _slctdItem > 0) exitWith {hint "Nao foi possivel atualizar as informacoes do paciente selecionado...Contate aos desenvolvedores!"};
private _paciente = (_slctdItem select 0);
private _time = switch ((_slctdItem select 2)) do {case "cop": {"Policial"};case "civ": {"Civil"};case "med": {"Bombeiro"};default {"Mendigo"};};
private _causaMorte = switch (_paciente getVariable "causaMorte") do {case 1: {"01"};case 2: {"02"};default {"(DEDONOCU)"};};

[CONTROL(52900,1650),1,0.1,(_paciente getVariable "PositionCorpse"),CONTROL(52900,52901)] call cxp_fnc_setMapPosition;
(CONTROL(52900,1649)) ctrlSetText format[localize "STR_CXPDLST_Team",_time];
(CONTROL(52900,1648)) ctrlSetText format[localize "STR_CXPDLST_NamePac",(_slctdItem select 1)];
(CONTROL(52900,1647)) ctrlSetText format[localize "STR_CXPDLST_DeadBy",_causaMorte];
if (player getVariable ["emAtendimento",false]) then {
	if (cxp_atndVarios) then {
		(CONTROL(52900,1646)) ctrlSetText format[localize "STR_CXPDLST_NbAtualPac",((count cxp_arrCorpsesPerto)+1)];
	} else {
		(CONTROL(52900,1646)) ctrlSetText format[localize "STR_CXPDLST_NbAtualPac",(count cxp_arrCorpsesPerto)];
	};
} else {
	(CONTROL(52900,1646)) ctrlSetText format[localize "STR_CXPDLST_NbAtualPac",0];
};