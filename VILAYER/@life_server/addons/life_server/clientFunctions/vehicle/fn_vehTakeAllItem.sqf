#include "\life_server\script_macros.hpp"
#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehTakeAllItem.sqf
	Author: Killerknight
	
	Modified : Casperento
	
	Description:
	Take all (max items) from selected and add it to the players inventory
*/
private["_ctrl","_num","_index","_data","_old","_value","_weight","_diff"];
disableSerialization;
if (isNull cxp_trunk_vehicle || !alive cxp_trunk_vehicle) exitWith {hint localize "STR_MISC_VehDoesntExist"};
if (!alive player) exitWith {closeDialog 0;};
if ((cxp_trunk_vehicle getVariable ["trunk_in_use_by",player]) != player) exitWith {  closeDialog 0; hint localize "STR_MISC_VehInvUse"; };

if ((lbCurSel 3502) == -1) exitWith {hint localize "STR_Global_NoSelection";};
_ctrl = ctrlSelData(3502);
_config = configName (missionConfigFile >> "VirtualItems" >> _ctrl);
_num2 = getNumber(missionConfigFile >> "VirtualItems" >> _config  >> "weight");
_num1 = (floor (((cxp_maxWeight) - (cxp_carryWeight)) / _num2));
_num = if (_num1 <= ((((cxp_trunk_vehicle getVariable "Trunk") select 0) select (lbCurSel 3502)) select 1)) then {_num1}else{((((cxp_trunk_vehicle getVariable "Trunk") select 0) select (lbCurSel 3502)) select 1)};
if(_num < 1) exitWith {
	hint "Voce nao tem espaco no inventario para armazenar este item !";
};

_index = [_ctrl,((cxp_trunk_vehicle getVariable "Trunk") select 0)] call CXPSV_fnc_index;
_data = (cxp_trunk_vehicle getVariable "Trunk") select 0;
_old = cxp_trunk_vehicle getVariable "Trunk";
if(_index == -1) exitWith {};
_value = _data select _index select 1;
if(_num > _value) exitWith {
	hint localize "STR_MISC_NotEnough";
};
_num = [_ctrl,_num,cxp_carryWeight,cxp_maxWeight] call cxp_fnc_calWeightDiff;
if(_num == 0) exitWith {
	hint localize "STR_NOTF_InvFull";
};
_weight = ([_ctrl] call cxp_fnc_itemWeight) * _num;
if(_ctrl == "money") then {
	if(_num == _value) then {
		_data set[_index,-1];
		_data = _data - [-1];
	} else {
		_data set[_index,[_ctrl,(_value - _num)]];
	};
	
	CASH = CASH + _num;
	[true] call cxp_fnc_hudUpdate;
	cxp_trunk_vehicle setVariable["Trunk",[_data,(_old select 1) - _weight],true];
	[cxp_trunk_vehicle] call cxp_fnc_vehInventory;
} else {
	if([true,_ctrl,_num] call cxp_fnc_handleInv) then {
		if(_num == _value) then {
			_data set[_index,-1];
			_data = _data - [-1];
		} else {
			_data set[_index,[_ctrl,(_value - _num)]];
		};
		cxp_trunk_vehicle setVariable["Trunk",[_data,(_old select 1) - _weight],true];
		[cxp_trunk_vehicle] call cxp_fnc_vehInventory;
	} else {
		hint localize "STR_NOTF_InvFull";
	};
};