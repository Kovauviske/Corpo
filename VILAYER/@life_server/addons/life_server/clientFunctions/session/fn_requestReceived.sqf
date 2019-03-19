#include "\life_server\script_macros.hpp"
/*
    File: fn_requestReceived.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Casperento
    Description:
    Called by the server saying that we have a response so let's
    sort through the information, validate it and if all valid
    set the client up.
*/
private _count = count _this;
if (CXP_SETTINGS(getNumber,"log_request_client") isEqualTo 1) then {diag_log format["query no request do cliente : %1 ; quantidade: %2",_this,_count];};
cxp_session_tries = cxp_session_tries + 1;
if (cxp_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if (cxp_session_tries > 3) exitWith {cutText["","BLACK FADED"];diag_log format[(localize "STR_Session_Error")];0 cutFadeOut 999999999;};

0 cutText ["","BLACK FADED"];
diag_log format[(localize "STR_Session_Received")];
0 cutFadeOut 9999999;

//Error handling and junk..
if (isNil "_this") exitWith {[] call CXPSKT_fnc_insertPlayerInfo;};
if (_this isEqualType "") exitWith {[] call CXPSKT_fnc_insertPlayerInfo;};
if (count _this isEqualTo 0) exitWith {[] call CXPSKT_fnc_insertPlayerInfo;};
if ((_this select 0) isEqualTo "Error") exitWith {[] call CXPSKT_fnc_insertPlayerInfo;};
if !(getPlayerUID player isEqualTo (_this select 0)) exitWith {[] call CXPSKT_fnc_dataQuery;};

//Parse basic player information.
CASH = parseNumber (_this select 2);
BANK = parseNumber (_this select 3);

// Donates - Players
cxp_playerExtraDom = false;
if (playerSide isEqualTo civilian) then {cxp_playerExtraDom = switch (_this select 14) do {case 0:{false};case 1:{true};};};
[(_this select 4),(getPlayerUID player),profileName] call cxp_fnc_initGbSysDonClient;

// Donates - Bases
CONST(cxp_gdonorlevel,(_this select 12));

//Loop through licenses
if (count (_this select 5) > 0) then {
    {missionNamespace setVariable [(_x select 0),(_x select 1)];} forEach (_this select 5);
};

//Parse side specific information.
switch (playerSide) do {
    case west: {
        CONST(cxp_coplevel,(_this select 6));
        CONST(cxp_medicLevel,0);
        cxp_blacklisted = _this select 8;
        if (CXP_SETTINGS(getNumber,"save_playerStats") isEqualTo 1) then {
            cxp_hunger = ((_this select 9) select 0);
            cxp_thirst = ((_this select 9) select 1);
            player setDamage ((_this select 9) select 2);
        };
    };

    case civilian: {
        cxp_is_arrested = _this select 6;
        CONST(cxp_coplevel, 0);
        CONST(cxp_medicLevel, 0);
        cxp_houses = _this select (_count - 3);
        cxp_blacklisted = _this select 13;
        if (CXP_SETTINGS(getNumber,"log_blacklisted_var") isEqualTo 1) then {diag_log format["Log do cxp_blacklisted CIV >>> %1",cxp_blacklisted];};
        if (CXP_SETTINGS(getNumber,"save_playerStats") isEqualTo 1) then {
            cxp_hunger = ((_this select 8) select 0);
            cxp_thirst = ((_this select 8) select 1);
            player setDamage ((_this select 8) select 2);
            cxp_drink  = ((_this select 8) select 3);
        };

        //Position
        //BugFix para nao deixar player que sair do servidor na ilha de spawn voltar e dar respawn
        cxp_is_alive = switch ((_this select 9)) do {case 0:{false};case 1:{true};};
        cxp_civ_position = _this select 10;
        if (cxp_civ_position isEqualTo [1,1,1]) then {cxp_is_alive = false;};
        if (!(count cxp_civ_position isEqualTo 3) || (cxp_civ_position isEqualTo [0,0,0])) then {
            diag_log format ["[requestReceived] Bad position received. Data: %1",cxp_civ_position];
            cxp_is_alive = false;
        };

        {
            _house = nearestObject [(call compile format ["%1",(_x select 0)]), "House"];
            cxp_vehicles pushBack _house;
        } forEach cxp_houses;

        cxp_gangData = _this select (_count - 2);
        if !(count cxp_gangData isEqualTo 0) then {[] spawn cxp_fnc_initGang;};
        [] spawn cxp_fnc_initHouses;
    };

    case independent: {
        cxp_blacklisted = _this select 10;
        if (CXP_SETTINGS(getNumber,"log_blacklisted_var") isEqualTo 1) then {
            diag_log format["Log do cxp_blacklisted MED >>> %1",cxp_blacklisted];
        };
        CONST(cxp_medicLevel,(_this select 6));
        CONST(cxp_coplevel,0);
        if (CXP_SETTINGS(getNumber,"save_playerStats") isEqualTo 1) then {
            cxp_hunger = ((_this select 8) select 0);
            cxp_thirst = ((_this select 8) select 1);
            player setDamage ((_this select 8) select 2);
        };
    };
};

cxp_gear = _this select 7;
[true] call cxp_fnc_loadGear;

if (count (_this select (_count - 1)) > 0) then {
    {cxp_vehicles pushBack _x;} forEach (_this select (_count - 1));
};

cxp_session_completed = true;
