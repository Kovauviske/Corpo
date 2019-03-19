#include "\life_server\script_macros.hpp"
/*
    File: fn_newsBroadcast.sqf
    Author: Jesse "tkcjesse" Schultz
    Modified : Casperento
    Description:
    Creates the dialog and handles the data in the Channel 7 News Dialog.
*/
if !(dialog) then {createDialog "cxp_news_broadcast";};

disableSerialization;

private _confirmBtn = CONTROL(100100,100104);
_confirmBtn ctrlEnable false;

private _msgCooldown = 60 * CXP_SETTINGS(getNumber,"news_broadcast_cooldown");
private _msgCost = CXP_SETTINGS(getNumber,"news_broadcast_cost");

if (CASH < _msgCost) then {
    hint format [localize "STR_News_NotEnough",[_msgCost] call cxp_fnc_numberText];
} else {
    _confirmBtn ctrlEnable true;
    _confirmBtn buttonSetAction "[ctrlText 100101,ctrlText 100102,profilename] call cxp_fnc_postNewsBroadcast; closeDialog 0;";
};

private "_broadcastDelay";
if (isNil "cxp_broadcastTimer" || {(time - cxp_broadcastTimer) > _msgCooldown}) then {
    _broadcastDelay = localize "STR_News_Now";
} else {
    _broadcastDelay = [(_msgCooldown - (time - cxp_broadcastTimer))] call BIS_fnc_secondsToString;
    _confirmBtn ctrlEnable false;
};

CONTROL(100100,100103) ctrlSetStructuredText parseText format [ localize "STR_News_StructuredText",[_msgCost] call cxp_fnc_numberText,_broadcastDelay];
