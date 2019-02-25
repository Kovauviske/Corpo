#include "\cxp_server\script_macros.hpp"
/*
	File: fn_pickupItems.sqf
	Author: John "Paratus" VanderZwet

	Modified : Casperento

	Description:
	Dialog code for picking up items.
*/
disableSerialization;

if (isNull (findDisplay 1520) || cxp_pickup_open) exitWith {};

cxp_pickup_open = true;

private _list = CONTROL(1520,1521);
private _lastItems = [];
private _lifeInvItems = getArray (missionConfigFile >> "VirtualItems");

while {!isNull (findDisplay 1520)} do {
	private _items = [];
	private _objects = nearestObjects [player, [], 4];
	{
		if (count (_x getVariable ["item",[]]) > 0) then { _items pushBack _x; };
	} forEach _objects;

	_items = [_items, [], {_ic = ((_x getVariable ["item",[]]) select 0);_icf = M_CONFIG(getText,"VirtualItems",_ic,"displayName");_i = -1;{if (_x == _icf) exitWith {_i = _forEachIndex}} forEach _lifeInvItems;_i;},"ASCEND"] call BIS_fnc_sortBy;

	cxp_pickup_item_array = _items;

	if !([_lastItems, _items] call BIS_fnc_areEqual) then {
		ctrlEnable [1522, (count _items > 0)];
		lbClear _list;
		{
			private _itemInfo = _x getVariable ["item", ["Unknown",0]];
			private _itemName = (localize (M_CONFIG(getText,"VirtualItems",(_itemInfo select 0),"displayName")));
			if ((_itemInfo select 0) isEqualTo "money") then {_list lbAdd format["R$%1", [(_itemInfo select 1)] call cxp_fnc_numberText];};
			if (_itemName != "") then {_list lbAdd format["%1x %2",(_itemInfo select 1),_itemName];};
		} foreach _items;
		if (count _items < 1) then {_list lbAdd "Não há nenhum objeto para ser pego no chão.";};
		_list lbSetSelected [0, true];
	};
	_lastItems = _items;
	sleep 0.5;
};

cxp_pickup_open = false;
