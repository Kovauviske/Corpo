#include "\cxp_server\script_macros.hpp"
/*
	File: fn_reviveInst.sqf
	Author: Casperento
	BASED ON: fn_revived.sqf
	Description:
	Revive player sem precisar do samu (APENAS PARA VIP 5 e 6)
*/
if (playerSide isEqualTo independent) exitWith {};
if (CXP_SETTINGS(getNumber,"revive_inst_on") isEqualTo 0) exitWith {};

private _revivePrice = CXP_SETTINGS(getNumber,"revive_inst_fee");

player setVariable ["UsouReviveInst",true,true];
cxp_deadClient_Atendido = [false,objNull]; // Zera atendimento do medico q localizou esse defunto revivido por Chessus

[cxp_save_gear] spawn cxp_fnc_loadDeadGear;

closeDialog 0;
cxp_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy cxp_deathCamera;

if !(isNil "cxp_spawnCamera") then {
    cxp_spawnCamera cameraEffect ["TERMINATE","BACK"];
    camDestroy cxp_spawnCamera;
    cxp_spawnCamera = nil;
};

//Cobra o valor pelo revive
[_revivePrice] spawn cxp_fnc_calcMoneyRemote;

player setDir (getDir cxp_corpse);

// Mandando pra puta que pariu
if (playerSide isEqualTo civilian) then {
	if (FETCH_CONST(cxp_gdonorlevel) > 0) then {
		for "_i" from 1 to 15 do { // 15 >> numero de max de bases
			if (FETCH_CONST(cxp_gdonorlevel) isEqualTo _i) exitWith {
				player setPosASL (getMarkerPos ("sp_gangP"+(str(_i)))); // Manda jogador para Kavala
				hint "Você se auto-reviveu e foi 'jogado' em sua base de gangue!";
			};
		};
	} else {
		// manda pra kavala (garagem de deficientes/hospital)
		player setPosASL (getMarkerPos "civ_gar_4");
		hint "Você se auto-reviveu e foi 'jogado' em Kavala, ao lado de uma garagem para deficientes, fuja antes que seja tarde e a polícia o pegue!";
	};
};
// manda pra kavala HQ DA POLICIA
if (playerSide isEqualto west) then {player setPosASL (getMarkerPos "cop_spawn_1");};

// Deletando objeto de referencia do corpse
if (player getVariable ["clienteSkull",objNull] != objNull || cxp_corpse getVariable ["clienteSkull",objNull] != objNull) then {
    if (count (attachedObjects player) > 0) then {{if (vehicleVarName _x isEqualTo "cxp_skull_var") then {deleteVehicle _x;};} forEach (attachedObjects player);};
    if (count (attachedObjects cxp_corpse) > 0) then {{if (vehicleVarName _x isEqualTo "cxp_skull_var") then {deleteVehicle _x;};} forEach (attachedObjects cxp_corpse);};
};
cxp_skull = objNull;
player setVariable ["clienteSkull",objNull,true];
cxp_corpse setVariable ["clienteSkull",objNull,true];

player setVariable ["Revive",true,true];
player setVariable ["name",nil,true];
player setVariable ["Reviving",nil,true];
cxp_corpse setVariable ["realname",nil,true];
cxp_corpse setVariable ["Reviving",nil,true];
cxp_corpse setVariable ["Revive",nil,true];
cxp_corpse setVariable ["name",nil,true];
[cxp_corpse] remoteExecCall ["cxp_fnc_corpse",RANY];
deleteVehicle cxp_corpse;

cxp_action_inUse = false;
cxp_is_alive = true;

[] call cxp_fnc_playerSkins;
[] call cxp_fnc_playerTags; // Atualiza TAGs visiveis...
[] call CXPSKT_fnc_updateRequest;

// Removendo por completo da lista do samu
[(name player)] remoteExec ["CXPSV_fnc_rmMorteListaSv",RSERV];
[player] remoteExecCall ["cxp_fnc_rmCorpseArr",independent];
player setVariable ["UsouReviveInst",false,true]; // reforcando o 'desligamento' do uso do revive instantaneo

// Salva player vivo no DB
if (playerSide isEqualTo civilian) then {[4] call CXPSKT_fnc_updatePartial;};