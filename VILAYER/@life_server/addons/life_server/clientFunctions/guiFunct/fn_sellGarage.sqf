#include "\life_server\script_macros.hpp"
/*
    File: fn_sellGarage.sqf
    Author: Bryan "Tonic" Boardwine

		Modified : Casperento

    Description:
    Sells a vehicle from the garage.
*/
if (varAntidupe) exitWith {["suspeito",true] spawn cxp_fnc_antiSellBug;cxp_action_delay = time;closeDialog 0;};
disableSerialization;
if ((lbCurSel 2802) isEqualTo -1) exitWith {hint localize "STR_Global_NoSelection"};
private _vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format ["%1",_vehicle]) select 0;
private _vehicleCxp = _vehicle;
private _vid = lbValue[2802,(lbCurSel 2802)];
private _pid = getPlayerUID player;

if (isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};

//Anti-dupe
if ((time - cxp_action_delay) < 0.2) exitWith {hint localize "STR_NOTF_ActionDelay";};

if (!isClass (missionConfigFile >> "CxpCfgVehicles" >> _vehicleCxp)) then {
    _vehicleCxp = "Default"; //Use Default class if it doesn't exist
    diag_log format ["%1: CxpCfgVehicles class doesn't exist",_vehicle];
};

private "_price";
switch (playerSide) do {
  case civilian: {
    _price = M_CONFIG(getNumber,"CxpCfgVehicles",_vehicleCxp,"price");
  };
  case west: {
    _price = M_CONFIG(getNumber,"CxpCfgVehicles",_vehicleCxp,"price_cop");
  };
  case independent: {
    _price = M_CONFIG(getNumber,"CxpCfgVehicles",_vehicleCxp,"price_samu");
  };
};
////////////////////////////////// CALCULO DE PRECO //////////////////////////////////////////////////
private "_sellMultiplier";
switch (playerSide) do {
  case civilian : {
    _sellMultiplier = CXP_SETTINGS(getNumber,"vehicle_sell_multiplier_CIVILIAN");
  };
  case west: {
    _sellMultiplier = CXP_SETTINGS(getNumber,"vehicle_sell_multiplier_COP");
  };
  case independent: {
    _sellMultiplier = CXP_SETTINGS(getNumber,"vehicle_sell_multiplier_MEDIC");
  };
  case east: {
    _sellMultiplier = CXP_SETTINGS(getNumber,"vehicle_sell_multiplier_OPFOR");
  };
};

private _realSellPrice = _price*_sellMultiplier;
///////////////////////////////////////////////////////////////////////////////////////////////////////////
private _sellPrice = round(_realSellPrice);

if (!(_sellPrice isEqualType 0) || _sellPrice < 1) then {_sellPrice = 500;};

if (cxp_CXPHC_isActive) then {
    [_vid,_pid,_sellPrice,player,cxp_garage_type] remoteExecCall ["CXPHC_fnc_vehicleDelete",CXP_HC];
} else {
    [_vid,_pid,_sellPrice,player,cxp_garage_type] remoteExecCall ["CXPSV_fnc_vehicleDelete",RSERV];
};

hint format [localize "STR_Garage_SoldCar",[_sellPrice] call cxp_fnc_numberText];
BANK = BANK + _sellPrice;
[true] call cxp_fnc_hudUpdate;
[1] call CXPSKT_fnc_updatePartial;

if (CXP_SETTINGS(getNumber,"player_advancedLog") isEqualTo 1) then {
    if (CXP_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        advanced_log = format [localize "STR_DL_AL_soldVehicle_BEF",_vehicleCxp,[_sellPrice] call cxp_fnc_numberText,[BANK] call cxp_fnc_numberText,[CASH] call cxp_fnc_numberText];
    } else {
        advanced_log = format [localize "STR_DL_AL_soldVehicle",profileName,(getPlayerUID player),_vehicleCxp,[_sellPrice] call cxp_fnc_numberText,[BANK] call cxp_fnc_numberText,[CASH] call cxp_fnc_numberText];
    };
    publicVariableServer "advanced_log";
};

cxp_action_delay = time;
closeDialog 0;

// Anti-dupe
if (contadorAntiCheat >= 0) then {
	["checagem",true] spawn cxp_fnc_antiSellBug;
};
