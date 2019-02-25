#include "\cxp_server\script_macros.hpp"
/*
    File: fn_garageLBChange.sqf
    Author: Bryan "Tonic" Boardwine

    Modified : Casperento

    Description:
    Can't be bothered to answer it.. Already deleted it by accident..
*/
disableSerialization;
private _control = _this select 0;
private _index = _this select 1;

//Fetch some information.
private _dataArr = CONTROL_DATAI(_control,_index);
_dataArr = call compile format["%1",_dataArr];
private _className = (_dataArr select 0);
private _classNameCxp = _className;
private _insurance = (_dataArr select 2);

if (!isClass (missionConfigFile >> "CxpCfgVehicles" >> _classNameCxp)) then {
    _classNameCxp = "Default"; //Use Default class if it doesn't exist
    diag_log format["%1: CxpCfgVehicles class doesn't exist",_className];
};

private _vehicleColor = (( M_CONFIG(getArray,"CxpCfgVehicles",_classNameCxp,"textures") select (_dataArr select 1)) select 0);

if (isNil "_vehicleColor") then {_vehicleColor = "Default";};

private _vehicleInfo = [_className] call cxp_fnc_fetchVehInfo;
private _trunkSpace = [_className] call cxp_fnc_vehicleWeightCfg;

private "_price";
switch (playerSide) do {
  case civilian: {
    _price = M_CONFIG(getNumber,"CxpCfgVehicles",_classNameCxp,"price");
  };
  case west: {
    _price = M_CONFIG(getNumber,"CxpCfgVehicles",_classNameCxp,"price_cop");
  };
  case independent: {
    _price = M_CONFIG(getNumber,"CxpCfgVehicles",_classNameCxp,"price_samu");
  };
};
////////////////////////////////// CALCULO DE PRECO //////////////////////////////////////////////////
private "_sellMultiplier";
private "_buyMultiplier";
private "_realBuyPrice";
private "_insuranceMultiplier";
private "_retrievalMulti";
switch (playerSide) do {
  case civilian : {
    _sellMultiplier = CXP_SETTINGS(getNumber,"vehicle_sell_multiplier_CIVILIAN");
    if (FETCH_CONST(cxp_donorlevel) isEqualTo 1) then {
      _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_umpLic");
      _realBuyPrice = _price * _buyMultiplier;
      _insuranceMultiplier = CXP_SETTINGS(getNumber,"vehicle_insurance_multiplier_umpLic");
      _retrievalMulti = CXP_SETTINGS(getNumber,"vehicle_retrieval_multiplier_umpLic");
    }else{
      if (FETCH_CONST(cxp_donorlevel) isEqualTo 2) then {
        _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_uiLic");
        _realBuyPrice = _price * _buyMultiplier;
        _insuranceMultiplier = CXP_SETTINGS(getNumber,"vehicle_insurance_multiplier_uiLic");
        _retrievalMulti = CXP_SETTINGS(getNumber,"vehicle_retrieval_multiplier_uiLic");
      }else{
        if (FETCH_CONST(cxp_donorlevel) isEqualTo 3) then {
          _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_typeLic");
          _realBuyPrice = _price * _buyMultiplier;
          _insuranceMultiplier = CXP_SETTINGS(getNumber,"vehicle_insurance_multiplier_typeLic");
          _retrievalMulti = CXP_SETTINGS(getNumber,"vehicle_retrieval_multiplier_typeLic");
        }else{
          if (FETCH_CONST(cxp_donorlevel) in [5,6]) then {
            _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_typeLis");
            _realBuyPrice = _price * _buyMultiplier;
            _insuranceMultiplier = CXP_SETTINGS(getNumber,"vehicle_insurance_multiplier_typeLis");
            _retrievalMulti = CXP_SETTINGS(getNumber,"vehicle_retrieval_multiplier_typeLis");
          }else{
            _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_CIVILIAN");
            _realBuyPrice = _price * _buyMultiplier;
            _insuranceMultiplier = CXP_SETTINGS(getNumber,"vehicle_insurance_multiplier_CIVILIAN");
            _retrievalMulti = CXP_SETTINGS(getNumber,"vehicle_retrieval_multiplier");
          };
        };
      };
    };
  };
  case west: {
    _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_COP");
    _realBuyPrice = _price * _buyMultiplier;
    _sellMultiplier = CXP_SETTINGS(getNumber,"vehicle_sell_multiplier_COP");
    _insuranceMultiplier = CXP_SETTINGS(getNumber,"vehicle_insurance_multiplier_COP");
    _retrievalMulti = CXP_SETTINGS(getNumber,"vehicle_retrieval_multiplier_COP");
  };
  case independent: {
    _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_MEDIC");
    _realBuyPrice = _price * _buyMultiplier;
    _sellMultiplier = CXP_SETTINGS(getNumber,"vehicle_sell_multiplier_MEDIC");
    _insuranceMultiplier = CXP_SETTINGS(getNumber,"vehicle_insurance_multiplier_MEDIC");
    _retrievalMulti = CXP_SETTINGS(getNumber,"vehicle_retrieval_multiplier_MEDIC");
  };
  case east: {
    _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_OPFOR");
    _realBuyPrice = _price * _buyMultiplier;
    _sellMultiplier = CXP_SETTINGS(getNumber,"vehicle_sell_multiplier_OPFOR");
    _insuranceMultiplier = CXP_SETTINGS(getNumber,"vehicle_insurance_multiplier_OPFOR");
    _retrievalMulti = CXP_SETTINGS(getNumber,"vehicle_retrieval_multiplier_OPFOR");
  };
};
private _realRetrievePrice = _realBuyPrice * _retrievalMulti;
private _realSellPrice     = _price * _sellMultiplier;
private _realInsurPrice    = _realBuyPrice * _insuranceMultiplier;
///////////////////////////////////////////////////////////////////////////////////////////////////////////
private _retrievePrice = round(_realRetrievePrice);
private _sellPrice = round(_realSellPrice);
private _insurancePrice = round(_realInsurPrice);

