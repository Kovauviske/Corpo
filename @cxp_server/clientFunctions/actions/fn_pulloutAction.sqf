#include "\cxp_server\script_macros.hpp"
/*
    File: fn_pulloutAction.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Casperento
    Description:
    Pulls players out of a car if it's stopped.
*/
{
    _x setVariable ["transporting",false,true];
    _x setVariable ["Escorting",false,true];
    [] remoteExecCall ["cxp_fnc_pulloutVeh",_x];
} forEach (crew cursorObject);
