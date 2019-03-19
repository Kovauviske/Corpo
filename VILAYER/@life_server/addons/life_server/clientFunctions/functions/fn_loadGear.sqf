#include "\life_server\script_macros.hpp"
/*
    File: fn_loadGear.sqf
  Author: Bryan "Tonic" Boardwine
  Modified: Casperento
  Description:
  Loads saved civilian gear, this is limited for a reason and that's balance.
*/
params [["_variable",false,[false]]];
private _itemArray = cxp_gear;
waitUntil {!isNull (findDisplay 46)};

private _handle = [] spawn cxp_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};
if (count _itemArray isEqualTo 0) exitWith {
    switch (playerSide) do {
        case west: {
          // COP LOADOUT
          // Uniformes, Armas, etc...
          player forceAddUniform "U_Rangemaster";
          player addVest "V_Rangemaster_belt";
          player addWeapon "hgun_P07_snds_F";
          player addMagazine "16Rnd_9x21_Mag";
        };
        case civilian: {
          // CIV LOADOUT
          // Uniformes, Armas, etc...
          private _roupas = ["U_C_Poloshirt_stripped","U_C_Poloshirt_redwhite"];
          player forceAddUniform (selectRandom _roupas);
        };
        case independent: {
          // MED LOADOUT
          // Uniformes, Armas, etc...
          player forceAddUniform "U_I_HeliPilotCoveralls";
          player addVest "V_Rangemaster_belt";
          player addItem "FirstAidKit";
          player addWeapon "hgun_P07_snds_F";
          player addMagazine "16Rnd_9x21_Mag";
        };
    };
    player linkItem "ItemMap";
    player linkItem "ItemCompass";
    player linkItem "ItemWatch";
    [] call cxp_fnc_playerSkins;
    [] call cxp_fnc_saveGear;
};

_itemArray params [
  "_items",
  ["_yItems",[]]
];

player setUnitLoadout _items;

/* Hotfix for losing virtual items on login */
if (_variable) then {
  cxp_maxWeight = cxp_maxWeight + (round(FETCH_CONFIG2(getNumber,"CfgVehicles",(backpack player),"maximumload") / 4));
};

cxp_maxWeight = 100;
{[true,(_x select 0),(_x select 1)] call cxp_fnc_handleInv;} forEach (_yItems);
cxp_maxWeight = 24;

[] call cxp_fnc_playerSkins;
