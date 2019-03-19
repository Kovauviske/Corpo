#include "\cxp_server\script_macros.hpp"
/*
    File: fn_dataQuery.sqf
    Author: Bryan "Tonic" Boardwine
	Modified: Casperento
    Description:
    Starts the 'authentication' process and sends a request out to
    the server to check for player information.
*/
if (cxp_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
cutText["","BLACK FADED"];
diag_log format[localize "STR_Session_Query",(getPlayerUID player)];
0 cutFadeOut 999999999;

if (cxp_CXPHC_isActive) then {
    [(getPlayerUID player),(playerSide),(player)] remoteExec ["CXPHC_fnc_queryRequest",CXP_HC];
} else {
    [(getPlayerUID player),(playerSide),(player)] remoteExec ["CXPDB_fnc_queryRequest",RSERV];
};
