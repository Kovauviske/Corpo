#include "\life_server\script_macros.hpp"
/*
    File: fn_ticketPaid.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Verifies that the ticket was paid.
*/
params [
    ["_value",5,[0]],
    ["_unit",objNull,[objNull]],
    ["_cop",objNull,[objNull]]
];
if (isNull _unit || {!(_unit isEqualTo cxp_ticket_unit)}) exitWith {}; //NO
if (isNull _cop || {!(_cop isEqualTo player)}) exitWith {}; //Double NO

BANK = BANK + _value;
[true] call cxp_fnc_hudUpdate;
[1] call CXPSKT_fnc_updatePartial;
