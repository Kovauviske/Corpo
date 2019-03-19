#include "\life_server\script_macros.hpp"
/*
	File: fn_setGroupTrackMarker.sqf
	Author: John "Paratus" VanderZwet
	Modified: Casperento
	Description:
	Shows a bounty tracking marker from friends bounty
*/
params [
	["_visible",false,[false]],
	["_name","",[""]],
	["_pos",[0,0,0],[[]]],
	["_radius",0,[0]],
	["_nomeAmigo","",[""]]
];

if !(_visible) exitWith {
	if (!(isNil (format["bounty_group_%1",_name])) && !(isNil (format["bounty_dot_group_%1",_name]))) then {
		deleteMarkerLocal format["bounty_group_%1",_name];
		deleteMarkerLocal format["bounty_dot_group_%1",_name];
	};
	hint "Seu alvo-recompensa atual foi deslocalizado...Volte ao HQ e localize outro novamente!";
};

if (_name isEqualTo "" || _nomeAmigo isEqualTo "") exitWith {};

_marker = createMarkerLocal [format["bounty_group_%1",_name],_pos];
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerSizeLocal [_radius,_radius];
_marker setMarkerTypeLocal "mil_dot";
_marker setMarkerBrushLocal "DiagGrid";
_marker setMarkerColorLocal "ColorOrange";

_marker2 = createMarkerLocal [format["bounty_dot_group_%1",_name],_pos];
_marker2 setMarkerShapeLocal "ICON";
_marker2 setMarkerTypeLocal "mil_dot";
_marker2 setMarkerColorLocal "ColorOrange";
_marker2 setMarkerTextLocal format["Alvo %1",_name];

_name spawn {
	sleep 600;
	deleteMarkerLocal format["bounty_group_%1",_this];
	deleteMarkerLocal format["bounty_dot_group_%1",_this];
};

hint format ["Seu amigo %1 localizou um alvo-recompensa e compartilhou a sua localizacao com voce!\nAjude-o a capturar o alvo e voce tambem ganhara uma parcela do premio!",_nomeAmigo];