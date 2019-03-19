#include "\cxp_server\script_macros.hpp"
/*
	File: fn_gatherObject.sqf
	Author: John "Paratus" VanderZwet

	Modified : Casperento

	Description:
	Get berries off that bush!
*/
private _data = [_this,3,["",3],[[]]] call BIS_fnc_param;
private _item = _data select 0;
private _max = _data select 1;
private _string = _data select 2;
private _bush = cursorObject;

if !(["neriumo2d",(str _bush)] call cxp_fnc_inString) exitWith {}; //se o objeto nao for o correto, saia
if (_item == "") exitWith {};
if (isNull _bush) exitWith {};

private _count = ceil (random _max);

if (vehicle player != player) exitWith { hint "Voce nao pode colher enquanto voce esta dentro de um carro !" };
if (!([true,_item,_count] call cxp_fnc_handleInv)) exitWith { hint "Seu inventario esta cheio !" };

_bush setDamage 1;

player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";

if (([true, _item, _count] call cxp_fnc_handleInv)) then {
    private _name = ITEM_NAME(_item);
    titleText[format["Voce colheu %1 %2",_count,localize _name],"PLAIN"];
};
