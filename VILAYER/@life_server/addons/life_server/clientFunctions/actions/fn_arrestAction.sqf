#include "\life_server\script_macros.hpp"
/*
    File: fn_arrestAction.sqf
    Author: ?
    Modified: Casperento

    Description:
    Arrests the targeted person.
*/
params [
  ["_unit",objNull,[objNull]]
];

if !(_unit isKindOf "CAManBase") exitWith {}; //Not a unit
if !(isPlayer _unit) exitWith {}; //Not a human
if (side _unit != civilian) exitWith {};
if (playerSide isEqualTo west && !(_unit getVariable "restrained")) exitWith {hint "O alvo deve estar algemado para ser enviado a cadeia!"};
if (playerSide isEqualTo civilian && !(_unit getVariable "tied")) exitWith {hint "O alvo deve estar algemado para ser enviado a cadeia!"};
if (playerSide isEqualTo civilian && (count cxp_bounty_contract) < 1) exitWith {hint "Você não possui uma tarefa de Bounty Hunter no momento."};
if (playerSide isEqualTo civilian && !((getPlayerUID _unit) in cxp_bounty_uid)) exitWith {hint "Você não pode prender este individuo pois ele não é seu alvo-recompensas no momento..."};

_unit setVariable ["arrester",player,true];

if (playerSide isEqualTo civilian) then {	
	private _result = false;
	if (count ([units group player, {player distance _x < 100 && _x != player && _x getVariable ["clienteBounty",false]}] call BIS_fnc_conditionalSelect) > 0) then {
		_result = ["Vimos que você tem (um) amigo(s) contigo. Gostaria de compartilhar a recompensa com ele(s) ?", "Bounty Hunter", "Sim!", "Não!"] call BIS_fnc_guiMessage;
	};

    [(name _unit)] spawn cxp_fnc_removeLocalBounty; //remove alvo da 'lista negra' do BountyHunter
    [getPlayerUID _unit,_unit,player,false,_result] remoteExecCall ["cxp_fnc_wantedBountyCiv",RSERV];
} else {
    if (cxp_CXPHC_isActive) then {
        [getPlayerUID _unit,_unit,player,false] remoteExecCall ["CXPHC_fnc_wantedBounty",CXP_HC];
    } else {
        [getPlayerUID _unit,_unit,player,false] remoteExecCall ["cxp_fnc_wantedBounty",RSERV];
    };
};

detach _unit;
[_unit,false] remoteExecCall ["cxp_fnc_jail",_unit];
[0,"STR_NOTF_Arrested_1",true, [_unit getVariable ["realname",name _unit], profileName]] remoteExecCall ["cxp_fnc_broadcast",RCLIENT];

if (CXP_SETTINGS(getNumber,"player_advancedLog") isEqualTo 1) then {
    if (CXP_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        advanced_log = format [localize "STR_DL_AL_Arrested_BEF",_unit getVariable ["realname",name _unit]];
    } else {
        advanced_log = format [localize "STR_DL_AL_Arrested",profileName,(getPlayerUID player),_unit getVariable ["realname",name _unit]];
    };
    publicVariableServer "advanced_log";
};
