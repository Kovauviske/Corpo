/*
    File: fn_spawnMenu.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Casperento
    Description:
    Initializes the spawn point selection menu.
*/
disableSerialization;

if (cxp_is_arrested) exitWith {[] call cxp_fnc_respawned;};
if (cxp_respawned) then {[] call cxp_fnc_respawned;};
if !(createDialog "cxp_spawn_selection") exitWith {[] call cxp_fnc_spawnMenu;};

cxp_curWep_h = currentWeapon player;
player action ["SwitchWeapon", player, player, 100];
0 cutText ["","BLACK IN"];
cxp_spawnCamera = "CAMERA" camCreate (getPosATL player);
showCinemaBorder true;
cxp_spawnCamera cameraEffect ["Internal","FRONT"];
cxp_spawnCamera camSetTarget player;
cxp_spawnCamera camSetRelPos [0.5,3.5,1.48];
cxp_spawnCamera camSetFOV .9;
cxp_spawnCamera camSetFocus [50,0];
cxp_spawnCamera camCommit 0;

(findDisplay 38500) displaySetEventHandler ["keyDown","_this call cxp_fnc_displayHandler"];

private _spCfg = [playerSide] call cxp_fnc_spawnPointCfg;
private _ctrl = ((findDisplay 38500) displayCtrl 38510);
{
    _ctrl lnbAddRow[(_spCfg select _ForEachIndex) select 1,(_spCfg select _ForEachIndex) select 0,""];
    _ctrl lnbSetPicture[[_ForEachIndex,0],(_spCfg select _ForEachIndex) select 2];
    _ctrl lnbSetData[[_ForEachIndex,0],(_spCfg select _ForEachIndex) select 0];
} forEach _spCfg;

private _sp = _spCfg select 0; //First option is set by default
[((findDisplay 38500) displayCtrl 38502),1,0.1,getMarkerPos (_sp select 0),((findDisplay 38500) displayCtrl 38510)] call cxp_fnc_setMapPosition;
cxp_spawn_point = _sp;

ctrlSetText[38501,format ["%2: %1",_sp select 1,localize "STR_Spawn_CSP"]];
