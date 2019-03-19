#include "\cxp_server\script_macros.hpp"
/*
	File: fn_avisarPvpEntorno.sqf
	Author: Casperento
	Description:
	Cria trigger para avisar que um tab foi dado numa area de X metros de raio 
*/
params [["_pos",[0,0,0],[[]]]];

if (isNil "cxp_safezone") then {cxp_safezone=true;};
if (cxp_safezone) exitWith {
	if !(isNil "cxp_tab_tgg") then {deleteVehicle cxp_tab_tgg;};
	cxp_tab_tgg = nil;
};
if (playerSide isEqualTo independent || {(player getVariable ["alvoTab",false])} || _pos isEqualTo [0,0,0] || !(isNil "cxp_tab_tgg")) exitWith {};

cxp_tab_tgg = createTrigger ["EmptyDetector",_pos,false];
cxp_tab_tgg setTriggerArea [CXP_SETTINGS(getNumber,"avisos_tab_distancia"),CXP_SETTINGS(getNumber,"avisos_tab_distancia"),0,false];
cxp_tab_tgg setTriggerActivation ["ANYPLAYER","PRESENT",true];
cxp_tab_tgg setTriggerStatements [
	"this",
	"hint parseText format[""<t color='#f40505' size='%4' shadow='1' align='center'>%1</t><t size='1' align='%3'>%2</t>"",""ZONA EM PVP<br/><br/>"",""Você entrou em uma zona de constante pvp. Isso quer dizer que alguem anunciou assalto ou comecou um PVP atraves do aviso do TAB. Saia imediatamente desta area para evitar problemas com a administracao!"",""center"",2];",
	"hint parseText format[""<t color='#e6f405' size='%4' shadow='1' align='center'>%1</t><t size='1' align='%3'>%2</t>"",""ZONA EM PVP<br/><br/>"",""Você saiu de uma zona que esta em constante pvp. Parabens, assim que se faz! Continue assim e evite problemas com outros jogadores."",""center"",2];"
];

// Monitor para remover o trigger depois de certo tempo
[] spawn {
	sleep (CXP_SETTINGS(getNumber,"avisos_tab_tempoTgg"));
	deleteVehicle cxp_tab_tgg;cxp_tab_tgg = nil;
};