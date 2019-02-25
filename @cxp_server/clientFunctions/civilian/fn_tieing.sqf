#include "\cxp_server\script_macros.hpp"
/*
    File: fn_tieing.sqf
    Based On: Bryan "Tonic" Boardwine
    Modified: Casperento
    Description:
	  Algema o alvo (script para civis/rebeldes)
*/
params [["_civ", Objnull, [Objnull]]];
if(isNull _civ) exitWith {};

[] spawn {
    private "_time";
    for "_i" from 0 to 1 step 0 do {
        _time = time;
        waitUntil {uiSleep 1; (!(player getVariable ["tied", false]) || (time - _time) > (5 * 60))};

        if !(player getVariable ["tied", false]) exitWith {};
        if (!([west,getPos player,30] call cxp_fnc_nearUnits) && (player getVariable["tied", false]) && isNull objectParent player) exitWith {
            player setVariable ["restrained", nil, true];
            player setVariable ["Escorting", nil, true];
            player setVariable ["transporting", nil, true];
            player setVariable ["tied", nil, true];
            player setVariable ["gagged",false,true];
            detach player;
            hintSilent "Voce conseguiu se livrar das algemas."
        };
    };
};

hint format ["O jogador %1 lhe algemou.",name _civ];

cxp_disable_getIn = true;
cxp_disable_getOut = false;

if((player getVariable["playerSurrender", false])) then { player setVariable ["playerSurrender",false,true]; };
player switchMove "";

if(isNull objectParent player) then {
    player playMove "AmovPercMstpSnonWnonDnon_Ease";
};

[] spawn {
    private _vehicle = vehicle player;
    while {player getVariable ["tied", false]} do {

        if (isNull objectParent player) then {
            player playMove "AmovPercMstpSnonWnonDnon_Ease";
        };

        _state = vehicle player;
        waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getvariable ["tied", false]) || vehicle player != _state};

        if !(alive player) exitWith {
            player setVariable ["restrained", nil, true];
            player setVariable ["Escorting", nil, true];
            player setVariable ["transporting", nil, true];
            player setVariable ["tied", nil, true];
            player setVariable ["gagged",false,true];
            detach player;
        };

        if (!(isNull objectParent player) && cxp_disable_getIn) then {
            player action["eject",vehicle player];
        };

        if (!(isNull objectParent player) && !(vehicle player isEqualTo _vehicle)) then {
            _vehicle = vehicle player;
        };

        if (isNull objectParent player && cxp_disable_getOut) then {
            player moveInCargo _vehicle;
        };

        if (!(isNull objectParent player) && cxp_disable_getOut && (driver (vehicle player) isEqualTo player)) then {
            player action["eject",vehicle player];
            player moveInCargo _vehicle;
        };

        if (!(isNull objectParent player) && cxp_disable_getOut) then {
            _turrets = [[-1]] + allTurrets _vehicle;
            {
                if (_vehicle turretUnit [_x select 0] isEqualTo player) then {
                    player action["eject",vehicle player];
                    sleep 1;
                    player moveInCargo _vehicle;
                };
            } forEach _turrets;
        };
    };

    if(alive player) then {
        player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
        player setVariable ["restrained", nil, true];
        player setVariable ["Escorting", nil, true];
        player setVariable ["transporting", nil, true];
        player setVariable ["tied",nil , true];
        player setVariable ["gagged",false,true];
        detach player;
    };
};