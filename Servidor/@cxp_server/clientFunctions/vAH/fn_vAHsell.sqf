#include "\cxp_server\script_macros.hpp"
/*
	File: fn_vAH_sell.sqf
	Author: Fresqo
	Modified : Casperento
	Description: sells items to our auction house and blah blah too much fml
*/
if (contadorAntiCheat >= 0) then {["checagem",true] spawn cxp_fnc_antiSellBug;};
if (varAntidupe) exitWith {["suspeito",true] spawn cxp_fnc_antiSellBug;cxp_action_delay = time;closeDialog 0;};

private["_able","_uid","_dialog","_myListbox","_myQuantity","_onGuy","_details","_tquantity","_myTotal","_price","_typeb","_type","_classname","_realName","_bad","_tax","_action","_selectedSell","_quantity","_tochangePriceText","_tochangePriceNumber","_tochangeQuantityText","_tochangeQuantityNumber","_invItem"];

disableSerialization;
_dialog = findDisplay 15600;
_myListbox = _dialog displayCtrl 15601;
_able = CXP_SETTINGS(getNumber,"ah_listing_limit");
private _auctioneers = CXP_SETTINGS(getArray,"ah_auctioneers");
private _percent = CXP_SETTINGS(getNumber,"ah_percent");
private _nearAH = false;
{if (player distance (call compile _x) < 5) exitWith {_nearAH = true}} forEach _auctioneers;
if (!_nearAH) exitWith {hint localize "STR_AH_TooFar"};

//Anti-dupe
if ((time - cxp_action_delay) < 0.2) exitWith {hint localize "STR_NOTF_ActionDelay";};

if (!vAH_loaded) exitWith {hint "Auction house is busy at the moment, please try again in a short while!"};

_bad = false;
_realName = "";

_uid = getPlayerUID player;
if (({(_x select 5) isEqualTo _uid} count all_ah_items) >= _able) exitWith {hint format["You can only have %1 items listed",_able];cxp_action_delay = time;closeDialog 0;};
if (count all_ah_items >= 80) exitWith {hint "The auction house has reached its listing limit, please wait for an item expiry and try again";cxp_action_delay = time;closeDialog 0;};

_price = ctrlText 15603;
_quantity = ctrlText 15602;

if(! ([_price] call CXPSV_fnc_isnumber)) exitWith {hint "You have to enter a number in the price field.";};
if(! ([_quantity] call CXPSV_fnc_isnumber)) exitWith {hint "You have to enter a number in the quantity field.";};
_price = parseNumber _price;
_quantity = parseNumber _quantity;

if (lbCurSel _myListbox < 0) exitWith {hint "Please select an Item";};
_selectedSell = call compile (_myListbox lbData (lbCurSel _myListbox));

_classname = (_selectedSell select 0);
if (_classname isEqualTo "yolo") exitWith {};
_typeb = (_selectedSell select 1);
_invItem = [_selectedSell,2,3,[3]] call BIS_fnc_param;
if !(_invItem isEqualTo 3) exitWith {hint "You cannot sell an item that is already on the auction house, expired, or sold!"};
if (_typeb isEqualTo "ymenu") then {_type = 0} else {_type = 1};

if (_price < 1) exitWith {hint "Invalid value"};
if (_price > 9000000) exitWith {hint "Invalid value. Must be lower than 9 mil"};

_percent = (_percent / 1000);
_tax = round (_price * _percent);

switch (_type) do
{
	case 0: {
				_realName = localize M_CONFIG(getText,"VirtualItems",_classname,"displayName");
				if (_quantity > 100) then {_bad = true; hint "Are you fucking kidding me, dont be a dickhead, put a proper amount in!"};
			};
	case 1: {if (_quantity > 1) then
			{
				_details = [_classname] call cxp_fnc_fetchCfgDetails;
				if (!(_details select 6 isEqualTo "CfgMagazines")) then {
				hint "You can only sell 1 of any of this item!";_bad = true;};
				_onGuy = {_classname isEqualTo _x} count (magazines player);
				if (_onGuy < _quantity) then {hint "You dont have that many!";_bad = true;}
			};
			_realName = ([_classname] call cxp_fnc_fetchCfgDetails) select 1;
			};
};

if (_bad) exitWith {cxp_action_delay = time;closeDialog 0;};

_action = [format["You will be taxed R$%1 . Continue?",_tax],"Auction Confirmation","CONTINUE","CANCEL"] call BIS_fnc_guiMessage;
if (_action) then {
	if(BANK < _tax) exitWith {hint "You don't have enough money in the bank to pay the tax";_bad = true;};
	switch (_type) do
		{
			case 0: {if(!([false,_classname,_quantity] call cxp_fnc_handleInv)) then {hint "You dont have that many!";_bad = true;};};
			case 1: {
						_tquantity = _quantity +1;
						for [{_i=1}, {_i<_tquantity}, {_i=_i+1}] do
							{
								[_classname,false] spawn cxp_fnc_handleItem;
							};
					};
		};
		if (_bad) exitWith {cxp_action_delay = time;closeDialog 0;};
		[4,_type,_quantity,_price,_uid,_classname,_realName,name player] remoteExec ["CXPSV_fnc_vAHupdate",RSERV];
		hint "Auction Successfully Added";
		BANK = BANK - _tax;
		[true] call cxp_fnc_hudUpdate;
		cxp_action_delay = time;
		closeDialog 0;
		[0] call CXPSKT_fnc_updatePartial;
		[3] call CXPSKT_fnc_updatePartial;
} else {
	cxp_action_delay = time;
	closeDialog 0;
};
