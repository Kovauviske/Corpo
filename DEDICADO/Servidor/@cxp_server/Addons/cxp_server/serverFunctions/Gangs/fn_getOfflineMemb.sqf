/*
    File: fn_getOfflineMemb.sqf
    Author: Casperento
*/
params [
	["_uidLeader","",[""]],
	["_pl",objNull,[objNull]]
];

private _query = format ["SELECT members FROM gangs WHERE active='1' AND owner='%1'",_uidLeader];
private _queryResult = [_query,2] call CXPDB_fnc_asyncCall;

if !(count _queryResult isEqualTo 0) then {
    _queryResult = [_queryResult select 0] call CXPDB_fnc_mresToArray;
    if (_queryResult isEqualType "") then {_queryResult = call compile format ["%1", _queryResult];};
	[_queryResult] remoteExecCall ["cxp_fnc_getOffmem",(owner _pl)];
};