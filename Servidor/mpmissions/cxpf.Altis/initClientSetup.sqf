/*
    File: initClientSetup.sqf
    Author: Casperento
    Description:
	Inicializa cliente
*/
cxp_session_completed = false;

0 cutText[format[(localize "STR_Init_ClientSetup")],"BLACK FADED"];
diag_log format[(localize "STR_Init_ClientSetup")];
0 cutFadeOut 9999999;

private _timeStamp = diag_tickTime;
private _extDB_notLoaded = "";

diag_log "----------------------------------------------------------------------------------------------------";
diag_log "-------------------------------------- Iniciando Cliente CXP ---------------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";

waitUntil {!isNull player && player == player}; //Wait till the player is ready

enableSentences false;

//Setup initial client core functions
diag_log "::Cliente CXP:: Inicializando Variaveis Basicas do Cliente...";
[] call compile preprocessFileLineNumbers "clientVars.sqf";
diag_log "::Cliente CXP:: Variaveis basicas do cliente inicializadas!";

diag_log "::Cliente CXP:: Carregando actions das lojas...";
[] call cxp_fnc_initAddActions;
diag_log "::Cliente CXP:: Actions das lojas carregados com sucesso!";

diag_log "::Cliente CXP:: Configurando Eventhandlers";
[] call cxp_fnc_setupEVH;
diag_log "::Cliente CXP:: Eventhandlers configurados com sucesso!";

execVM "comunidade\fastrope.sqf";
waituntil {!isNil "shk_fastrope_fnc_createropes" && !isNil "SHK_Fastrope_fnc_cutRopes" && !isNil "SHK_Fastrope_fnc_queueUp"};
diag_log "::Cliente CXP:: Configurando ScrollActions Basicos";
[] call cxp_fnc_setupActions;
diag_log "::Cliente CXP:: ScrollActions configurados com sucesso!";

diag_log "::Cliente CXP:: Configurando Cellphone_SQL";
[] call cxp_fnc_cellPhoneCheck;
diag_log "::Cliente CXP:: Cellphone_SQL configurado com sucesso!";

diag_log "::Cliente CXP:: Aguardando Funcoes do servidor para continuar...";
waitUntil {(!isNil "CXPSV_fnc_clientGangLeader")};
diag_log "::Cliente CXP:: Funcoes recebidas do servidor com sucesso!";

diag_log format[(localize "STR_Init_ServerReady")];

diag_log "::Cliente CXP:: Esperando o servidor terminar sua sincronizacão...";

waitUntil {!isNil "cxp_server_isReady"};
waitUntil {!isNil "cxp_CXPHC_isActive" && {!isNil "cxp_server_extDB_notLoaded"}};

if (cxp_server_extDB_notLoaded) exitWith {diag_log format[(localize "STR_Init_ExtdbFail")];};

waitUntil {cxp_server_isReady};
[] call CXPSKT_fnc_dataQuery;
0 cutText["Aguardando sincronizacao com o banco de dados...","BLACK FADED"];
diag_log "Aguardando sincronizacao com o banco de dados...";
0 cutFadeOut 9999999;
waitUntil {cxp_session_completed};

0 cutText["Cliente sincronizado com o banco de dados com sucesso!","BLACK FADED"];
diag_log "Cliente sincronizado com o banco de dados com sucesso!";
0 cutFadeOut 9999999;

[] spawn cxp_fnc_escInterupt;

waitUntil {!isNil "cxp_salary_expired"};
if (cxp_salary_expired) exitWith {["Expired",false,true] call BIS_fnc_endMission;sleep 30;};

diag_log "::Cliente CXP:: Montando configuracoes basicas do cliente final...";
// Configurando salarios para cada time!
private "_cfgSalario";
switch (playerSide) do {
    case west: {
        _cfgSalario = getArray(missionConfigFile >> "CxpBasic_Settings" >> "paycheck_cop");
        for "_i" from 0 to 17 do {
            if ((call cxp_coplevel) isEqualTo _i) then {
                cxp_paycheck = _cfgSalario select _i;
            };
        };
    };
    case civilian: {
        _cfgSalario = getArray(missionConfigFile >> "CxpBasic_Settings" >> "paycheck_civ");
        for "_i" from 0 to 6 do {
            if ((call cxp_donorlevel) isEqualTo _i) then {
                cxp_paycheck = _cfgSalario select _i;
            };
        };
    };
    case independent: {
        _cfgSalario = getArray(missionConfigFile >> "CxpBasic_Settings" >> "paycheck_med");
        for "_i" from 0 to 9 do {
            if ((call cxp_mediclevel) isEqualTo _i) then {
                cxp_paycheck = _cfgSalario select _i;
            };
        };
    };
};

