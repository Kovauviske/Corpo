#include "\cxp_server\script_macros.hpp"
/*
    File: fn_insertPlayerInfo.sqf
    Author: Bryan "Tonic" Boardwine
	Modified: Casperento
    Description:
    Upon first join inital player data is sent to the server and added to the database.
    Setup data gets sent to cxp_server\serverFunctions\MySQL\fn_insertRequest.sqf
*/
params [["_firstLog",false,[false]]];
if (cxp_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
cutText["","BLACK FADED"];
diag_log format[(localize "STR_Session_QueryFail")];
0 cutFadeOut 9999999;

if (_firstLog) then {cxp_sec_salario=true;};

private "_bank";
switch (playerSide) do {
    case west: {
        waitUntil {cxp_sec_salario};
        _bank = CXP_SETTINGS(getNumber,"bank_cop");
    };
    case civilian: {
        waitUntil {cxp_sec_salario};
        _bank = CXP_SETTINGS(getNumber,"bank_civ");
    };
    case independent: {
        waitUntil {cxp_sec_salario};
        _bank = CXP_SETTINGS(getNumber,"bank_med");
    };
};

if (cxp_CXPHC_isActive) then {
    [getPlayerUID player,profileName,CASH,_bank,player] remoteExecCall ["CXPHC_fnc_insertRequest",CXP_HC];
} else {
    [getPlayerUID player,profileName,CASH,_bank,player] remoteExecCall ["CXPDB_fnc_insertRequest",RSERV];
};