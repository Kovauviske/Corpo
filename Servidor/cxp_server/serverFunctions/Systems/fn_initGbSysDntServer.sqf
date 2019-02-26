#include "\cxp_server\script_macros.hpp"
/*
	File: fn_initGbSysDntServer.sqf
	Author: Casperento
	Description:
	Inicia o sistema global de donates (SV)
*/
// Iniciando consulta no DB
private _querySysSlct = format["SELECT sv_id, sysVipGlobalOn, vipGlobal FROM globalSystems WHERE sv_id = '%1'",([1] call CXPDB_fnc_numberSafe)]; // sempre 1, apenas para identificar a roll do na table
private _selected = [_querySysSlct,2] call CXPDB_fnc_asyncCall;

if (_selected isEqualType "") exitWith {
	private _querySysInsert = format ["INSERT INTO globalSystems (sv_id, sysVipGlobalOn, vipGlobal) VALUES('%1', '%2', '%3')",([1] call CXPDB_fnc_numberSafe),([0] call CXPDB_fnc_numberSafe),([0] call CXPDB_fnc_numberSafe)]; // 'Sets' padrões
	[_querySysInsert,1] call CXPDB_fnc_asyncCall;
	[] call CXPSV_fnc_persistGbSysDntServer;
};

if (count _selected isEqualTo 0) exitWith {
	private _querySysInsert = format ["INSERT INTO globalSystems (sv_id, sysVipGlobalOn, vipGlobal) VALUES('%1', '%2', '%3')",([1] call CXPDB_fnc_numberSafe),([0] call CXPDB_fnc_numberSafe),([0] call CXPDB_fnc_numberSafe)]; // 'Sets' padrões
	[_querySysInsert,1] call CXPDB_fnc_asyncCall;
	[] call CXPSV_fnc_persistGbSysDntServer;
};

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
