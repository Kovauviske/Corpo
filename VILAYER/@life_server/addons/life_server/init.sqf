#include "script_macros.hpp"
/*
    File: init.sqf
    Author: Bryan "Tonic" Boardwine

    Edit: Nanou for HeadlessClient optimization.
    Please read support for more informations.

    Modified: Casperento

    Description:
    Initialize the server and required systems.
*/
waitUntil {cxp_clientFunctReady};

CXPDB_Async_Active = false;
CXPDB_Async_ExtraLock = false;
cxp_server_isReady = false;
private _extDBNotLoaded = "";
serv_sv_use = [];
publicVariable "cxp_server_isReady";
fn_whoDoneIt = compile preprocessFileLineNumbers "\life_server\serverFunctions\Systems\fn_whoDoneIt.sqf";

/*
    Prepare the headless client.
*/
cxp_CXPHC_isActive = false;
publicVariable "cxp_CXPHC_isActive";
CXP_HC = false;
publicVariable "CXP_HC";
if (EXTSQLCXP_STNG(getNumber,"HeadlessSupport") isEqualTo 1) then {[] execVM "\life_server\initHC.sqf";};

/*
    Prepare extDB before starting the initialization process
    for the server.
*/

if (isNil {uiNamespace getVariable "cxp_sql_id"}) then {
    cxp_sql_id = round(random(9999));
    CONSTVAR(cxp_sql_id);
    uiNamespace setVariable ["cxp_sql_id",cxp_sql_id];
    try {
        _result = EXTSQL format ["9:ADD_DATABASE:%1",EXTSQLCXP_STNG(getText,"DatabaseName")];
        if (!(_result isEqualTo "[1]")) then {throw "extDB3: Error with Database Connection"};
        if (EXTSQLCXP_STNG(getNumber,"SupportSqlCustom") isEqualTo 1) then {
            _result = EXTSQL format ["9:ADD_DATABASE_PROTOCOL:%1:SQL_CUSTOM:SQL:cxpf_db.ini",EXTSQLCXP_STNG(getText,"DatabaseName")];
        } else {
            _result = EXTSQL format ["9:ADD_DATABASE_PROTOCOL:%2:SQL:%1:TEXT2",FETCH_CONST(cxp_sql_id),EXTSQLCXP_STNG(getText,"DatabaseName")];
        };
        if (!(_result isEqualTo "[1]")) then {throw "extDB3: Error with Database Connection"};
    } catch {
        diag_log _exception;
        _extDBNotLoaded = [true, _exception];
    };
    if (_extDBNotLoaded isEqualType []) exitWith {};
    EXTSQL "9:LOCK";
    diag_log "extDB3: Connected to Database";
} else {
    cxp_sql_id = uiNamespace getVariable "cxp_sql_id";
    CONSTVAR(cxp_sql_id);
    diag_log "extDB3: Still Connected to Database";
};


if (_extDBNotLoaded isEqualType []) exitWith {
    cxp_server_extDB_notLoaded = true;
    publicVariable "cxp_server_extDB_notLoaded";
};
cxp_server_extDB_notLoaded = false;
publicVariable "cxp_server_extDB_notLoaded";

/* Run stored procedures for SQL side cleanup */
["CALL resetCxpVehicles",1] call CXPDB_fnc_asyncCall;
["CALL deleteDeadVehicles",1] call CXPDB_fnc_asyncCall;
["CALL deleteOldHouses",1] call CXPDB_fnc_asyncCall;
["CALL deleteOldGangs",1] call CXPDB_fnc_asyncCall;

private _timeStamp = diag_tickTime;
diag_log "----------------------------------------------------------------------------------------------------";
diag_log "------------------------------------- Iniciando Servidor CXP ---------------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";

/* Map-based server side initialization. */
master_group attachTo[bank_obj,[0,0,0]];

// Feito para o sqm padrao da framework do Tonic v5.0.0 do mapa Tanoa
{
    _hs = createVehicle ["Land_Hospital_main_F", [0,0,0], [], 0, "NONE"];
    _hs setDir (markerDir _x);
    _hs setPosATL (getMarkerPos _x);
    _var = createVehicle ["Land_Hospital_side1_F", [0,0,0], [], 0, "NONE"];
    _var attachTo [_hs, [4.69775,32.6045,-0.1125]];
    detach _var;
    _var = createVehicle ["Land_Hospital_side2_F", [0,0,0], [], 0, "NONE"];
    _var attachTo [_hs, [-28.0336,-10.0317,0.0889387]];
    detach _var;
    if (worldName isEqualTo "Tanoa") then {
        if (_forEachIndex isEqualTo 0) then {
            atm_hospital_2 setPos (_var modelToWorld [4.48633,0.438477,-8.25683]);
            vendor_hospital_2 setPos (_var modelToWorld [4.48633,0.438477,-8.25683]);
            "medic_spawn_3" setMarkerPos (_var modelToWorld [8.01172,-5.47852,-8.20022]);
            "med_car_2" setMarkerPos (_var modelToWorld [8.01172,-5.47852,-8.20022]);
            hospital_assis_2 setPos (_hs modelToWorld [0.0175781,0.0234375,-0.231956]);
        } else {
            atm_hospital_3 setPos (_var modelToWorld [4.48633,0.438477,-8.25683]);
            vendor_hospital_3 setPos (_var modelToWorld [4.48633,0.438477,-8.25683]);
            "medic_spawn_1" setMarkerPos (_var modelToWorld [-1.85181,-6.07715,-8.24944]);
            "med_car_1" setMarkerPos (_var modelToWorld [5.9624,11.8799,-8.28493]);
            hospital_assis_2 setPos (_hs modelToWorld [0.0175781,0.0234375,-0.231956]);
        };
    };
} forEach ["hospital_2","hospital_3"];

