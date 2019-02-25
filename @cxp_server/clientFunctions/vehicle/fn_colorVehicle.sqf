#include "\cxp_server\script_macros.hpp"
/*
    File: fn_colorVehicle.sqf
    Author: Bryan "Tonic" Boardwine
    
    Modified: Casperento

    Description:
    Reskins the vehicle.
*/
params [
    ["_vehicle",objNull,[objNull]],
    ["_index",-1,[0]]
];

private _classNameCxp = typeOf _vehicle;

if (isNull _vehicle || {!alive _vehicle} || {_index isEqualTo -1}) exitWith {};

//Does the vehicle already have random styles? Halt till it's set.
if (local _vehicle) then {
    private _colorIndex = 1;
    if (_classNameCxp isEqualTo "C_Offroad_01_F") then {_colorIndex = 3};
    _vehicle setVariable ["color",_colorIndex,true];
};

if (!isClass (missionConfigFile >> "CxpCfgVehicles" >> _classNameCxp)) then {
    diag_log format ["%1: CxpCfgVehicles class doesn't exist",_className];
    _classNameCxp = "Default"; //Use Default class if it doesn't exist
};

private _textures = ((M_CONFIG(getArray,"CxpCfgVehicles",_classNameCxp,"textures") select _index) param [2,[]]);
if (_textures isEqualTo []) exitWith {};

_vehicle setVariable ["CXP_VEH_color",_index,true];

{_vehicle setObjectTextureGlobal [_forEachIndex,_x]} forEach _textures;
