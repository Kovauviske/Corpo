#include "\life_server\script_macros.hpp"
/*
    File: fn_copSiren2.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Casperento
    Description:
    Starts the medic siren sound for other players.
*/
private _vehicle = param [0,ObjNull,[ObjNull]];

if (isNull _vehicle) exitWith {};
if (isNil {_vehicle getVariable "siren2"}) exitWith {};

for "_i" from 0 to 1 step 0 do {
    if !(_vehicle getVariable "siren2") exitWith {};
    if (count crew _vehicle isEqualTo 0) then {_vehicle setVariable["siren2",false,true]};
    if !(alive _vehicle) exitWith {};
    if (isNull _vehicle) exitWith {};
    _vehicle say3D ["Yelp",500,1]; //Class name specified in description.ext, max distance & pitch
    sleep 2.0;
    if !(_vehicle getVariable "siren2") exitWith {};
};
