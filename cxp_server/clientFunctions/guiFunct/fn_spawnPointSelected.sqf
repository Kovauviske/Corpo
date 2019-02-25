/*
    File: fn_spawnPointSelected.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Casperento
    Description:
    Sorts out the spawn point selected and does a map zoom.
*/
disableSerialization;

private _control = [_this,0,controlNull,[controlNull]] call BIS_fnc_param;
private _selection = [_this,1,0,[0]] call BIS_fnc_param;
private _spCfg = [playerSide] call cxp_fnc_spawnPointCfg;
private _sp = _spCfg select _selection;

[((findDisplay 38500) displayCtrl 38502),1,0.1,getMarkerPos (_sp select 0),((findDisplay 38500) displayCtrl 38510)] call cxp_fnc_setMapPosition;
cxp_spawn_point = _sp;

ctrlSetText[38501,format ["%2: %1",_sp select 1,localize "STR_Spawn_CSP"]];