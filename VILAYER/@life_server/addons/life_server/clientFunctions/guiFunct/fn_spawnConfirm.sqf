#include "\life_server\script_macros.hpp"
/*
    File: fn_spawnConfirm.sqf
    Author: Bryan "Tonic" Boardwine

	  Modified : Casperento

    Description:
    Spawns the player where he selected.
*/
private ["_spCfg","_sp","_spawnPos"];
closeDialog 0;

if !(isNil "cxp_spawnCamera") then {
    cxp_spawnCamera cameraEffect ["TERMINATE","BACK"];
    camDestroy cxp_spawnCamera;
    cxp_spawnCamera = nil;
};

if (cxp_spawn_point isEqualTo []) then {
    private ["_sp","_spCfg"];
    _spCfg = [playerSide] call cxp_fnc_spawnPointCfg;
    _sp = _spCfg select 0;

    if (playerSide isEqualTo civilian) then {
        if (isNil {(call compile format ["%1",_sp select 0])}) then {
            player setPos (getMarkerPos (_sp select 0));
        } else {
            _spawnPos = (call compile format ["%1",_sp select 0]) call BIS_fnc_selectRandom;
            _spawnPos = _spawnPos buildingPos 0;
            player setPos _spawnPos;
        };
    } else {
        player setPos (getMarkerPos (_sp select 0));
    };
    titleText[format ["%2 %1",_sp select 1,localize "STR_Spawn_Spawned"],"BLACK IN"];
} else {
    if (playerSide isEqualTo civilian) then {
        if (isNil {(call compile format ["%1",cxp_spawn_point select 0])}) then {
            if (["house",cxp_spawn_point select 0] call cxp_fnc_inString) then {
                private ["_bPos","_house","_pos"];
                _house = nearestObjects [getMarkerPos (cxp_spawn_point select 0),["House_F"],10] select 0;
                _bPos = [_house] call cxp_fnc_getBuildingPositions;

                if (_bPos isEqualTo []) exitWith {
                    player setPos (getMarkerPos (cxp_spawn_point select 0));
                };

                {_bPos = _bPos - [(_house buildingPos _x)];} forEach (_house getVariable ["slots",[]]);
                _pos = _bPos call BIS_fnc_selectRandom;
                player setPosATL _pos;
            } else {
                player setPos (getMarkerPos (cxp_spawn_point select 0));
            };
        } else {
            _spawnPos = (call compile format ["%1", cxp_spawn_point select 0]) call BIS_fnc_selectRandom;
            _spawnPos = _spawnPos buildingPos 0;
            player setPos _spawnPos;
        };
    } else {
        player setPos (getMarkerPos (cxp_spawn_point select 0));
    };
    titleText[format ["%2 %1",cxp_spawn_point select 1,localize "STR_Spawn_Spawned"],"BLACK IN"];
};

// Seta vars iniciais para o jogador q concordou com os termos
if (!cxp_respawned && cxp_concordDiscord && playerSide isEqualTo civilian) then {
  [] call cxp_fnc_initPayChecks;
  [] spawn cxp_fnc_autoMessages;
  [] spawn cxp_fnc_autoSave;
	switch (playerSide) do {
		case civilian : {
			playSound "introSong";
		};
		case west : {
			playSound "copintrosong";
		};
		case independent : {
			playSound "introSong";
		};
	};
  [] spawn {["Nova mensagem recebida","De: Administração",(localize "STR_Init_Welcome"),[1,0,0,1]] call cxp_fnc_notify;sleep 30;[] spawn cxp_fnc_welcomeCredits;};
};

cxp_respawned = false;
[] call cxp_fnc_playerSkins;
[] call cxp_fnc_hudSetup;