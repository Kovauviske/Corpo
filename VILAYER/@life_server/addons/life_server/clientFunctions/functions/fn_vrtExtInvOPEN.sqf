#include "\life_server\script_macros.hpp"
/*
    File: fn_vrtExtInvOPEN.sqf
	Author: Casperento (THX PARATUS)
*/
if (cxp_action_inUse) exitWith {closeDialog 0;hint "Você nao pode mexer em seu inventario enquanto estiver fazedo outra ação!";};
disableSerialization;
private _display = findDisplay 602;
if !(cxp_virtextinv_open) then {
	cxp_virtextinv_open = true;
	_mainX = getNumber (configfile >> "RscDisplayInventory" >> "controls" >> "CA_PlayerBackground" >> "x");
	_mainW = getNumber (configfile >> "RscDisplayInventory" >> "controls" >> "CA_PlayerBackground" >> "w");
	_panelX = getNumber (configfile >> "RscDisplayInventory" >> "controls" >> "CA_ContainerBackground" >> "x");
	_panelY = getNumber (configfile >> "RscDisplayInventory" >> "controls" >> "CA_ContainerBackground" >> "y");
	_panelW = getNumber (configfile >> "RscDisplayInventory" >> "controls" >> "CA_ContainerBackground" >> "w");
	_panelH = getNumber (configfile >> "RscDisplayInventory" >> "controls" >> "CA_ContainerBackground" >> "h");
	_progressX = getNumber (configfile >> "RscDisplayInventory" >> "controls" >> "GroundLoad" >> "x");
	_progressY = getNumber (configfile >> "RscDisplayInventory" >> "controls" >> "GroundLoad" >> "y");
	_progressW = getNumber (configfile >> "RscDisplayInventory" >> "controls" >> "GroundLoad" >> "w");
	_progressH = getNumber (configfile >> "RscDisplayInventory" >> "controls" >> "GroundLoad" >> "h");
	_containerX = getNumber (configfile >> "RscDisplayInventory" >> "controls" >> "GroundContainer" >> "x");
	_containerY = getNumber (configfile >> "RscDisplayInventory" >> "controls" >> "GroundContainer" >> "y");
	_containerW = getNumber (configfile >> "RscDisplayInventory" >> "controls" >> "GroundContainer" >> "w");
	_containerH = getNumber (configfile >> "RscDisplayInventory" >> "controls" >> "GroundContainer" >> "h");
	_padding = _progressX - _panelX;

	_panel = _display ctrlCreate ["RscBackground", 6665];
	_panel ctrlSetBackgroundColor [0.05,0.05,0.05,0.7];
	_panelX = (_mainX + _mainW) + (_mainX - _panelX - _panelW);
	_panel ctrlSetPosition [_panelX, _panelY, _panelW, _panelH];
	_panel ctrlCommit 0;

	_load = _display ctrlCreate ["RscProgress", 6667];
	_load ctrlSetTextColor [0.9,0.9,0.9,0.9];
	_load ctrlSetPosition [_panelX + _padding, _progressY, _progressW, _progressH];
	_load ctrlCommit 0;
	_load progressSetPosition (cxp_carryWeight / cxp_maxWeight);

	_loadFrame = _display ctrlCreate ["RscFrame", -1];
	_loadFrame ctrlSetTextColor [0.6,0.6,0.6,1];
	_loadFrame ctrlSetPosition [_panelX + _padding, _progressY, _progressW, _progressH];
	_loadFrame ctrlCommit 0;

	_loadText = _display ctrlCreate ["RscStructuredText", 6678];
	_loadText ctrlSetTextColor [0,0,0,0.7];
	_loadText ctrlSetPosition [_panelX + _padding, _progressY, _progressW, _progressH];
	_loadText ctrlSetStructuredText parseText format["<t align='center'>%1/%2</t>", cxp_carryWeight, cxp_maxWeight];
	_loadText ctrlCommit 0;

	_title = _display ctrlCreate ["RscText", -1];
	_title ctrlSetTextColor [1,1,1,1];
	_title ctrlSetText "Itens";
	_title ctrlSetPosition [_panelX + _padding, _panelY + _padding, _progressW, _progressH];
	_title ctrlCommit 0;

	_players = _display ctrlCreate ["RscCombo", 2023];
	_players ctrlSetPosition [_panelX + _padding, _panelY + _padding, _progressW / 2, _progressH];
	_players ctrlCommit 0;

	_edit = _display ctrlCreate ["RscEdit", 2010];
	_edit ctrlSetText "1";
	_edit ctrlSetPosition [_panelX + _padding + (_progressW / 2), _panelY + _padding, _progressW / 2, _progressH];
	_edit ctrlCommit 0;

	_inv = _display ctrlCreate ["RscListBox", 2005];
	_inv ctrlSetPosition [_panelX + _padding, _containerY, _containerW, _containerH];
	_inv ctrlSetBackgroundColor [0,0,0,0];
	_inv ctrlCommit 0;

	_but1 = _display ctrlCreate ["RscButtonMenu", 6670];
	_but1 ctrlSetPosition [_panelX + _padding, _panelY + _padding + _progressH + (_progressH / 8), _containerW / 3, _progressH];
	_but1 ctrlSetText "USAR";
	_but1 ctrlCommit 0;
	_but1 ctrlAddEventHandler ["ButtonClick", "[true] call cxp_fnc_useItem;"];

	_but2 = _display ctrlCreate ["RscButtonMenu", 2002];
	_but2 ctrlSetPosition [_panelX + _padding + ((_containerW / 3) * 1), _panelY + _padding + _progressH + (_progressH / 8), _containerW / 3, _progressH];
	_but2 ctrlSetText "DAR";
	_but2 ctrlCommit 0;
	_but2 ctrlAddEventHandler ["ButtonClick", "[true] call cxp_fnc_giveItem;"];

	_but3 = _display ctrlCreate ["RscButtonMenu", 454];
	_but3 ctrlSetPosition [_panelX + _padding + ((_containerW / 3) * 2), _panelY + _padding + _progressH + (_progressH / 8), _containerW / 3, _progressH];
	_but3 ctrlSetText "REMOVER";
	_but3 ctrlCommit 0;
	_but3 ctrlAddEventHandler ["ButtonClick", "[] call cxp_fnc_vrtExtInvDROP;"];

	_centerX = getNumber (configfile >> "RscDisplayInventory" >> "controls" >> "BackgroundSlotPrimary" >> "x");
	_offset = _centerX - 0.5;
	{
		_x ctrlSetPosition [((ctrlPosition _x) select 0) - _offset,((ctrlPosition _x) select 1)];
		_x ctrlCommit 0;
	} forEach allControls _display;

	[] spawn {disableSerialization;waitUntil {isNull (findDisplay 602)};cxp_virtextinv_open = false;};

	_inventory = CONTROL(602,2005);
	_nearPlayer = CONTROL(602,2023);

	lbClear _inventory;
	lbClear _nearPlayer;

	// Identificar nome dos jogadores ao redor do cliente
	_near_units = [];
	{ if (player distance _x < 10) then {_near_units pushBack _x};} forEach playableUnits;
	{
		if (!isNull _x && alive _x && player distance _x < 10 && _x != player) then {
			_nearPlayer lbAdd format ["%1 - %2",_x getVariable ["realname",name _x], side _x];
			_nearPlayer lbSetData [(lbSize _nearPlayer)-1,str(_x)];
		};
	} forEach _near_units;

	// Preenchimento da ListBox
	{
		if (ITEM_VALUE(configName _x) > 0) then {
			_inventory lbAdd format ["%2 [x%1]",ITEM_VALUE(configName _x),localize (getText(_x >> "displayName"))];
			_inventory lbSetData [(lbSize _inventory)-1,configName _x];
			_icone = M_CONFIG(getText,"VirtualItems",configName _x,"icon");
			if (!(_icone isEqualTo "")) then {_inventory lbSetPicture [(lbSize _inventory)-1,_icone];};
		};
	} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));
};
