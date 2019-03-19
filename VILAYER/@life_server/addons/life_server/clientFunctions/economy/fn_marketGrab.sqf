#include "\life_server\script_macros.hpp"
/*
    File: fn_marketGrab.sqf
    Author: Derek

    Modified: Casperento

    Description:
    Gets the data for the market item you are looking at
*/
disableSerialization;
private _currgood = 39002;
private _currprice = 39003;
private _recprice = 39004;
private _recchange = 39005;
private _startprice = 39006;
private _startchange = 39007;
private _value = lbValue[39001,(lbCurSel 39001)];

// Ignore the market types defined in Master_Config
if ((_value mod 2) isEqualTo 1)  exitWith {};

private _good = lbData[39001,(lbCurSel 39001)];

{
    if ((_x select 0) isEqualTo _good) exitWith {_good = _x;};
} forEach cxp_market;

private _name = ITEM_NAME(_good select 0);

ctrlSetText[_currgood, format["Item: %1",(localize _name)]];
ctrlSetText[_currprice, format["Atual: R$%1", (_good select 2)]];
ctrlSetText[_recprice, format["Recente: R$%1", (_good select 7)]];
ctrlSetText[_recchange, format["Mudança recente: R$%1", ((_good select 2) - (_good select 7))]];
ctrlSetText[_startprice, format["Inicial: R$%1", (_good select 8)]];
ctrlSetText[_startchange, format["Alterado (start): R$%1", ((_good select 2) - (_good select 8))]];
