/*
    File: fn_pullOutVeh.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
*/
if (isNull objectParent player) exitWith {};
if (player getVariable "restrained") then {
    detach player;
    player setVariable ["Escorting",false,true];
    player setVariable ["transporting",false,true];
};
cxp_disable_getOut = false;
player action ["Eject", vehicle player];
titleText[localize "STR_NOTF_PulledOut","PLAIN"];
titleFadeOut 4;
cxp_disable_getIn = true;
if (player getVariable ["downed",false]) then {player setUnconscious true;player setVelocity [0,0,0];};