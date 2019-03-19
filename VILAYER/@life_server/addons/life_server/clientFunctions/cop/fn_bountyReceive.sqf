#include "\life_server\script_macros.hpp"
/*
    File: fn_bountyReceive.sqf
    Author: Brian "Tonic" Boardwine
	Modified: Casperento
	Description:
	Notifies the player he has received a bounty and gives him the cash.
*/
params [
    ["_val",0,[0]],
    ["_total",0,[0]]
];

if (_val isEqualTo _total) then {
    titleText[format [localize "STR_Cop_BountyRecieve",[_val] call cxp_fnc_numberText],"PLAIN"];
} else {
    titleText[format [localize "STR_Cop_BountyKill",[_val] call cxp_fnc_numberText,[_total] call cxp_fnc_numberText],"PLAIN"];
};

BANK = BANK + _val;
[1] call CXPSKT_fnc_updatePartial;
[true] call cxp_fnc_hudUpdate;