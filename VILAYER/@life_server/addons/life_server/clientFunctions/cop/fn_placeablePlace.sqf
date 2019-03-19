#include "\life_server\script_macros.hpp"
/*
	Author : ?
	Modified : Casperento
*/
disableSerialization;
if (count cxp_bar_placey >= cxp_bar_limit) exitWith { hint "Voce atingiu o limite de itens que voce pode colocar no mapa !"; };
private _placeables = CONTROL(20000,20001);
private _className = lbData[20001, lbCurSel (20001)];
cxp_barrier_active = true;
private _allowMoveDistance = 50;
private _object = _className createVehicle (position player);
cxp_barrier_activeObj = _object;
closeDialog 0;
private _attachPos = [0, 3, 0.5];
_object attachTo[player, _attachPos];
_object enableSimulationGlobal false;
private _originalPos = position _object;
private _playerOriginalPos = position player;
waitUntil{
	if (cxp_barrier_activeObj distance _originalPos > _allowMoveDistance || player distance _playerOriginalPos > _allowMoveDistance) then {
		[true] call cxp_fnc_placeableCancel;
    };
    sleep 1;
    !cxp_barrier_active;
};
