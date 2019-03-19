#include "\life_server\script_macros.hpp"
/*
	File: fn_onPutItem.sqf
	Author: DevUnkwnon
	Descrition:
	Monitora a o evento de colocar algum item num container
*/
params [
    ["_unit",objNull,[objNull]],
    ["_container",objNull,[objNull]],
    ["_item","",[""]]
];

if (isNull _unit || _item isEqualTo "") exitWith {};
if (_unit getVariable ["restrained",false]) exitWith {hint"Voce nao pode fazer isso enquanto estiver algemado!"};
if (_unit getVariable ["tied",false]) exitWith {hint"Voce nao pode fazer isso enquanto estiver algemado!"};

[3] call CXPSKT_fnc_updatePartial;