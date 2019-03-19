#include "\life_server\script_macros.hpp"
/*
    File: fn_actionKeyHandler.sqf
    Author: Bryan "Tonic" Boardwine
    Modified : Casperento
    Description:
    Master action key handler, handles requests for picking up various items and
    interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/
private _curObject = cursorObject;
if (cxp_action_inUse) exitWith {}; //Action is in use, exit to prevent spamming.
if (cxp_interrupted) exitWith {cxp_interrupted = false;};
private _isWater = surfaceIsWater (visiblePositionASL player);

// Prevenção contra o cancer do Brasileiro
if (player getVariable "restrained") exitWith {hint "Você não pode mexer as mãos enquanto estiver algemado !"};
if (player getVariable "tied") exitWith {hint "Você não pode mexer as mãos enquanto estiver algemado !"};

if (playerSide isEqualTo west && {player getVariable ["isEscorting",false]}) exitWith {[] call cxp_fnc_playerInteractionMenu;};
if (playerSide isEqualTo independent && {player getVariable ["isEscorting",false]}) exitWith {[] call cxp_fnc_medInteractionMenu;};
if (playerSide isEqualTo civilian && {player getVariable ["isEscorting",false]} && (!(_curObject getVariable ["restrained",false]))) exitWith {[] call cxp_fnc_playerInteractionMenu;};

//Check if the player is near an ATM.
if ((call cxp_fnc_nearATM) && {!dialog}) exitWith {[] call cxp_fnc_atmMenu;};

if (isNull _curObject) exitWith {
    if (_isWater) then {
        private _fish = (nearestObjects[player,(CXP_SETTINGS(getArray,"animaltypes_fish")),3]) select 0;
        if !(isNil "_fish") then {
            if (!alive _fish) then {
                [_fish] call cxp_fnc_catchFish;
            };
        };
    } else {
        private _animal = (nearestObjects[player,(CXP_SETTINGS(getArray,"animaltypes_hunting")),3]) select 0;
        if !(isNil "_animal") then {
            if !(alive _animal) then {
                [_animal] call cxp_fnc_gutAnimal;
            } else {
				hint "Mate o animal para poder obter sua carne depois...";
			};
        } else {
            private "_handle";
            if (playerSide isEqualTo civilian && !cxp_action_gathering) then {
                private _whatIsIt = [] call cxp_fnc_whereAmI;
                if (cxp_action_gathering) exitWith {}; //Action is in use, exit to prevent spamming.
                switch (_whatIsIt) do {
                    case "mine" : { _handle = [] spawn cxp_fnc_mine };
                    default { _handle = [] spawn cxp_fnc_gather };
                };
                cxp_action_gathering = true;
                waitUntil {scriptDone _handle};
                cxp_action_gathering = false;
            };
        };
    };
};

if ((_curObject isKindOf "B_supplyCrate_F" || _curObject isKindOf "Box_IND_Grenades_F") && {player distance _curObject < 3} && !(_curObject getVariable ["caixaInfectada",false])) exitWith {
    if (alive _curObject) then {
        [_curObject] call cxp_fnc_containerMenu;
    };
};

private _vaultHouse = [[["Altis", "Land_Research_house_V1_F"], ["Tanoa", "Land_Medevac_house_V1_F"]]] call CXPSV_fnc_terrainSort;
private _altisArray = [16019.5,16952.9,0];
private _tanoaArray = [11074.2,11501.5,0.00137329];
private _pos = [[["Altis", _altisArray], ["Tanoa", _tanoaArray]]] call CXPSV_fnc_terrainSort;

if (_curObject isKindOf "House_F" && {player distance _curObject < 12} || ((nearestObject [_pos,"Land_Dome_Big_F"]) isEqualTo _curObject || (nearestObject [_pos,_vaultHouse]) isEqualTo _curObject)) exitWith {
    [_curObject] call cxp_fnc_houseMenu;
};

if (dialog) exitWith {}; //Don't bother when a dialog is open.
if !(isNull objectParent player) exitWith {}; //He's in a vehicle, cancel!
cxp_action_inUse = true;

//Temp fail safe.
[] spawn {
    sleep 60;
    cxp_action_inUse = false;
};

//Check if it's a dead body.
if (_curObject isKindOf "CAManBase" && {!alive _curObject}) exitWith {
    //Hotfix code by ins0
    if ((playerSide isEqualTo west && {(CXP_SETTINGS(getNumber,"revive_cops") isEqualTo 1)}) || {(playerSide isEqualTo civilian && {(CXP_SETTINGS(getNumber,"revive_civ") isEqualTo 1)})} || {(playerSide isEqualTo east && {(CXP_SETTINGS(getNumber,"revive_east") isEqualTo 1)})} || {playerSide isEqualTo independent}) then {
        if (cxp_inv_defibrillator > 0) then {
            [_curObject] call cxp_fnc_revivePlayer;
        };
    };
};

//If target is a player then check if we can use the cop menu.
if (isPlayer _curObject && _curObject isKindOf "CAManBase") then {
    if ((_curObject getVariable ["restrained",false]) && !dialog && playerSide isEqualTo west) then {
        [_curObject] call cxp_fnc_playerInteractionMenu;
    };

    if ((!(_curObject getVariable ["restrained",false]) || (_curObject getVariable ["restrained",false])) && !dialog && playerSide isEqualTo independent) then {
        [1,format["O bombeiro %1 está te examinando no momento e ele te dará uma resposta em instantes!",name player]] remoteExecCall ["cxp_fnc_broadcast",_curObject];
        [_curObject] call cxp_fnc_medInteractionMenu;
    };

    if ((!(_curObject getVariable ["restrained",false])) && !dialog && playerSide isEqualTo civilian) then {
        [_curObject] call cxp_fnc_playerInteractionMenu;
    };
} else {
    //OK, it wasn't a player so what is it?
    private _list = ["landVehicle","Ship","Air"];
    private _isVehicle = if (KINDOF_ARRAY(_curObject,_list)) then {true} else {false};
    private _miscItems = ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_Sleeping_bag_blue_folded_F"];

    //It's a vehicle! open the vehicle interaction key!
    if (_isVehicle) then {
        if (!dialog) then {
            if (player distance _curObject < ((boundingBox _curObject select 1) select 0)+2 && (!(player getVariable ["restrained",false])) && (!(player getVariable ["playerSurrender",false])) && !cxp_isknocked && !cxp_istazed && !cxp_isBorrachado) then {
                [_curObject] call cxp_fnc_vInteractionMenu;
            };
        };
    } else {
        //OK, it wasn't a vehicle so let's see what else it could be?
        if ((typeOf _curObject) in _miscItems) then {
            [_curObject,player,false] remoteExecCall ["cxp_fnc_pickupAction",RSERV];
        } else {
            //It wasn't a misc item so is it money?
            if ((typeOf _curObject) isEqualTo "Land_Money_F" && {!(_curObject getVariable ["inUse",false])}) then {
                [_curObject,player,true] remoteExecCall ["cxp_fnc_pickupAction",RSERV];
            };
        };
    };
};
