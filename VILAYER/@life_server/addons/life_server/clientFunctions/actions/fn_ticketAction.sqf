/*
    File: fn_ticketAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the ticketing process.
*/
params [
    ["_unit",objNull,[objNull]]
];
disableSerialization;
if (!(createDialog "cxp_ticket_give")) exitWith {hint localize "STR_Cop_TicketFail"};
if (isNull _unit || !isPlayer _unit) exitWith {};
ctrlSetText[2651,format [localize "STR_Cop_Ticket",_unit getVariable ["realname",name _unit]]];
cxp_ticket_unit = _unit;