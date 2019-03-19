#include "\life_server\script_macros.hpp"
/*
    File: fn_clearVehicleAmmo.sqf
    Author: Casperento (BASED ON TONIC, BUT BETTER ;)
    Description:
    Limpa o armamento dos veiculos com a opcao "desarmar = true;" no CfgVehicles,
    e dos demais veiculos que nao podem spawnar com cargas em seus inv's
*/
params [
    ["_vehicle",objNull,[objNull]],
    ["_className","",[""]]
];

if !(isClass(configFile >> "CfgVehicles" >> _className)) exitWith {};
if (isNull _vehicle || _className isEqualTo "") exitWith {};

private _magArr = magazinesallturrets _vehicle;
if (count _magArr > 0) then {
    if (getNumber(missionConfigFile >> "CxpCfgVehicles" >> _className >> "desarmar") isEqualTo 1) then {
        {_vehicle removeMagazinesTurret [(_x select 0),(_x select 1)];} forEach _magArr;
    };
};

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;
