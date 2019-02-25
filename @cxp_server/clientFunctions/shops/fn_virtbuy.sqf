#include "\cxp_server\script_macros.hpp"
/*
  File: fn_virt_buy.sqf
  Author: Bryan "Tonic" Boardwine
  Modified : Casperento
  Description:
  Buy a virtual item from the store.
*/
if ((lbCurSel 2401) isEqualTo -1) exitWith {hint localize "STR_Shop_Virt_Nothing"};
// Params
private _gangOrNot = param [0,false,[false]];
// Vars
private _type = lbData[2401,(lbCurSel 2401)];
private _price = lbValue[2401,(lbCurSel 2401)];
private _amount = ctrlText 2404;
private _name = M_CONFIG(getText,"VirtualItems",_type,"displayName");

// Proibicao do tapete de espinhos
if (_type in ["spikeStrip","boltcutter_cop","lockpick_cop"] && (FETCH_CONST(cxp_copLevel) < CXP_SETTINGS(getNumber,"restrictItems_min_rank")) && playerSide isEqualTo west) exitWith {
  hint "Voce precisa ser Cabo para comprar e usar este item !";
};

if !([_amount] call CXPSV_fnc_isnumber) exitWith {hint localize "STR_Shop_Virt_NoNum";};
private _diff = [_type,parseNumber(_amount),cxp_carryWeight,cxp_maxWeight] call cxp_fnc_calWeightDiff;
_amount = parseNumber(_amount);
if (_diff <= 0) exitWith {hint localize "STR_NOTF_NoSpace"};
_amount = _diff;

// Pela gangue
if (_gangOrNot) exitWith {[1,_price,_amount,_type] call cxp_fnc_buyWithGang;};
// Pelo rabo
if ((_price * _amount) > CASH) exitWith {hint localize "STR_NOTF_NotEnoughMoney";};

//Anti-dupe
if ((time - cxp_action_delay) < 0.2) exitWith {hint localize "STR_NOTF_ActionDelay";};
cxp_action_delay = time;

if ([true,_type,_amount] call cxp_fnc_handleInv) then {CASH = CASH - (_price * _amount);};
hint format [localize "STR_Shop_Virt_BoughtItem",_amount,(localize _name),[(_price * _amount)] call cxp_fnc_numberText];
playSound "purchaseS";

[] call cxp_fnc_virtupdate;
[0] call CXPSKT_fnc_updatePartial;
[3] call CXPSKT_fnc_updatePartial;
[true] call cxp_fnc_hudUpdate;
