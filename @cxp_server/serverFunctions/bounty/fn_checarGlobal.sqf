#include "\cxp_server\script_macros.hpp"
/*
	File: fn_checarGlobal.sqf
	Author: Casperento
	Description:
		Modulo para -> Add, remover, limpar, etc..a lista global de procurados pelos BHs
*/
params [
	["_arrAlvo",[],[[]]],
	"_func",
	["_alvoSide",sideUnknown,[sideUnknown]]
];

if (_alvoSide isEqualTo sideUnknown) exitWith {diag_log "Erro encontrado no 'checker'(SV) da lista de Bountys, 'sideError', contate aos desenvolvedores!";};
if (CXP_SETTINGS(getNumber,"log_arr_checker") isEqualTo 1) then {diag_log format ["Array recebido no 'checarGlobal' do SV: %1 (SIDE:%2)",str(_arrAlvo),_alvoSide];};

private _alvoUid = ((_arrAlvo select 0) select 0);
private _alvoPrice = if (count _arrAlvo >= 3) then { ((_arrAlvo select 0) select 2) } else { -1 };

if (_func isEqualTo "add") exitWith {
	if !(_alvoUid in cxp_bounty_procurados) then { // segurança
		if (_alvoPrice > 0 && _alvoPrice < CXP_SETTINGS(getNumber,"bCFG_alvo_valor_min")) exitWith {
			[_alvoUid,_alvoSide,0,9] call CXPDB_fnc_updatePartial;
			[cxp_bounty_procurados] remoteExecCall ["cxp_fnc_updateBountyListLocal",RANY];
		};
		cxp_bounty_procurados pushBack _alvoUid;
		[_alvoUid,_alvoSide,1,9] call CXPDB_fnc_updatePartial;
		[cxp_bounty_procurados] remoteExecCall ["cxp_fnc_updateBountyListLocal",RANY];
	};
};

if (_func isEqualTo "rm") exitWith {
	if (_alvoUid in cxp_bounty_procurados) then { // segurança
		cxp_bounty_procurados deleteAt (cxp_bounty_procurados find _alvoUid);
		[_alvoUid,_alvoSide,0,9] call CXPDB_fnc_updatePartial;
		[cxp_bounty_procurados] remoteExecCall ["cxp_fnc_updateBountyListLocal",RANY];
	};
};

if (_func isEqualTo "save_DB_out") exitWith {
	if (_alvoUid in cxp_bounty_procurados) then {
		cxp_bounty_procurados deleteAt (cxp_bounty_procurados find _alvoUid);
		[_alvoUid,_alvoSide,1,9] call CXPDB_fnc_updatePartial;
		[cxp_bounty_procurados] remoteExecCall ["cxp_fnc_updateBountyListLocal",RANY];
	} else {
		[_alvoUid,_alvoSide,0,9] call CXPDB_fnc_updatePartial;
		[cxp_bounty_procurados] remoteExecCall ["cxp_fnc_updateBountyListLocal",RANY];
	};
};