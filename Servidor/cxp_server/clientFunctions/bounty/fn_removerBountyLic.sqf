/*
	File: fn_removerBountyLic.sqf
	Author: Casperento
	Description:
	Cop retira licença de palhaço que usa bounty hunter
	Que vocês todos se fodam, seus trouxas q n sabem jogar!
*/
params [
	["_remeName","",[""]],
	["_reme",objNull,[objNull]]
];

if !(license_civ_bHunterLic) exitWith {};

missionNamespace setVariable["license_civ_bHunterLic",false];
player setVariable ["clienteBounty",false,true];
[2] call CXPSKT_fnc_updatePartial;

if (side _reme isEqualTo civilian) exitWith {
	hint "Você perdeu sua licença de BountyHunter por ter matado um companheiro e foi adicionado na lista de procurados do servidor!";
};

if (side _reme isEqualTo west) exitWith {
	hint format["O oficial %1 retirou sua licença de Bounty Hunter!\nTente não fazer merda da próxima vez, palhaço!",_remeName];
	// Avisa para o cop que deu certo
	[2,format["Você apreendeu a licença de Bounty Hunter de %1",profileName]] remoteExecCall ["cxp_fnc_broadcast",_reme];
};