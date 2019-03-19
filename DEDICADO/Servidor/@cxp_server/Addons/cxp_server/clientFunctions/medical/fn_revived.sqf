#include "\cxp_server\script_macros.hpp"
/*
    File: fn_revived.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Casperento
    Description:
    THANK YOU CASP. I WAS SAVED!
    ;)
*/
private _medic = param [0,"Unknown Medic",[""]];
private _reviveCost = CXP_SETTINGS(getNumber,"revive_cost_player");

[cxp_save_gear] spawn cxp_fnc_loadDeadGear;

hint format [localize "STR_Medic_RevivePay",_medic,[_reviveCost] call cxp_fnc_numberText];

closeDialog 0;
cxp_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy cxp_deathCamera;

if !(isNil "cxp_spawnCamera") then {
    cxp_spawnCamera cameraEffect ["TERMINATE","BACK"];
    camDestroy cxp_spawnCamera;
    cxp_spawnCamera = nil;
};

//Cobra o valor pelo revive
[_reviveCost] spawn cxp_fnc_calcMoneyRemote;

//Reanima corpo...
player setDir (getDir cxp_corpse);
player setPosASL (visiblePositionASL cxp_corpse);
cxp_corpse setVariable ["realname",nil,true];
cxp_corpse setVariable ["Revive",nil,true];
cxp_corpse setVariable ["name",nil,true];
[cxp_corpse] remoteExecCall ["cxp_fnc_corpse",RANY];
deleteVehicle cxp_corpse;

cxp_action_inUse = false;
cxp_is_alive = true;
cxp_deadClient_Atendido = [false,objNull]; // Zera atendimento do medico q localizou esse defunto revivido por Chessus

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
[] call cxp_fnc_playerSkins;
[] call cxp_fnc_playerTags; // Atualiza TAGs visiveis...
[] call CXPSKT_fnc_updateRequest;

//Tela embaçada durante 3min apos revive
[2,"dynamicBlur",400,[10]] spawn cxp_fnc_geradordeefeitos;

// Removendo por completo da lista do samu
[(name player)] remoteExec ["CXPSV_fnc_rmMorteListaSv",RSERV];
[player] remoteExecCall ["cxp_fnc_rmCorpseArr",independent];

// Mostra para todo mundo que o player foi revivido por tal medico(no chat)
[0,format["O jogador %1 foi revivido por %2",name player,_medic]] remoteExecCall ["cxp_fnc_broadcast",RANY];

// Salva player vivo no DB
if (playerSide isEqualTo civilian) then {[4] call CXPSKT_fnc_updatePartial;};