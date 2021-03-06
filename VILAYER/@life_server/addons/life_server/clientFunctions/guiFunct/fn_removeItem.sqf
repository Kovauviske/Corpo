#include "\life_server\script_macros.hpp"
/*
    File: fn_removeItem.sqf
    Author: Bryan "Tonic" Boardwine

    Modified: Casperento

    Description:
    Removes the selected item & amount to remove from the players
    virtual inventory.
*/
disableSerialization;

private _data = lbData[2005,(lbCurSel 2005)];
private _value = ctrlText 2010;

if (_data isEqualTo "") exitWith {hint localize "STR_NOTF_didNotSelectToRemove";};
if !([_value] call CXPSV_fnc_isnumber) exitWith {hint localize "STR_NOTF_notNumberFormat";};
if (parseNumber(_value) <= 0) exitWith {hint localize "STR_NOTF_enterAmountRemove";};
if (ITEM_ILLEGAL(_data) isEqualTo 1 && ([west,visiblePosition player,100] call cxp_fnc_nearUnits)) exitWith {titleText[localize "STR_NOTF_illegalItemCannotDispose","PLAIN"]};
if !(isNull objectParent player) exitWith {titleText[localize "STR_NOTF_cannotRemoveInVeh","PLAIN"]};
if !([false,_data,(parseNumber _value)] call cxp_fnc_handleInv) exitWith {hint localize "STR_NOTF_couldNotRemoveThatMuch";};

hint format [localize "STR_NOTF_removedFromInventory",(parseNumber _value),(localize ITEM_NAME(_data))];

[] call cxp_fnc_pupdateMenu;
