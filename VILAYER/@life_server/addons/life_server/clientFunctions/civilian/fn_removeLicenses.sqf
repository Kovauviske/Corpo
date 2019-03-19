#include "\life_server\script_macros.hpp"
/*
    File: fn_removeLicenses.sqf
    Author: Bryan "Tonic" Boardwine
    
    Modified: Casperento

    Description:
    Used for stripping certain licenses off of civilians as punishment.
*/
private _state = param [0,1,[0]];

switch (_state) do {
    //Death while being wanted
    case 0: {
        missionNamespace setVariable [LICENSE_VARNAME("driver","civ"),false];
        missionNamespace setVariable [LICENSE_VARNAME("rebellic","civ"),false];
        missionNamespace setVariable [LICENSE_VARNAME("driver","civ"),false];
        missionNamespace setVariable [LICENSE_VARNAME("heroin","civ"),false];
        missionNamespace setVariable [LICENSE_VARNAME("marijuana","civ"),false];
        missionNamespace setVariable [LICENSE_VARNAME("cocaine","civ"),false];
    };

    //Jail Civ licenses
    case 1: {
        missionNamespace setVariable [LICENSE_VARNAME("driver","civ"),false];
    };

    //Remove motor vehicle licenses
    case 2: {
        if (missionNamespace getVariable LICENSE_VARNAME("driver","civ") || missionNamespace getVariable LICENSE_VARNAME("pilot","civ") || missionNamespace getVariable LICENSE_VARNAME("trucking","civ") || missionNamespace getVariable LICENSE_VARNAME("boat","civ")) then {
            missionNamespace setVariable [LICENSE_VARNAME("pilot","civ"),false];
            missionNamespace setVariable [LICENSE_VARNAME("driver","civ"),false];
            missionNamespace setVariable [LICENSE_VARNAME("trucking","civ"),false];
            missionNamespace setVariable [LICENSE_VARNAME("boat","civ"),false];
            hint localize "STR_Civ_LicenseRemove_1";
        };
    };

    //Killing someone while owning a gun license
    case 3: {
        if (missionNamespace getVariable LICENSE_VARNAME("gun","civ")) then {
            missionNamespace setVariable [LICENSE_VARNAME("gun","civ"),false];
            hint localize "STR_Civ_LicenseRemove_2";
        };
    };

    // remove licenca rebelde, de armas quando morre/eh preso
    case 4: {
      missionNamespace setVariable [LICENSE_VARNAME("gun","civ"),false];
      missionNamespace setVariable [LICENSE_VARNAME("rebellic","civ"),false];
      hint localize "STR_Civ_LicenseRemove_3";
    };
};
