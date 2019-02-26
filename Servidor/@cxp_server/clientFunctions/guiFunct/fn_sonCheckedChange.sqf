#include "\cxp_server\script_macros.hpp"
/*
    File: fn_s_onCheckedChange.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Switching it up and making it prettier..
*/
private ["_option","_state"];
_option = _this select 0;
_state = _this select 1;

switch (_option) do {
    case "tags": {
        if (_state isEqualTo 1) then {
            cxp_settings_tagson = true;
            profileNamespace setVariable ["cxp_settings_tagson",true];
            CXP_ID_PlayerTags = ["CXP_PlayerTags","onEachFrame","cxp_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
        } else {
            cxp_settings_tagson = false;
            profileNamespace setVariable ["cxp_settings_tagson",false];
            [CXP_ID_PlayerTags,"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
        };
    };

    case "objects": {
        if (_state isEqualTo 1) then {
            cxp_settings_revealObjects = true;
            profileNamespace setVariable ["cxp_settings_revealObjects",true];
            CXP_ID_RevealObjects = ["CXP_RevealObjects","onEachFrame","cxp_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;
        } else {
            cxp_settings_revealObjects = false;
            profileNamespace setVariable ["cxp_settings_revealObjects",false];
            [CXP_ID_RevealObjects,"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
        };
    };

    case "sidechat": {
        if (_state isEqualTo 1) then {
            cxp_enableSidechannel = true;
            profileNamespace setVariable ["cxp_enableSidechannel",true];
            cxp_settings_enableSidechannel = profileNamespace getVariable ["cxp_enableSidechannel",true];
        } else {
            cxp_enableSidechannel = false;
            profileNamespace setVariable ["cxp_enableSidechannel",false];
            cxp_settings_enableSidechannel = profileNamespace getVariable ["cxp_enableSidechannel",false];
        };
        [player,cxp_settings_enableSidechannel,playerSide] remoteExecCall ["CXPSV_fnc_manageSC",RSERV];
    };

    case "broadcast": {
        if (_state isEqualTo 1) then {
            cxp_enableNewsBroadcast = true;
            profileNamespace setVariable ["cxp_enableNewsBroadcast",true];
            cxp_settings_enableNewsBroadcast = profileNamespace getVariable ["cxp_enableNewsBroadcast",true];
        } else {
            cxp_enableNewsBroadcast = false;
            profileNamespace setVariable ["cxp_enableNewsBroadcast",false];
            cxp_settings_enableNewsBroadcast = profileNamespace getVariable ["cxp_enableNewsBroadcast",false];
        };
    };
};
