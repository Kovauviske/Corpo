#include "\cxp_server\script_macros.hpp"
/*
    File: fn_gather.sqf
    Author: Devilfloh

      Description:
    Main functionality for gathering.
    Wood sound effect by Casperento
*/

scopeName "main";

if (cxp_action_inUse) exitWith {};
if !(isNull objectParent player) exitWith {};
if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};

cxp_action_inUse = true;
private _zone = "";
private _requiredItem = "";

private _resourceCfg = missionConfigFile >> "CfgGather" >> "Resources";

private "_curConfig";
private "_resource";
private "_maxGather";
private "_zoneSize";
private "_resourceZones";

for "_i" from 0 to (count _resourceCfg)-1 do {

    _curConfig = _resourceCfg select _i;
    _resource = configName _curConfig;
    _maxGather = getNumber(_curConfig >> "amount");
    _zoneSize = getNumber(_curConfig >> "zoneSize");
    _resourceZones = getArray(_curConfig >> "zones");
    _requiredItem = getText(_curConfig >> "item");

    {
        if ((player distance (getMarkerPos _x)) < _zoneSize) exitWith {_zone = _x;};
        true
    } count _resourceZones;

    if !(_zone isEqualTo "") exitWith {};
};

if (_zone isEqualTo "") exitWith {cxp_action_inUse = false;};

if !(_requiredItem isEqualTo "") then {
    private _valItem = missionNamespace getVariable [format["cxp_inv_%1", _requiredItem], 0];

    if (_valItem < 1) exitWith {
        switch (_requiredItem) do {
            case "pickaxe": {
                titleText[(localize "STR_NOTF_Pickaxe"),"PLAIN",1];
            };
            case "woodaxe": {
                titleText[(localize "STR_NOTF_Woodaxe"),"PLAIN",1];
            };
            case "enxada": {
                titleText[(localize "STR_NOTF_Enxada"),"PLAIN",1];
            };
        };
        cxp_action_inUse = false;
        breakOut "main";
    };
};

private _amount = round(random(_maxGather)) + 1;
private _diff = [_resource,_amount,cxp_carryWeight,cxp_maxWeight] call cxp_fnc_calWeightDiff;
if (_diff isEqualTo 0) exitWith {
    hint localize "STR_NOTF_InvFull";
    cxp_action_inUse = false;
};

switch (_requiredItem) do {
    case "pickaxe": {player say3D "mining";};
    case "woodaxe": {player say3D "wooding";};
    default {player say3D "harvest";};
};

for "_i" from 0 to 4 do {
    player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
    waitUntil {animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
    sleep 0.5;
};

if ([true,_resource,_diff] call cxp_fnc_handleInv) then {
    private _itemName = M_CONFIG(getText,"VirtualItems",_resource,"displayName");
    titleText[format [localize "STR_NOTF_Gather_Success",(localize _itemName),_diff],"PLAIN"];
};

sleep 1;
cxp_action_inUse = false;
