#include "\life_server\script_macros.hpp"
/*
    File: fn_postBail.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Casperento
    Description:
    Called when the player attempts to post bail.
    Needs to be revised.
*/
private _unit = param [1,objNull,[objNull]];
if (cxp_bail_paid) exitWith {};
if (isNil "cxp_bail_amount") then {cxp_bail_amount = 3500;};
if (!cxp_canpay_bail) exitWith {hint localize "STR_NOTF_Bail_Post"};
if (BANK < cxp_bail_amount) exitWith {hint format [localize "STR_NOTF_Bail_NotEnough",cxp_bail_amount];};

BANK = BANK - cxp_bail_amount;
[true] call cxp_fnc_hudUpdate;
cxp_bail_paid = true;
[1] call CXPSKT_fnc_updatePartial;
[0,"STR_NOTF_Bail_Bailed",true,[profileName]] remoteExecCall ["cxp_fnc_broadcast",RCLIENT];