// Desarma todos os bots
{
    if !(isPlayer _x) then {
        _npc = _x;
        {
            if (_x != "") then {
                _npc removeWeapon _x;
            };
        } forEach [primaryWeapon _npc,secondaryWeapon _npc,handgunWeapon _npc];
    };
} forEach allUnits;

[8,true,12] execFSM "\life_server\FSM\timeModule.fsm";

cxp_medicLevel = 0;
cxp_copLevel = 0;
CONST(JxMxE_PublishVehicle,"false");

/* Setup radio channels for west/independent/civilian */
cxp_radio_west = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
cxp_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
cxp_radio_indep = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];

/* Set the amount of gold in the federal reserve at mission start */
fed_bank setVariable ["safe",count playableUnits,true];
[] spawn CXPSV_fnc_federalUpdate;

/* Lista com nome dos players */
ListaPlayersNome = [];

/* Event handler for connecting/disconnecting players */
addMissionEventHandler ["HandleDisconnect",{_this call CXPSV_fnc_clientDisconnect;false;}];
addMissionEventHandler ["PlayerConnected", {_this call CXPSV_fnc_clientConnect;}];
[] call compile preprocessFileLineNumbers "\life_server\functions.sqf";

/* Set OwnerID players for Headless Client */
CXPSV_fnc_requestClientID = {
    (_this select 1) setVariable ["cxp_clientID", owner (_this select 1), true];
};
"cxp_fnc_RequestClientId" addPublicVariableEventHandler CXPSV_fnc_requestClientID;

/* Event handler for logs */
"money_log" addPublicVariableEventHandler {diag_log (_this select 1)};
"advanced_log" addPublicVariableEventHandler {diag_log (_this select 1)};

/* Miscellaneous mission-required stuff */
cleanupFSM = [] execFSM "\life_server\FSM\cleanup.fsm";

[] spawn {
    for "_i" from 0 to 1 step 0 do {
        uiSleep (30 * 60);
        {
            _x setVariable ["sellers",[],true];
        } forEach [Dealer_1,Dealer_2,Dealer_3];
    };
};

[] spawn CXPSV_fnc_initHouses;
cleanup = [] spawn CXPSV_fnc_cleanup;

CXPSV_fnc_playtime_values = [];
CXPSV_fnc_playtime_values_request = [];

//Just incase the Headless Client connects before anyone else
publicVariable "CXPSV_fnc_playtime_values";
publicVariable "CXPSV_fnc_playtime_values_request";

/* Setup the federal reserve building(s) */
private _vaultHouse = [[["Altis", "Land_Research_house_V1_F"], ["Tanoa", "Land_Medevac_house_V1_F"]]] call CXPSV_fnc_terrainSort;
private _altisArray = [16019.5,16952.9,0];
private _tanoaArray = [11074.2,11501.5,0.00137329];
private _pos = [[["Altis", _altisArray], ["Tanoa", _tanoaArray]]] call CXPSV_fnc_terrainSort;

private _dome = nearestObject [_pos,"Land_Dome_Big_F"];
private _rsb = nearestObject [_pos,_vaultHouse];

for "_i" from 1 to 3 do {_dome setVariable [format ["bis_disabled_Door_%1",_i],1,true]; _dome animateSource [format ["Door_%1_source", _i], 0];};
_dome setVariable ["locked",true,true];
_rsb setVariable ["locked",true,true];
_rsb setVariable ["bis_disabled_Door_1",1,true];
_dome allowDamage false;
_rsb allowDamage false;

all_ah_items = [];
publicVariable "all_ah_items";
[] spawn CXPSV_fnc_vAH_init;
[] spawn {
    for "_i" from 0 to 1 step 0 do {
        sleep (20 * 60);
        if (count all_ah_items > 0) then {
            [] spawn CXPSV_fnc_vAH_update;
        };
    };
};

/* Tell clients that the server is ready and is accepting queries */
cxp_server_isReady = true;
publicVariable "cxp_server_isReady";

/* Start dynamic market syncing */
if (CXP_SETTINGS(getNUmber,"dynamic_market") isEqualTo 1) then {[] spawn CXPSV_fnc_syncPrices;};

/* Initialize hunting zone(s) */
aiSpawn = ["hunting_zone",30] spawn CXPSV_fnc_huntingZone;

server_corpses = [];
addMissionEventHandler ["EntityRespawned", {_this call CXPSV_fnc_entityRespawned}];

/* AVISOS RESTART - PARA LINUX/WINDOWS */
missionStartServer = missionStart;
publicVariable "missionStartServer";
execVM "\life_server\serverFunctions\RestartAvisos\svRestMsg.sqf";

/* Lista de Mortos para o SAMU/BOMBEIRO */
[] call CXPSV_fnc_initDeadListServer;

/* Lista Publica de players procurados pelos Bounty Hunters -> By Casperento */
cxp_bounty_procurados = [];
publicVariableServer "cxp_bounty_procurados";

/* Sistema Global de Doadores -> By Casperento */
[] call CXPSV_fnc_initGbSysDntServer;

diag_log "----------------------------------------------------------------------------------------------------";
diag_log format ["               End of Altis Cxp Server Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "----------------------------------------------------------------------------------------------------";