private "_handle";
switch (playerSide) do {
    case west: {
        _handle = [] spawn cxp_fnc_initCop;
        waitUntil {scriptDone _handle};
    };
    case civilian: {
        _handle = [] spawn cxp_fnc_initCiv;
        waitUntil {scriptDone _handle};
    };
    case independent: {
        _handle = [] spawn cxp_fnc_initMedic;
        waitUntil {scriptDone _handle};
    };
};

diag_log format[(localize "STR_Init_ClientFinish")];

player setVariable ["Revive",true,true];
player setVariable ["restrained",false,true];
player setVariable ["tied",false,true];
player setVariable ["Escorting",false,true];
player setVariable ["transporting",false,true];
player setVariable ["playerSurrender",false,true];
player setVariable ["plPerdeuCabaco",false,true];
player setVariable ["podeArrombarCu",false,true];
player setVariable ["drogado",false,true];
player setVariable ["UsouReviveInst",false,true];
player setVariable ["clienteSkull",objNull,true];
player setVariable ["alvoTab",false,true];
player setVariable ["sequestrado",false,true];
player setVariable ["arrester",objNull,true];
player setVariable ["causaMorte",1,true];
diag_log "::Cliente CXP:: Configuracoes basicas montadas com sucesso!";

diag_log "::Cliente CXP:: Inicializando FSM do cliente CXP";
[] execFSM "client.fsm";
diag_log "::Cliente CXP:: FSM do cliente executado!";

waitUntil {!(isNull (findDisplay 46))};
diag_log "::Cliente CXP::Display 46 Encontrado";
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call cxp_fnc_keyHandler"];

[player,cxp_settings_enableSidechannel,playerSide] remoteExecCall ["CXPSV_fnc_manageSC",2];

if (playerSide in [west,independent]) then {
	switch (playerSide) do {
		case west : {
			playSound "copintrosong";
		};
		case independent : {
			playSound "introSong";
		};
	};
	[] spawn {["Nova mensagem recebida","De: Administração",(localize "STR_Init_Welcome"),[1,0,0,1]] call cxp_fnc_notify;sleep 30;[] spawn cxp_fnc_welcomeCredits;};
};

