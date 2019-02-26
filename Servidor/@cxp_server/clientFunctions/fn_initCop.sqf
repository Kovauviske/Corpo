#include "\cxp_server\script_macros.hpp"
/*
    File: fn_initCop.sqf
    Author: Bryan "Tonic" Boardwine
	Modified : Casperento
    Description:
    Cop Initialization file.
*/
waitUntil {!(isNull (findDisplay 46))};

if (cxp_blacklisted) exitWith {
    ["Blacklisted",false,true] call BIS_fnc_endMission;
    sleep 30;
};

if (!(str(player) in ["cop_9999"])) then {
    if (FETCH_CONST(cxp_coplevel) isEqualTo 0) then {
        ["NotWhitelisted",false,true] call BIS_fnc_endMission;
        sleep 35;
    };
};

player setVariable ["rank",(FETCH_CONST(cxp_coplevel)),true];
cxp_sec_salario = true;
[] call cxp_fnc_spawnMenu;

waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

[] spawn cxp_fnc_placeablesInit;
[] spawn cxp_fnc_autoMessages;
[] spawn cxp_fnc_autoSave;
