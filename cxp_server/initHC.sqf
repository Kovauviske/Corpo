/*
    Author: Nanou
    File: fn_initHC.sqf
    Description:
    Written for Altis life RPG.
*/

CXPHC_UID = nil;

// JIP integration of an hc
"cxp_CXPHC_isActive" addPublicVariableEventHandler {
    if (_this select 1) then {
        CXPHC_UID = getPlayerUID hc_1;
        CXP_HC = owner hc_1;
        publicVariable "CXP_HC";
        CXP_HC publicVariableClient "serv_sv_use";
        cleanupFSM setFSMVariable ["stopfsm",true];
        terminate cleanup;
        terminate aiSpawn;
        [true] call CXPSV_fnc_transferOwnership;
        CXP_HC publicVariableClient "animals";
        diag_log "Headless client is connected and ready to work!";
    };
};

CXPHC_DC = ["CXPHC_Disconnected","onPlayerDisconnected",
    {
        if (!isNil "CXPHC_UID" && {_uid == CXPHC_UID}) then {
            cxp_CXPHC_isActive = false;
            publicVariable "cxp_CXPHC_isActive";
            CXP_HC = false;
            publicVariable "CXP_HC";
            cleanup = [] spawn CXPSV_fnc_cleanup;
            cleanupFSM = [] execFSM "\cxp_server\FSM\cleanup.fsm";
            [false] call CXPSV_fnc_transferOwnership;
            aiSpawn = ["hunting_zone",30] spawn CXPSV_fnc_huntingZone;
            diag_log "Headless client disconnected! Broadcasted the vars!";
            diag_log "Ready for receiving queries on the server machine.";
        };
    }
] call BIS_fnc_addStackedEventHandler;
