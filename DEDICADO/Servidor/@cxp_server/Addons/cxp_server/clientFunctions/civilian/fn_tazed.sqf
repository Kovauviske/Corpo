#include "\cxp_server\script_macros.hpp"
/*
    File: fn_tazed.sqf
    Author: Bryan "Tonic" Boardwine
    Editor: Repentz to improve the function

    Description:
    Starts the tazed animation and broadcasts out what it needs to.
*/
private["_unit","_shooter","_curWep","_curMags","_attach"];
_unit = param [0,Objnull,[Objnull]];
_shooter = param [1,Objnull,[Objnull]];
if(isNull _unit OR isNull _shooter) exitWith {player allowDamage true; cxp_istazed = false;};
if(player getVariable["restrained",false]) exitWith {};
_time = time;
if(_shooter isKindOf "CAManBase" && alive player) then {
    if(!cxp_istazed) then {
        cxp_istazed = true;
        "DynamicBlur" ppEffectEnable true;
        "DynamicBlur" ppEffectAdjust [20];
        "DynamicBlur" ppEffectCommit 1;
        player allowDamage false;
        if(isNull objectParent player) then {for [{_x=1},{_x<=10},{_x=_x+1}] do { call CXPSKT_fnc_tazeRagdoll; sleep 0.1; if(animationState player isEqualTo "unconscious") exitWith{}};};
		//[_unit, "tazersound", 50, 1] remoteExec ["cxp_fnc_say3D",RANY];
        [_unit,"aiaiiaiaia",50] remoteExec ["cxp_fnc_say3D",RANY];
        [0,"STR_NOTF_Tazed",true,[profileName, _shooter getVariable["realname",name _shooter]]] remoteExecCall ["cxp_fnc_broadcast",-2];
        disableUserInput true;
        // player setDamage 0;
        waitUntil{animationState player != "unconscious"};
        _anim = if(isNull objectParent player) then {"Incapacitated"} else {"kia_driver_mid01"};
        [player,_anim] remoteExec ["cxp_fnc_animSync",0];
        waitUntil{time - _time >= 15};
        player allowDamage true;
        if(!(player getVariable["Escorting",false])) then {
            detach player;
        };
        "DynamicBlur" ppEffectEnable false;
        cxp_istazed = false;
        disableUserInput false;
        player playMoveNow "amovppnemstpsraswrfldnon";
		// player setFatigue 1; //no running for you
		// player setdamage 0.6; //especially no running for you
    };
} else {
    _unit allowDamage true;
    cxp_iztazed = false;
};
