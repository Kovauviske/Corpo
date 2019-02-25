#include "\cxp_server\script_macros.hpp"
/*
    File: fn_updateRequest.sqf
    Author: Tonic
	Modified : Casperento
    Description:
    Passes ALL player information to the server to save player data to the database.
*/
private _packet = [getPlayerUID player,(profileName),playerSide,CASH,BANK];
private _array = [];
private _alive = alive player;
private _position = getPosATL player;
private _flag = switch (playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"};};

{
    // Syntax ["nomedalicenca",int] , em que 'int' >> 0: não possui, 1: possui a licenca
    _array pushBack [LICENSE_VARNAME(configName _x,_flag),LICENSE_VALUE(configName _x,_flag)];
} forEach (format ["getText(_x >> 'side') isEqualTo '%1'",_flag] configClasses (missionConfigFile >> "Licenses"));

_packet pushBack _array;

[] call cxp_fnc_saveGear;
_packet pushBack cxp_gear;

_array = [];
_array pushBack cxp_hunger;
_array pushBack cxp_thirst;
_array pushBack (damage player);
_array pushBack cxp_drink;
_packet pushBack _array;

switch (playerSide) do {
    case civilian: {
        _packet pushBack cxp_is_arrested;
        _packet pushBack _alive;
        _packet pushBack _position;
    };
};

if (cxp_CXPHC_isActive) then {
    _packet remoteExecCall ["CXPHC_fnc_updateRequest",CXP_HC];
} else {
    _packet remoteExecCall ["CXPDB_fnc_updateRequest",RSERV];
};

private _messages = player getVariable "cellphone_messages";
[getPlayerUid player,_messages] remoteExecCall ["CXPDB_fnc_saveCellPhone",RSERV];