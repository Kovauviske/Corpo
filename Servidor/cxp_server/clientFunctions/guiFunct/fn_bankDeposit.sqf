#include "\cxp_server\script_macros.hpp"
/*
    File: fn_bankDeposit.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Casperento
    Description:
    Figure it out.
*/
private _value = parseNumber(ctrlText 2702);

//Series of stupid checks
if (_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if (_value < 1) exitWith {};
if (!([str(_value)] call CXPSV_fnc_isnumber)) exitWith {hint localize "STR_ATM_notnumeric"};
if (_value > CASH) exitWith {hint localize "STR_ATM_NotEnoughCash"};

CASH = CASH - _value;
BANK = BANK + _value;
[true] call cxp_fnc_hudUpdate;

hint format [localize "STR_ATM_DepositSuccess",[_value] call cxp_fnc_numberText];
[] call cxp_fnc_atmMenu;
[6] call CXPSKT_fnc_updatePartial;

if (CXP_SETTINGS(getNumber,"player_moneyLog") isEqualTo 1) then {
    if (CXP_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        money_log = format [localize "STR_DL_ML_depositedBank_BEF",_value,[BANK] call cxp_fnc_numberText,[CASH] call cxp_fnc_numberText];
    } else {
        money_log = format [localize "STR_DL_ML_depositedBank",profileName,(getPlayerUID player),_value,[BANK] call cxp_fnc_numberText,[CASH] call cxp_fnc_numberText];
    };
    publicVariableServer "money_log";
};
