/*
	File: fn_showRRMessage.sqf
	Author: Casperento
	Description:
	Exibe msg de restart!
*/
params [["_t1","",[""]],["_t2","",[""]],["_t3","",[""]],["_t4","",[""]],["_t5","",[""]],["_t6","",[""]]];
[
	[
		[_t2,_t1],
		[_t4,_t3],
		[_t6,_t5]
	]
] call BIS_fnc_typeText;