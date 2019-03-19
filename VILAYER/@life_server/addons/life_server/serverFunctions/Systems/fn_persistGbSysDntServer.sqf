#include "\life_server\script_macros.hpp"
/*
	File: fn_persistGbSysDntServer.sqf
	Author: Casperento
	Description:
	Persiste em declarar todas as vars globais do sistema
*/
// Iniciando consulta no DB
private _querySysSlct = format["SELECT sv_id, sysVipGlobalOn, vipGlobal FROM globalSystems WHERE sv_id = '%1'",([1] call CXPDB_fnc_numberSafe)]; // sempre 1, apenas para identificar a roll do na table
private _selected = [_querySysSlct,2] call CXPDB_fnc_asyncCall;

if (_selected select 1 isEqualTo 1) then {
	cxp_global_donor = true;
	publicVariable "cxp_global_donor";
	diag_log "Sistema Global de Donates Verificado no DB e Ligado!";
	cxp_global_donorlvl = _selected select 2;
	publicVariable "cxp_global_donorlvl";
	diag_log format ["Nivel de Donor de todos os jogadores ativos no momento: %1",cxp_global_donorlvl];
} else {
	cxp_global_donor = false;
	publicVariable "cxp_global_donor";
	diag_log "Sistema Global de Donates Verificado no DB e Desligado!";
	cxp_global_donorlvl = 0;
	publicVariable "cxp_global_donorlvl";
};