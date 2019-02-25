#include "\cxp_server\script_macros.hpp"
/*
    File: fn_onPlayerKilled.sqf
    Author: Bryan "Tonic" Boardwine

    Modified : Casperento

    Description:
    When the player dies collect various information about that player
    and pull up the death dialog / camera functionality.
*/
params [
    ["_unit",objNull,[objNull]],
    ["_killer",objNull,[objNull]]
];
disableSerialization;

if !((vehicle _unit) isEqualTo _unit) then {
    UnAssignVehicle _unit;
    _unit action ["getOut", vehicle _unit];
    _unit setPosATL [(getPosATL _unit select 0) + 3, (getPosATL _unit select 1) + 1, 0];
};

//Set some vars
_unit setVariable ["Revive",false,true];
_unit setVariable ["name",profileName,true]; //Set my name so they can say my name.
_unit setVariable ["restrained",false,true];
_unit setVariable ["tied",nil,true];
_unit setVariable ["gagged",false,true];
_unit setVariable ["blindfolded",nil,true];
_unit setVariable ["Escorting",false,true];
_unit setVariable ["transporting",false,true];
_unit setVariable ["escorted_by",[objNull,false],true];
_unit setVariable ["downed",false,true];
_unit setVariable ["playerSurrender",false,true];
_unit setVariable ["plPerdeuCabaco",false,true];
_unit setVariable ["podeArrombarCu",false,true];
_unit setVariable ["inDrink",false,true];
_unit setVariable ["drogado",false,true];
_unit setVariable ["steam64id",(getPlayerUID player),true]; //Set the UID.
_unit setVariable ["alvoTab",false,true];

// close the esc dialog
if (dialog) then {closeDialog 0;};

//Setup our camera view
cxp_deathCamera = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder false;
cxp_deathCamera cameraEffect ["Internal","Back"];
createDialog "cxp_death_screen";
cxp_deathCamera camSetTarget _unit;
cxp_deathCamera camSetRelPos [0,3.5,4.5];
cxp_deathCamera camSetFOV .5;
cxp_deathCamera camSetFocus [50,0];
cxp_deathCamera camCommit 0;

(findDisplay 7300) displaySetEventHandler ["KeyDown","if ((_this select 1) isEqualTo 1) then {true}"]; //Block the ESC menu

// Inicia funcoes dos componentes da tela de morte
[] spawn cxp_fnc_telaDeMorte;

//Create a thread to follow with some what precision view of the corpse.
[_unit] spawn {
    private _unit = _this select 0;
    waitUntil {if (speed _unit isEqualTo 0) exitWith {true}; cxp_deathCamera camSetTarget _unit; cxp_deathCamera camSetRelPos [0,3.5,4.5]; cxp_deathCamera camCommit 0;};
};

// Prepara para lista de mortos dos medicos
_unit setVariable ["PositionCorpse",getPos _unit,true];

// Objeto referencia do corpse
cxp_skull = "Land_HumanSkull_F" createVehicle getPos _unit;
cxp_skull setVehicleVarName "cxp_skull_var";
cxp_skull attachTo [_unit,[0,0,0],"Pelvis"];
_unit setVariable ["clienteSkull",cxp_skull,true];

if ((!(isNull _killer) && !(_killer isEqualTo _unit) && _killer isKindOf "CAManBase") || side _killer isEqualTo east ) then {_unit setVariable ["causaMorte",2,true];};

