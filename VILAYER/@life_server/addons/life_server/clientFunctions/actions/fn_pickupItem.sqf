#include "\life_server\script_macros.hpp"
#define INUSE(ENTITY) ENTITY setVariable ["inUse",false,true]
/*
    File: fn_pickupItem.sqf
    Author: Bryan "Tonic" Boardwine

	Modified : Casperento

    Description:
    Master handling for picking up an item.
*/
private _objeto = param [0,objNull,[objNull]];
if ((time - cxp_action_delay) < 1) exitWith {hint localize "STR_NOTF_ActionDelay"; INUSE(_objeto);};
if (isNull _objeto || {player distance _objeto > 3}) exitWith {INUSE(_objeto);};

private _itemInfo = _objeto getVariable ["item",["Unknown",0]];
if (count _itemInfo isEqualTo 0) exitWith {deleteVehicle _objeto;};
private _illegal = ITEM_ILLEGAL(_itemInfo select 0);
private _itemName = (localize (M_CONFIG(getText,"VirtualItems",(_itemInfo select 0),"displayName")));

if (playerSide isEqualTo west && _illegal isEqualTo 1) exitWith {
    titleText[format [localize "STR_NOTF_PickedEvidence",_itemName,[round(ITEM_SELLPRICE(_itemInfo select 0) / 2)] call cxp_fnc_numberText],"PLAIN"];
    BANK = BANK + round(ITEM_SELLPRICE(_itemInfo select 0) / 2);
    deleteVehicle _objeto;
	waitUntil{isNull _objeto};
    [true] call cxp_fnc_hudUpdate;
    [1] call CXPSKT_fnc_updatePartial;
    cxp_action_delay = time;
};

cxp_action_delay = time;
private _diff = [(_itemInfo select 0),(_itemInfo select 1),cxp_carryWeight,cxp_maxWeight] call cxp_fnc_calWeightDiff;
if (_diff <= 0) exitWith {hint localize "STR_NOTF_InvFull"; INUSE(_objeto);};

if (!(_diff isEqualTo (_itemInfo select 1))) then {
    if ([true,(_itemInfo select 0),_diff] call cxp_fnc_handleInv) then {
        player playMove "AinvPknlMstpSlayWrflDnon";

        _objeto setVariable ["item",[(_itemInfo select 0),(_itemInfo select 1) - _diff],true];
        titleText[format [localize "STR_NOTF_Picked",_diff,_itemName],"PLAIN"];
        INUSE(_objeto);
    } else {
        INUSE(_objeto);
    };
} else {
    if ([true,(_itemInfo select 0),(_itemInfo select 1)] call cxp_fnc_handleInv) then {
        deleteVehicle _objeto;
        waitUntil{isNull _objeto};
        player playMove "AinvPknlMstpSlayWrflDnon";
        titleText[format [localize "STR_NOTF_Picked",_diff,_itemName],"PLAIN"];
    } else {
        INUSE(_objeto);
    };
};

if (CXP_SETTINGS(getNumber,"player_advancedLog") isEqualTo 1) then {
    if (CXP_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        advanced_log = format [localize "STR_DL_AL_pickedUp_BEF",_diff,_itemName];
    } else {
        advanced_log = format [localize "STR_DL_AL_pickedUp",profileName,(getPlayerUID player),_diff,_itemName];
    };
    publicVariableServer "advanced_log";
};
