#include "\cxp_server\script_macros.hpp"
/*
    File: fn_updatePrice.sqf
    Author: Worldtrade1101
    Edited by: Derek && Casperento
    Base on Tonic script
    Description:
    Update and fill the virtual shop menu.
*/
disableSerialization;
params [
    ["_type", 0],
    ["_array", []]
];

//Setup control vars.
private _item_list = CONTROL(2400,2401);
private _gear_list = CONTROL(2400,2402);

//Purge list
lbClear _item_list;
lbClear _gear_list;

private _shop_data = M_CONFIG(getArray,"VirtualShops",cxp_shop_type,"items");

if (count _array isEqualTo 0) exitwith {};

{
    if ((_x select 1) > -1 ) then {
        private _name = ITEM_NAME(_x select 0);
        private _price = _x select 1;
        _item_list lbAdd format["%1  ($%2)",(localize _name),[_price] call cxp_fnc_numberText];
        _item_list lbSetData [(lbSize _item_list)-1,_x select 0];
        _item_list lbSetValue [(lbSize _item_list)-1,_price];
        _icon = M_CONFIG(getText,"VirtualItems",(_x select 0),"icon");
        if !(_icon isEqualTo "") then {
            _item_list lbSetPicture [(lbSize _item_list)-1,_icon];
        };
    };
} forEach _array;

{
    if ((_x select 2) > -1 ) then {
        private _val = ITEM_VALUE(_x select 0);
        private _name = ITEM_NAME(_x select 0);
        if (_val > 0) then {
            private _price = _x select 2;
            _gear_list lbAdd format["%2 [x%1]",_val,(localize _name)];
            _gear_list lbSetData [(lbSize _gear_list)-1,_x select 0];
            _gear_list lbSetValue [(lbSize _gear_list)-1,_price];
            _icon = M_CONFIG(getText,"VirtualItems",(_x select 0),"icon");
            if !(_icon isEqualTo "") then {
                _gear_list lbSetPicture [(lbSize _gear_list)-1,_icon];
            };
        };
    };
} forEach (_array);

lbSort _item_list;
lbSort _gear_list;
