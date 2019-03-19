#include "\cxp_server\script_macros.hpp"
/*
	File : fn_buyWithGang.sqf
	Author : Casperento
	Description:
	Efetua compras através da conta bancária da gangue
*/
// params
params [
  ["_shopType",-1,[0]],
  ["_price",0,[0]],
  ["_quantidade",1,[0]],
  ["_produtoNovo","",[""]]
];
// vars
private _gPlayer = group player;
private _gPlayerSaldo = (_gPlayer getVariable ["gang_bank",0]);
private _realPrice = _price * _quantidade;

// verificacoes anti-bugs
if (isNil {_gPlayer getVariable "gang_name"}) exitWith {hint localize "STR_ATM_NotInGang"};
if (_realPrice > _gPlayerSaldo) exitWith {hint localize "STR_ATM_NotEnoughtMInGangAcc"};

switch (_shopType) do {
  // Mercado Virtual
  case 1 : {
    _gPlayerSaldo = _gPlayerSaldo - _realPrice;
    _gPlayer setVariable ["gang_bank",_gPlayerSaldo,true];
    [true,_produtoNovo,_quantidade] call cxp_fnc_handleInv;
    playSound "purchaseS";
    [] call cxp_fnc_virtupdate;
    [3] call CXPSKT_fnc_updatePartial;
    [true] call cxp_fnc_hudUpdate;
  };
  // Mercado de Armas
  case 2 : {
    _gPlayerSaldo = _gPlayerSaldo - _realPrice;
    _gPlayer setVariable ["gang_bank",_gPlayerSaldo,true];
    playSound "purchaseS";
    [_produtoNovo,true] spawn cxp_fnc_handleItem;
    [] call cxp_fnc_saveGear;
  };
  // Mercado de Veiculos
  case 3 : {
    _gPlayerSaldo = _gPlayerSaldo - _realPrice;
    _gPlayer setVariable ["gang_bank",_gPlayerSaldo,true];
  };
  // Mercado de Roupas
  case 4 : {
    _gPlayerSaldo = _gPlayerSaldo - _realPrice;
    _gPlayer setVariable ["gang_bank",_gPlayerSaldo,true];
    playSound "purchaseS";
    cxp_clothesPurchased = true;
    [] call cxp_fnc_playerSkins;
    closeDialog 0;
  };
};

if (cxp_CXPHC_isActive) then {
  [1,_gPlayer] remoteExec ["CXPHC_fnc_updateGang",CXP_HC]; // salvando dados no banco de dados
} else {
  [1,_gPlayer] remoteExec ["CXPSV_fnc_updateGang",RSERV]; // salvando dados no banco de dados
};

hint "Compra com o saldo da gangue efetuada com sucesso !";
