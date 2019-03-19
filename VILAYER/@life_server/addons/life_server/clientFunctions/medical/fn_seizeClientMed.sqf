#include "\life_server\script_macros.hpp"
/*
    File: fn_seizeClientMed.sqf
    Author: Casperento

    Description:
    Médicos podem apreender armas, munições e acessorios das armas
*/
private _armas = CXP_SETTINGS(getArray,"seize_med_weapons");
private _muni = CXP_SETTINGS(getArray,"seize_med_magazines");
private _accs = CXP_SETTINGS(getArray,"seize_med_acessorios");

{
	player removeWeapon _x;
} forEach _armas;

{
	player removeMagazine _x;
} forEach _muni;

{
	player unassignitem _x;
	player removeItem _x;
} forEach _accs;

[] call CXPSKT_fnc_updateRequest;
titleText[localize "STR_NOTF_SeizeIllegalsMed","PLAIN"];