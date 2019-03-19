#include "\life_server\script_macros.hpp"
#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehStoreAllItem.sqf
	Author: Killerknight
	Modified : Casperento
	Description:
	stores all (max items) from selected and add it to the Vehicles inventory
*/
private["_ctrl","_num","_totalWeight","_itemWeight","_veh_data","_inv","_index","_val"];
private "_armaze";
private "_usado";
disableSerialization;
if ((cxp_trunk_vehicle getVariable ["trunk_in_use_by",player]) != player) exitWith { closeDialog 0; hint localize "STR_MISC_VehInvUse"; };
if (cxp_is_processing) exitWith {};

if ((lbCurSel 3503) == -1) exitWith {hint localize "STR_Global_NoSelection";};
_ctrl = ctrlSelData(3503);
if(cxp_trunk_vehicle isKindOf "House_F") then {
	_mWeight = 0;
	{_mWeight = _mWeight + ([(typeOf _x)] call cxp_fnc_vehicleWeightCfg);} foreach (cxp_trunk_vehicle getVariable["containers",[]]);
	_totalWeight = [_mWeight,(cxp_trunk_vehicle getVariable["Trunk",[[],0]]) select 1];
} else {
	if (typeOf cxp_trunk_vehicle in ["Land_TentDome_F","Land_TentA_F"]) then {
		_armaze = getNumber(missionConfigFile >> "CxpBasic_Settings" >> "cxp_barracas" >> (typeOf cxp_trunk_vehicle) >> "armazenamento");
		_usado = (cxp_trunk_vehicle getVariable "Trunk") select 1;
		if (isNil "_usado") then {_usado = 0;};
		_totalWeight = [_armaze,_usado];
	} else {
		_totalWeight = [cxp_trunk_vehicle] call cxp_fnc_vehicleWeight;
	};
};
_num2 = getNumber(missionConfigFile >> "VirtualItems" >> _ctrl >> "weight");
_num1 = (floor (((_totalWeight select 0) - (_totalWeight select 1)) / _num2));
_num = if (_num1 <= (ITEM_VALUE(_ctrl))) then {_num1}else{(ITEM_VALUE(_ctrl))};
if(_num < 1) exitWith {
	hint "Voce nao tem espaco no inventario para armazenar este item !";
};
_itemWeight = ([_ctrl] call cxp_fnc_itemWeight) * _num;
_veh_data = cxp_trunk_vehicle getVariable ["Trunk",[[],0]];
_inv = _veh_data select 0;

if(_ctrl == "goldbar" && {!(cxp_trunk_vehicle isKindOf "LandVehicle" OR cxp_trunk_vehicle isKindOf "House_F")}) exitWith {
	hint "Este item so pode ser armazenado em veiculos terrestres !";
};

if(_ctrl == "money") then
{
	_index = [_ctrl,_inv] call CXPSV_fnc_index;
	if(CASH < _num) exitWith {
		hint "Voce nao precisa guardar tanto dinheiro assim..";
	};
	if(_index == -1) then
	{
		_inv pushBack [_ctrl,_num];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};

	CASH = CASH - _num;
	[true] call cxp_fnc_hudUpdate;
	cxp_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[cxp_trunk_vehicle] call cxp_fnc_vehInventory;
}
	else
{
	if(((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {
		hint "O inventario do veiculo esta cheio !";
	};

	if(!([false,_ctrl,_num] call cxp_fnc_handleInv)) exitWith {
		hint "Nao foi possivel guardar este item.";
	};
	_index = [_ctrl,_inv] call CXPSV_fnc_index;
	if(_index isEqualTo -1) then
	{
		_inv pushBack [_ctrl,_num];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};

	cxp_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[cxp_trunk_vehicle] call cxp_fnc_vehInventory;
};