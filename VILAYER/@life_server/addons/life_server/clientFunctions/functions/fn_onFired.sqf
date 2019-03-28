#include "\life_server\script_macros.hpp"
/*
  File: fn_onFired.sqf
  Author: Casperento
*/
params [
  ["_unit",ObjNull,[ObjNull]],
  "_weapon",
  "_muzzle",
  "_mode",
  "_ammoType",
  "_magazine",
  ["_projectile",ObjNull,[ObjNull]],
  ["_gunner",ObjNull,[ObjNull]]
];

if (_unit getVariable ["restrained",false]) exitWith {hint "Voce nao pode atirar enquanto estiver algemado!";deleteVehicle _projectile;};
if (_unit getVariable ["tied",false]) exitWith {hint "Voce nao pode atirar enquanto estiver algemado!";deleteVehicle _projectile;};

if (playerSide isEqualTo civilian) then {
   if (cxp_safezone) then {
    if (license_civ_bHunterLic && CXP_SETTINGS(getNumber,"bCFG_fire_safezone") isEqualTo 1) exitWith {};
    deleteVehicle _projectile;
    titleText ["!!! É proibido atirar dentro de uma zona segura !!!","PLAIN",2,true];
    if (CXP_SETTINGS(getNumber,"atirar_safe_procurado") isEqualTo 1 && !(license_civ_bHunterLic)) then {
      if (cxp_CXPHC_isActive) then {
        [getPlayerUID player,profileName,"187"] remoteExecCall ["CXPHC_fnc_wantedAdd",CXP_HC];
      } else {
        [getPlayerUID player,profileName,"187"] remoteExecCall ["cxp_fnc_wantedAdd",RSERV];
      };
      [0,format["O jogador %1 atirou dentro de uma safezone e foi adicionado na lista de procurados.",name player]] remoteExecCall ["cxp_fnc_broadcast",RANY];
    } else {
      [0,format["O jogador %1 atirou dentro de uma safezone.",name player]] remoteExecCall ["cxp_fnc_broadcast",RANY];
    };
  };
  if (CXP_SETTINGS(getNumber,"bCFG_bloquear_arma") isEqualTo 1) then {
    if (_weapon in CXP_SETTINGS(getArray,"bCFG_bounty_armas") && _ammoType in CXP_SETTINGS(getArray,"bCFG_bounty_bullet") && !(license_civ_bHunterLic)) then {
      deleteVehicle _projectile;
      if (isClass (configFile >> "CfgWeapons" >> "arifle_SPAR_02_blk_F")) then {player removeweapon "arifle_SPAR_02_blk_F";};
      if (isClass (configFile >> "CfgMagazines" >> "B_556x45_Ball_Tracer_Red")) then {player removeMagazine "B_556x45_Ball_Tracer_Red";};
      titleText ["Você não está autorizado a usar esta arma sem ser Bounty Hunter!","PLAIN"];
    };
  };
  if (_ammoType isEqualTo "GrenadeHand_stone") then {
    _projectile spawn {
        private "_position";
        while {!isNull _this} do {
            _position = ASLtoATL (visiblePositionASL _this);
            sleep 0.1;
        };
        [_position] remoteExec ["life_fnc_flashbang",RCLIENT];
    };
    };
};
