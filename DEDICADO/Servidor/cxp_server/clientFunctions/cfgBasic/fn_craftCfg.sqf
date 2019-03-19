#include "\cxp_server\script_macros.hpp"
/*
	File: fn_craftCfg.sqf
	Author: EdgeKiller
	Modified: Casperento
	Description:
	Master configuration file for the crafting menu.
*/
params [
	["_craft","",[""]]
];
if (_craft isEqualTo "") exitWith {closeDialog 0}; // Bad Type

private "_return";
if (_craft isEqualTo "weapon") exitWith {
	_return = (CXP_CFG_CRAFT(getArray,"craft_cfg_weapon"));
	_return;
};
if (_craft isEqualTo "uniform") exitWith {
	_return = (CXP_CFG_CRAFT(getArray,"craft_cfg_uniform"));
	_return;
};
if (_craft isEqualTo "backpack") exitWith {
	_return = (CXP_CFG_CRAFT(getArray,"craft_cfg_backpack"));
	_return;
};
if (_craft isEqualTo "item") exitWith {
	_return = (CXP_CFG_CRAFT(getArray,"craft_cfg_item"));
	_return;
};
