#include "\life_server\script_macros.hpp"
/*
	File: fn_getBounty.sqf
	Author: John "Paratus" VanderZwet
	Modified: Casperento
	Description:
	Requests a bounty from the server.
*/
if !(license_civ_bHunterLic) exitWith {hint"Vire gente primeiro e torne-se um Bounty Hunter de sucesso para usar esta função!"};
if (time - cxp_last_bounty < CXP_SETTINGS(getNumber,"bCFG_delay_recomp")) exitWith {hint format ["Você deve aguardar %1 segundos antes de requisitar outro alvo-recompensa.",CXP_SETTINGS(getNumber,"bCFG_delay_recomp")];};
cxp_last_bounty = time;

//Timer
private _searchTime = CXP_SETTINGS(getNumber,"bCFG_tempo_bounties"); // de quanto em quanto tempo o cara pode ter alvo-recompensas (Padrao: 2min)
if (((time - cxp_bounty_tracked) < _searchTime)) exitWith {hint format["Você só pode rastrear um alvo por vez a cada %1min. Você poderá rastrear novamente daqui a %2seg(s)!", _searchTime/60,round(_searchTime - (time - cxp_bounty_tracked))]};

cxp_transact_bounty = true;
hint "Buscando por alvos-recompensas...";
[player,cxp_bounty_uid] remoteExecCall ["cxp_fnc_wantedGetBounty",RSERV];
cxp_transact_bounty = false;
