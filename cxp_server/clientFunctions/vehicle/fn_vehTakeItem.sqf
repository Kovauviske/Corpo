#include "\cxp_server\script_macros.hpp"
#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
    File: fn_vehTakeItem.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Used in the vehicle trunk menu, takes the selected item and puts it in the players virtual inventory
    if the player has room.
*/
disableSerialization;
if (isNull cxp_trunk_vehicle || !alive cxp_trunk_vehicle) exitWith {hint localize "STR_MISC_VehDoesntExist"};
if (!alive player) exitWith {closeDialog 0;};
if ((cxp_trunk_vehicle getVariable ["trunk_in_use_by",player]) != player) exitWith {  closeDialog 0; hint localize "STR_MISC_VehInvUse"; };

if ((lbCurSel 3502) isEqualTo -1) exitWith {hint localize "STR_Global_NoSelection";};
private _ctrl = ctrlSelData(3502);
private _num = ctrlText 3505;
if (!([_num] call CXPSV_fnc_isnumber)) exitWith {hint localize "STR_MISC_WrongNumFormat";};
_num = parseNumber(_num);
if (_num < 1) exitWith {hint localize "STR_MISC_Under1";};

private _index = [_ctrl,((cxp_trunk_vehicle getVariable "Trunk") select 0)] call CXPSV_fnc_index;
private _data = (cxp_trunk_vehicle getVariable "Trunk") select 0;
private _old = cxp_trunk_vehicle getVariable "Trunk";
if (_index isEqualTo -1) exitWith {};
private _value = _data select _index select 1;
if (_num > _value) exitWith {hint localize "STR_MISC_NotEnough"};
_num = [_ctrl,_num,cxp_carryWeight,cxp_maxWeight] call cxp_fnc_calWeightDiff;
if (_num isEqualTo 0) exitWith {hint localize "STR_NOTF_InvFull"};
private _weight = ([_ctrl] call cxp_fnc_itemWeight) * _num;
if (_ctrl == "money") then {
    if (_num == _value) then {
        _data deleteAt _index;
    } else {
        _data set[_index,[_ctrl,(_value - _num)]];
    };

    CASH = CASH + _num;
	[true] call cxp_fnc_hudUpdate;
    [0] call CXPSKT_fnc_updatePartial;
    cxp_trunk_vehicle setVariable ["Trunk",[_data,(_old select 1) - _weight],true];
    [cxp_trunk_vehicle] call cxp_fnc_vehInventory;
} else {
    if ([true,_ctrl,_num] call cxp_fnc_handleInv) then {
        if (_num == _value) then {
            _data deleteAt _index;
        } else {
            _data set[_index,[_ctrl,(_value - _num)]];
        };
        cxp_trunk_vehicle setVariable ["Trunk",[_data,(_old select 1) - _weight],true];
        [cxp_trunk_vehicle] call cxp_fnc_vehInventory;
    } else {
        hint localize "STR_NOTF_InvFull";
    };
};
