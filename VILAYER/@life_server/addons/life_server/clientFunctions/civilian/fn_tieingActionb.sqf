#include "\life_server\script_macros.hpp"
/*
	File: fn_tieingActionb.sqf
	Author: ?
	Modified: Casperento
*/
private _unit = cursorTarget;

if (isNull _unit) exitWith {}; //Not valid
if (_unit getVariable ["blindfolded", false]) exitWith {};

if (cxp_safezone) exitWith {
	hint "Você não pode fazer isso em uma zona segura !"
};

if ((cxp_action_inUse) || (player getVariable ["tied", false]) || (player getVariable ["restrained", false])) exitWith { 
	hintSilent "Voce nao pode fazer isso.";
}; 

if (player == _unit) exitWith {};
if !(isPlayer _unit) exitWith {};

[false,"blindfold",1] call cxp_fnc_handleInv;

hintSilent "Colocando saco de sequestro...";
_cme = 1;
_myposy = getPos player;

for "_i" from 0 to 1 step 0 do {
	cxp_action_inUse = true;
	if (player distance _myposy > 2.5 ) exitwith { 
		hint "Voce esta longe da vitima !";
	};
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	_cme = _cme + 1;
	if (_cme > 3) exitwith {
		cursorTarget setVariable["blindfolded", true, true];
		[player] remoteExecCall ["cxp_fnc_tieingb", cursorTarget];
	};
};
cxp_action_inUse = false;