#include "\cxp_server\script_macros.hpp"
/*
    File: fn_vehicleGarage.sqf
    Author: Bryan "Tonic" Boardwine
    Updated to Housing/Garage Configs - BoGuu

    Description:
    Vehicle Garage, why did I spawn this in an action its self?
*/
params [
    ["_garageObj",objNull,[objNull]],
    ["_type","",[""]]
];

_className = typeOf _garageObj;
private _houseConfig = missionConfigFile >> "Housing" >> worldName >> _className;
private _garageConfig = missionConfigFile >> "Garages" >> worldName >> _className;

private _config = [_garageConfig,_houseConfig] select {isClass _x};

if (_config isEqualTo []) exitWith {};

_config = _config select 0;
private _dir = getNumber(_config >> "garageSpawnDir");
private _mTwPos = getArray(_config >> "garageSpawnPos");

cxp_garage_sp = [(_garageObj modelToWorld _mTwPos),((getDir _garageObj) + _dir)];
cxp_garage_type = _type;

if (cxp_CXPHC_isActive) then {
    [getPlayerUID player,playerSide,_type,player] remoteExec ["CXPHC_fnc_getVehicles",CXP_HC];
} else {
    [getPlayerUID player,playerSide,_type,player] remoteExec ["CXPSV_fnc_getVehicles",RSERV];
};

createDialog "Cxp_impound_menu";
disableSerialization;
ctrlSetText[2802,(localize "STR_NOTF_QueryGarage")];
