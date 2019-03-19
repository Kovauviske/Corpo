#include "\life_server\script_macros.hpp"
/*
    File: fn_ticketPay.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Pays the ticket.
*/
if (isNil "cxp_ticket_val" || isNil "cxp_ticket_cop") exitWith {};
if (CASH < cxp_ticket_val) exitWith {
    if (BANK < cxp_ticket_val) exitWith {
        hint localize "STR_Cop_Ticket_NotEnough";
        [1,"STR_Cop_Ticket_NotEnoughNOTF",true,[profileName]] remoteExecCall ["cxp_fnc_broadcast",cxp_ticket_cop];
        closeDialog 0;
    };

    hint format [localize "STR_Cop_Ticket_Paid",[cxp_ticket_val] call cxp_fnc_numberText];
    BANK = BANK - cxp_ticket_val;
    [true] call cxp_fnc_hudUpdate;
    [1] call CXPSKT_fnc_updatePartial;
    cxp_ticket_paid = true;

    [0,"STR_Cop_Ticket_PaidNOTF",true,[profileName,[cxp_ticket_val] call cxp_fnc_numberText]] remoteExecCall ["cxp_fnc_broadcast",west];
    [1,"STR_Cop_Ticket_PaidNOTF_2",true,[profileName]] remoteExecCall ["cxp_fnc_broadcast",cxp_ticket_cop];
    [cxp_ticket_val,player,cxp_ticket_cop] remoteExecCall ["cxp_fnc_ticketPaid",cxp_ticket_cop];

    if (cxp_CXPHC_isActive) then {
        [getPlayerUID player] remoteExecCall ["CXPHC_fnc_wantedRemove",CXP_HC];
    } else {
        [getPlayerUID player] remoteExecCall ["cxp_fnc_wantedRemove",RSERV];
    };
    player setVariable ["procurado",false,true];
    closeDialog 0;
};

CASH = CASH - cxp_ticket_val;
[true] call cxp_fnc_hudUpdate;
[0] call CXPSKT_fnc_updatePartial;
cxp_ticket_paid = true;

if (cxp_CXPHC_isActive) then {
    [getPlayerUID player] remoteExecCall ["CXPHC_fnc_wantedRemove",CXP_HC];
} else {
    [getPlayerUID player] remoteExecCall ["cxp_fnc_wantedRemove",RSERV];
};
player setVariable ["procurado",false,true];

[0,"STR_Cop_Ticket_PaidNOTF",true,[profileName,[cxp_ticket_val] call cxp_fnc_numberText]] remoteExecCall ["cxp_fnc_broadcast",west];
closeDialog 0;
[1,"STR_Cop_Ticket_PaidNOTF_2",true,[profileName]] remoteExecCall ["cxp_fnc_broadcast",cxp_ticket_cop];
[cxp_ticket_val,player,cxp_ticket_cop] remoteExecCall ["cxp_fnc_ticketPaid",cxp_ticket_cop];