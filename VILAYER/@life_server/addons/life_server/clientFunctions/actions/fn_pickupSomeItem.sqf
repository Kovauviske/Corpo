#include "\life_server\script_macros.hpp"
/*
	File : fn_pickupSomeItem.sqf
	Author : Casperento

	Description :
	Pegar item no chao
*/
private "_obj";
disableSerialization;
if (isNull (findDisplay 1520)) then {
	_obj = cursorObject;
} else {
	_obj = objNull;
	if ((lbCurSel 1521) > -1) then {_obj = cxp_pickup_item_array select (lbCurSel 1521);};
};

if (isNull _obj || isPlayer _obj) exitWith {};

if (((_obj getVariable "item") select 0) isEqualTo "money") then {
	[_obj] spawn cxp_fnc_pickupMoney;
} else {
	[_obj] spawn cxp_fnc_pickupItem;
};
