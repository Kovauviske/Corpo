/*
	File: fn_getNameByUID.sqf
	Author: Casperento
	Description:
	Pega nome do player pelo UID e manda de volta pro caller
*/
params [
	["_arrUids",[],[[]]],
	["_caller",objNull,[objNull]]
];

if (count _arrUids isEqualTo 0 || isNull _caller) exitWith {};

private _arr = [];
{
	_queryOne = format ["SELECT name FROM players WHERE pid='%1'",_x];
	_queryRetOne = [_queryOne,2] call CXPDB_fnc_asyncCall;
	
	_queryTwo = format ["SELECT gdonorlevel FROM players WHERE pid='%1'",_x];
	_queryRetTwo = [_queryTwo,2] call CXPDB_fnc_asyncCall;

	_arr pushBack [(_queryRetOne select 0),(_queryRetTwo select 0),_x];
} forEach _arrUids;

[_arr] remoteExecCall ["cxp_fnc_getNamesExUID",(owner _caller)];