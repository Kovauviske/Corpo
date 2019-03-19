#include "\life_server\script_macros.hpp"
/*
    File: fn_repairTruck.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Casperento
    Description:
    Main functionality for toolkits, to be revised in later version.
*/
private _veh = cursorObject;

cxp_interrupted = false;

if (isNull _veh) exitWith {};
if (vehicle player != player) exitWith {titleText[localize "STR_NOTF_ActionInVehicle","PLAIN"];};

if ((_veh isKindOf "Car") || (_veh isKindOf "Ship") || (_veh isKindOf "Air")) then {
    if (cxp_inv_toolkit > 0) then {
        cxp_action_inUse = true;
        private _displayName = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _veh),"displayName");
        private _upp = format[localize "STR_NOTF_Repairing",_displayName];

        //Setup our progress bar.
        disableSerialization;
        "progressBar" cutRsc ["cxp_progress","PLAIN"];
        private _ui = uiNamespace getVariable "cxp_progress";
        private _progress = _ui displayCtrl 38201;
        private _pgText = _ui displayCtrl 38202;
        _pgText ctrlSetText format["%2 (1%1)...","%",_upp];
        _progress progressSetPosition 0.01;
        private _cP = 0.01;

        [player,"Acts_carFixingWheel","playNow",21] remoteExec ["cxp_fnc_animDynSync",RCLIENT];

        for "_i" from 0 to 1 step 0 do {
            uiSleep 0.14;
            _cP = _cP + 0.01;
            _progress progressSetPosition _cP;
            _pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
            if (_cP >= 1) exitWith {};
            if (!alive player) exitWith {};
            if (vehicle player != player) exitWith {titleText[localize "STR_NOTF_ActionInVehicle","PLAIN"];};
            if (cxp_interrupted) exitWith {};
            if (player getVariable ["downed",false]) exitWith {};
        };

        [player,""] remoteExec ["cxp_fnc_animDynSync",RCLIENT];

        cxp_action_inUse = false;
        "progressBar" cutText ["","PLAIN"];
        if (player getVariable ["downed",false]) exitWith {titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; cxp_action_inUse = false;};
        if (cxp_interrupted) exitWith {cxp_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; cxp_action_inUse = false;};
        if (vehicle player != player) exitWith {titleText[localize "STR_NOTF_ActionInVehicle","PLAIN"];};

        private _sideRepairArray = CXP_SETTINGS(getArray,"vehicle_infiniteRepair");

        //Check if playerSide has infinite repair enabled
        if (playerSide isEqualTo civilian && (_sideRepairArray select 0) isEqualTo 0) then {
            [false,"toolkit",1] call cxp_fnc_handleInv;
        };
        if (playerSide isEqualTo west && (_sideRepairArray select 1) isEqualTo 0) then {
            [false,"toolkit",1] call cxp_fnc_handleInv;
        };
        if (playerSide isEqualTo independent && (_sideRepairArray select 2) isEqualTo 0) then {
            [false,"toolkit",1] call cxp_fnc_handleInv;
        };
        if (playerSide isEqualTo east && (_sideRepairArray select 3) isEqualTo 0) then {
            [false,"toolkit",1] call cxp_fnc_handleInv;
        };

        _veh setDamage 0;
        titleText[localize "STR_NOTF_RepairedVehicle","PLAIN"];
    };
};
