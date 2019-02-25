#include "\cxp_server\script_macros.hpp"
/*
    File: fn_bankWithdraw.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Casperento
    Description:
    Withdraws money from the players account
*/
private _value = parseNumber(ctrlText 2702);
if (_value > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if (_value < 1) exitWith {};
if (!([str(_value)] call CXPSV_fnc_isnumber)) exitWith {hint localize "STR_ATM_notnumeric"};
if (_value > BANK) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
if (_value < 100 && BANK > 20000000) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Temp fix for something.

CASH = CASH + _value;
BANK = BANK - _value;
[true] call cxp_fnc_hudUpdate;

hint format [localize "STR_ATM_WithdrawSuccess",[_value] call cxp_fnc_numberText];
[] call cxp_fnc_atmMenu;
[6] call CXPSKT_fnc_updatePartial;

if (CXP_SETTINGS(getNumber,"player_moneyLog") isEqualTo 1) then {
    if (CXP_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        money_log = format [localize "STR_DL_ML_withdrewBank_BEF",_value,[BANK] call cxp_fnc_numberText,[CASH] call cxp_fnc_numberText];
    } else {
        money_log = format [localize "STR_DL_ML_withdrewBank",profileName,(getPlayerUID player),_value,[BANK] call cxp_fnc_numberText,[CASH] call cxp_fnc_numberText];
    };
    publicVariableServer "money_log";
};
