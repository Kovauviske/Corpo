/*
	File: fn_saveBugReported.sqf
	Author: Casperento
	Description:
	Salva reporte do cliente no banco de dados
*/
params [["_rptrUID","",[""]],["_rptrName","",[""]],["_bugRptr","",[""]],["_exptdBeha","",[""]],["_unit",objNull,[objNull]]];
if ((_rptrUID isEqualTo "") || (_rptrName isEqualTo "") || (_bugRptr isEqualTo "") || (_exptdBeha isEqualTo "")) exitWith {["falhou"] remoteExecCall ["cxp_fnc_completeBugTracking",owner _unit];};

//Limpa strings
_rptrName = [_rptrName] call CXPDB_fnc_mresString;
_bugRptr = [_bugRptr] call CXPDB_fnc_mresString;
_exptdBeha = [_exptdBeha] call CXPDB_fnc_mresString;

private _query = format["INSERT INTO bugTracker SET pid ='%1', name = '%2', bugReportado = '%3', esperadoQue = '%4'",_rptrUID,_rptrName,_bugRptr,_exptdBeha];
[_query,1] call CXPDB_fnc_asyncCall;

["sucesso"] remoteExecCall ["cxp_fnc_completeBugTracking",owner _unit];
