#include "\cxp_server\script_macros.hpp"
/*
    File: fn_gangDisband.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Prompts the user about disbanding the gang and if the user accepts the gang will be
    disbanded and removed from the database.
*/
private "_action";
_action = [
    localize "STR_GNOTF_DisbandWarn",
    localize "STR_Gang_Disband_Gang",
    localize "STR_Global_Yes",
    localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
    hint localize "STR_GNOTF_DisbandGangPro";

    if (cxp_CXPHC_isActive) then {
        [group player] remoteExec ["CXPHC_fnc_removeGang",CXP_HC];
    } else {
        [group player] remoteExec ["CXPSV_fnc_removeGang",RSERV];
    };

} else {
    hint localize "STR_GNOTF_DisbandGangCanc";
};