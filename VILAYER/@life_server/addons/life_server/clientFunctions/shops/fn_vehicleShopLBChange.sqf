#include "\life_server\script_macros.hpp"
/*
    File: fn_vehicleShopLBChange.sqf
    Author: Bryan "Tonic" Boardwine

    Modified : NiiRoZz && Casperento

    Description:
    Called when a new selection is made in the list box and
    displays various bits of information about the vehicle.
*/
disableSerialization;

//Fetch some information.
private _className = (_this select 0) lbData (_this select 1);
private _classNameCxp = _className;

private "_initalPrice";
switch (playerSide) do {
  case civilian: {
    _initalPrice = M_CONFIG(getNumber,"CxpCfgVehicles",_classNameCxp,"price");
  };
  case west: {
    _initalPrice = M_CONFIG(getNumber,"CxpCfgVehicles",_classNameCxp,"price_cop");
  };
  case independent: {
    _initalPrice = M_CONFIG(getNumber,"CxpCfgVehicles",_classNameCxp,"price_samu");
  };
};
////////////////////////////////// CALCULO DE PRECO //////////////////////////////////////////////////
private "_buyMultiplier";
private "_rentMultiplier";
switch (playerSide) do {
  case civilian : {
    if (FETCH_CONST(cxp_donorlevel) isEqualTo 1) then {
      _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_umpLic");
      _rentMultiplier = CXP_SETTINGS(getNumber,"vehicle_rental_multiplier_umpLic");
    }else{
      if (FETCH_CONST(cxp_donorlevel) isEqualTo 2) then {
        _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_uiLic");
        _rentMultiplier = CXP_SETTINGS(getNumber,"vehicle_rental_multiplier_uiLic");
      }else{
        if (FETCH_CONST(cxp_donorlevel) isEqualTo 3) then {
          _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_typeLic");
          _rentMultiplier = CXP_SETTINGS(getNumber,"vehicle_rental_multiplier_typeLic");
        }else{
          if (FETCH_CONST(cxp_donorlevel) in [5,6]) then {
            _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_typeLis");
            _rentMultiplier = CXP_SETTINGS(getNumber,"vehicle_rental_multiplier_typeLis");
          }else{
            _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_CIVILIAN");
            _rentMultiplier = CXP_SETTINGS(getNumber,"vehicle_rental_multiplier_CIVILIAN");
          };
        };
      };
    };
  };
  case west: {
    _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_COP");
    _rentMultiplier = CXP_SETTINGS(getNumber,"vehicle_rental_multiplier_COP");
  };
  case independent: {
    _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_MEDIC");
    _rentMultiplier = CXP_SETTINGS(getNumber,"vehicle_rental_multiplier_MEDIC");
  };
  case east: {
    _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_OPFOR");
    _rentMultiplier = CXP_SETTINGS(getNumber,"vehicle_rental_multiplier_OPFOR");
  };
};
private _originalPrice = _initalPrice*_buyMultiplier;
private _rentOriginalPrice = _originalPrice*_rentMultiplier;
///////////////////////////////////////////////////////////////////////////////////////////////////////////

private _purchasePrice = round(_originalPrice);
private _rentalPrice = round(_rentOriginalPrice);

private _vehicleInfo = [_className] call cxp_fnc_fetchVehInfo;
private _trunkSpace = [_className] call cxp_fnc_vehicleWeightCfg;
private _maxspeed = (_vehicleInfo select 8);
private _horsepower = (_vehicleInfo select 11);
private _passengerseats = (_vehicleInfo select 10);
private _fuel = (_vehicleInfo select 12);
private _armor = (_vehicleInfo select 9);
[_className] call cxp_fnc_3dPreviewDisplay;

ctrlShow [2330,true];
(CONTROL(2300,2303)) ctrlSetStructuredText parseText format[
    (localize "STR_Shop_Veh_UI_Rental")+ " <t color='#8cff9b'>$%1</t><br/>" +
    (localize "STR_Shop_Veh_UI_Ownership")+ " <t color='#8cff9b'>$%2</t><br/>" +
    (localize "STR_Shop_Veh_UI_MaxSpeed")+ " %3 km/h<br/>" +
    (localize "STR_Shop_Veh_UI_HPower")+ " %4<br/>" +
    (localize "STR_Shop_Veh_UI_PSeats")+ " %5<br/>" +
    (localize "STR_Shop_Veh_UI_Trunk")+ " %6<br/>" +
    (localize "STR_Shop_Veh_UI_Fuel")+ " %7<br/>" +
    (localize "STR_Shop_Veh_UI_Armor")+ " %8",
    [_rentalPrice] call cxp_fnc_numberText,
    [_purchasePrice] call cxp_fnc_numberText,
    _maxspeed,
    _horsepower,
    _passengerseats,
    if (_trunkSpace isEqualTo -1) then {"None"} else {_trunkSpace},
    _fuel,
    _armor
];

private _ctrl = CONTROL(2300,2304);
lbClear _ctrl;

if (!isClass (missionConfigFile >> "CxpCfgVehicles" >> _classNameCxp)) then {
    _classNameCxp = "Default"; //Use Default class if it doesn't exist
    diag_log format["%1: CxpCfgVehicles class doesn't exist",_className];
};

private _colorArray = M_CONFIG(getArray,"CxpCfgVehicles",_classNameCxp,"textures");
{
    private _flag = (_x select 1);
    private _textureName = (_x select 0);
    if ((cxp_veh_shop select 2) isEqualTo _flag) then {
        _ctrl lbAdd _textureName;
        _ctrl lbSetValue [(lbSize _ctrl)-1,_forEachIndex];
    };
} forEach _colorArray;

private _numberindexcolorarray = [];
for "_i" from 0 to (count(_colorArray) - 1) do {
    _numberindexcolorarray pushBack _i;
};
private _indexrandom = _numberindexcolorarray call BIS_fnc_selectRandom;
_ctrl lbSetCurSel _indexrandom;

if (_className in (CXP_SETTINGS(getArray,"vehicleShop_rentalOnly"))) then {
    ctrlEnable [2309,false];
} else {
    if (!(cxp_veh_shop select 3)) then {
        ctrlEnable [2309,true];
    };
};

if ((lbSize _ctrl)-1 != -1) then {
    ctrlShow[2304,true];
} else {
    ctrlShow[2304,false];
};

true;
