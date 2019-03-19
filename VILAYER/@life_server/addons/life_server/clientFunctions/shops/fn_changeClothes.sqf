#include "\life_server\script_macros.hpp"
/*
    File: fn_changeClothes.sqf
    Author: Bryan "Tonic" Boardwine

    Modified : Casperento

    Description:
    Used in the clothing store to show a 'preview' of the piece of clothing.
*/
disableSerialization;

private _control = (_this select 0) select 0;
private _selection = (_this select 0) select 1;
private _price = (findDisplay 3100) displayCtrl 3102;
private _total = (findDisplay 3100) displayCtrl 3106;
if (_selection isEqualTo -1) exitWith {hint localize "STR_Shop_NoSelection";};
if (isNull _control) exitWith {hint localize "STR_Shop_NoDisplay"};
if (cxp_cMenu_lock) exitWith {};
cxp_cMenu_lock = true;

////////////////////////////////////////////////////CALCULO DESCONTO PRECO/////////////////////////////////////////////////////////////
private _priceSelectd = _control lbValue _selection;
private "_buyMultiplier";
switch (playerSide) do {
  case civilian : {
    if (FETCH_CONST(cxp_donorlevel) isEqualTo 1) then {
      _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_umpLic"); // VIP 1
    }else{
      if (FETCH_CONST(cxp_donorlevel) isEqualTo 2) then {
        _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_uiLic"); // VIP 2
      }else{
        if (FETCH_CONST(cxp_donorlevel) isEqualTo 3) then {
          _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_typeLic"); // VIP 3
        }else{
          if (FETCH_CONST(cxp_donorlevel) in [5,6]) then {
            _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_typeLis"); // VIP 4
          }else{
            _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_CIVILIAN"); // civ sem vip
          };
        };
      };
    };
  };
  case west : {
    _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_COP"); // cop sem vip
  };
  case independent : {
    _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_MEDIC"); // medic sem vip
  };
  case east : {
    _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_OPFOR"); // opfor sem vip
  };
};
_priceSelectd = _priceSelectd*_buyMultiplier;
_priceSelectd = round(_priceSelectd);
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

cxp_clothing_purchase set[cxp_clothing_filter,_priceSelectd];
private _data = _control lbData _selection;

if (_data isEqualTo "NONE") then {
    _item = switch (cxp_clothing_filter) do {
        case 0: {uniform player};
        case 1: {headGear player};
        case 2: {goggles player};
        case 3: {vest player};
        case 4: {backpack player};
    };

    [_item,false] call cxp_fnc_handleItem;
} else {
    [_data,true,nil,nil,nil,nil,nil,true] call cxp_fnc_handleItem;
};

cxp_cMenu_lock = false;
_price ctrlSetStructuredText parseText format [(localize "STR_GNOTF_Price")+ " <t color='#8cff9b'>$%1</t>",[_priceSelectd] call cxp_fnc_numberText];

private _totalPrice = 0;
{
    if (_x != -1) then {
        _totalPrice = _totalPrice + _x;
    };
} forEach cxp_clothing_purchase;

_total ctrlSetStructuredText parseText format [(localize "STR_Shop_Total")+ " <t color='#8cff9b'>$%1</t>",[_totalPrice] call cxp_fnc_numberText];

[] call cxp_fnc_playerSkins;
