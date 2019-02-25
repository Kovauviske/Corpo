#include "\cxp_server\script_macros.hpp"
/*
    File: fn_wantedGrab.sqf
    Author: ColinM

    Modified : Casperento

    Description:
    Prepare the array to query the crimes.
*/
disableSerialization;

private _tab = CONTROL(2400,2402);
private _criminal = lbData[2401,(lbCurSel 2401)];
_criminal = call compile format ["%1", _criminal];
if (isNil "_criminal") exitWith {};

if (cxp_CXPHC_isActive) then {
    [player,_criminal] remoteExec ["CXPHC_fnc_wantedCrimes",CXP_HC];
} else {
    [player,_criminal] remoteExec ["cxp_fnc_wantedCrimes",RSERV];
};[]
