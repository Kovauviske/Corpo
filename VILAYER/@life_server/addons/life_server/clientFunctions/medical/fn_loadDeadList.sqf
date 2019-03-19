#include "\life_server\script_macros.hpp"
/*
	File: fn_loadDeadList.sqf
	Author: Casperento
	Description:
	Lista todos os jogadores mortos no mapa no momento em q o menu foi aberto
*/
if !(createDialog "cxp_actualdead_List") exitWith {};
disableSerialization;

if (isNull (findDisplay 52900)) exitWith {hint"Display do menu de pacientes inválido, contate aos desenvolvedores!"};
if !(cxp_dead_list_recebida isEqualType []) exitWith {hint"Variavel do sistema 'CXP DEAD LIST' inválida, contate aos desenvolvedores!"};

private _listaMortos = CONTROL(52900,52901);
lbClear _listaMortos;

if (count cxp_dead_list_recebida < 1) exitWith {
	_listaMortos lbAdd "Não há defuntos no momento!";
	(CONTROL(52900,52961)) ctrlEnable false; //botao de remover
	(CONTROL(52900,52962)) ctrlEnable false; //botao de Localizar
};

{
	_listaMortos lbAdd format["%1",(_x select 1)];
	_listaMortos lbSetData [(lbSize _listaMortos) - 1, str([(_x select 0),(_x select 1),(_x select 2)])]; // objPlayer, nome player, side player
} forEach cxp_dead_list_recebida;

_listaMortos lbSetCurSel 0;

//carregar lista e demais info.
private _slctdItem = call compile format ["%1",CONTROL_DATA(52901)];
private _time = switch (_slctdItem select 2) do {case "cop": {"Policial"};case "civ": {"Civil"};case "med": {"Bombeiro"};default {"Mendigo"};};
private _causaMorte = switch ((_slctdItem select 0) getVariable "causaMorte") do {case 1: {"01 (SOZINHO)"};case 2: {"02 (POR ALGUEM)"};default {"(DEDONOCU)"};};

[CONTROL(52900,1650),1,0.1,((_slctdItem select 0) getVariable "PositionCorpse"),CONTROL(52900,52901)] call cxp_fnc_setMapPosition;
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