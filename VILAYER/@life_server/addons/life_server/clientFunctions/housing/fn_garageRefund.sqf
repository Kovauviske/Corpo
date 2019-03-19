#include "\life_server\script_macros.hpp"
/*
    File: fn_garageRefund.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    I don't know?
*/
_price = _this select 0;
_unit = _this select 1;
if !(_unit isEqualTo player) exitWith {};
BANK = BANK + _price;
[true] call cxp_fnc_hudUpdate;
[1] call CXPSKT_fnc_updatePartial;
