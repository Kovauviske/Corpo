/*
	File: fn_rmCorpseArr.sqf
	Author: Casperento
	Description:
	Remove corpse quando necessario no atendimento simultaneo
*/
params [
	["_paciente",objNull,[objNull]]
];

if (count cxp_arrCorpsesPerto > 0) exitWith {
	if (_paciente in cxp_arrCorpsesPerto) then {
		cxp_arrCorpsesPerto deleteAt (cxp_arrCorpsesPerto find _paciente);
	};
};