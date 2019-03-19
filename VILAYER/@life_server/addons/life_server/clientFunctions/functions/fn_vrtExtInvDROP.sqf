#include "\life_server\script_macros.hpp"
/*
    File: fn_vrtExtInvDROP.sqf
	Author : Casperento
*/
disableSerialization;
private _dados = lbData[2005,(lbCurSel 2005)];
private _valor = ctrlText 2010;

if (_dados isEqualTo "") exitWith {hint localize "STR_NOTF_didNotSelectToRemove";};
if (!([_valor] call CXPSV_fnc_isnumber)) exitWith {hint localize "STR_NOTF_notNumberFormat";};
if (parseNumber(_valor) <= 0) exitWith {hint localize "STR_NOTF_enterAmountRemove";};
if (ITEM_ILLEGAL(_dados) isEqualTo 1 && ([west,visiblePosition player,100] call cxp_fnc_nearUnits)) exitWith {titleText[localize "STR_NOTF_illegalItemCannotDispose","PLAIN"]};
if !(isNull objectParent player) exitWith {titleText[localize "STR_NOTF_cannotRemoveInVeh","PLAIN"]};
if (!([false,_dados,(parseNumber _valor)] call cxp_fnc_handleInv)) exitWith {hint localize "STR_NOTF_couldNotRemoveThatMuch";};

hint format [localize "STR_NOTF_removedFromInventory",_valor,(localize ITEM_NAME(_dados))];

[3] call CXPSKT_fnc_updatePartial;
[] call cxp_fnc_vrtExtInvUPDATE;