/* Set up frame-by-frame handlers */
CXP_ID_PlayerTags = ["CXP_PlayerTags","onEachFrame","cxp_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
CXP_ID_RevealObjects = ["CXP_RevealObjects","onEachFrame","cxp_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;

player setVariable ["steam64ID",getPlayerUID player];
player setVariable ["realname",profileName,true];

cxp_fnc_moveIn = compileFinal "cxp_disable_getIn = false;player moveInCargo (_this select 0);cxp_disable_getOut = true;";

cxp_fnc_RequestClientId = player;
publicVariableServer "cxp_fnc_RequestClientId"; //Variable OwnerID for HeadlessClient

[] spawn cxp_fnc_survival;
diag_log "::Cliente CXP:: Sistema de sobrevivencia inicializado!";

waitUntil {(missionNamespace getVariable ["cxp_perksInitialized", true])};

cxp_paycheck = compileFinal (str(cxp_paycheck));
if ((getNumber(missionConfigFile >> "CxpBasic_Settings" >> "enable_fatigue")) isEqualTo 0) then {player enableFatigue false;};
if ((getNumber(missionConfigFile >> "CxpBasic_Settings" >> "pump_service")) isEqualTo 1) then {[] execVM "setupStationService.sqf";};

/*
    https://feedback.bistudio.com/T117205 - disableChannels settings cease to work when leaving/rejoining mission
    Universal workaround for usage in a preInit function. - AgentRev
    Remove if Bohemia actually fixes the issue.
*/
{
    _x params [["_chan",-1,[0]], ["_noText","false",[""]], ["_noVoice","false",[""]]];

    _noText = [false,true] select ((["false","true"] find toLower _noText) max 0);
    _noVoice = [false,true] select ((["false","true"] find toLower _noVoice) max 0);

    _chan enableChannel [!_noText, !_noVoice];

} forEach getArray (missionConfigFile >> "disableChannels");
diag_log "::Cliente CXP:: Sistema de bloqueio dos canais inuteis inicializado!";

[getPlayerUID player,player getVariable ["realname",name player]] remoteExec ["cxp_fnc_wantedProfUpdate",2];

cxp_hideoutBuildings = [];
{
    private _building = nearestBuilding getMarkerPos _x;
    cxp_hideoutBuildings pushBack _building;
    false
} count ["gang_area_1","gang_area_2","gang_area_3"];

// Aguarda a resposta dada pelo jogador(CIV/REB) ao clicar em concordar ou discordar
if (playerSide isEqualTo civilian) then {waitUntil {cxp_concordDiscord};};

waitUntil {vAH_loaded};
private _total = 0;
private _toDel = [];
private _uid = getPlayerUID player;

{
	if (((_x select 5) isEqualTo _uid) && ((_x select 7) isEqualTo 2)) then {_total = _total + (_x select 4);
	_toDel pushBack (_x select 0)};
} forEach all_ah_items;

if (_total > 0) then {
	{
		[1,_x] remoteExec ["CXPSV_fnc_vAHupdate",2];
	} forEach _toDel;
	[0,format[localize "STR_AH_LogInRec",[_total] call cxp_fnc_numberText]] call cxp_fnc_broadcast;
    [_total,1,"seuCuFilhoDaPuta"] call cxp_fnc_calcMoneyRemote;
};

// Carrega HUD do jogador pela primeira vez..
[] call cxp_fnc_hudSetup;

// Anti 'ESC e I juntos' -- Nao copie este procedure para sua missao, pois a missao do Tonic ja o possui seu tapado!
[] spawn {
    for "_i" from 0 to 1 step 0 do {
        waitUntil{(!isNull (findDisplay 49)) && (!isNull (findDisplay 602))}; // Checa para saber se o 'I' e o 'ESC' estao abertos
        (findDisplay 49) closeDisplay 2; // Fecha Menu 'ESC'
        (findDisplay 602) closeDisplay 2; // Fecha Menu 'I'
        hint "Pare de tentar abrir o menu ESC junto ao seu inventario!";
    };
};

// Remover cobras
[] spawn {
    for "_i" from 0 to 1 step 0 do {
        {if ((agent _x isKindOf "Snake_random_F")) then { deleteVehicle agent _x; };} forEach agents;
        sleep 2;
    };
};

/* Iniciar Modulos Cliente */
diag_log "::Cliente CXP:: Carregando Modulos CXP...";
private _arr = [];
switch (playerSide) do {
    case civilian : {
        _arr = [
            "cxp_fnc_initVirtualExtraInv",
            "cxp_fnc_initBounty",
            "cxp_fnc_initGangZoneModule"
        ];
    };
    case independent : {
        _arr = [
            "cxp_fnc_initVirtualExtraInv",
            "cxp_fnc_initSamuExtraFunc",
            "cxp_fnc_initDeadListClient"
        ];
    };
    case west : {
        _arr = [
            "cxp_fnc_initVirtualExtraInv"
        ];
    };
};
{[] call (call compile _x);} forEach _arr;
diag_log "::Cliente CXP:: Modulos CXP carregados com sucesso !";
/* ----------------------- */

/* CXP - MacaMed - Me envie um email caso queira comprar esse script e/ou outros... rafalzdev16@gmail.com */
[] spawn cxp_fnc_macaScript; // Esse script eh compativel com qualquer modo de jogo no arma 3!

diag_log "----------------------------------------------------------------------------------------------------";
diag_log format ["          Finalizado a inicializacao do Cliente CXP :: Tempo total de execucao %1 seg ",(diag_tickTime) - _timeStamp];
diag_log "----------------------------------------------------------------------------------------------------";
