#include "\life_server\script_macros.hpp"
/*
    File: fn_syncData.sqf
    Author: Bryan "Tonic" Boardwine"

    Description:
    Used for player manual sync to the server.
*/
_fnc_scriptName = "Player Synchronization";
if (isNil "cxp_session_time") then {cxp_session_time = false;};
if (cxp_session_time) exitWith {hint localize "STR_Session_SyncdAlready";};

[] call CXPSKT_fnc_updateRequest;
hint localize "STR_Session_SyncData";
[] spawn {
    cxp_session_time = true;
    sleep (5 * 60);
    cxp_session_time = false;
};
