#include "\cxp_server\script_macros.hpp"
/*
    File: fn_ticketPrompt
    Author: Bryan "Tonic" Boardwine
    Modified: Casperento
    Description:
    Prompts the player that he is being ticketed.
*/
if !(isNull (findDisplay 2600)) exitWith {}; //Already at the ticket menu, block for abuse?
private _cop = _this select 0;
if (isNull _cop) exitWith {};
private _val = _this select 1;

createDialog "cxp_ticket_pay";
disableSerialization;
waitUntil {!isNull (findDisplay 2600)};

cxp_ticket_paid = false;
cxp_ticket_val = _val;
cxp_ticket_cop = _cop;
CONTROL(2600,2601) ctrlSetStructuredText parseText format ["<t align='center'><t size='.8px'>" +(localize "STR_Cop_Ticket_GUI_Given"),_cop getVariable ["realname",name _cop],_val];

[] spawn {
    disableSerialization;
    waitUntil {cxp_ticket_paid || (isNull (findDisplay 2600))};
    if (isNull (findDisplay 2600) && !cxp_ticket_paid) then {
        [0,"STR_Cop_Ticket_Refuse",true,[profileName]] remoteExecCall ["cxp_fnc_broadcast",west];
        [1,"STR_Cop_Ticket_Refuse",true,[profileName]] remoteExecCall ["cxp_fnc_broadcast",cxp_ticket_cop];
    };
};
