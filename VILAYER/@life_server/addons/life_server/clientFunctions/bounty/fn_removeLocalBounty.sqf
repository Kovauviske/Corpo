#include "\life_server\script_macros.hpp"
/*
	File: fn_removeLocalBounty.sqf
	Author: Casperento (BASED ON ASYLUM, THX!)
	Description:
	Limpa marcadores do ultimo bounty
*/
params [
	["_name","",[""]]
];

if (_name isEqualTo "") exitWith {};

if (count cxp_bounty_contract > 0) then {
	player removeSimpleTask bounty_task;
	["BountyNotify",["Tarefa Bounty Hunter Encerrada..."]] call BIS_fnc_showNotification;
	cxp_bounty_contract = [];
	cxp_bounty_uid = [];
	deleteMarkerLocal "bounty_0";
	deleteMarkerLocal "bounty_dot_0";
	if (count units group player > 1) then {
		{
			if (player distance _x < 100 && _x != player && _x getVariable ["clienteBounty",false]) then {[false,_name] remoteExecCall ["cxp_fnc_setGroupTrackMarker",_x];};
		} forEach (units group player);
	};
};