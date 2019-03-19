#include "\life_server\script_macros.hpp"
/*
	File: fn_trackBounty.sqf
	Author: John "Paratus" VanderZwet
	Modified: Casperento
	Description:
	Rastreia bounty
*/
params [
	["_uid","",[""]]
];

if (isNil "_uid" || _uid isEqualTo "") exitWith {};

private _bounty = [];
private _bountyIndex = -1;
private _unit = objNull;

{
	_uidInit = (_x select 0);
	if (_uidInit isEqualTo _uid) exitWith {
		_bounty = _x;
		_bountyIndex = _forEachIndex;
		{
			if (getPlayerUID _x isEqualTo _uidInit) then {_unit = _x;};
		} forEach allPlayers;
	};
} forEach cxp_bounty_contract;

// Anti-bugs
if (_bountyIndex < 0) exitWith {titleText ["Você não é responsavel por este alvo-recompensa.\nVolte para casa parceiro!","PLAIN"];};
if (_unit distance getMarkerPos "Correctional_Facility" < 100 || isNull _unit) exitWith {cxp_bounty_contract = [];cxp_bounty_uid = [];hint "Seu alvo-recompensa é inválido no momento, localize outro novamente!";};
if (vehicle player != player) exitWith {hint "Você não pode rastrear alguém, enquanto voce estiver dentro de um veículo.";};

private _pos = [(getPos _unit),[1,cxp_track_radius] call BIS_fnc_randomInt,[0,359] call BIS_fnc_randomInt] call BIS_fnc_relPos;

_marker = createMarkerLocal [format["bounty_%1",_bountyIndex], _pos];
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerSizeLocal [cxp_track_radius,cxp_track_radius];
_marker setMarkerTypeLocal "mil_dot";
_marker setMarkerBrushLocal "DiagGrid";
_marker setMarkerColorLocal "ColorRed";

_marker2 = createMarkerLocal [format["bounty_dot_%1",_bountyIndex],_pos];
_marker2 setMarkerShapeLocal "ICON";
_marker2 setMarkerTypeLocal "mil_dot";
_marker2 setMarkerColorLocal "ColorRed";
_marker2 setMarkerTextLocal format["Alvo %1",(_bounty select 1)];

cxp_bounty_tracked = time;
_bounty set[3,_pos]; // '_oldPos'
cxp_bounty_contract set[_bountyIndex,_bounty];

if (count units group player > 1) then {
	{
		if (player distance _x < 100 && _x != player && _x getVariable ["clienteBounty",false]) then {[true,(_bounty select 1),_pos,cxp_track_radius,profileName] remoteExecCall ["cxp_fnc_setGroupTrackMarker",_x];};
	} forEach (units group player);
	systemChat "BOUNTY HUNTER STATUS: Todos os seus amigos bounty hunters que estão com você receberam o marcador de seu alvo-recompensa atual.Boa jogatina irmaos!";
};

[[0,2], format["Você recebeu uma dica de que seu alvo-recompensa ('%1') está na área marcada em seu mapa, %2m de você!",(_bounty select 1),player distance _pos]] call cxp_fnc_broadcast;