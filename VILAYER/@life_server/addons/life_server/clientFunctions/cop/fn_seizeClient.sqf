#include "\life_server\script_macros.hpp"
/*
    File: fn_seizeClient.sqf
    Author: Daniel "Skalicon" Larusso
    Modified: Casperento
    Description:
    Removes the players weapons client side
*/
private _exempt = CXP_SETTINGS(getArray,"seize_exempt");
private _headgear = CXP_SETTINGS(getArray,"seize_headgear");
private _vest = CXP_SETTINGS(getArray,"seize_vest");
private _uniform = CXP_SETTINGS(getArray,"seize_uniform");

{
    if !(_x in _exempt) then {
        player removeWeapon _x;
    };
} forEach weapons player;

{
    if !(_x in _exempt) then {
        player removeItemFromUniform _x;
    };
} forEach uniformItems player;

{
    if !(_x in _exempt) then {
        player removeItemFromVest _x;
    };
} forEach vestItems player;

{
    if !(_x in _exempt) then {
        player removeItemFromBackpack _x;
    };
} forEach backpackItems player;

{
    if !(_x in _exempt) then {
        player removeMagazine _x;
    };
} forEach magazines player;

if (uniform player in _uniform) then {removeUniform player;};
if (vest player in _vest) then {removeVest player;};
if (headgear player in _headgear) then {removeHeadgear player;};

[] call CXPSKT_fnc_updateRequest;
titleText[localize "STR_NOTF_SeizeIllegals","PLAIN"];
