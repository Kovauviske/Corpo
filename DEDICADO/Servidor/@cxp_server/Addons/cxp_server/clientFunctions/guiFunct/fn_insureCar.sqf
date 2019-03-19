#include "\cxp_server\script_macros.hpp"
/*
	File: fn_insureCar.sqf
	Author: Guit0x "Lintox"

	Modified : Casperento

	Description:
	Insure a vehicle from the garage.
*/
disableSerialization;
if ((lbCurSel 2802) isEqualTo -1) exitWith {hint localize "STR_Global_NoSelection"};
private _vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
private _vehicleCxp = _vehicle;
private _vid = lbValue[2802,(lbCurSel 2802)];
private _pid = getPlayerUID player;
private _unit = player;

if (isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};
if (!isClass (missionConfigFile >> "CxpCfgVehicles" >> _vehicleCxp)) then {
    _vehicleCxp = "Default"; //Use Default class if it doesn't exist
    diag_log format["%1: CxpCfgVehicles class doesn't exist",_vehicle];
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
private "_buyMultiplier";
private "_realBuyPrice";
private "_insuranceMultiplier";
switch (playerSide) do {
  case civilian : {
    if (FETCH_CONST(cxp_donorlevel) isEqualTo 1) then {
      _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_umpLic");
      _realBuyPrice = _price*_buyMultiplier;
      _insuranceMultiplier = CXP_SETTINGS(getNumber,"vehicle_insurance_multiplier_umpLic");
    }else{
      if (FETCH_CONST(cxp_donorlevel) isEqualTo 2) then {
        _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_uiLic");
        _realBuyPrice = _price*_buyMultiplier;
        _insuranceMultiplier = CXP_SETTINGS(getNumber,"vehicle_insurance_multiplier_uiLic");
      }else{
        if (FETCH_CONST(cxp_donorlevel) isEqualTo 3) then {
          _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_typeLic");
          _realBuyPrice = _price*_buyMultiplier;
          _insuranceMultiplier = CXP_SETTINGS(getNumber,"vehicle_insurance_multiplier_typeLic");
        }else{
          if (FETCH_CONST(cxp_donorlevel) in [5,6]) then {
            _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_typeLis");
            _realBuyPrice = _price*_buyMultiplier;
            _insuranceMultiplier = CXP_SETTINGS(getNumber,"vehicle_insurance_multiplier_typeLis");
          }else{
            _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_CIVILIAN");
            _realBuyPrice = _price*_buyMultiplier;
            _insuranceMultiplier = CXP_SETTINGS(getNumber,"vehicle_insurance_multiplier_CIVILIAN");
          };
        };
      };
    };
  };
  case west: {
    _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_COP");
    _realBuyPrice = _price*_buyMultiplier;
    _insuranceMultiplier = CXP_SETTINGS(getNumber,"vehicle_insurance_multiplier_COP");
  };
  case independent: {
    _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_MEDIC");
    _realBuyPrice = _price*_buyMultiplier;
    _insuranceMultiplier = CXP_SETTINGS(getNumber,"vehicle_insurance_multiplier_MEDIC");
  };
  case east: {
    _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_OPFOR");
    _realBuyPrice = _price*_buyMultiplier;
    _insuranceMultiplier = CXP_SETTINGS(getNumber,"vehicle_insurance_multiplier_OPFOR");
  };
};
private _realInsurPrice = _realBuyPrice*_insuranceMultiplier;
///////////////////////////////////////////////////////////////////////////////////////////////////////////
private _insurancePrice = round(_realInsurPrice);

if (!(_insurancePrice isEqualType 0) || _insurancePrice < 1) then {_insurancePrice = 500};
if (BANK < _insurancePrice) exitWith {hint format[(localize "STR_GNOTF_NotEnoughMoney"),[_insurancePrice] call cxp_fnc_numberText];};

if (cxp_CXPHC_isActive) then {
    [_vid,_pid,_insurancePrice,player,cxp_garage_type] remoteExecCall ["CXPHC_fnc_insureCar",CXP_HC];
} else {
    [_vid,_pid,_insurancePrice,player,cxp_garage_type] remoteExecCall ["CXPSV_fnc_insureCar",RSERV];
};

hint localize "STR_InsuranceApply";
BANK = BANK - _insurancePrice;
[true] call cxp_fnc_hudUpdate;
closeDialog 0;
