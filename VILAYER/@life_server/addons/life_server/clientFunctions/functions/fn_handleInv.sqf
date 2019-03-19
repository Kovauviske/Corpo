#include "\life_server\script_macros.hpp"
/*
    File: fn_handleInv.sqf
    Author: Bryan "Tonic" Boardwine

	Modified: Casperento
	
    Description:
    Do I really need one?
*/
params [
	["_math",false,[false]],
	["_item","",[""]],
	["_num",0,[0]]
];
if (_item isEqualTo "" || _num isEqualTo 0) exitWith {false};

private _var = ITEM_VARNAME(_item);

if (_math) then {
    private _diff = [_item,_num,cxp_carryWeight,cxp_maxWeight] call cxp_fnc_calWeightDiff;
    _num = _diff;
    if (_num <= 0) exitWith {false};
};
private _weight = ([_item] call cxp_fnc_itemWeight) * _num;
private _value = ITEM_VALUE(_item);

private "_return";
if (_math) then {
    //Lets add!
    if ((cxp_carryWeight + _weight) <= cxp_maxWeight) then {
        missionNamespace setVariable [_var,(_value + _num)];
        if ((missionNamespace getVariable _var) > _value) then {
            cxp_carryWeight = cxp_carryWeight + _weight;
            _return = true;
        } else {
            _return = false;
        };
    } else {
		_return = false;
    };
} else {
    //Lets SUB!
    if ((_value - _num) < 0) then {
		_return = false;
	} else {
        missionNamespace setVariable [_var,(_value - _num)];
        if ((missionNamespace getVariable _var) < _value) then {
            cxp_carryWeight = cxp_carryWeight - _weight;
            _return = true;
        } else {
			_return = false;
        };
    };
};

_return;
