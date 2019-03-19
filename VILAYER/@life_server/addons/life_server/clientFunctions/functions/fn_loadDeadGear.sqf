#include "\life_server\script_macros.hpp"
/*
    File: fn_loadDeadGear.sqf
    Author: Casperento
    Description:
    Carrega itens do player nele depois de ter sido revivido
*/
params [["_loadout",[],[[]]]];
private _handle = nil;
private _primary = _loadout select 0;
private _launcher = _loadout select 1;
private _handgun = _loadout select 2;
private _magazines = _loadout select 3;
private _uniform = _loadout select 4;
private _vest = _loadout select 5;
private _backpack = _loadout select 6;
private _items = _loadout select 7;
private _primitems = _loadout select 8;
private _secitems = _loadout select 9;
private _handgunitems = _loadout select 10;
private _uitems = _loadout select 11;
private _vitems = _loadout select 12;
private _bitems = _loadout select 13;
private _headgear = _loadout select 14;
private _goggles = _loadout select 15;

//Add the gear
if !(_uniform isEqualTo "") then {_handle = [_uniform,true,false,false,false] spawn cxp_fnc_handleItem; waitUntil {scriptDone _handle};};
if !(_vest isEqualTo "") then {_handle = [_vest,true,false,false,false] spawn cxp_fnc_handleItem; waitUntil {scriptDone _handle};};
if !(_backpack isEqualTo "") then {_handle = [_backpack,true,false,false,false] spawn cxp_fnc_handleItem; waitUntil {scriptDone _handle};};
{_handle = [_x,true,false,false,false] spawn cxp_fnc_handleItem;waitUntil {scriptDone _handle};} forEach _magazines;
if !(_primary isEqualTo "") then {[_primary,true,false,false,false] spawn cxp_fnc_handleItem;};
if !(_launcher isEqualTo "") then {[_launcher,true,false,false,false] spawn cxp_fnc_handleItem;};
if !(_handgun isEqualTo "") then {[_handgun,true,false,false,false] spawn cxp_fnc_handleItem;};
{_handle = [_x,true,false,false,false] spawn cxp_fnc_handleItem; waitUntil {scriptDone _handle};} forEach _items;
{[_x,true,false,false,true] call cxp_fnc_handleItem;} forEach (_uitems);
{[_x,true,false,false,true] call cxp_fnc_handleItem;} forEach (_vitems);
{[_x,true,true,false,false] call cxp_fnc_handleItem;} forEach (_bitems);
{[_x,true,false,true,false] call cxp_fnc_handleItem;} forEach (_primitems);
{[_x,true,false,true,false] call cxp_fnc_handleItem;} forEach (_secitems);
{[_x,true,false,true,false] call cxp_fnc_handleItem;} forEach (_handgunitems);
if !(_headgear isEqualTo "") then {player addHeadGear _headgear};
if !(_goggles isEqualTo "") then {player addGoggles _goggles};
