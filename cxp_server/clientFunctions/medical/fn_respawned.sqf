#include "\cxp_server\script_macros.hpp"
/*
    File: fn_respawned.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Casperento
    Description:
    Sets the player up if he/she used the respawn option.
*/
//Reset our weight and other stuff
cxp_action_inUse = false;
cxp_use_atm = true;
cxp_hunger = 100;
cxp_thirst = 100;
cxp_drink = 0;
cxp_cigar_uses = 0;
cxp_carryWeight = 0;
CASH = 0; //Make sure we don't get our cash back.
player playMove "AmovPercMstpSnonWnonDnon";

cxp_corpse setVariable ["Revive",nil,true];
cxp_corpse setVariable ["name",nil,true];
cxp_corpse setVariable ["Reviving",nil,true];
player setVariable ["Revive",true,true];
player setVariable ["name",nil,true];
player setVariable ["Reviving",nil,true];

// Deletando objeto de referencia do corpse
if (player getVariable ["clienteSkull",objNull] != objNull || cxp_corpse getVariable ["clienteSkull",objNull] != objNull) then {
    if (count (attachedObjects player) > 0) then {{if (vehicleVarName _x isEqualTo "cxp_skull_var") then {deleteVehicle _x;};} forEach (attachedObjects player);};
    if (count (attachedObjects cxp_corpse) > 0) then {{if (vehicleVarName _x isEqualTo "cxp_skull_var") then {deleteVehicle _x;};} forEach (attachedObjects cxp_corpse);};
};
cxp_skull = objNull;
player setVariable ["clienteSkull",objNull,true];
cxp_corpse setVariable ["clienteSkull",objNull,true];

// Removendo por completo da lista do samu
[(name player)] remoteExec ["CXPSV_fnc_rmMorteListaSv",RSERV];

//Load gear for a 'new life'
private "_handle";
switch (playerSide) do {
    case west: {
        _handle = [] spawn cxp_fnc_copLoadout;
    };
    case civilian: {
        _handle = [] spawn cxp_fnc_civLoadout;
    };
    case independent: {
        _handle = [] spawn cxp_fnc_medicLoadout;
    };
    waitUntil {scriptDone _handle};
};

//Cleanup of weapon containers near the body & hide it.
if !(isNull cxp_corpse) then {
    private "_containers";
    cxp_corpse setVariable ["Revive",true,true];
    _containers = nearestObjects[cxp_corpse,["WeaponHolderSimulated"],5];
    {deleteVehicle _x;} forEach _containers; //Delete the containers.
    deleteVehicle cxp_corpse;
};

//Destroy our camera...
cxp_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy cxp_deathCamera;
if !(isNil "cxp_spawnCamera") then {
    cxp_spawnCamera cameraEffect ["TERMINATE","BACK"];
    camDestroy cxp_spawnCamera;
    cxp_spawnCamera = nil;
};

//Bad boy
if (cxp_is_arrested) exitWith {
    hint localize "STR_Jail_Suicide";
    cxp_is_arrested = false;
    [player,true] spawn cxp_fnc_jail;
    [] call CXPSKT_fnc_updateRequest;
};

//Johnny law got me but didn't let the EMS revive me, reward them half the bounty.
if (!isNil "cxp_copRecieve") then {

    if (cxp_CXPHC_isActive) then {
        [getPlayerUID player,player,cxp_copRecieve,true] remoteExecCall ["CXPHC_fnc_wantedBounty",CXP_HC];
    } else {
        [getPlayerUID player,player,cxp_copRecieve,true] remoteExecCall ["cxp_fnc_wantedBounty",RSERV];
    };

    cxp_copRecieve = nil;
};

//So I guess a fellow gang member, cop or myself killed myself so get me off that Altis Most Wanted
if (cxp_removeWanted) then {
    if (cxp_CXPHC_isActive) then {
        [getPlayerUID player] remoteExecCall ["CXPHC_fnc_wantedRemove",CXP_HC];
    } else {
        [getPlayerUID player] remoteExecCall ["cxp_fnc_wantedRemove",RSERV];
    };
    player setVariable ["procurado",false,true];
};

// Remover licencas necessarias do player e salvar no DB
//[4] call cxp_fnc_removeLicenses;
//[2] call CXPSKT_fnc_updatePartial;

[] call CXPSKT_fnc_updateRequest;
[] call cxp_fnc_playerTags; // Atualiza TAGs visiveis...

// Salva player vivo no DB
if (playerSide isEqualTo civilian) then {[4] call CXPSKT_fnc_updatePartial;};