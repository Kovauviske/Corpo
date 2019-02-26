#include "\cxp_server\script_macros.hpp"
/*
    File: fn_onTakeItem.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Casperento
    Description:
    Monitora o evento de pegar algum item de um container(mochila/corpo/etc)
*/
params [
    ["_unit",objNull,[objNull]],
    ["_container",objNull,[objNull]],
    ["_item","",[""]]
];

if (isNull _unit || _item isEqualTo "") exitWith {}; //Bad thingies?
if (_unit getVariable ["restrained",false]) exitWith {hint"Voce nao pode fazer isso enquanto estiver algemado!"};
if (_unit getVariable ["tied",false]) exitWith {hint"Voce nao pode fazer isso enquanto estiver algemado!"};

switch (playerSide) do {
    case west: {
        if (_item isEqualTo "arifle_MX_GL_F") then {[_item,false,false,false,false] call cxp_fnc_handleItem;};
		[] call cxp_fnc_playerSkins;
	};
    case civilian: {
        if (CXP_SETTINGS(getNumber,"restrict_clothingPickup") isEqualTo 1) then {
            if (_item in (CXP_SETTINGS(getArray,"restricted_uniforms"))) then {
                [_item,false,false,false,false] call cxp_fnc_handleItem;
            };
        };
        
        if (CXP_SETTINGS(getNumber,"restrict_weaponPickup") isEqualTo 1) then {
            if (_item in (CXP_SETTINGS(getArray,"restricted_weapons"))) then {
                [_item,false,false,false,false] call cxp_fnc_handleItem;
            };
        };

        // Proibir de civ/rebelde pegar armas BountyHunter
        if ((CXP_SETTINGS(getNumber,"bCFG_bloquear_arma") isEqualTo 1) && (_item in (CXP_SETTINGS(getArray,"bCFG_bounty_armas")) || _item in (CXP_SETTINGS(getArray,"bCFG_bounty_muni"))) && !license_civ_bHunterLic) exitWith {
            "ArmaRestrita" hintC parseText "<t color='#FF0000'>!- OOPS! -!</t><br/>Você não pode pegar esta arma/municao no momento.<br/><t color='#e6f405'>Vire gente primeiro e compre uma licença de BountyHunter!</t>";
            if (isClass (configFile >> "CfgWeapons" >> _item)) then {player removeWeapon _item;};
            if (isClass (configFile >> "CfgMagazines" >> _item)) then {player removeMagazine _item;};
        };
    };
    case independent: {
        // -- Restrict Weapons
        if (CXP_SETTINGS(getNumber,"restrict_medic_weapons") isEqualTo 1) then {
            // -- Check if the type is a weapon
            if (isClass (configFile >> "CfgWeapons" >> _item)) then {
                // -- Remove all weapons from player (_unit)
                removeAllWeapons _unit;
            };
        };
    };
};
[] call cxp_fnc_playerSkins;
[3] call CXPSKT_fnc_updatePartial;