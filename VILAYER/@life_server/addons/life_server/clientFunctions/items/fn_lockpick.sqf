#include "\life_server\script_macros.hpp"
/*
    File: fn_lockpick.sqf
    Author: Bryan "Tonic" Boardwine

    Modified: Casperento

    Description:
    Main functionality for lock-picking.
*/
params [["_n","",[""]]];
if !(_n in ["lockpick","lockpick_cop"]) exitWith {};
private _curTarget = cursorObject;

cxp_interrupted = false;
if (cxp_action_inUse) exitWith {};
if (isNull _curTarget) exitWith {}; //Bad type
private _distance = ((boundingBox _curTarget select 1) select 0) + 2;
if (player distance _curTarget > _distance) exitWith {}; //Too far

private _isVehicle = if ((_curTarget isKindOf "LandVehicle") || (_curTarget isKindOf "Ship") || (_curTarget isKindOf "Air")) then {true} else {false};
if (_isVehicle && _curTarget in cxp_vehicles) exitWith {hint localize "STR_ISTR_Lock_AlreadyHave"};

//More error checks
if (!_isVehicle && !isPlayer _curTarget) exitWith {};
if (!_isVehicle && !(_curTarget getVariable ["restrained",false])) exitWith {};
if (!_isVehicle && !(_curTarget getVariable ["tied",false])) exitWith {};
if (_curTarget getVariable "NPC") exitWith {hint localize "STR_NPC_Protected"};

private _title = format [localize "STR_ISTR_Lock_Process",if (!_isVehicle) then {"Handcuffs"} else {getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")}];
cxp_action_inUse = true; //Lock out other actions

//Setup the progress bar
disableSerialization;
"progressBar" cutRsc ["cxp_progress","PLAIN"];
private _ui = uiNamespace getVariable "cxp_progress";
private _progressBar = _ui displayCtrl 38201;
private _titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format ["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
private _cP = 0.01;

private _badDistance = false;
for "_i" from 0 to 1 step 0 do {
    if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
        [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["cxp_fnc_animSync",RCLIENT];
        player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
    };

    uiSleep 0.26;

    if (isNull _ui) then {
        "progressBar" cutRsc ["cxp_progress","PLAIN"];
        _ui = uiNamespace getVariable "cxp_progress";
        _progressBar = _ui displayCtrl 38201;
        _titleText = _ui displayCtrl 38202;
    };
	_cP = _cP + 0.01;
    _progressBar progressSetPosition _cP;
    _titleText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_title];

    if (_cP >= 1 || !alive player) exitWith {};
    if (cxp_istazed) exitWith {}; //Tazed
    if (cxp_isBorrachado) exitWith {}; // Borrachado
    if (cxp_isknocked) exitWith {}; //Knocked
    if (cxp_interrupted) exitWith {};
    if (player getVariable ["restrained",false]) exitWith {};
    if (player getVariable ["tied",false]) exitWith {};
    if (player distance _curTarget > _distance) exitWith {_badDistance = true;};
};

//Kill the UI display and check for various states
"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";

if (!alive player || cxp_istazed || cxp_isBorrachado || cxp_isknocked) exitWith {cxp_action_inUse = false;};
if (player getVariable ["restrained",false]) exitWith {cxp_action_inUse = false;};
if (player getVariable ["tied",false]) exitWith {cxp_action_inUse = false;};
if (_badDistance) exitWith {titleText[localize "STR_ISTR_Lock_TooFar","PLAIN"]; cxp_action_inUse = false;};
if (cxp_interrupted) exitWith {cxp_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; cxp_action_inUse = false;};
if (!([false,_n,1] call cxp_fnc_handleInv)) exitWith {cxp_action_inUse = false;};

cxp_action_inUse = false;

if !(_isVehicle) then {
    _curTarget setVariable ["restrained",false,true];
    _curTarget setVariable ["tied",false,true];
    _curTarget setVariable ["Escorting",false,true];
    _curTarget setVariable ["transporting",false,true];
} else {
    if (playerSide isEqualTo civilian && _n isEqualTo "lockpick") then {
        private _dice = random(100);
        if (_dice < 30) then {
            cxp_vehicles pushBack _curTarget;
            [player, "alarm", 200, 1] remoteExec ["cxp_fnc_say3D",RANY];
            if !(player getVariable ["clienteBounty",false]) then {
                if (cxp_CXPHC_isActive) then {
                    [getPlayerUID player,profileName,"487"] remoteExecCall ["CXPHC_fnc_wantedAdd",CXP_HC];
                } else {
                    [getPlayerUID player,profileName,"487"] remoteExecCall ["cxp_fnc_wantedAdd",RSERV];
                };
            };
            titleText[localize "STR_ISTR_Lock_Success","PLAIN"];
        } else {
            if !(player getVariable ["clienteBounty",false]) then {
                if (cxp_CXPHC_isActive) then {
                    [getPlayerUID player,profileName,"215"] remoteExecCall ["CXPHC_fnc_wantedAdd",CXP_HC];
                } else {
                    [getPlayerUID player,profileName,"215"] remoteExecCall ["cxp_fnc_wantedAdd",RSERV];
                };
                [0,"STR_ISTR_Lock_FailedNOTF",true,[profileName]] remoteExecCall ["cxp_fnc_broadcast",west];
            };
            titleText[localize "STR_ISTR_Lock_Failed","PLAIN"];
        };
    } else {
        if (playerSide != west) exitWith {hint "Voce nao esta autorizado a usar este item da policia!"};
        cxp_vehicles pushBack _curTarget;
        [player, "alarm", 200, 1] remoteExec ["cxp_fnc_say3D",RANY];
        titleText[localize "STR_ISTR_Lock_Success","PLAIN"];
    };
};
