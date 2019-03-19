/*
	File: fn_insertDoadores.sqf
	Author: Casperento
	Description:
	Insere novo doador na tabela de doadores!
*/
params [
	["_uid","",[""]],
	["_expira",0,[0]],
	["_doador",objNull,[objNull]]
];

if (_expira isEqualTo -1) then {
	private _query = format ["UPDATE doadores SET vipExpirado='1' WHERE pid='%2'",_uid];
	[_query,1] call CXPDB_fnc_asyncCall;
	["CALL vipCxpExpirado",1] call CXPDB_fnc_asyncCall;
	[true] remoteExecCall ["cxp_fnc_novoDonator",(owner _doador)];
} else {
	private _query = format ["SELECT vipExpirado FROM doadores WHERE pid='%1'",_uid];
	private _qRt1 = [_query,2] call CXPDB_fnc_asyncCall;
	if (count _qRt1 isEqualTo 0 || _qRt1 isEqualType "") then {
		private _query = format ["INSERT INTO doadores (pid,vipExpirado) VALUES('%1',0)",_uid];
		[_query,1] call CXPDB_fnc_asyncCall;
	};
	[false] remoteExecCall ["cxp_fnc_novoDonator",(owner _doador)];
};