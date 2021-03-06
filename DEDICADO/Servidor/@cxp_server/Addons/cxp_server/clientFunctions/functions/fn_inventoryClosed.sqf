#include "\cxp_server\script_macros.hpp"
/*
    File: fn_inventoryClosed.sqf
    Author: Bryan "Tonic" Boardwine
    Modified : NiiRoZz

    Description:
    1 : Used for syncing house container data but when the inventory menu
    is closed a sync request is sent off to the server.
    2 : Used for syncing vehicle inventory when save vehicle gear are activated
*/
params [
    "",
    ["_container", objNull, [objNull]]
];
if (isNull _container) exitWith {};

if ((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"] && !(_container getVariable ["caixaInfectada",false])) exitWith {
    if (cxp_CXPHC_isActive) then {
        [_container] remoteExecCall ["CXPHC_fnc_updateHouseContainers",CXP_HC];
    } else {
        [_container] remoteExecCall ["CXPSV_fnc_updateHouseContainers",RSERV];
    };
	[3] call CXPSKT_fnc_updatePartial;
};

if (CXP_SETTINGS(getNumber,"save_vehicle_inventory") isEqualTo 1) then {
    if (_container isKindOf "Car" || {_container isKindOf "Air"} || {_container isKindOf "Ship"}) then {
        if (cxp_CXPHC_isActive) then {
            [_container,1] remoteExecCall ["CXPHC_fnc_vehicleUpdate",CXP_HC];
        } else {
            [_container,1] remoteExecCall ["CXPSV_fnc_vehicleUpdate",RSERV];
        };
    };
	[3] call CXPSKT_fnc_updatePartial;
};