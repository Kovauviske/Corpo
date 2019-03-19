#include "\life_server\script_macros.hpp"
/*
    File: fn_healHospital.sqf
    Author: Bryan "Tonic" Boardwine
    Reworked: Jesse "TKCJesse" Schultz

    Modified : Casperento

    Description:
    Prompts user with a confirmation dialog to heal themselves.
    Used at the hospitals to restore health to full.
    Note: Dialog helps stop a few issues regarding money loss.
*/
if (cxp_action_inUse) exitWith {};
if ((damage player) < 0.01) exitWith {hint localize "STR_NOTF_HS_FullHealth"};

private _healCost = CXP_SETTINGS(getNumber,"hospital_heal_fee");
if (CASH < _healCost) exitWith {hint format [localize "STR_NOTF_HS_NoCash",[_healCost] call cxp_fnc_numberText];};

cxp_action_inUse = true;

private _action = [
    format [localize "STR_NOTF_HS_PopUp",[_healCost] call cxp_fnc_numberText],
    localize "STR_NOTF_HS_TITLE",
    localize "STR_Global_Yes",
    localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
    titleText [localize "STR_NOTF_HS_Healing", "PLAIN"];
    closeDialog 0;
    uiSleep 8;
    if (player distance (_this select 0) > 5) exitWith {cxp_action_inUse = false; titleText [localize "STR_NOTF_HS_ToFar", "PLAIN"]};
    titleText [localize "STR_NOTF_HS_Healed", "PLAIN"];
    player setVariable["plPerdeuCabaco",false,true];
    player setDamage 0;
    CASH = CASH - _healCost;
	[true] call cxp_fnc_hudUpdate;
    cxp_action_inUse = false;
} else {
    hint localize "STR_NOTF_ActionCancel";
    closeDialog 0;
    cxp_action_inUse = false;
};
playSound "purchaseS";
