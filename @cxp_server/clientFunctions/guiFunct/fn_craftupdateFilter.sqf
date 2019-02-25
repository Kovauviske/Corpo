#include "\cxp_server\script_macros.hpp"
/*
	File: fn_craft_updateFilter.sqf
	Description: Crafting System
	Created by EdgeKiller
	Coder: EdgeKiller
	Modified : Casperento
*/
private["_list","_filter","_dialog","_inv","_mats","_filterBox","_item","_itemFilter"];
disableSerialization;
_dialog = findDisplay 666; //find the craft dialog/window
_inv = _dialog displayCtrl 669; //find the listbox of items can be created
_mats = _dialog displayCtrl 672;
_filterBox = _dialog displayCtrl 673;
_itemFilter = lbData[673,(lbCurSel 673)];
lbClear _inv;
_struct = "";
_config = [_itemFilter] call cxp_fnc_craftCfg;

{
	if(_itemFilter == "item") then{
		_str = ITEM_NAME(_x select 0);
		_inv lbAdd format["%1",(localize _str)]; //add a gun to the listbox
		_inv lbSetData[(lbSize _inv)-1,_x select 0]; //set the data of the gun
		_icon = ITEM_ICON(_x select 0);
		_inv lbSetPicture[(lbSize _inv)-1,_icon];
	} else {
		_itemInfo = [_x select 0] call cxp_fnc_fetchCfgDetails;
		_inv lbAdd format["%1",_itemInfo select 1]; //add a gun to the listbox
		_inv lbSetData[(lbSize _inv)-1,_itemInfo select 0]; //set the data of the gun
		_inv lbSetPicture[(lbSize _inv)-1,_itemInfo select 2];
	};
} foreach (_config);

_inv lbSetCurSel 0;
_item = lbData[669,(lbCurSel 669)];
_config = [_itemFilter] call cxp_fnc_craftCfg;

{
	if(_item == _x select 0)then {
		_matsNeed = _x select 1;
		_invSize = count _matsNeed;
		for [{_i = 0},{_i < _invSize - 1},{_i = _i + 2}] do {
			_str = ITEM_NAME(_matsNeed select _i);
			_matsNum = _matsNeed select _i+1;
			_struct = _struct + format["%1x %2<br/>",_matsNum,(localize _str)];
		};
	};
} foreach (_config);

_mats ctrlSetStructuredText parseText format["
<t size='0.8px'>
%1
</t>
",_struct];