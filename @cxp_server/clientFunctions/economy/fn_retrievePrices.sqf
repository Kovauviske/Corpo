#include "\cxp_server\script_macros.hpp"
/*
	File: fn_retrievePrices.sqf
	Author: Derek
	Modified: Casperento
	Description:
	Searches through the economy public variables to locate the correct ones
*/
params [
    ["_type", 0],
    ["_data", ""]
];

if (_data isEqualTo "") exitWith {diag_log "Shoptype is null";};

private _itemArray = [];
private "_varname";
private "_priceArray";
switch (_data) do {
    case "economy" :{
        private _market = missionNamespace getVariable "MarketPrices";
        {
            _name = (_x select 0);
            _fact = (_x select 1);
            if (_fact != 0) then {
                _varname = format["%1MarketGoodPrice",_name];
                _priceArray = missionNamespace getVariable (_varname);
                _itemArray pushBack _priceArray;
            };
        } forEach _market;
    };
    default {
        private _shopItems = M_CONFIG(getArray,"VirtualShops",_data, "items");
        if ((CXP_SETTINGS(getNumber, "dynamic_market")) isEqualTo 1) then {
            {
                _varname = format["%1MarketGoodPrice",_x];
                _priceArray = missionNamespace getVariable (_varname);
                _itemArray pushBack _priceArray;
            } forEach _shopItems;
        } else {
            {
                _itemArray pushBack [_x, ITEM_BUYPRICE(_x), ITEM_SELLPRICE(_x)];
            } forEach _shopItems;
        };
    };
};

if (_data isEqualTo "economy") exitwith {[_type,_itemArray] spawn cxp_fnc_updateEconomy};
[_type,_itemArray] spawn cxp_fnc_updatePrice;