#include "\life_server\script_macros.hpp"
/*
    File: fn_hudUpdate.sqf
    Author: Casperento

    Description:
    Atualiza o HUD do jogador
*/
private _attInfo = param [0,false,[false]];
private _infoPri = param [1,true,[true]];

disableSerialization;

if (isNull CXP_Display) exitWith {[] call cxp_fnc_hudSetup;};
if (isNil "cxp_thirst") exitWith {cxp_thirst=100;[] call cxp_fnc_hudUpdate;};
if (isNil "cxp_hunger") exitWith {cxp_hunger=100;[] call cxp_fnc_hudUpdate;};
if (isNil "cxp_drink") exitWith {cxp_drink=0;[] call cxp_fnc_hudUpdate;};

if (_attInfo) exitWith {[] call cxp_fnc_hudUpdateInfo;}; // atualiza unicamente

CXP_Ctrl(6969) progressSetPosition (cxp_hunger / 100);
CXP_Ctrl(6968) progressSetPosition (1 - (damage player));
CXP_Ctrl(6970) progressSetPosition (cxp_thirst / 100);
CXP_Ctrl(6971) progressSetPosition (cxp_drink);

// Montando barrinha de info pela primeira vez
if (_infoPri) exitWith {cxp_hudInfo_init = false;[] call cxp_fnc_hudUpdateInfo;};