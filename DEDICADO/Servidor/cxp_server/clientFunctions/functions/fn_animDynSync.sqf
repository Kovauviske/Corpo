/*
	File: fn_animDynSync.sqf
	Author : Paratus?
	Modified : Casperento
*/
private _unit = param [0,ObjNull,[Objnull]];
private _anim = param [1,"",[""]];
private _type = param [2,"switch",["switch"]];
private _repeat = param [3,0,[0]];

if(isNull _unit) exitWith {};
if (_anim isEqualTo "" && _type != "mimic") then { _type = "stop"; };

if (_repeat > 0) then {
	_unit setVariable ["animLoop", _anim];
	while {!isNull _unit && alive _unit && _unit getVariable ["animLoop", ""] != ""} do {_unit playMoveNow _anim;sleep _repeat;};
} else {
	switch (_type) do {
		case "switch": {_unit switchMove _anim};
		case "playMove": {_unit playMove _anim};
		case "playNow": {_unit playMoveNow _anim};
		case "mimic": {_unit setMimic _anim};
		case "stop": {_unit setVariable ["animLoop", nil];_unit switchMove _anim};
	};
};