if (!(_retrievePrice isEqualType 0) || _retrievePrice < 1) then {_retrievePrice = 500;};
if (!(_sellPrice isEqualType 0) || _sellPrice < 1) then {_sellPrice = 500;};
if (!(_insurancePrice isEqualType 0) || _insurancePrice < 1) then {_insurancePrice = 500;};

(CONTROL(2800,2803)) ctrlSetStructuredText parseText format[
    (localize "STR_Shop_Veh_UI_RetrievalP")+ " <t color='#8cff9b'>R$%1</t><br/>
    " +(localize "STR_Shop_Veh_UI_SellP")+ " <t color='#8cff9b'>R$%2</t><br/>
    " +(localize "STR_Shop_Veh_UI_SeguroP")+ " <t color='#8cff9b'>R$%9</t><br/>
    " +(localize "STR_Shop_Veh_UI_SeguroE")+ " %10<br/>
    " +(localize "STR_Shop_Veh_UI_Color")+ " %8<br/>
    " +(localize "STR_Shop_Veh_UI_MaxSpeed")+ " %3 km/h<br/>
    " +(localize "STR_Shop_Veh_UI_HPower")+ " %4<br/>
    " +(localize "STR_Shop_Veh_UI_PSeats")+ " %5<br/>
    " +(localize "STR_Shop_Veh_UI_Trunk")+ " %6<br/>
    " +(localize "STR_Shop_Veh_UI_Fuel")+ " %7
    ",
[_retrievePrice] call cxp_fnc_numberText,
[_sellPrice] call cxp_fnc_numberText,
(_vehicleInfo select 8),
(_vehicleInfo select 11),
(_vehicleInfo select 10),
if(_trunkSpace isEqualTo -1) then {"None"} else {_trunkSpace},
(_vehicleInfo select 12),
_vehicleColor,
[_insurancePrice] call cxp_fnc_numberText,
if(_insurance isEqualTo 1) then {"<t color='#8cff9b'>Assegurado</t>"} else {"<t color='#FF0000'>Desassegurado</t>"},
(_vehicleInfo select 9)
];

if(_insurance isEqualTo 1) then {
    ctrlShow [97480,False];
}else{
    ctrlShow [97480,True];
};

ctrlShow [2803,true];
ctrlShow [2830,true];
