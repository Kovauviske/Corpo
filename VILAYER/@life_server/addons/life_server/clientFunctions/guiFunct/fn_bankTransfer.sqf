#include "\life_server\script_macros.hpp"
/*
    File: fn_bankTransfer.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Casperento
    Description:
    Figure it out again.
*/
private _value = parseNumber(ctrlText 2702);
private _unit = call compile format ["%1",(lbData[2703,(lbCurSel 2703)])];
if (isNull _unit) exitWith {};
if ((lbCurSel 2703) isEqualTo -1) exitWith {hint localize "STR_ATM_NoneSelected"};
if (isNil "_unit") exitWith {hint localize "STR_ATM_DoesntExist"};
if (_value > 999999) exitWith {hint localize "STR_ATM_TransferMax";};
if (_value < 1) exitWith {};
if (!([str(_value)] call CXPSV_fnc_isnumber)) exitWith {hint localize "STR_ATM_notnumeric"};
if (_value > BANK) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
private _tax = _value * CXP_SETTINGS(getNumber,"bank_transferTax");
if ((_value + _tax) > BANK) exitWith {hint format [localize "STR_ATM_SentMoneyFail",_value,_tax]};

BANK = BANK - (_value + _tax);
[true] call cxp_fnc_hudUpdate;
[1] call CXPSKT_fnc_updatePartial;
[_value,profileName] remoteExecCall ["cxp_fnc_wireTransfer",_unit];
hint format [localize "STR_ATM_SentMoneySuccess",[_value] call cxp_fnc_numberText,_unit getVariable ["realname",name _unit],[(_value + _tax)] call cxp_fnc_numberText];

[] call cxp_fnc_atmMenu;

if (CXP_SETTINGS(getNumber,"player_moneyLog") isEqualTo 1) then {
    if (CXP_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        money_log = format [localize "STR_DL_ML_transferredBank_BEF",_value,_unit getVariable ["realname",name _unit],[BANK] call cxp_fnc_numberText,[CASH] call cxp_fnc_numberText];
    } else {
        money_log = format [localize "STR_DL_ML_transferredBank",profileName,(getPlayerUID player),_value,_unit getVariable ["realname",name _unit],[BANK] call cxp_fnc_numberText,[CASH] call cxp_fnc_numberText];
    };
    publicVariableServer "money_log";
};
