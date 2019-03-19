/*
	Author: GetSomePanda / Panda
	SteamID: 76561198145366418
	File Name: fn_saveCellPhone.sqf
	Information: Saves messages on cellphone to cellphone db.
	Modified : Casperento
*/
params [
	["_pid","",[""]],
	["_msgs",[],[[]]]
];
if (count _msgs isEqualTo 0) then {};

/* FIX - String indo cagado pro DB */
private _fromClean = [];
private _msgClean = [];
{
	_from = [(_x select 0)] call CXPDB_fnc_mresString;
	_fromClean pushBack _from;
	_msg = [(_x select 1)] call CXPDB_fnc_mresString;
	_msgClean pushBack _msg;
} forEach _msgs;
for "_i" from 0 to (count _fromClean)-1 do {(_msgs select _i) set[0,(_fromClean select _i)];};
for "_i" from 0 to (count _msgClean)-1 do {(_msgs select _i) set[1,(_msgClean select _i)];};
/* FIX - String indo cagado pro DB */

_msgs = [_msgs] call CXPDB_fnc_mresArray;
private _query = format ["UPDATE cellphone SET messages='%1' WHERE pid='%2'",_msgs,_pid];
[_query,1] call CXPDB_fnc_asyncCall;
