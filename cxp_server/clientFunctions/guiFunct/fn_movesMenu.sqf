#include "\cxp_server\script_macros.hpp"
/*
	File: fn_movesMenu.sqf	
	Author: Jack "Scarso" Farhall
	Modified: Casperento
*/
disableSerialization;
private _moves = [
  ["Kung Fu", "AmovPercMstpSnonWnonDnon_exerciseKata"],
  ["Flexao", "AmovPercMstpSnonWnonDnon_exercisePushup"],
  ["Agachamento (Rapido)", "AmovPercMstpSnonWnonDnon_exercisekneeBendB"],
  ["Agachamento (Normal)", "AmovPercMstpSnonWnonDnon_exercisekneeBendA"],
  ["Assustado", "AmovPercMstpSnonWnonDnon_Scared"]
];

waitUntil {!isNull(findDisplay 2900)};

private _list = CONTROL(2900,2902);
lbClear _list; {
  _list lbAdd format["%1", _x select 0];
  _list lbSetdata[(lbSize _list) - 1, str(_x select 1)];
} forEach _moves;