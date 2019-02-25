#include "\cxp_server\script_macros.hpp"
/*
	File: fn_cellphone.sqf
	Author: Alan
	Modified: Casperento

	Description:
	Abre o menu de e-mail do menu do jogador
*/
private _name = param [0,"",[""]];

disableSerialization;
waitUntil {!isNull findDisplay 3000};
private _units = CONTROL(3000,3004);

ctrlSetText [3003, ""];
lbClear _units;

switch (playerSide) do {
	case independent : {ctrlShow[3022,false];};
	case west : {ctrlShow[3016,false];};
};

private "_lbNum";
private "_type";
{
	if(alive _x && _x != player) then {
		switch (side _x) do {
			case west: {_type = "Cop"};
			case civilian: {_type = "Civ"};
			case independent: {_type = "Med"};
		};
		_units lbAdd format["%1 (%2)",_x getVariable ["realname",name _x],_type];
		_units lbSetData [(lbSize _units)-1,str(_x)];

		if(_name != "") then {
			if(name _x isEqualTo _name) then {
				_lbNum = lbSize(_units);
			};
		};
	};
} forEach playableUnits;

if (_name == "") then {
	lbSetCurSel [3004,0];
} else {
	lbSetCurSel [3004,_lbNum];
};
