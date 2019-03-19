#include "\life_server\script_macros.hpp"
/*
	File: fn_donoCartel.sqf
	Author: Casperento

	Description:
	Determina qual � a gangue que domina determinado cartel
*/

private _parcelaCartel = param [0,0,[0]];
private _parcelaC = round (_parcelaCartel); // arredondando o valor para evitar mimimi..

//Gang_Area_1 - coca, meta, hero
private _cartelBand = [11210.265,8717.957,0] nearestObject "Flag_Red_F";
private _dono = _cartelBand getVariable ["gangOwner",grpNull];
if (CXP_SETTINGS(getNumber,"log_dono_cartel") isEqualTo 1) then {diag_log format ["Dono chegou no donoCartel, Dono: %1",_dono];};
[_parcelaC,_dono] call CXPSV_fnc_parcelaCartel;
