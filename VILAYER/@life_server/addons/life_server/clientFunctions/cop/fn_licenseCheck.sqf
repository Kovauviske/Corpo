#include "\life_server\script_macros.hpp"
/*
    File: fn_licenseCheck.sqf
    Author: Bryan "Tonic" Boardwine
    Modified : Casperento
    Description:
    Returns the licenses to the cop.
*/
private _cop = param [0,objNull,[objNull]];
if (isNull _cop) exitWith {}; //Bad entry

private _licenses = "";
{
    if (LICENSE_VALUE(configName _x,"civ")) then {
        _licenses = _licenses + localize getText(_x >> "displayName") + "<br/>";
    };
} forEach ("getText(_x >> 'side') isEqualTo 'civ'" configClasses (missionConfigFile >> "Licenses"));

if (_licenses isEqualTo "") then {_licenses = (localize "STR_Cop_NoLicensesFound");};
// return
[profileName,_licenses] remoteExecCall ["cxp_fnc_licensesRead",_cop];
