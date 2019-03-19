#include "\life_server\script_macros.hpp"
/*
    File: fn_openEconomy.sqf
    Author: Derek
    Modified : Casperento
    Description:
    Opens the Market menu
*/
if ((CXP_SETTINGS(getNumber, "dynamic_market")) isEqualTo 1) then {
    disableSerialization;
    createDialog "Market";
    waitUntil {!isNull findDisplay 39000};
    private _sellList = CONTROL(39000,39002);
    private _buyList = CONTROL(39000,39003);

    lbClear _sellList;
    lbClear _buyList;

    [0, "economy"] spawn cxp_fnc_retrievePrices;
};
