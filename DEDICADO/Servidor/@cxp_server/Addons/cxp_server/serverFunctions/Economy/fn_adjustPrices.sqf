#include "\cxp_server\script_macros.hpp"
/*
    File: fn_adjustPrices.sqf
    Author: worldtrade1101
    Edited by: Derek Benson && Casperento
    Description:
    Updates the variables serverside.
*/
params [
    ["_type",0,[0]],
    ["_unit",objNull,[objNull]],
    ["_data","",[""]],
    ["_amount",0,[0]],
    ["_price",0,[0]],
    ["_var","",[""]]
];

/* Randomizes when changes hit the market */
private _endtime = CXP_SETTINGS(getNumber, "end_time");
private _diff = _endtime - time;
private _cfgDelay = CXP_SETTINGS(getNumber, "adjustment_delay");
private _delay = _cfgDelay + random(_cfgDelay/10);

if (_diff < _delay) then {_delay = _diff - 10;if (_delay < 0) then {_delay = 0;};};

sleep _delay;
//Error checks

diag_log format ["%1   %2    %3    %4    %5    %6",_unit,_type,_data,_amount,_price,_var];
if ((_data isEqualTo "") || (isNull _unit)) exitWith { diag_log "data or unit null"; };

_unit = owner _unit; //for hack purpose!
private _market = missionNamespace getVariable "MarketPrices";
private _good = missionNamespace getVariable format["%1MarketGoodPrice",_var];

if (isNil "_good") exitWith {diag_log format["ERROR: nil _good variable found in adjust prices. _var = %1", _var];};
private _itemArray = [];

//we check the factor of the object
private _factor = (_good select  6);
if (_factor isEqualTo 0) exitwith {};//the factor 0 is not a real group

{
    if ((_x select 1) isEqualTo _factor) then {
        _name = format["%1MarketGoodPrice",(_x select 0)];
        _itemArray pushBack (missionNamespace getVariable _name);
    };
} forEach _market;

private _sellingfactor = (count _itemArray) - 1;

{
    _resource = _x select 0;
    _buyprice = _x select 1;
    _sellprice = _x select 2;
    _varprice = _x select 3;
    _minprice = _x select 4;
    _maxprice = _x select 5;
    _changeco = 0.3 + random 1.4;
    _x set [7, _sellprice];
    if (_resource isEqualTo _var) then {
        if (_type isEqualTo 0) then {
            if ((_sellprice - (_varprice * _amount * _sellingfactor)) > _minprice) then {
                _sellprice = _sellprice - (_varprice * _amount * _sellingfactor);
            } else {
                _sellprice = _minprice;
            };
            if (_buyprice > 0) then {
                if (_sellprice >= _buyprice) then {
                    _buyprice=_sellprice + 15;
                };
            };
        };
    } else {
        _varprice = _varprice * _changeco;
        if (_type isEqualTo 0) then {
            if ((_sellprice + (_varprice * _amount)) < _maxprice) then {
                _sellprice = round(_sellprice + (_varprice * _amount));
            } else {
                _sellprice = _maxprice;
            };
        };
    };

    _x set [2, _sellprice];
    _name = format["%1MarketGoodPrice",(_x select 0)];
    missionNamespace setVariable [_name,_x];
    publicVariable _name;
} forEach _itemArray;