#include "\life_server\script_macros.hpp"
/*
    File: fn_updateEconomy.sqf
    Author: Worldtrade1101
    Edited by: Derek && Casperento
    Base on Tonic script
    Description:
    Update and fill the Economy gui menu.
*/
disableSerialization;
params [
    ["_type", 0],
    ["_market", []]
];
cxp_market = _market;

//Setup control vars.
private _goodlist = CONTROL(39000,39001);

//Purge list
lbClear _goodlist;

if (count cxp_market isEqualTo 0) exitwith {};

private _categories = CXP_SETTINGS(getArray, "market_categories");
private _factor = 1;
{
    _goodlist lbAdd _x;
    _goodlist lbSetValue [(lbSize _goodlist)-1,(_factor*2)-1];
    _factor = _factor + 1;
} forEach _categories;

{
    if ((_x select 2) > 1 ) then {
        private _name = ITEM_NAME((_x select 0));
		    private _icone = ITEM_ICON((_x select 0));
        _goodlist lbAdd format["%1",(localize _name)];
        _goodlist lbSetData [(lbSize _goodlist)-1,_x select 0];
        _goodlist lbSetValue [(lbSize _goodlist)-1,2*(_x select 6)];
		    if !(_icone isEqualTo "") then {
          _goodlist lbSetPicture [(lbSize _goodlist)-1,_icone];
        };
    };
} foreach cxp_market;

lbSortByValue _goodlist;
