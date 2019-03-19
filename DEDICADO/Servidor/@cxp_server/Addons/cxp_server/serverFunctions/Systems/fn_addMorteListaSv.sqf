#include "\cxp_server\script_macros.hpp"
/*
  File: fn_addMorteListaSv.sqf
  Author: Casperento
  Description:
  Adiciona cliente morto na lista de jogadores mortos e devolve informacoes para o medico cliente
*/
params [
	["_jogadorAdd",objNull,[objNull]],
	["_nome","",[""]],
	["_side",sideUnknown,[civilian]]
];

// Pre-verific para nao ocorrer bugs iniciais
if (isNull _jogadorAdd || _nome isEqualTo "" || _side isEqualTo sideUnknown) exitWith {};

// Limpa lista caso haja elementos antigos invalidos
[] call CXPSV_fnc_cleanerListaSv;
waitUntil {cxp_sv_lista_limpa && !cxp_sv_lista_emuso};
cxp_sv_lista_emuso = true;

_side = switch (_side) do {case civilian:{"civ"};case west:{"cop"};case independent:{"med"};default{"mendigo"};};
private _arrMorto = [_jogadorAdd,_nome,_side];
if !(_arrMorto in ListMortosNoMomento) then {
	ListMortosNoMomento pushBack _arrMorto;
	// Envia lista atualizada de volta para os medicos de plantao
	[ListMortosNoMomento] remoteExecCall ["cxp_fnc_recebListClient",independent];
};
cxp_sv_lista_limpa = false;
cxp_sv_lista_emuso = false;