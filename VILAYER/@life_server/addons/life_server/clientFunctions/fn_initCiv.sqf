#include "\life_server\script_macros.hpp"
/*
    File: fn_initCiv.sqf
    Author: Bryan "Tonic" Boardwine

	  Modified : Casperento

    Description:
    Initializes the civilian.
*/
private _altisArray = ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"];
private _tanoaArray = ["Land_House_Small_01_F"];
private _spawnBuildings = [[["Altis", _altisArray], ["Tanoa", _tanoaArray]]] call CXPSV_fnc_terrainSort;

player setVariable ["rankgbVip",(FETCH_CONST(cxp_gdonorLevel)),true];
player setVariable ["rankPlVip",(FETCH_CONST(cxp_donorLevel)),true];
player setVariable ["downed",false,true];
player setVariable ["prisoner",false,true];

// Anti-dup licenca
if (license_civ_bHunterLic && license_civ_rebellic) then {
    missionNamespace setVariable["license_civ_rebellic",false];
    missionNamespace setVariable["license_civ_bHunterLic",false];
    [2] call CXPSKT_fnc_updatePartial;
    hint "Você não pode ter uma licença rebelde enquanto for Bounty Hunter e vice-versa!";
};

// Reafirma Bounty ativo
if (license_civ_bHunterLic) then {player setVariable ["clienteBounty",true,true];};

civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", _spawnBuildings,350];
civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", _spawnBuildings,350];
civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", _spawnBuildings,350];
civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", _spawnBuildings,350];

waitUntil {!(isNull (findDisplay 46))};

cxp_blacklisted = switch(cxp_blacklisted)do{case 0:{false};case 1:{true};};
if (cxp_blacklisted) exitWith {
    ["Banido",false,true] call BIS_fnc_endMission;
    sleep 30;
};

private _arrPriv = [];
for "_i" from 1 to 20 do {_arrPriv pushBack ("a_civ_"+(str _i));};
if (str(player) in _arrPriv) then {
	if !(cxp_playerExtraDom) then {
		["SlotReservado",false,true] call BIS_fnc_endMission;
		sleep 30;
	};
};

for "_i" from 0 to 15 do {if (player getVariable "rankgbVip" isEqualTo _i) then {[_i] call cxp_fnc_validarBase;};};
cxp_sec_salario = true;

[] call cxp_fnc_abrirMenTerm;

// Aguarda a resposta dada pelo jogador ao clicar em concordar ou discordar
waitUntil {cxp_concordDiscord};

if (cxp_is_alive && !cxp_is_arrested) then {
    /* Spawn at our last position */
    player setVehiclePosition [cxp_civ_position,[],0,"CAN_COLLIDE"];
} else {
    if (!cxp_is_alive && !cxp_is_arrested) then {
        waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
        waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
    } else {
        if (cxp_is_arrested) then {
            cxp_is_arrested = false;
            player setVariable ["arrester",player,true];
            [player,true] spawn cxp_fnc_jail;
        };
    };
};
cxp_is_alive = true;

0 cutText ["","BLACK IN"];