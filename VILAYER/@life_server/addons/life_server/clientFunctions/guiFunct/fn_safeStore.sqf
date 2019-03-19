#include "\life_server\script_macros.hpp"
/*
    File: fn_safeStore.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Gateway copy of fn_vehStoreItem but designed for the safe.
*/
private ["_ctrl","_num"];
disableSerialization;
_ctrl = CONTROL_DATA(3503);
_num = ctrlText 3506;

//Error checks
if (!([_num] call CXPSV_fnc_isnumber)) exitWith {hint localize "STR_MISC_WrongNumFormat";};
_num = parseNumber(_num);
if (_num < 1) exitWith {hint localize "STR_Cop_VaultUnder1";};
if (!(_ctrl isEqualTo "goldBar")) exitWith {hint localize "STR_Cop_OnlyGold"};
if (_num > cxp_inv_goldbar) exitWith {hint format [localize "STR_Cop_NotEnoughGold",_num];};

//Store it.
if (!([false,_ctrl,_num] call cxp_fnc_handleInv)) exitWith {hint localize "STR_Cop_CantRemove";};
_safeInfo = cxp_safeObj getVariable ["safe",0];
cxp_safeObj getVariable ["safe",_safeInfo + _num,true];

[cxp_safeObj] call cxp_fnc_safeInventory;
