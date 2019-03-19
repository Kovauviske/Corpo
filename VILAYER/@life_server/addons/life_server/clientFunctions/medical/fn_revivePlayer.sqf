#include "\life_server\script_macros.hpp"
/*
    File: fn_revivePlayer.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Casperento
    Description:
    Starts the revive process on the player.
*/
private _target = param [0,objNull,[objNull]];
if (isNull _target) exitWith {};
private _reviveCost = CXP_SETTINGS(getNumber,"revive_fee");
private _revivable = _target getVariable ["Revive",false];
disableSerialization;

if (_revivable) exitWith {hint"Player invalido para ser revivido!"};
if (_target getVariable ["Reviving",objNull] == player) exitWith {hint localize "STR_Medic_AlreadyReviving";};
if (player distance _target > 5) exitWith {hint"Aproxime-se de seu paciente para socorre-lo!"}; //Not close enough.

//Fetch their name so we can shout it.
private _targetName = _target getVariable ["name","Unknown"];
private _title = format [localize "STR_Medic_Progress",_targetName];
cxp_action_inUse = true; //Lockout the controls.

_target setVariable ["Reviving",player,true];
//Setup our progress bar
// Som Revivendo
[player, "revivendo", 30, 1] remoteExec ["cxp_fnc_say3D",RANY];
"progressBar" cutRsc ["cxp_progress","PLAIN"];
private _ui = uiNamespace getVariable ["cxp_progress",displayNull];
private _progressBar = _ui displayCtrl 38201;
private _titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format ["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
private _cP = 0.01;

//Lets reuse the same thing!
for "_i" from 0 to 1 step 0 do {
    if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
        [player,"AinvPknlMstpSnonWnonDnon_medic_1"] remoteExecCall ["cxp_fnc_animSync",RCLIENT];
        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
    };

    uiSleep .15;
    _cP = _cP + .01;
    _progressBar progressSetPosition _cP;
    _titleText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_title];
    if (_cP >= 1 || !alive player) exitWith {};
    if (cxp_istazed) exitWith {}; //Tazed
    if (cxp_isBorrachado) exitWith {}; //Borrachado
    if (cxp_isknocked) exitWith {}; //Knocked
    if (cxp_interrupted) exitWith {};
    if ((player getVariable ["restrained",false]) || (player getVariable ["tied",false])) exitWith {};
    if (player distance _target > 4) exitWith {_badDistance = true;};
    if (_target getVariable ["Revive",false]) exitWith {};
    if (_target getVariable ["Reviving",objNull] != player) exitWith {};
	if !([(getPlayerUID (player getVariable "pacienteAtual"))] call cxp_fnc_isUIDActive) exitWith {systemChat "Seu paciente desconectou no meio do atendimento!";};
};

//Kill the UI display and check for various states
"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";

if (_target getVariable ["Reviving",objNull] != player) exitWith {hint localize "STR_Medic_AlreadyReviving"; cxp_action_inUse = false;};
_target setVariable ["Reviving",NIL,true];

if (!alive player || cxp_istazed || cxp_isBorrachado || cxp_isknocked) exitWith {cxp_action_inUse = false;};
if (_target getVariable ["Revive",false]) exitWith {hint localize "STR_Medic_RevivedRespawned"; cxp_action_inUse = false;};
if ((player getVariable ["restrained",false]) || (player getVariable ["tied",false])) exitWith {cxp_action_inUse = false;};
if (!isNil "_badDistance") exitWith {titleText[localize "STR_Medic_TooFar","PLAIN"]; cxp_action_inUse = false;};
if (cxp_interrupted) exitWith {cxp_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; cxp_action_inUse = false;};

cxp_action_inUse = false;
[profileName] remoteExecCall ["cxp_fnc_revived",_target];

if (playerSide isEqualTo independent) then {
    titleText[format [localize "STR_Medic_RevivePayReceive",_targetName,[_reviveCost] call cxp_fnc_numberText],"PLAIN"];
    BANK = BANK + _reviveCost;
    [1] call CXPSKT_fnc_updatePartial;
};

sleep .6;
player reveal _target;

// Finaliza atendimento quando tem apenas um paciente
if (count cxp_arrCorpsesPerto < 1 && !cxp_atndVarios) then {
    player setVariable["emAtendimento",false,true];
} else {
	// Anti-bug
	if (_target in cxp_arrCorpsesPerto) then {cxp_arrCorpsesPerto deleteAt (cxp_arrCorpsesPerto find _target);};
    if (count cxp_arrCorpsesPerto > 0 && cxp_atndVarios) then {hint "Você ainda possui clientes esperando para serem revividos por você...Ache-os na área marcada e complete seu chamado!";};
};
