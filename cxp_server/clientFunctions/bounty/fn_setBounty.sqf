#include "\cxp_server\script_macros.hpp"
/*
	File: fn_setBounty.sqf
	Author: John "Paratus" VanderZwet
	Modified: Casperento
	Description:
	Sets the provided wanted entry as active bounty.
*/
params [
	["_bounty",[],[[]]]
];

if (CXP_SETTINGS(getNumber,"log_bounty_atual") isEqualTo 1) then {diag_log format["Array _bounty atual: %1",str(_bounty)];};

if !(license_civ_bHunterLic) exitWith {cxp_bounty_contract = [];cxp_bounty_uid = [];};
if (count _bounty < 1) exitWith {hint "Não há alvos-recompensas disponíveis no momento, por favor volte mais tarde...";};

cxp_transact_bounty = true;
["BountyNotify",[format["Você foi contratado para capturar o jogador '%1'.",((_bounty select 0) select 1)]]] call BIS_fnc_showNotification;
systemChat format["Seu alvo-recompensa é o jogador '%1' que possui uma recompensa de R$%2 no momento.",((_bounty select 0) select 1),[((_bounty select 0) select 2)] call cxp_fnc_numberText];

cxp_bounty_contract pushBack (_bounty select 0); // array bounty
cxp_bounty_uid pushBack ((_bounty select 0) select 0);

private _alvoPl = objNull;
{
	if (getPlayerUID _x isEqualTo ((_bounty select 0) select 0)) then {_alvoPl = _x;};
} forEach allPlayers;

if (isNull _alvoPl) exitWith {hint"Erro encontrado no 'setador' dos Bountys, contate aos desenvolvedores!";};

_alvoPl setVariable ["alvo_recompensa",true,true];
[((_bounty select 0) select 0)] spawn cxp_fnc_trackBounty;
bounty_task = player createSimpleTask ["Tarefa BountyHunter"];
player setCurrentTask bounty_task;
hint "Alvo-recompensa encontrado!";
cxp_transact_bounty = false;