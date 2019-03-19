#include "\life_server\script_macros.hpp"
/*
	File: fn_initGbSysDonClient.sqf
	Author: Casperento
	Description:
	Inicia o sistema global de donates no cliente
*/
params [
	["_dnLvl",0,[0]],
	["_uid","",[""]],
	["_name","",[""]]
];
if !(cxp_global_donor) exitWith {CONST(cxp_donorlevel,_dnLvl);[8] call CXPSKT_fnc_updatePartial;};
if !(playerSide isEqualTo civilian) exitWith {CONST(cxp_donorlevel,_dnLvl);cxp_salary_expired = false;};

// Verificando cliente e setando o vip de acordo com o do servidor
if (_dnLvl >= 1 && cxp_playerExtraDom) then {
	[_uid,_dnLvl,player] remoteExecCall ["CXPDB_fnc_insertDoadores",RSERV];
	CONST(cxp_donorlevel,_dnLvl);
} else {
	if (_dnLvl > 0 && cxp_global_donorlvl != _dnLvl) exitWith {CONST(cxp_donorlevel,0);cxp_salary_expired = true;[_uid,-1,player] remoteExecCall ["CXPDB_fnc_insertDoadores",RSERV];};
	CONST(cxp_donorlevel,cxp_global_donorlvl);
	cxp_salary_expired = false;
};
[8] call CXPSKT_fnc_updatePartial;