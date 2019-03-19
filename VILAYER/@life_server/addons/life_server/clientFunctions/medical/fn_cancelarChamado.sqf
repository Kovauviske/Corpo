#include "\life_server\script_macros.hpp"
/*
	File: fn_cancelarChamado.sqf
	Author: Casperento
	Description:
	Cancela chamado atual e desbuga task
*/
if !(player getVariable ["emAtendimento",false]) exitWith {hint"Voce nao esta em nenhum chamado no momento!"};
if (cxp_clienteAtualNome isEqualTo "") exitWith {};

if !(cxp_atndVarios) then {
	if (["atPacint"] call BIS_fnc_taskExists) then {["atPacint"] call BIS_fnc_deleteTask;};
	if (["atPacintNext"] call BIS_fnc_taskExists) then {["atPacintNext"] call BIS_fnc_deleteTask;}; // por precaucao
	deleteMarkerLocal cxp_clienteMkAtual;
	deleteMarkerLocal cxp_mkAreaClientes; // por precaucao
	
	//Readicionando cliente atual na lista
	if !(isNull (player getVariable "pacienteAtual")) then {
		[player,true] remoteExec ["cxp_fnc_pacienteAceito",(player getVariable "pacienteAtual")];
		[(player getVariable "pacienteAtual"),name (player getVariable "pacienteAtual"),side (player getVariable "pacienteAtual")] remoteExec ["CXPSV_fnc_addMorteListaSv",RSERV];
	};

	player setVariable["pacienteAtual",objNull,true];
	player setVariable["emAtendimento",false,true];
	cxp_clienteAtualNome = "";
	cxp_clienteSide = sideUnknown;
	cxp_arrCorpsesPerto = [];
	hint "Chamado atual cancelado com sucesso!";
} else {
	if (["atPacint"] call BIS_fnc_taskExists) then {["atPacint"] call BIS_fnc_deleteTask;};
	if (["atPacintNext"] call BIS_fnc_taskExists) then {["atPacintNext"] call BIS_fnc_deleteTask;};
	deleteMarkerLocal cxp_clienteMkAtual;
	deleteMarkerLocal cxp_mkAreaClientes;
	
	//Readicionando cliente atual na lista
	if !(isNull (player getVariable "pacienteAtual")) then {
		[player,true] remoteExec ["cxp_fnc_pacienteAceito",(player getVariable "pacienteAtual")];
		[(player getVariable "pacienteAtual"),name (player getVariable "pacienteAtual"),side (player getVariable "pacienteAtual")] remoteExec ["CXPSV_fnc_addMorteListaSv",RSERV];
		
		// Clientes subordinados
		{
			if ([(getPlayerUID (_x))] call cxp_fnc_isUIDActive) then {
				[player,true] remoteExec ["cxp_fnc_pacienteAceito",(_x)];
				[(_x),(name _x),(side _x)] remoteExec ["CXPSV_fnc_addMorteListaSv",RSERV];
			};
		} forEach cxp_arrCorpsesPerto;
	};

	player setVariable["pacienteAtual",objNull,true];
	player setVariable["emAtendimento",false,true];
	cxp_clienteAtualNome = "";
	cxp_clienteSide = sideUnknown;
	cxp_arrCorpsesPerto = [];
	cxp_atndVarios = false;
	hint "Chamado simultaneo cancelado com sucesso: todos os seus clientes atuais foram recolocados na lista de mortos novamente!";
};
