#include "\cxp_server\script_macros.hpp"
/*
	File: fn_gangSetBase.sqf
	Author: Casperento
	Description:
	Da permissao para membro da gangue usar a base da gangue
*/
disableSerialization;
params [["_act","",[""]],["_deset",false,[false]]];

if (_act isEqualTo "") exitWith {};
private _idc = switch (_act) do {case "on":{91002};case "off":{91001};};
if ((lbCurSel _idc) isEqualTo -1) exitWith {hint localize "STR_GNOTF_SelectPersonSet";};
private _infoPl = call compile format ["%1",CONTROL_DATA(_idc)];
if (_infoPl isEqualTo player) exitWith {hint "Voce nao pode fazer isso consigo mesmo!"};

private _action = [
    localize "STR_Gang_PergSetbase",
    localize "STR_Gang_PergSetbaseTit",
    localize "STR_Global_Yes",
    localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
	switch (_act) do {
		case "on": {
			if (_deset) then {
				[1,player,_infoPl] remoteExecCall ["CXPSV_fnc_baseGangueSet",RSERV];
			} else {
				[0,player,_infoPl,(FETCH_CONST(cxp_gdonorLevel))] remoteExecCall ["CXPSV_fnc_baseGangueSet",RSERV];
			};
		};
		case "off": {
			if (_deset) then {
				[1,objNull,(_infoPl select 2)] remoteExecCall ["CXPSV_fnc_baseGangueSet",RSERV];
			} else {
				[0,objNull,(_infoPl select 2),(FETCH_CONST(cxp_gdonorLevel))] remoteExecCall ["CXPSV_fnc_baseGangueSet",RSERV];
			};
		};
	};
} else {
	hint localize "STR_GNOTF_PergSetbaseCancel";
};
uiNamespace setVariable ["BIS_fnc_guiMessage_status",false];
closeDialog 0;