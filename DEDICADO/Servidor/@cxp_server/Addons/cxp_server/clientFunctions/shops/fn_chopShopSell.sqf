#include "\cxp_server\script_macros.hpp"
/*
    File: fn_chopShopSell.sqf
    Author: Bryan "Tonic" Boardwine
    Modified : Casperento
    Description:
    Sells the selected vehicle off.
*/
if (contadorAntiCheat >= 0) then {["checagem",true] spawn cxp_fnc_antiSellBug;};
if (varAntidupe) exitWith {["suspeito",true] spawn cxp_fnc_antiSellBug;cxp_action_delay = time;closeDialog 0;};
disableSerialization;
private ["_control","_price","_vehicle","_nearVehicles","_price2","_chopable"];
_control = CONTROL(39400,39402);
_price = _control lbValue (lbCurSel _control);
_vehicle = _control lbData (lbCurSel _control);
_vehicle = call compile format ["%1", _vehicle];
_chopable = CXP_SETTINGS(getArray,"chopShop_vehicles");
_nearVehicles = nearestObjects [getMarkerPos cxp_chopShop,_chopable,25];
_vehicle = (_nearVehicles select _vehicle);
if (isNull _vehicle) exitWith {};

//Anti-dupe
if ((time - cxp_action_delay) < 0.2) exitWith {hint localize "STR_NOTF_ActionDelay";};

hint localize "STR_Shop_ChopShopSelling";
cxp_action_inUse = true;
_price2 = CASH + _price;
[0] call CXPSKT_fnc_updatePartial;
[true] call cxp_fnc_hudUpdate;

if (cxp_CXPHC_isActive) then {
    [player,_vehicle,_price,_price2] remoteExecCall ["CXPHC_fnc_chopShopSell",CXP_HC];
} else {
    [player,_vehicle,_price,_price2] remoteExecCall ["CXPSV_fnc_chopShopSell",RSERV];
};

if (CXP_SETTINGS(getNumber,"player_advancedLog") isEqualTo 1) then {
    if (CXP_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        advanced_log = format [localize "STR_DL_AL_choppedVehicle_BEF",_vehicle,[_price] call cxp_fnc_numberText,[CASH] call cxp_fnc_numberText];
    } else {
        advanced_log = format [localize "STR_DL_AL_choppedVehicle",profileName,(getPlayerUID player),_vehicle,[_price] call cxp_fnc_numberText,[CASH] call cxp_fnc_numberText];
    };
    publicVariableServer "advanced_log";
};

cxp_action_delay = time;
closeDialog 0;
[true] call cxp_fnc_hudUpdate;