#include "\cxp_server\script_macros.hpp"
/*
  File: fn_initDeadListClient.sqf
  Author: Casperento
  Description:
  Inicia o núcleo de funcionamento do deadlist do cliente
*/
if (playerSide != independent) exitWith {};

player setVariable["emAtendimento",false,true];
player setVariable["pacienteAtual",objNull,true];
cxp_clienteMkAtual = "";
cxp_dead_list_recebida = [];
cxp_clienteAtualNome = "";
cxp_clienteSide = sideUnknown;
cxp_arrCorpsesPerto = [];
cxp_atndVarios = false;
cxp_monBusy = false;
cxp_mkAreaClientes = "";

[player] remoteExec ["CXPSV_fnc_envListaClient",RSERV];

// Monitor para saber o estado do atendimento basico
[] spawn {
	for "_i" from 0 to 1 step 0 do {
		waitUntil {!cxp_monBusy && !cxp_atndVarios && !(player getVariable ["emAtendimento",false]) && {!isNull (player getVariable "pacienteAtual")} && ((player getVariable "pacienteAtual") getVariable ["Revive",false])};
		cxp_monBusy = true;
		if (["atPacint"] call BIS_fnc_taskExists) then {["atPacint"] call BIS_fnc_deleteTask;};
		if (["atPacintNext"] call BIS_fnc_taskExists) then {["atPacintNext"] call BIS_fnc_deleteTask;};
		deleteMarkerLocal cxp_clienteMkAtual;
		player setVariable["pacienteAtual",objNull,true];
		cxp_clienteAtualNome = "";
		cxp_clienteSide = sideUnknown;
		cxp_arrCorpsesPerto = [];
		hint "Chamado atual concluido com sucesso!";
		cxp_monBusy = false;
		waitUntil {(player getVariable ["emAtendimento",false])};
	};
};

// Monitor para cancelar chamado quando o paciente desconectar
[] spawn {
	for "_i" from 0 to 1 step 0 do {
		waitUntil {!cxp_monBusy && !cxp_atndVarios && (player getVariable ["emAtendimento",false]) && !([(getPlayerUID (player getVariable "pacienteAtual"))] call cxp_fnc_isUIDActive)};
		cxp_monBusy = true;
		if (["atPacint"] call BIS_fnc_taskExists) then {["atPacint"] call BIS_fnc_deleteTask;};
		if (["atPacintNext"] call BIS_fnc_taskExists) then {["atPacintNext"] call BIS_fnc_deleteTask;};
		deleteMarkerLocal cxp_clienteMkAtual;
		player setVariable["pacienteAtual",objNull,true];
		player setVariable["emAtendimento",false,true];
		cxp_clienteAtualNome = "";
		cxp_clienteSide = sideUnknown;
		cxp_arrCorpsesPerto = [];
		hint "Chamado atual cancelado pois seu cliente se desconectou.";
		cxp_monBusy = false;
	};
};

// Monitor para saber o player deu respawn instantaneo em atendimento comum
[] spawn {
	for "_i" from 0 to 1 step 0 do {
		waitUntil {!cxp_monBusy && !cxp_atndVarios && (player getVariable ["emAtendimento",false]) && !isNull (player getVariable "pacienteAtual") && ((player getVariable "pacienteAtual") getVariable "UsouReviveInst")};
		cxp_monBusy = true;
		if (["atPacint"] call BIS_fnc_taskExists) then {["atPacint"] call BIS_fnc_deleteTask;};
		if (["atPacintNext"] call BIS_fnc_taskExists) then {["atPacintNext"] call BIS_fnc_deleteTask;};
		deleteMarkerLocal cxp_clienteMkAtual;
		player setVariable["pacienteAtual",objNull,true];
		player setVariable["emAtendimento",false,true];
		cxp_clienteAtualNome = "";
		cxp_clienteSide = sideUnknown;
		cxp_arrCorpsesPerto = [];
		titleText [format["Seu paciente atual se auto reviveu pagando R$%1 para o governo de Altis!\nProcure por outro chamado!",CXP_SETTINGS(getNumber,"revive_inst_fee")],"PLAIN",3];
		cxp_monBusy = false;
	};
};

