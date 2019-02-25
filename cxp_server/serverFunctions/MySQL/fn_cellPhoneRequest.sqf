/*
	Author: GetSomePanda / Panda
	SteamID: 76561198145366418
	File Name: fn_cellPhoneRequest.sqf
	Information: Get phone information from db.
	Modified: Casperento
*/
private _player = _this select 0;
private _playerName = name _player;
private _playerUid = getPlayerUid _player;
private _query = format["SELECT pid, playerName, messages FROM cellphone WHERE pid='%1'",_playerUid];
private _queryResult = [_query,2] call CXPDB_fnc_asyncCall;
private _cleanMsgs = "";

// Limpa nome pra n ir cagado pro banco de dados
[_playerName] call CXPDB_fnc_mresString;

if (typeName _queryResult == "STRING") exitWith {
	_cleanMsgs = [(_queryResult select 2)] call CXPDB_fnc_mresToArray;
	_queryResult set[2,_cleanMsgs];
	[_queryResult] remoteExecCall ["cxp_fnc_setupCellPhone",(owner _player)];
};

if (count _queryResult != 0) exitWith {
	_cleanMsgs = [(_queryResult select 2)] call CXPDB_fnc_mresToArray;
	_queryResult set[2,_cleanMsgs];
	[_queryResult] remoteExecCall ["cxp_fnc_setupCellPhone",(owner _player)];
};

_query = format["INSERT INTO cellphone (pid, playerName, messages) VALUES('%1', '%2', '""[]""')",_playerUid,_playerName];
[_query,1] call CXPDB_fnc_asyncCall;
_queryResult = [];
[_queryResult] remoteExecCall ["cxp_fnc_setupCellPhone",(owner _player)];
