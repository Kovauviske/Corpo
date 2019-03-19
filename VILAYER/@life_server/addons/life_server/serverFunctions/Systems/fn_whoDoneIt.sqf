#include "\life_server\script_macros.hpp"
/*
    File: fn_whoDoneIt.sqf
    Description: Save log file of units killed.
    Author: Å  ColinM - Help of BI Wiki & Forums.
    
    Modified: Casperento

    Credits:    
    KillzoneKid for his Debug_Console v3.0 file. Cuel from the BI Forums for his current & previous posts.
*/
params [
    ["_victim",objNull,[objNull]],
    ["_killer",objNull,[objNull]]
];
if (isNull _victim || isNull _killer || !(isPlayer _victim) || !(isPlayer _killer)) exitWith {};

if (isServer) then {
    private _killerWep = currentWeapon _killer;
    private _killerVeh = vehicle _killer;
    private _distance = floor(_killer distance _victim);
    private _message = "";

    if (_killerWep != "" && _victim != _killer) then {_message = format [localize "STR_DCM_KilledByWeaponMeters", (name _killer), (name _victim), (getText(configFile >> "cfgWeapons" >> _killerWep >> "displayName")), _distance];};
    if (_killerVeh isKindOf "Car" && _killerWep isEqualTo "" && _victim != _killer) then {_message = format [localize "STR_DCM_KilledByCar", (name _killer), (name _victim), (getText(configFile >> "CfgVehicles" >> (typeOf _killerVeh) >> "displayName"))];};
    if (_killerVeh isKindOf "Air" && _killerWep isEqualTo "" && _victim != _killer) then {_message = format [localize "STR_DCM_KilledByAir", (name _killer), (name _victim), (getText(configFile >> "CfgVehicles" >> (typeOf _killerVeh) >> "displayName"))];};
    if (_message isEqualTo "" && _victim != _killer) then {_message = format [localize "STR_DCM_KilledByUnk", (name _victim)];};
    if (_victim isEqualTo _killer || side _killer isEqualTo sideUnknown) then {_message = format[localize "STR_DCM_AloneKilled",(name _victim)];};

    if (_message != "") exitWith {[0,_message] remoteExecCall ["cxp_fnc_broadcast",RANY];};
};
