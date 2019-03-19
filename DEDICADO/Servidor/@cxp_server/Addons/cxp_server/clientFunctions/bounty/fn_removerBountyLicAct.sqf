/*
	File: fn_removerBountyLicAct.sqf
	Author: Casperento
	Description:
	Cop retira licença de palhaço que usa bounty hunter
	Que vocês todos se fodam, seus trouxas q n sabem jogar!
*/
params [
	["_cuzao",objNull,[objNull]]
];
[profileName,player] remoteExecCall ["cxp_fnc_removerBountyLic",_cuzao];