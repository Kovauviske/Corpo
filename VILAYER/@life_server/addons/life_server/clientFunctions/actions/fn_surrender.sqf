#include "\life_server\script_macros.hpp"
/*
    File: fn_surrender.sqf
    Author: ?
    Modified: Casperento
    Description:
    Causes player to put their hands on their head.
*/
if (player getVariable ["downed",false]) exitWith {};
if ((player getVariable ["restrained",false]) || (player getVariable ["tied",false])) exitWith {};
if (player getVariable ["Escorting",false]) exitWith {};
if (vehicle player != player) exitWith {};
if (speed player > 1) exitWith {};

if (player getVariable ["playerSurrender",false]) then {
    player setVariable ["playerSurrender",false,true];
} else {
    player setVariable ["playerSurrender",true,true];
};

while {player getVariable ["playerSurrender",false]} do {
    player playMove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
    if (!alive player || !(isNull objectParent player)) then { player setVariable ["playerSurrender",false,true]; };
};

player playMoveNow "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon";
