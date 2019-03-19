#include "\life_server\script_macros.hpp"
/*
    File: fn_updatePartial.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Casperento
    Description:
    Sends specific information to the server to update on the player,
    meant to keep the network traffic down with large sums of data flowing
    through remoteExec
*/
private _mode = param [0,0,[0]];
private _packet = [getPlayerUID player,playerSide,nil,_mode];
private _array = [];
private _flag = switch (playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"};};

switch (_mode) do {
    case 0: {
        _packet set[2,CASH];
    };

    case 1: {
        _packet set[2,BANK];
    };

    case 2: {
        {
            private _varName = LICENSE_VARNAME(configName _x,_flag);
            _array pushBack [_varName,LICENSE_VALUE(configName _x,_flag)];
        } forEach (format ["getText(_x >> 'side') isEqualTo '%1'",_flag] configClasses (missionConfigFile >> "Licenses"));

        _packet set[2,_array];
    };

    case 3: {
        [] call cxp_fnc_saveGear;
        _packet set[2,cxp_gear];
    };

    case 4: {
        _packet set[2,cxp_is_alive];
        if (cxp_is_alive) then {
            _packet set[4,(getPosATL player)];
        } else {
            _packet set[4,[1,1,1]];
        };
    };

    case 5: {
        _packet set[2,cxp_is_arrested];
    };

    case 6: {
        _packet set[2,CASH];
        _packet set[4,BANK];
    };

    case 7: {}; // Tonic key management system

    // DonorLevel -> By Casperento
    case 8: {
        _packet set[2,FETCH_CONST(cxp_donorlevel)];
    };

};

if (cxp_CXPHC_isActive) then {
    _packet remoteExecCall ["CXPHC_fnc_updatePartial",CXP_HC];
} else {
    _packet remoteExecCall ["CXPDB_fnc_updatePartial",RSERV];
};
