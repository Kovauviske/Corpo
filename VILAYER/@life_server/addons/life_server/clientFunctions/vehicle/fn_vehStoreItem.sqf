#include "\life_server\script_macros.hpp"
#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
    File: fn_vehStoreItem.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Used in the vehicle trunk menu, stores the selected item and puts it in the vehicles virtual inventory
    if the vehicle has room for the item.
*/
private ["_ctrl","_num","_totalWeight","_itemWeight","_veh_data","_inv","_index","_val"];
disableSerialization;
if ((cxp_trunk_vehicle getVariable ["trunk_in_use_by",player]) != player) exitWith { closeDialog 0; hint localize "STR_MISC_VehInvUse"; };
if (cxp_is_processing) exitWith {};

_ctrl = ctrlSelData(3503);
_num = ctrlText 3506;
if (!([_num] call CXPSV_fnc_isnumber)) exitWith {hint localize "STR_MISC_WrongNumFormat";};
_num = parseNumber(_num);
if (_num < 1) exitWith {hint localize "STR_MISC_Under1";};

private "_armaze";
private "_usado";
if (typeOf cxp_trunk_vehicle in ["Land_TentDome_F","Land_TentA_F"]) then {
	_armaze = getNumber(missionConfigFile >> "CxpBasic_Settings" >> "cxp_barracas" >> (typeOf cxp_trunk_vehicle) >> "armazenamento");
	_usado = (cxp_trunk_vehicle getVariable "Trunk") select 1;
	if (isNil "_usado") then {_usado = 0;};
	_totalWeight = [_armaze,_usado];
} else {
	_totalWeight = [cxp_trunk_vehicle] call cxp_fnc_vehicleWeight;
};

_itemWeight = ([_ctrl] call cxp_fnc_itemWeight) * _num;
_veh_data = cxp_trunk_vehicle getVariable ["Trunk",[[],0]];
_inv = _veh_data select 0;

if (_ctrl == "goldbar" && {!(cxp_trunk_vehicle isKindOf "LandVehicle")}) exitWith {hint localize "STR_NOTF_canOnlyStoreInLandVeh";};

if (_ctrl == "money") then {
    _index = [_ctrl,_inv] call CXPSV_fnc_index;
    if (CASH < _num) exitWith {hint localize "STR_NOTF_notEnoughCashToStoreInVeh";};
    if (_index isEqualTo -1) then {
        _inv pushBack [_ctrl,_num];
    } else {
        _val = _inv select _index select 1;
        _inv set[_index,[_ctrl,_val + _num]];
    };

    CASH = CASH - _num;
	[true] call cxp_fnc_hudUpdate;
    [0] call CXPSKT_fnc_updatePartial;
    cxp_trunk_vehicle setVariable ["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
    [cxp_trunk_vehicle] call cxp_fnc_vehInventory;
} else {
    if (((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {hint localize "STR_NOTF_VehicleFullOrInsufCap";};

    if (!([false,_ctrl,_num] call cxp_fnc_handleInv)) exitWith {hint localize "STR_CouldNotRemoveItemsToPutInVeh";};
    _index = [_ctrl,_inv] call CXPSV_fnc_index;
    if (_index isEqualTo -1) then {
        _inv pushBack [_ctrl,_num];
    } else {
        _val = _inv select _index select 1;
        _inv set[_index,[_ctrl,_val + _num]];
    };

    cxp_trunk_vehicle setVariable ["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
    [cxp_trunk_vehicle] call cxp_fnc_vehInventory;
};