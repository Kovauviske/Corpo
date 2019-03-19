#include "\cxp_server\script_macros.hpp"
/*
 File: fn_jail.sqf
 Author: Bryan "Tonic" Boardwine
 Modified : Casperento
 Description:
 Starts the initial process of jailing.
*/
params [
 ["_unit",objNull,[objNull]],
 ["_bad",false,[false]],
 ["_time",15,[0]]
];

if (isNull _unit) exitWith {};
if !(_unit isEqualTo player) exitWith {};
if (cxp_is_arrested) exitWith {};

private _illegalItems = CXP_SETTINGS(getArray,"jail_seize_vItems");

player setVariable ["restrained",false,true];
player setVariable ["tied",nil,true];
player setVariable ["Escorting",false,true];
player setVariable ["transporting",false,true];
titleText[localize "STR_Jail_Warn","PLAIN"];
hint localize "STR_Jail_LicenseNOTF";
player setPosASL [22621,14639.7,9.71194];

if (_bad) then {
	waitUntil {alive player};
	sleep 1;
};

//Check to make sure they goto check
if (player distance (getMarkerPos "jail_marker") > 40) then {
	player setPosASL [22621,14639.7,9.71194];
};

// Remover licencas necessarias do player e salvar no DB
[1] call cxp_fnc_removeLicenses;
[4] call cxp_fnc_removeLicenses;
[2] call CXPSKT_fnc_updatePartial;

{
	_amount = ITEM_VALUE(_x);
	if (_amount > 0) then {
		[false,_x,_amount] call cxp_fnc_handleInv;
	};
  true
} count _illegalItems;

cxp_is_arrested = true;

if (CXP_SETTINGS(getNumber,"jail_seize_inventory") isEqualTo 1) then {
	[] call cxp_fnc_limparInvPlayer;
	if (CXP_SETTINGS(getNumber, "jail_cloth") isEqualTo 1) then {
		[] call cxp_fnc_playerSkins;
	};
} else {
  hint "Sistema de apreender itens do player ao caminho da prisao desligado !";
  diag_log "Sistema de apreender itens do player ao caminho da prisao desligado !";
};

if (cxp_CXPHC_isActive) then {
	[player,_bad,_time] remoteExecCall ["CXPHC_fnc_jailSys",CXP_HC];
} else {
	[player,_bad,_time] remoteExecCall ["cxp_fnc_jailSys",RSERV];
};
[5] call CXPSKT_fnc_updatePartial;