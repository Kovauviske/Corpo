#include "\life_server\script_macros.hpp"
/*
    File: fn_unimpound.sqf
    Author: Bryan "Tonic" Boardwine

    Modified : Casperento

    Description:
    Yeah... Gets the vehicle from the garage.
*/
disableSerialization;
if ((lbCurSel 2802) isEqualTo -1) exitWith {hint localize "STR_Global_NoSelection"};

private _vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format ["%1",_vehicle]) select 0;
private _vehicleCxp = _vehicle;
private _vid = lbValue[2802,(lbCurSel 2802)];
private _pid = getPlayerUID player;
private _spawntext = localize "STR_Garage_spawn_Success";

if (isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};
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
private "_buyMultiplier";
private "_realBuyPrice";
private "_retrievalMulti";
switch (playerSide) do {
  case civilian : {
    if (FETCH_CONST(cxp_donorlevel) isEqualTo 1) then {
      _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_umpLic");
      _realBuyPrice = _price*_buyMultiplier;
      _retrievalMulti = CXP_SETTINGS(getNumber,"vehicle_retrieval_multiplier_umpLic");
    }else{
      if (FETCH_CONST(cxp_donorlevel) isEqualTo 2) then {
        _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_uiLic");
        _realBuyPrice = _price*_buyMultiplier;
        _retrievalMulti = CXP_SETTINGS(getNumber,"vehicle_retrieval_multiplier_uiLic");
      }else{
        if (FETCH_CONST(cxp_donorlevel) isEqualTo 3) then {
          _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_typeLic");
          _realBuyPrice = _price*_buyMultiplier;
          _retrievalMulti = CXP_SETTINGS(getNumber,"vehicle_retrieval_multiplier_typeLic");
        }else{
          if (FETCH_CONST(cxp_donorlevel) in [5,6]) then {
            _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_typeLis");
            _realBuyPrice = _price*_buyMultiplier;
            _retrievalMulti = CXP_SETTINGS(getNumber,"vehicle_retrieval_multiplier_typeLis");
          }else{
            _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_CIVILIAN");
            _realBuyPrice = _price*_buyMultiplier;
            _retrievalMulti = CXP_SETTINGS(getNumber,"vehicle_retrieval_multiplier");
          };
        };
      };
    };
  };
  case west: {
    _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_COP");
    _realBuyPrice = _price*_buyMultiplier;
    _retrievalMulti = CXP_SETTINGS(getNumber,"vehicle_retrieval_multiplier_COP");
  };
  case independent: {
    _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_MEDIC");
    _realBuyPrice = _price*_buyMultiplier;
    _retrievalMulti = CXP_SETTINGS(getNumber,"vehicle_retrieval_multiplier_MEDIC");
  };
  case east: {
    _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_OPFOR");
    _realBuyPrice = _price*_buyMultiplier;
    _retrievalMulti = CXP_SETTINGS(getNumber,"vehicle_retrieval_multiplier_OPFOR");
  };
};

private _realRetrievePrice = _realBuyPrice*_retrievalMulti;
///////////////////////////////////////////////////////////////////////////////////////////////////////////
_price = round(_realRetrievePrice);

if (!(_price isEqualType 0) || _price < 1) then {_price = 500;};
if (BANK < _price) exitWith {hint format [(localize "STR_Garage_CashError"),[_price] call cxp_fnc_numberText];};

if (cxp_garage_sp isEqualType []) then {
    if (cxp_CXPHC_isActive) then {
        [_vid,_pid,(cxp_garage_sp select 0),player,_price,(cxp_garage_sp select 1),_spawntext] remoteExec ["CXPHC_fnc_spawnVehicle",CXP_HC];
    } else {
        [_vid,_pid,(cxp_garage_sp select 0),player,_price,(cxp_garage_sp select 1),_spawntext] remoteExec ["CXPSV_fnc_spawnVehicle",RSERV];
    };
} else {
    if (cxp_CXPHC_isActive) then {
        [_vid,_pid,(getMarkerPos cxp_garage_sp),player,_price,markerDir cxp_garage_sp,_spawntext] remoteExec ["CXPHC_fnc_spawnVehicle",CXP_HC];
    } else {
        [_vid,_pid,(getMarkerPos cxp_garage_sp),player,_price,markerDir cxp_garage_sp,_spawntext] remoteExec ["CXPSV_fnc_spawnVehicle",RSERV];
    };
};

hint localize "STR_Garage_SpawningVeh";
BANK = BANK - _price;
[true] call cxp_fnc_hudUpdate;
[1] call CXPSKT_fnc_updatePartial;
closeDialog 0;
