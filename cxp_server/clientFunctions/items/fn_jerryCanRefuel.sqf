#include "\cxp_server\script_macros.hpp"
/*
    File: fn_jerryCanRefuel.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Jesse "tkcjesse" Schultz

    Description:
    Refuels the empty fuel canister at a gas pump. Based off the jerryRefuel/lockpick scripts by Tonic.
*/
private ["_startPos","_badDistance","_title","_ui","_progress","_pgText","_cP","_action","_fuelCost"];
cxp_interrupted = false;
if (cxp_inv_fuelEmpty isEqualTo 0) exitWith {};
if (count(nearestObjects [player,["Land_FuelStation_Feed_F","Land_fs_feed_F"],3.5]) isEqualTo 0) exitWith { hint localize "STR_ISTR_Jerry_Distance";};
if (cxp_action_inUse) exitWith {};
if !(isNull objectParent player) exitWith {};
if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
_fuelCost = CXP_SETTINGS(getNumber,"fuelCan_refuel");

cxp_action_inUse = true;
_action = [
    format [localize "STR_ISTR_Jerry_PopUp",[_fuelCost] call cxp_fnc_numberText],
    localize "STR_ISTR_Jerry_StationPump",
    localize "STR_Global_Yes",
    localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
    if (CASH < _fuelCost) exitWith {hint localize "STR_NOTF_NotEnoughMoney"; cxp_action_inUse = false;};
    _startPos = getPos player;
    //Setup our progress bar.
    disableSerialization;
    "progressBar" cutRsc ["cxp_progress","PLAIN"];
    _title = localize "STR_ISTR_Jerry_Refuel";
    _ui = uiNamespace getVariable "cxp_progress";
    _progress = _ui displayCtrl 38201;
    _pgText = _ui displayCtrl 38202;
    _pgText ctrlSetText format ["%2 (1%1)...","%",_title];
    _progress progressSetPosition 0.01;
    _cP = 0.01;

    for "_i" from 0 to 1 step 0 do {
        if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
            [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["cxp_fnc_animSync",RCLIENT];
            player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
            player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
        };
        uiSleep 0.2;
        if (isNull _ui) then {
            "progressBar" cutRsc ["cxp_progress","PLAIN"];
            _ui = uiNamespace getVariable "cxp_progress";
            _progressBar = _ui displayCtrl 38201;
            _titleText = _ui displayCtrl 38202;
        };
        _cP = _cP + 0.01;
        _progress progressSetPosition _cP;
        _pgText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_title];
        if (_cP >= 1) exitWith {};
        if (!alive player) exitWith {cxp_action_inUse = false;};
        if (cxp_interrupted) exitWith {cxp_interrupted = false; cxp_action_inUse = false;};
    };

    //Kill the UI display and check for various states
    "progressBar" cutText ["","PLAIN"];
    player playActionNow "stop";

    if (!alive player || cxp_istazed || cxp_isBorrachado || cxp_isknocked) exitWith {cxp_action_inUse = false;};
    if (player getVariable ["restrained",false]) exitWith {cxp_action_inUse = false;};
    if (!isNil "_badDistance") exitWith {titleText[localize "STR_ISTR_Lock_TooFar","PLAIN"]; cxp_action_inUse = false;};
    if (cxp_interrupted) exitWith {cxp_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; cxp_action_inUse = false;};
    if (!([false,"fuelEmpty",1] call cxp_fnc_handleInv)) exitWith {cxp_action_inUse = false;};
    cxp_action_inUse = false;
    CASH = CASH - _fuelCost;
	[true] call cxp_fnc_hudUpdate;
    [true,"fuelFull",1] call cxp_fnc_handleInv;
    hint localize "STR_ISTR_Jerry_Refueled";
} else {
    hint localize "STR_NOTF_ActionCancel";
    closeDialog 0;
    cxp_action_inUse = false;
};
