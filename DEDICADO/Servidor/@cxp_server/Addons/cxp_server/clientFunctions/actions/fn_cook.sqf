#include "\cxp_server\script_macros.hpp"
/*
    File: fn_cook.sqf
    Author: Fresqo

	Modified : Casperento

    Description:
	Cooks some peace of shit
*/
private _fire = param [0,objNull,[objNull]];
private _item = param [1,"",[""]];

if (_item isEqualTo "") exitWith {};

private _time = 0.05;
if (isNull _fire) exitWith {};
if !((typeOf _fire) isEqualTo "Land_Campfire_F") exitWith {};
if (player distance _fire > 3) exitWith {hint localize "STR_Cook_Closer"};
if !(inFlamed _fire) exitWith {hint localize "STR_Cook_Light"};
if (cxp_cooking) exitWith {hint"Termine de cozinhar a carne atual para depois cozinhar outra !"};

private _itemName = ITEM_NAME(_item);
private _newItem = ITEM_COOKED(_item);
private _newItemName = ITEM_NAME(_newItem);

if (_itemName isEqualTo "" || _newItem isEqualTo "" || _newItemName isEqualTo "") exitWith {};

if ([false,_item,1] call cxp_fnc_handleInv) then {
    cxp_cooking = true;

    //Setup our progress bar.
    disableSerialization;
    "progressBar" cutRsc ["cxp_progress","PLAIN"];
    private _ui = uiNameSpace getVariable "cxp_progress";
    private _progress = _ui displayCtrl 38201;
    private _pgText = _ui displayCtrl 38202;
    _pgText ctrlSetText format["Cozinhando %2 (1%1)...","%",(localize _itemName)];
    _progress progressSetPosition 0.01;
    private _cP = 0.01;

	  for "_i" from 0 to 1 step 0 do {
	    uiSleep _time;
	    _cP = _cP + 0.01;
	    _progress progressSetPosition _cP;
	    _pgText ctrlSetText format["Cozinhando %3 (%1%2)...",round(_cP * 100),"%",(localize _itemName)];

	    if(_cP >= 1) exitWith {};
	    if(player distance _fire > 3) exitWith {};
	    if!(alive player) exitWith {};
	    if !(inFlamed _fire) exitWith {};
	  };

    if !(inFlamed _fire) exitWith {hint localize "STR_Cook_Light";
		"progressBar" cutText ["","PLAIN"];
		cxp_cooking = false;
		[false,false] call cxp_fnc_hudUpdate;
	};
	if !(alive player) exitWith {
		cxp_cooking = false;
		[false,false] call cxp_fnc_hudUpdate;
	};
	if(player distance _fire > 3) exitWith {
		hint localize "STR_Cook_Closer2";
		"progressBar" cutText ["","PLAIN"];
		cxp_cooking = false;
		[false,false] call cxp_fnc_hudUpdate;
	};
	"progressBar" cutText ["","PLAIN"];
	[false,false] call cxp_fnc_hudUpdate;
    if ([true,_newItem,1] call cxp_fnc_handleInv) then {
        hint format[localize "STR_Cook_Cooked",(localize _newItemName)];
    };
    cxp_cooking = false;
};