// Consequencias por ter matado alguem
if (!isNull _killer && {!(_killer isEqualTo _unit)} && {!(side _killer in [west,independent])} && {alive _killer}) then {
    if !(vehicle _killer isKindOf "LandVehicle") then {

        // rebelde matar civil sem licenca rebelde leva pau, ou nao ;)
        if (playerSide isEqualTo civilian) then {
            private _priceMultaAuto = CXP_SETTINGS(getNumber,"price_reb_matar_civil");
            if (_priceMultaAuto < 0) exitWith {diag_log "Sistema de multa para rebelde que mata civil sem licença rebelde foi desligado!";};
            if !(LICENSE_VALUE("rebellic","civ")) then {
                [_priceMultaAuto] remoteExec ["cxp_fnc_calcMoneyRemote",_killer];
                [2,format["Voce recebeu uma multa de R$%1 por ter matado um civil. Covarde !",_priceMultaAuto]] remoteExecCall ["cxp_fnc_broadcast",_killer];
            } else {
                [2,format["Você deu sorte que seu alvo tinha licença rebelde!\nDo contrário você teria pago R$%1 de multa para o servidor!",_priceMultaAuto]] remoteExecCall ["cxp_fnc_broadcast",_killer];
            };
        };

        // add 'killer'(rebelde) na lista de procurados
        if !(_killer getVariable ["clienteBounty",false]) then {
            // Retira alvo recompensa da lista de bountys
            if (_killer getVariable ["alvo_recompensa",false] && player getVariable ["clienteBounty",false]) then {
                _killer setVariable ["alvo_recompensa",false,false];
                [[[getPlayerUID _killer]],"rm",(side _killer)] remoteExecCall ["cxp_fnc_checarGlobal",RSERV];
                [(name _killer)] spawn cxp_fnc_removeLocalBounty;
                [0,format["%1 morreu para seu alvo-recompensa, que otario...",profileName]] remoteExecCall ["cxp_fnc_broadcast",RANY];
            };
            if (cxp_CXPHC_isActive) then {
                [getPlayerUID _killer,_killer getVariable ["realname",name _killer],"187"] remoteExecCall ["CXPHC_fnc_wantedAdd",CXP_HC];
            } else {
                [getPlayerUID _killer,_killer getVariable ["realname",name _killer],"187"] remoteExecCall ["cxp_fnc_wantedAdd",RSERV];
            };
        } else {
            // checa se o player era o alvo do bounty hunter
            if (player getVariable ["alvo_recompensa",false] && _killer getVariable ["clienteBounty",false]) then {
                [player] remoteExecCall ["cxp_fnc_alvoKilled",_killer];
            };
            // Matou companheiro de guerra (COP ou outro BH)
            if ((player getVariable ["clienteBounty",false] || playerSide isEqualTo west) && _killer getVariable ["clienteBounty",false]) then {
                [profileName,player] remoteExecCall ["cxp_fnc_removerBountyLic",_killer];
                if (cxp_CXPHC_isActive) then {
                    [getPlayerUID _killer,_killer getVariable ["realname",name _killer],"187"] remoteExecCall ["CXPHC_fnc_wantedAdd",CXP_HC];
                } else {
                    [getPlayerUID _killer,_killer getVariable ["realname",name _killer],"187"] remoteExecCall ["cxp_fnc_wantedAdd",RSERV];
                };
                systemChat "Seu assassino e traidor da lei perdeu a licenca de Bounty Hunter, e ainda foi mandado para a lista de procurados!";
            };
        };

        // remove licencas de armas...
        if !(local _killer) then {[3] remoteExecCall ["cxp_fnc_removeLicenses",_killer];};
    };
};

cxp_save_gear = [player] call cxp_fnc_fetchDeadGear;
["e"] call cxp_fnc_limparInvPlayer;
// --> testar possivel fix pro dupe do chesssus dps ... ["e"] remoteExecCall ["cxp_fnc_limparInvPlayer",_unit];

//Killed by cop stuff...
if (side _killer in [west,civilian] && !(playerSide in [west,civilian])) then {
    cxp_copRecieve = _killer;
    //Did I rob the federal reserve?
    if (!cxp_use_atm && {CASH > 0}) then {
        [format [localize "STR_Cop_RobberDead",[CASH] call cxp_fnc_numberText]] remoteExecCall ["cxp_fnc_broadcast",RCLIENT];
        CASH = 0;
    };
};

if (!isNull _killer and {_killer != _unit}) then {
    cxp_removeWanted = true;
};

// Se o player for DOADOR menor que +4, seus itens caem no chao
if (FETCH_CONST(cxp_donorLevel) < 4) then {
    [_unit] call cxp_fnc_dropItems;
    CASH = 0;
};

[true] call cxp_fnc_hudUpdate;

cxp_hunger = 100;
cxp_thirst = 100;
cxp_drink = 0;
cxp_cigar_uses = 0;
cxp_carryWeight = 0;
cxp_action_inUse = false;
cxp_is_alive = false;

[player,cxp_settings_enableSidechannel,playerSide] remoteExecCall ["CXPSV_fnc_manageSC",RSERV];

[0] call CXPSKT_fnc_updatePartial;
[3] call CXPSKT_fnc_updatePartial;
if (playerSide isEqualTo civilian) then {[4] call CXPSKT_fnc_updatePartial;};
