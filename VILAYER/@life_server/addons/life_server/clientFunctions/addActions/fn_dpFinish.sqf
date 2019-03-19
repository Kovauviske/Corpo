#include "\life_server\script_macros.hpp"
/*
    File: fn_dpFinish.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Finishes the DP Mission and calculates the money earned based
    on distance between A->B
*/
params [
    ["_dp", objNull, [objNull]]
];

cxp_delivery_in_progress = false;
cxp_dp_point = nil;
private _dis = round((getPos cxp_dp_start) distance (getPos _dp));
private _price = round(1.7 * _dis);

["DeliverySucceeded",[format [(localize "STR_NOTF_Earned_1"),[_price] call cxp_fnc_numberText]]] call bis_fnc_showNotification;
cxp_cur_task setTaskState "Succeeded";
player removeSimpleTask cxp_cur_task;
CASH = CASH + _price;
[0] call CXPSKT_fnc_updatePartial;
[true] call cxp_fnc_hudUpdate;
