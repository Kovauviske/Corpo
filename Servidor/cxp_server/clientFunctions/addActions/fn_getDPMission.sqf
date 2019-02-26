#include "\cxp_server\script_macros.hpp"
/*
    File: fn_getDPMission.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Selects a random DP point for a delivery mission.
    Needs to be revised.
*/
params [
    ["_target",objNull,[objNull]]
];
if (isNull _target) exitWith {};

private "_dp";
if (str(_target) in CXP_SETTINGS(getArray,"delivery_points")) then {
    private _point = CXP_SETTINGS(getArray,"delivery_points");
    _point deleteAt (_point find (str(_target)));
    _dp = selectRandom _point;
} else {
    _dp = selectRandom (CXP_SETTINGS(getArray,"delivery_points"));
};

cxp_dp_start = _target;
cxp_delivery_in_progress = true;

cxp_dp_point = call compile format ["%1",_dp];
_dp = toUpper((_dp splitString "_") joinString " ");

cxp_cur_task = player createSimpleTask [format ["Delivery_%1",cxp_dp_point]];
cxp_cur_task setSimpleTaskDescription [format [localize "STR_NOTF_DPStart",_dp],"Delivery Job",""];
cxp_cur_task setTaskState "Assigned";
player setCurrentTask cxp_cur_task;

["DeliveryAssigned",[format [localize "STR_NOTF_DPTask",_dp]]] call bis_fnc_showNotification;

[] spawn {
    waitUntil {!cxp_delivery_in_progress || !alive player};
    if (!alive player) then {
        cxp_cur_task setTaskState "Failed";
        player removeSimpleTask cxp_cur_task;
        ["DeliveryFailed",[localize "STR_NOTF_DPFailed"]] call BIS_fnc_showNotification;
        cxp_delivery_in_progress = false;
        cxp_dp_point = nil;
    };
};