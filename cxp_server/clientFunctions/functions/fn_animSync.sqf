/*
    File: fn_animSync.sqf
    Author: ?
    Modified: Caspento

    Description:

*/
private _unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
private _anim = [_this,1,"",[""]] call BIS_fnc_param;
private _cancelOwner = [_this,2,false,[true]] call BIS_fnc_param;
if (isNull _unit || {(local _unit && _cancelOwner)}) exitWith {};
_unit switchMove _anim;