#include "\cxp_server\script_macros.hpp"
/*
	File: fn_vAH_takeBack.sqf
	Author: Fresqo
	Description: takes back the item from auction house if its still for sale or expired.
*/
private["_dialog","_myListbox","_data","_typeb","_type","_status","_item","_diff","_iCheck","_amount","_tamount","_id","_checkid","_found","_d","_e"];
disableSerialization;
_dialog = findDisplay 15600;
_myListbox = _dialog displayCtrl 15601;

private _auctioneers = CXP_SETTINGS(getArray,"ah_auctioneers");
private _nearAH = false;
{if (player distance (call compile _x) < 20) exitWith {_nearAH = true}} forEach _auctioneers;
if (!_nearAH) exitWith {hint localize "STR_AH_TooFar"};

if (!vAH_loaded) exitWith {hint localize"STR_AH_AHBusy"};

if (lbCurSel _myListbox < 0) exitWith {hint "Please select an Item";};
_data = call compile (_myListbox lbData (lbCurSel _myListbox));

_item = _data select 0;
if (_item isEqualTo "yolo") exitWith {};
_typeb = (_data select 1);
_status = [_data,2,3,[3]] call BIS_fnc_param;
_amount = [_data,3,0,[0]] call BIS_fnc_param;
_id = (_data select 4);
_iCheck = true;

if (_status isEqualTo 3) exitWith {hint localize "STR_AH_Block";};

_e = missionNamespace getVariable [format["ahItem_%1",_id],false];
if (player getVariable["ahID",0] != _id && !_e) exitWith {hint localize "STR_AH_SaleBusy";};

if(_typeb isEqualTo "ymenu") then {_type = 0} else {_type = 1};

_found = [];
{_checkid = (_x select 0);if (_checkid isEqualTo _id) then {_found pushBack _checkid};} forEach all_ah_items;
if (count _found isEqualTo 0) exitWith {hint "This item has been sold recently";};

if (_type isEqualTo 0) then {
_diff = [_item,_amount,cxp_carryWeight,cxp_maxWeight] call cxp_fnc_calWeightDiff;
if (_diff < _amount) then {_iCheck = false;};
} else {if (_type isEqualTo 1)then { if (_amount > 1) then {
_iCheck = [_item,_amount] call cxp_fnc_vAHcheckItem;
		};
	};
};

if(!_iCheck) exitWith {hint localize "STR_NOTF_InvFull";};

switch (_type) do {
	case 0: {[true,_item,_diff] call cxp_fnc_handleInv;};
	case 1: {
	_tamount = _amount + 1;
			for [{_i=1}, {_i<_tamount}, {_i=_i+1}] do
		{
			[_item,true] call cxp_fnc_handleItem;
		};
	};
};

[1,_id] remoteExec ["CXPSV_fnc_vAHupdate",RSERV];

hint "Item Successfully Retrieved";
closedialog 0;
