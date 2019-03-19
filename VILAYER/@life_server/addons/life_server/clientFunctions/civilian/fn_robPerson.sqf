#include "\life_server\script_macros.hpp"
/*
    File: fn_robPerson.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Robs a person.
*/
params [
    ["_robber",objNull,[objNull]]
];
if (isNull _robber) exitWith {}; //No one to return it to?

if (CASH > 0) then {
    [CASH,player,_robber] remoteExecCall ["cxp_fnc_robReceive",_robber];

    if (cxp_CXPHC_isActive) then {
        [getPlayerUID _robber,_robber getVariable ["realname",name _robber],"211"] remoteExecCall ["CXPHC_fnc_wantedAdd",CXP_HC];
    } else {
        [getPlayerUID _robber,_robber getVariable ["realname",name _robber],"211"] remoteExecCall ["cxp_fnc_wantedAdd",RSERV];
    };

    [1,"STR_NOTF_Robbed",true,[_robber getVariable ["realname",name _robber],profileName,[CASH] call cxp_fnc_numberText]] remoteExecCall ["cxp_fnc_broadcast",RCLIENT];
    CASH = 0;
	[true] call cxp_fnc_hudUpdate;
    [0] call CXPSKT_fnc_updatePartial;
} else {
    [2,"STR_NOTF_RobFail",true,[profileName]] remoteExecCall ["cxp_fnc_broadcast",_robber];
};
