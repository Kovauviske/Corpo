#include "\life_server\script_macros.hpp"
/*
    File: fn_vehicleWeightCfg.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Casperento
    Description:
    Master configuration for vehicle weight.
*/
private _className = param [0,"",[""]];

private _classNameCxp = _className;
if (!isClass (missionConfigFile >> "CxpCfgVehicles" >> _classNameCxp)) then {
    _classNameCxp = "Default"; //Use Default class if it doesn't exist
    diag_log format ["%1: CxpCfgVehicles class doesn't exist",_className];
};
private _weight = M_CONFIG(getNumber,"CxpCfgVehicles",_classNameCxp,"vItemSpace");

if (isNil "_weight") then {_weight = -1;};
_weight;
