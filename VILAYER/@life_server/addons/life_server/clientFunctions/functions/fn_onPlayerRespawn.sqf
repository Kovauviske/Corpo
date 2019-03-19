#include "\life_server\script_macros.hpp"
/*
    File: fn_onPlayerRespawn.sqf
    Author: Bryan "Tonic" Boardwine
    Modified : Casperento
*/
private _unit = _this select 0;
private _corpse = _this select 1;

cxp_corpse = _corpse;
cxp_is_alive = false;

_unit setVariable ["PositionCorpse",getPos cxp_corpse,true];

// Objeto referencia do corpse
cxp_skull = "Land_HumanSkull_F" createVehicle getPos _unit;
cxp_skull setVehicleVarName "cxp_skull_var";
cxp_skull attachTo [_unit,[0,0,0],"Pelvis"];
_unit setVariable ["clienteSkull",cxp_skull,true];

//Set some vars on our new body.
_unit setVariable ["restrained",false,true];
_unit setVariable ["tied",nil,true];
_unit setVariable ["Escorting",false,true];
_unit setVariable ["transporting",false,true];
_unit setVariable ["escorted_by",[objNull,false],true];
_unit setVariable ["downed",false,true];
_unit setVariable ["playerSurrender",false,true];
_unit setVariable ["plPerdeuCabaco",false,true];
_unit setVariable ["podeArrombarCu",false,true];
_unit setVariable ["inDrink",false,true];
_unit setVariable ["drogado",false,true];
_unit setVariable ["steam64id",getPlayerUID player,true]; //Reset the UID.
_unit setVariable ["realname",profileName,true]; //Reset the players name.
_unit setVariable ["alvoTab",false,true];

player playMoveNow "AmovPpneMstpSrasWrflDnon";

[] call cxp_fnc_setupActions;
[_unit,cxp_settings_enableSidechannel,playerSide] remoteExecCall ["CXPSV_fnc_manageSC",RSERV];

if (playerSide isEqualTo civilian) then {[4] call CXPSKT_fnc_updatePartial;};
if (CXP_SETTINGS(getNumber,"enable_fatigue") isEqualTo 0) then {player enableFatigue false;};
