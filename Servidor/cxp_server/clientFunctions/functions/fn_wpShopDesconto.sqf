#include "\cxp_server\script_macros.hpp"
/*
  File: fn_wpShopDesconto.sqf
  Author: Casperento
  Description:
  Calcula base do desconto (por enquanto usado apenas na loja de arma)
*/
//params
params [
  ["_price",0,[0]]
];

//vars
private _buyMultiplier = switch (playerSide) do { 
  case civilian :    {CXP_SETTINGS(getNumber,"purchase_multiplier_CIVILIAN")}; 
  case west :        {CXP_SETTINGS(getNumber,"purchase_multiplier_COP")};
  case independent : {CXP_SETTINGS(getNumber,"purchase_multiplier_MEDIC")};
  case east :        {CXP_SETTINGS(getNumber,"purchase_multiplier_OPFOR")};
};

if (playerSide isEqualTo civilian && FETCH_CONST(cxp_donorlevel) > 0) then {
  switch (FETCH_CONST(cxp_donorlevel)) do {
    case 1 : {_buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_umpLic");};
    case 2 : {_buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_uiLic");};
    case 3 : {_buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_typeLic");};
    case 5 : {_buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_typeLis");};
    case 6 : {_buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_typeLis");};
  };
};

// Preço final retornado
_price = round(_price * _buyMultiplier);
_price