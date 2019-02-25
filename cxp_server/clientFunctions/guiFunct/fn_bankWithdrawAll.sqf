#include "\cxp_server\script_macros.hpp"
/*
	File: fn_bankWithdrawAll.sqf
	Author: Casperento
	Description:
	Withdraw all the money on the player's bank
*/
private _valor = BANK;
if (_valor < 1) exitWith {};
CASH = CASH + BANK;
BANK = 0;
[true] call cxp_fnc_hudUpdate;
[] call cxp_fnc_atmMenu;
[6] call CXPSKT_fnc_updatePartial;
hint localize "STR_ATM_WithdrawAllSuccess";

if (CXP_SETTINGS(getNumber,"player_moneyLog") isEqualTo 1) then {
    if (CXP_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        money_log = format [localize "STR_DL_ML_withdrewBank_BEF",_value,[BANK] call cxp_fnc_numberText,[CASH] call cxp_fnc_numberText];
    } else {
        money_log = format [localize "STR_DL_ML_withdrewBank",profileName,(getPlayerUID player),_value,[BANK] call cxp_fnc_numberText,[CASH] call cxp_fnc_numberText];
    };
    publicVariableServer "money_log";
};