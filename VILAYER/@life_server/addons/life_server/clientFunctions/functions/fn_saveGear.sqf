#include "\life_server\script_macros.hpp"
/*
    File: fn_saveGear.sqf
    Author: Bryan "Tonic" Boardwine
    Full Gear/Y-Menu Save by Vampire
    Edited: Itsyuka && Casperento

    Description:
    Saves the players gear for syncing to the database for persistence..
*/
private _return = [];
private _savedVirtualItems = CXP_SETTINGS(getArray,"saved_virtualItems");

_return pushBack (getUnitLoadout player);

private _yItems = [];

{
    _val = ITEM_VALUE(_x);
    if (_val > 0) then {
        _yItems pushBack [_x,_val];
    };
} forEach _savedVirtualItems;

if (CXP_SETTINGS(getNumber,"save_virtualItems") isEqualTo 1) then {
    _return pushBack _yItems;
} else {
    _return pushBack [];
};

cxp_gear = _return;
