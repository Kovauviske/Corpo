#include "\cxp_server\script_macros.hpp"
/*
    File: fn_buyClothes.sqf
    Author: Bryan "Tonic" Boardwine

    Modified : Casperento

    Description:
    Buys the current set of clothes and closes out of the shop interface.
*/
private _gBuyOrNot = param [0,false,[false]];
if ((lbCurSel 3101) isEqualTo -1) exitWith {titleText[localize "STR_Shop_NoClothes","PLAIN"];};

//Anti-dupe
if ((time - cxp_action_delay) < 0.2) exitWith {hint localize "STR_NOTF_ActionDelay";};

private _price = 0;
{
    if (!(_x isEqualTo -1)) then {
        _price = _price + _x;
    };
} forEach cxp_clothing_purchase;

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
_price = _price*_buyMultiplier;
_price = round(_price);

if (_gBuyOrNot) then {
  [4,_price,1] call cxp_fnc_buyWithGang;
} else {
  if (_price > CASH) exitWith {titleText[localize "STR_Shop_NotEnoughClothes","PLAIN"];};
  CASH = CASH - _price;
  [0] call CXPSKT_fnc_updatePartial;
  playSound "purchaseS";

  cxp_clothesPurchased = true;
  [] call cxp_fnc_playerSkins;
};
cxp_action_delay = time;
closeDialog 0;
varAntiShopDupe = false;

[true] call cxp_fnc_hudUpdate;