// Monitor para atualizar o cliente atual quando for atender mais de 1
[] spawn {
	for "_i" from 0 to 1 step 0 do {
		waituntil {!cxp_monBusy && cxp_atndVarios && (player getVariable ["emAtendimento",false]) && (!([(getPlayerUID (player getVariable "pacienteAtual"))] call cxp_fnc_isUIDActive) || ((player getVariable "pacienteAtual") getVariable ["Revive",false]) || ((player getVariable "pacienteAtual") getVariable "UsouReviveInst"))};
		cxp_monBusy = true;
		if (count cxp_arrCorpsesPerto > 0) then {
			if ((player getVariable "pacienteAtual") in cxp_arrCorpsesPerto) then {cxp_arrCorpsesPerto deleteAt (cxp_arrCorpsesPerto find (player getVariable "pacienteAtual"));};
			deleteMarkerLocal cxp_clienteMkAtual;
			if !(count cxp_arrCorpsesPerto > 0) exitWith {
				player setVariable["pacienteAtual",objNull,true];
				cxp_clienteAtualNome = "";
				cxp_clienteSide = sideUnknown;
				cxp_arrCorpsesPerto = [];
				player setVariable["emAtendimento",false,true];
				cxp_atndVarios = false;
				if ((["atPacint"] call BIS_fnc_taskExists) || (["atPacintNext"] call BIS_fnc_taskExists)) then {
					["atPacint"] call BIS_fnc_deleteTask;
					["atPacintNext"] call BIS_fnc_deleteTask;
					deleteMarkerLocal cxp_clienteMkAtual;
					deleteMarkerLocal cxp_mkAreaClientes;
					hint "Chamado simultaneo concluido com sucesso!";
				};
			};
			player setVariable["pacienteAtual",(cxp_arrCorpsesPerto call BIS_fnc_selectRandom),true];
			sleep 0.1;
			cxp_clienteAtualNome = (name (player getVariable "pacienteAtual"));
			cxp_clienteSide = (side (player getVariable "pacienteAtual"));
			if ((["atPacint"] call BIS_fnc_taskExists) || (["atPacintNext"] call BIS_fnc_taskExists)) then {
				["atPacint"] call BIS_fnc_deleteTask;
				["atPacintNext"] call BIS_fnc_deleteTask;
				
				//Criando novos itens
				private _mkDeft = createMarkerLocal [format ["%1_mkDeft",cxp_clienteAtualNome],((player getVariable "pacienteAtual") getVariable "PositionCorpse")];
				_mkDeft setMarkerColorLocal "ColorRed";
				_mkDeft setMarkerTypeLocal "loc_Hospital";
				_mkDeft setMarkerTextLocal format ["PROXIMO PACIENTE - %1",cxp_clienteAtualNome];
				cxp_clienteMkAtual = _mkDeft;
				["MedicalRequestEmerg",[format[localize "STR_Medic_AtenderDefuntoUp",cxp_clienteAtualNome]]] call BIS_fnc_showNotification;
				["atPacintNext",player,["Salve seu proximo paciente!","Salvar Paciente","paciente_task_mk"],(getMarkerPos cxp_clienteMkAtual),"ASSIGNED",1,true,false,"",true] call BIS_fnc_setTask;
				hint "Seu cliente atual foi atualizado porque seu último já está vivo ou não é válido para ser revivido mais!";
			};
		} else {
			player setVariable["pacienteAtual",objNull,true];
			cxp_clienteAtualNome = "";
			cxp_clienteSide = sideUnknown;
			cxp_arrCorpsesPerto = [];
			player setVariable["emAtendimento",false,true];
			cxp_atndVarios = false;
			if ((["atPacint"] call BIS_fnc_taskExists) || (["atPacintNext"] call BIS_fnc_taskExists)) then {
				["atPacint"] call BIS_fnc_deleteTask;
				["atPacintNext"] call BIS_fnc_deleteTask;
				deleteMarkerLocal cxp_clienteMkAtual;
				deleteMarkerLocal cxp_mkAreaClientes;
				hint "Chamado simultaneo concluido com sucesso!";
			};
		};
		cxp_monBusy = false;
	};
};