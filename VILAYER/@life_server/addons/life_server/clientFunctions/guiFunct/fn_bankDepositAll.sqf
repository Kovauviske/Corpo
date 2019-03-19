#include "\life_server\script_macros.hpp"
/*
	File: fn_bankDepositAll.sqf
	Author: Casperento
	Description:
	Deposit all the money on the player's hand
*/
private _valor = CASH;
if (_valor < 1) exitWith {};
CASH = 0;
BANK = BANK + _valor;
[true] call cxp_fnc_hudUpdate;
[] call cxp_fnc_atmMenu;
[6] call CXPSKT_fnc_updatePartial;
hint localize "STR_ATM_DepositAllSuccess";

if (CXP_SETTINGS(getNumber,"player_moneyLog") isEqualTo 1) then {
    if (CXP_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        money_log = format [localize "STR_DL_ML_depositedBank_BEF",_valor,[BANK] call cxp_fnc_numberText,[CASH] call cxp_fnc_numberText];
    } else {
        money_log = format [localize "STR_DL_ML_depositedBank",profileName,(getPlayerUID player),_valor,[BANK] call cxp_fnc_numberText,[CASH] call cxp_fnc_numberText];
    };
    publicVariableServer "money_log";
};