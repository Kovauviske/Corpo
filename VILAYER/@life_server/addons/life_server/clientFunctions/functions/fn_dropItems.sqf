#include "\life_server\script_macros.hpp"
/*
    File: fn_dropItems.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Casperento
    Description:
    Called on death, player drops any 'virtual' items they may be carrying.
*/
private _unit = _this select 0;
private "_value";
private "_itemName";
private "_item";
{
    if (_x isEqualType "") then {_item = _x;} else {_item = configName _x};
    _value = ITEM_VALUE(_item);
    _itemName = ITEM_VARNAME(_item);

    switch (_item) do {
        case "waterBottle": {
            if (_value > 0) then {
                _pos = _unit modelToWorld[0,3,0];
                _pos = [(_pos select 0),(_pos select 1),0];
                _obj = "Land_BottlePlastic_V1_F" createVehicle _pos;
                [_obj] remoteExecCall ["cxp_fnc_simDisable",RANY];
                _obj setPos _pos;
                _obj setVariable ["item",[_item,_value],true];
                missionNamespace setVariable [_itemName,0];
            };
        };

        case "tbacon": {
            if (_value > 0) then {
                _pos = _unit modelToWorld[0,3,0];
                _pos = [(_pos select 0),(_pos select 1),0];
                _obj = "Land_TacticalBacon_F" createVehicle _pos;
                [_obj] remoteExecCall ["cxp_fnc_simDisable",RANY];
                _obj setPos _pos;
                _obj setVariable ["item",[_item,_value],true];
                missionNamespace setVariable [_itemName,0];
            };
        };

        case "redgull": {
            if (_value > 0) then {
                _pos = _unit modelToWorld[0,3,0];
                _pos = [(_pos select 0),(_pos select 1),0];
                _obj = "Land_Can_V3_F" createVehicle _pos;
                [_obj] remoteExecCall ["cxp_fnc_simDisable",RANY];
                _obj setPos _pos;
                _obj setVariable ["item",[_item,_value],true];
                missionNamespace setVariable [_itemName,0];
            };
        };

        case "fuelEmpty": {
            if (_value > 0) then {
                _pos = _unit modelToWorld[0,3,0];
                _pos = [(_pos select 0),(_pos select 1),0];
                _obj = "Land_CanisterFuel_F" createVehicle _pos;
                [_obj] remoteExecCall ["cxp_fnc_simDisable",RANY];
                _obj setPos _pos;
                _obj setVariable ["item",[_item,_value],true];
                missionNamespace setVariable [_itemName,0];
            };
        };

        case "fuelFull": {
            if (_value > 0) then {
                _pos = _unit modelToWorld[0,3,0];
                _pos = [(_pos select 0),(_pos select 1),0];
                _obj = "Land_CanisterFuel_F" createVehicle _pos;
                [_obj] remoteExecCall ["cxp_fnc_simDisable",RANY];
                _obj setPos _pos;
                _obj setVariable ["item",[_item,_value],true];
                missionNamespace setVariable [_itemName,0];
            };
        };

        case "coffee": {
            if (_value > 0) then {
                _pos = _unit modelToWorld[0,3,0];
                _pos = [(_pos select 0),(_pos select 1),0];
                _obj = "Land_Can_V3_F" createVehicle _pos;
                [_obj] remoteExecCall ["cxp_fnc_simDisable",RANY];
                _obj setPos _pos;
                _obj setVariable ["item",[_item,_value],true];
                missionNamespace setVariable [_itemName,0];
            };
        };

        case "bafTuirY_ncioe9f": {
            if (CASH > 0) then {
                _pos = _unit modelToWorld[0,3,0];
                _pos = [(_pos select 0),(_pos select 1),0];
                _obj = "Land_Money_F" createVehicle _pos;
                _obj setVariable ["item",["money",missionNamespace getVariable [_item,0]],true];
                _obj setPos _pos;
                [_obj] remoteExecCall ["cxp_fnc_simDisable",RANY];
                missionNamespace setVariable ["CASH",0];
                [true] call cxp_fnc_hudUpdate;
            };
        };

        default {
            if (_value > 0) then {
                _pos = _unit modelToWorld[0,3,0];
                _pos = [(_pos select 0),(_pos select 1),0];
                _obj = "Land_Sleeping_bag_blue_folded_F" createVehicle _pos;
				[_obj] remoteExecCall ["cxp_fnc_simDisable",RANY];
				_obj setPos _pos;
				_obj setVariable ["item",[_item,_value],true];
                missionNamespace setVariable [_itemName,0];
            };
        };
    };
} forEach (("true" configClasses (missionConfigFile >> "VirtualItems")) + ["bafTuirY_ncioe9f"]);
