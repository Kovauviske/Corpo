#include "\cxp_server\script_macros.hpp"
/*
    File: fn_safeOpen.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Opens the safe inventory menu.
*/
if (dialog) exitWith {}; //A dialog is already open.
cxp_safeObj = param [0,objNull,[objNull]];
if (isNull cxp_safeObj) exitWith {};
if !(playerSide isEqualTo civilian) exitWith {};
if ((cxp_safeObj getVariable ["safe",-1]) < 1) exitWith {hint localize "STR_Civ_VaultEmpty";};
if (cxp_safeObj getVariable ["inUse",false]) exitWith {hint localize "STR_Civ_VaultInUse"};
if (west countSide playableUnits < (CXP_SETTINGS(getNumber,"minimum_cops"))) exitWith {
    hint format [localize "STR_Civ_NotEnoughCops",(CXP_SETTINGS(getNumber,"minimum_cops"))];
};
if (!createDialog "Federal_Safe") exitWith {localize "STR_MISC_DialogError"};

disableSerialization;
ctrlSetText[3501,(localize "STR_Civ_SafeInv")];
[cxp_safeObj] call cxp_fnc_safeInventory;
cxp_safeObj setVariable ["inUse",true,true];

[cxp_safeObj] spawn {
    waitUntil {isNull (findDisplay 3500)};
    (_this select 0) setVariable ["inUse",false,true];
};
