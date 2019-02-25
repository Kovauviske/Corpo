#include "\cxp_server\script_macros.hpp"
/*
    File: fn_settingsMenu
    Author: Bryan "Tonic" Boardwine

    Description:
    Setup the settings menu.
*/
if (isNull (findDisplay 2900)) then {
    if (!createDialog "SettingsMenu") exitWith {hint localize "STR_NOTF_menuWillNotOpen";};
};

disableSerialization;

ctrlSetText[2902, format ["%1", cxp_settings_viewDistanceFoot]];
ctrlSetText[2912, format ["%1", cxp_settings_viewDistanceCar]];
ctrlSetText[2922, format ["%1", cxp_settings_viewDistanceAir]];

/* Set up the sliders */
{
    slidersetRange [(_x select 0),100,8000];
    CONTROL(2900,(_x select 0)) sliderSetSpeed [100,100,100];
    sliderSetPosition [(_x select 0),(_x select 1)];
} forEach [[2901,cxp_settings_viewDistanceFoot],[2911,cxp_settings_viewDistanceCar],[2921,cxp_settings_viewDistanceAir]];

if (isNil "cxp_settings_revealObjects") then {
    cxp_settings_enableNewsBroadcast = profileNamespace setVariable ["cxp_enableNewsBroadcast",true];
    cxp_settings_enableSidechannel = profileNamespace setVariable ["cxp_enableSidechannel",true];
    cxp_settings_tagson = profileNamespace setVariable ["cxp_settings_tagson",true];
    cxp_settings_revealObjects = profileNamespace setVariable ["cxp_settings_revealObjects",true];
};

CONTROL(2900,2971) cbSetChecked cxp_settings_enableSidechannel;
CONTROL(2900,2973) cbSetChecked cxp_settings_enableNewsBroadcast;
CONTROL(2900,2970) cbSetChecked cxp_settings_tagson;
CONTROL(2900,2972) cbSetChecked cxp_settings_revealObjects;
