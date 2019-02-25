#include "\cxp_server\script_macros.hpp"
/*
	File : fn_parachuteEspecial.sqf
	Author : Casperento
*/
private _vehPl = vehicle player;
private _preAddActPQD = "Steerable_Parachute_F" createVehicle [0,0,0];

if (isNull _vehPl) exitWith {};
if !(_vehPl isKindOf "Air") exitWith {hint"Você não pode usar paraquedas neste veículo!"};
if ((position _vehPl select 2) < CXP_SETTINGS(getNumber,"parachuteEspecial_minAltura")) exitWith {hint format ["Altura insuficiente para pular de para-quedas!\nMin: %1m",CXP_SETTINGS(getNumber,"parachuteEspecial_minAltura")]};

player addBackpack "B_Parachute";
_vehPl lock false;
player action ["getOut", _vehPl];
_vehPl lock true;
hint format["Boa sorte %1!\nTomara que o senhor chegue vivo em terra firme.", name player];
