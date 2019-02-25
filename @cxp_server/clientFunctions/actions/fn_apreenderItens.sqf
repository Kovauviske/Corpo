/*
	File: fn_apreenderItens.sqf
	Author: Casperento
	Description:
	Apreende itens no chao
*/
if (playerSide isEqualTo civilian) exitWith {};
private _weapons = [];
private _w1 = _weapons append (nearestObjects [player,["WeaponHolder"],3]);
private _w2 = _weapons append (nearestObjects [player,["GroundWeaponHolder"],3]);
private _w3 = _weapons append (nearestObjects [player,["WeaponHolderSimulated"],3]);
if (count _weapons isEqualTo 0) exitWith {titleText ["Nenhum item encontrado para apreender...","PLAIN"];};
_weapons = _weapons arrayIntersect _weapons;
{deleteVehicle _x;} forEach _weapons;
titleText ["Itens apreendidos com sucesso!","PLAIN"];