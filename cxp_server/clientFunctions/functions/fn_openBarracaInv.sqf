/*
	File: fn_openBarracaInv.sqf
	Author: Casperento
	Description:
	Abre inventario virtual da barraca
*/
private _barraca = cursorObject;

if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
if (player getVariable "tied") exitWith {hint localize "STR_NOTF_isrestrained";};
if (player getVariable "downed") exitWith {hint localize "STR_NOTF_downed";};
if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";}; // For player surrender and near vehicle.
if (dialog) exitWith {};
if (isNull _barraca) exitWith {hint "Barraca invalida!"};
if (_barraca getVariable ["trunk_in_use",false] || !(isNull (_barraca getVariable ["trunk_in_use_by",objNull]))) exitWith {hint localize "STR_MISC_BarcInvUse"};
if !(createDialog "TrunkMenu") exitWith {hint localize "STR_MISC_DialogError";};
disableSerialization;

_barraca setVariable ["trunk_in_use",true,true];
_barraca setVariable ["trunk_in_use_by",player,true];

private _armaze = getNumber(missionConfigFile >> "CxpBasic_Settings" >> "cxp_barracas" >> (typeOf _barraca) >> "armazenamento");
ctrlSetText[3501,format [(localize "STR_MISC_BarcStorage")+" %1",_armaze]];
private _usado = (_barraca getVariable "Trunk") select 1;
if (isNil "_usado") then {_usado = 0;};
if (_armaze isEqualTo -1) exitWith {closeDialog 0;_barraca setVariable ["trunk_in_use",false,true];_this setVariable ["trunk_in_use_by",objNull,true];hint localize "STR_MISC_NoStorageVeh";};
ctrlSetText[3504,format [(localize "STR_MISC_Weight")+" %1/%2",_usado,_armaze]];
[_barraca] call cxp_fnc_vehInventory;
cxp_trunk_vehicle = _barraca;

_barraca spawn {
    waitUntil {isNull (findDisplay 3500)};
    _this setVariable ["trunk_in_use",false,true];
	_this setVariable ["trunk_in_use_by",objNull,true];
};