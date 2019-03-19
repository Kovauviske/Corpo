#include "\life_server\script_macros.hpp"
/*
    File: fn_initMedic.sqf
    Author: Bryan "Tonic" Boardwine
	Modified : Casperento
    Description:
    Initializes the medic..
*/
waitUntil {!isNull (findDisplay 46)};

cxp_blacklisted = switch(cxp_blacklisted)do{case 0:{false};case 1:{true};};
if (cxp_blacklisted) exitWith {
    ["Banido",false,true] call BIS_fnc_endMission;
    sleep 30;
};

if (FETCH_CONST(cxp_medicLevel) < 1) exitWith {
    ["Notwhitelisted",false,true] call BIS_fnc_endMission;
    sleep 35;
};

player setVariable["rankmedic",(FETCH_CONST(cxp_mediclevel)),true];
if (CXP_SETTINGS(getNumber,"medico_imortal") isEqualTo 1) then {player allowDamage false};
cxp_sec_salario = true;
[] call cxp_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

[] spawn cxp_fnc_placeablesInit;
[] spawn cxp_fnc_autoMessages;
[] spawn cxp_fnc_autoSave;
