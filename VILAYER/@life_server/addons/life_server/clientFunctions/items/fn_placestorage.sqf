#include "\life_server\script_macros.hpp"
/*
    File : fn_placestorage.sqf
    Author: NiiRoZz

    Description:
    PLace container were player select with preview

*/
if !(cxp_container_active) exitWith {};
if (cxp_container_activeObj isEqualTo objNull) exitWith {};
if (!((typeOf cxp_container_activeObj) in ["B_supplyCrate_F","Box_IND_Grenades_F"])) exitWith {};

private _container = cxp_container_activeObj;
private _isFloating = if (((getPos _container) select 2) < 0.1) then {false} else {true};
detach _container;
[_container,true] remoteExecCall ["cxp_fnc_simDisable",RANY];
_container setPosATL [getPosATL _container select 0, getPosATL _container select 1, (getPosATL _container select 2) + 0.7];
_container allowDamage false;

if ((typeOf _container) isEqualTo "B_supplyCrate_F") then {
    [false,"storagebig",1] call cxp_fnc_handleInv;
} else {
    [false,"storagesmall",1] call cxp_fnc_handleInv;
};

[_container, _isFloating] call cxp_fnc_placeContainer;
cxp_container_active = false;
cxp_container_activeObj = objNull;