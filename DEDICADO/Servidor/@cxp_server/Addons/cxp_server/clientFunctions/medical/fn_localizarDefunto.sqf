#include "\cxp_server\script_macros.hpp"
/*
	File: fn_localizarDefunto.sqf
	Author: Casperento
	Description:
	Marca no mapa do médico o paciente escolhido na lista e o retira da lista de tds os medicos
*/
disableSerialization;

if (player getVariable ["emAtendimento",false]) exitWith {hint"Voce ja aceitou um chamado, salve a vida de seu(s) paciente(s)!"};
if ((lbCurSel 52901) isEqualTo -1) exitWith {hint "Selecione algum paciente disponível na lista!"};

private _deft = call compile format ["%1",CONTROL_DATA(52901)];
player setVariable ["pacienteAtual",(_deft select 0),true];
private _paciente = player getVariable "pacienteAtual";
private _raio = CXP_SETTINGS(getNumber,"deadList_raioMultiDead");
if (isNull _paciente || _paciente isEqualTo player) exitWith {closeDialog 0;hint"Paciente Invalido!";};
cxp_clienteAtualNome = (_deft select 1);
cxp_clienteSide = switch (_deft select 2) do {
	case "cop": {west};
	case "civ": {civilian};
	case "med": {independent};
	default {sideUnknown};
};

player setVariable["emAtendimento",true,true]; 

// Localiza defunto no mapa
private _mkDeft = createMarkerLocal [format ["%1_mkDeft",cxp_clienteAtualNome],(_paciente getVariable "PositionCorpse")];
_mkDeft setMarkerColorLocal "ColorRed";
_mkDeft setMarkerTypeLocal "loc_Hospital";
_mkDeft setMarkerTextLocal format ["PACIENTE - %1",cxp_clienteAtualNome];
cxp_clienteMkAtual = _mkDeft;

// Reconhecendo corpos em volta
private _skulls = nearestObjects [(_paciente getVariable ["clienteSkull",objNull]),["Land_HumanSkull_F"],_raio];
{
	_player = _x;
	if (((round((_paciente getVariable ["clienteSkull",objNull]) distance _player) < _raio)) && _player != _paciente) then {
		{if ((_player getVariable ["clienteSkull",objNull]) isEqualTo _x) then {cxp_arrCorpsesPerto pushBack (_player);};} forEach _skulls;
	};
} forEach allPlayers;

if (count cxp_arrCorpsesPerto > 0) then {
	cxp_atndVarios = true;

	// Cria marcador extra para a area dos mortos
	private _deadZone = createMarkerLocal ["multiPacientes_mkDefts",(_paciente getVariable "PositionCorpse")];
	_deadZone setMarkerShapeLocal "ELLIPSE";
	_deadZone setMarkerSizeLocal [_raio,_raio];
	_deadZone setMarkerBrushLocal "DiagGrid";
	_deadZone setMarkerColorLocal "ColorGreen";
	cxp_mkAreaClientes = _deadZone;

	// Retira da lista global de defuntos e deixa paciente avisado
	private _namesArr = [];
	{_namesArr pushback (name _x);} forEach cxp_arrCorpsesPerto;
	[_namesArr] remoteExec ["CXPSV_fnc_rmMorteListaSv",RSERV];
	{[player] remoteExec ["cxp_fnc_pacienteAceito",_x];} forEach cxp_arrCorpsesPerto;
	
	// Retira da lista global de defuntos e deixa paciente avisado
	[cxp_clienteAtualNome] remoteExec ["CXPSV_fnc_rmMorteListaSv",RSERV];
	[player] remoteExec ["cxp_fnc_pacienteAceito",_paciente];
	if (count cxp_arrCorpsesPerto > 1) then {
		[0,format["%1 assumiu o chamado de %2 e de outros (%3)!",(name player),cxp_clienteAtualNome,(count cxp_arrCorpsesPerto)]] remoteExecCall ["cxp_fnc_broadcast",independent];
	} else {
		[0,format["%1 assumiu o chamado de %2 e de %3!",(name player),cxp_clienteAtualNome,(name (cxp_arrCorpsesPerto select 0))]] remoteExecCall ["cxp_fnc_broadcast",independent];
	};
} else {
	// Retira da lista global de defuntos e deixa paciente avisado
	[cxp_clienteAtualNome] remoteExec ["CXPSV_fnc_rmMorteListaSv",RSERV];
	[player] remoteExec ["cxp_fnc_pacienteAceito",_paciente];
	[0,format["%1 assumiu o chamado de %2!",(name player),cxp_clienteAtualNome]] remoteExecCall ["cxp_fnc_broadcast",independent];
};
closeDialog 0;
// Cria marcador 3D para o medico(task) e da seu devido aviso
["MedicalRequestEmerg",[format[localize "STR_Medic_AtenderDefunto",cxp_clienteAtualNome]]] call BIS_fnc_showNotification;
["atPacint",player,["Salve a vida de seu paciente!","Salvar Paciente","paciente_task_mk"],(getMarkerPos cxp_clienteMkAtual),"ASSIGNED",1,true,false,"",true] call BIS_fnc_setTask;