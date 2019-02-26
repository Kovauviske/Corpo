#include "\cxp_server\script_macros.hpp"
/*
 File: fn_craftAction.sqf
 Author: EdgeKiller
 Description:
 Master handling for crafting an item.
*/
private["_dialog","_item","_itemInfo","_oldItem","_newItem","_upp","_itemName","_ui","_progress","_pgText","_cP","_allMaterial","_matsNeed","_invSize","_handledItem","_itemFilter","_backpackOldItems","_weight","_weightUsedItems"];
disableSerialization;
_dialog = findDisplay 666;
if((lbCurSel 669) == -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = lbData[669,(lbCurSel 669)];
_allMaterial = true;
_itemFilter = lbData[673,(lbCurSel 673)];
_matsNeed = 0;
_config = [_itemFilter] call cxp_fnc_craftCfg;
cxp_action_inUse = true;//Lock out other actions during processing.

{
	if (_item == _x select 0)then {
		_matsNeed = _x select 1;
		_invSize = count _matsNeed;
		for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {
			_matsNum = _matsNeed select _i+1;
			if ((ITEM_VALUE(_matsNeed select _i)) < _matsNum) then {_allMaterial = false;};
		};
	};
} foreach (_config);

_newItem = _item;
diag_log format ["%1",_allMaterial];
if (!_allMaterial) exitWith {hint localize "STR_PM_NoMaterial"; cxp_action_inUse = false;};

//Some checks
if ((count _matsNeed) == 0) exitWith {cxp_action_inUse = false;};
if (_itemFilter == "backpack" && backpack player != "") exitWith {
	hint localize "STR_CRAFT_AR_Backpack";
	cxp_action_inUse = false;
};
if (_itemFilter == "uniform" && uniform player != "") exitWith {
	hint localize "STR_CRAFT_AR_Uniform";
	cxp_action_inUse = false;
};
if (_itemFilter == "weapon") then {
	if (!(player canAdd _newItem) || currentWeapon player != "") exitWith {
		hint localize "STR_NOTF_NoRoom";
		cxp_action_inUse = false;
	};
};
if (_itemFilter == "item") then {
	_weight = [_item] call cxp_fnc_itemWeight;
	_weightUsedItems = 0;
	for [{_i=0},{_i<(count _matsNeed)-1},{_i=_i+2}] do {
		_matsNum = _matsNeed select _i+1;
		_weightUsedItems = _weightUsedItems + (([(_matsNeed select _i)] call cxp_fnc_itemWeight) * _matsNum);
		diag_log format ["%1 - %2",(_matsNeed select _i),_weightUsedItems];
	};
	if ((cxp_carryWeight - _weightUsedItems + _weight) > cxp_maxWeight) exitWith {
		hint localize "STR_NOTF_NoRoom";
		cxp_action_inUse = false;
	};
};
_oldItem = _matsNeed;

if (_itemFilter == "item") then {
	_itemName = localize M_CONFIG(getText,"VirtualItems",_newItem,"displayName");
} else {
	_itemInfo = [_newItem] call cxp_fnc_fetchCfgDetails;
	_itemName = _itemInfo select 1;
};

cxp_is_processing = true;
_upp = format["Craftando %1",_itemName];
closeDialog 0;
//Setup our progress bar.
disableSerialization;
"progressBar" cutRsc ["cxp_progress","PLAIN"];
_ui = uiNameSpace getVariable "cxp_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
_removeItemSuccess = true;
_invSize = count _oldItem;

for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {
	_handledItem = (_oldItem select _i);
	if(!([false,_handledItem,_oldItem select _i+1] call cxp_fnc_handleInv)) exitWith {_removeItemSuccess = false;};
};
if (!_removeItemSuccess) exitWith {"progressBar" cutText ["","PLAIN"]; cxp_is_processing = false; cxp_action_inUse = false;};
for "_i" from 0 to 1 step 0 do {
	sleep 0.3;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
};
if (_itemFilter == "backpack") then {
	if(backpack player == "") then {
		player addBackpack _newItem;
	} else {
		hint localize "STR_CRAFT_AR_Backpack";
		cxp_is_processing = false;
		cxp_action_inUse = false;
	};
};
if (_itemFilter == "uniform") then{
	if(uniform player == "") then{
		player addUniform _newItem;
	} else {
		hint localize "STR_CRAFT_AR_Uniform";
		cxp_is_processing = false;
		cxp_action_inUse = false;
	};
};
if (_itemFilter == "weapon") then{
	if(player canAdd _newItem) then{
		player addItem _newItem;
	} else {
		if(currentWeapon player == "") then{
			player addWeapon _newItem;
		} else {
			"progressBar" cutText ["","PLAIN"];
			for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {
				_handledItem = (_oldItem select _i);
				[true,_handledItem,_oldItem select _i+1] call cxp_fnc_handleInv;
			};
			cxp_is_processing = false;
			cxp_action_inUse = false;
		};
	};
};
if (_itemFilter == "item") then{
	_handledItem = _newItem;
	[true,_handledItem,1] call cxp_fnc_handleInv;
};
"progressBar" cutText ["","PLAIN"];
titleText[format[localize "STR_CRAFT_Process",_itemName],"PLAIN"];
[0] call CXPSKT_fnc_updatePartial;
cxp_is_processing = false;
cxp_action_inUse = false;