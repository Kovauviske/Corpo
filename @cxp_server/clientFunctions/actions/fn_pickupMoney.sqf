#include "\cxp_server\script_macros.hpp"
/*
    File: fn_pickupMoney.sqf
    Author: Bryan "Tonic" Boardwine
	
	Modified : Casperento
	
    Description:
    Picks up money
*/
private _objeto = param [0,objNull,[objNull]];
if ((time - cxp_action_delay) < 1.5) exitWith {hint localize "STR_NOTF_ActionDelay"; _objeto setVariable ["inUse",false,true];};
if (isNull _objeto || {player distance _objeto > 3}) exitWith {_objeto setVariable ["inUse",false,true];};

private _value = ((_objeto getVariable "item") select 1);

if (!isNil "_value") exitWith {
    deleteVehicle _objeto;

    switch (true) do {
        case (_value > 20000000) : {_value = 100000;}; //VAL>20mil->100k
        case (_value > 5000000) : {_value = 250000;}; //VAL>5mil->250k
        default {};
    };

    player playMove "AinvPknlMstpSlayWrflDnon";
    titleText[format[localize "STR_NOTF_PickedMoney",[_value] call cxp_fnc_numberText],"PLAIN"];
    CASH = CASH + _value;
	[true] call cxp_fnc_hudUpdate;
	[0] call CXPSKT_fnc_updatePartial;
    cxp_action_delay = time;

    if (CXP_SETTINGS(getNumber,"player_moneyLog") isEqualTo 1) then {
        if (CXP_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
            money_log = format [localize "STR_DL_ML_pickedUpMoney_BEF",[_value] call cxp_fnc_numberText,[BANK] call cxp_fnc_numberText,[CASH] call cxp_fnc_numberText];
        } else {
            money_log = format [localize "STR_DL_ML_pickedUpMoney",profileName,(getPlayerUID player),[_value] call cxp_fnc_numberText,[BANK] call cxp_fnc_numberText,[CASH] call cxp_fnc_numberText];
        };
		publicVariableServer "money_log";
	};
};
