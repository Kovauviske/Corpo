#include "\cxp_server\script_macros.hpp"
/*
    File: fn_huntingZone.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Casperento
    Description:
    Spawns animals around the marker when a player
    is near. Very basic WIP

    TODO:
    Change it up so animals repopulate over time.
*/
params [
        ["_zoneName","",[""]],
        ["_maxAnimals",10,[0]]
];

if (_zoneName isEqualTo "") exitWith {};
private _animalList = CXP_SETTINGS(getArray,"lista_animais_huntingZone");
private _radius = (getMarkerSize _zoneName) select 0;
private _dist = _radius + 100;
private _zone = getMarkerPos _zoneName;

if (!isNil "animals" && {!(count animals isEqualTo 0)}) then {
    _maxAnimals = _maxAnimals - count(animals);
} else {
    animals = [];
};

private _unitsNear = false;
private _animalsActive = false;
for "_i" from 0 to 1 step 0 do {
    {if ((_x distance _zone) < _dist) exitWith {_unitsNear = true;}; _unitsNear = false;} forEach playableUnits;
    if (_unitsNear && !_animalsActive) then {
        _animalsActive = true;
        for "_i" from 1 to _maxAnimals do {
            _animalClass = selectRandom _animalList;
            _position = [((_zone select 0) - _radius + random (_radius * 2)), ((_zone select 1) - _radius + random (_radius * 2)),0];
            _animal = createAgent [_animalClass,_position,[],0,"FORM"];
            _animal setDir (random 360);
            animals pushBack _animal;
        };
    } else {
        if (!_unitsNear && _animalsActive) then {
            {deleteVehicle _x;} forEach animals;
            animals = [];
            _animalsActive = false;
        };
    };
    uiSleep (3 + random 2);
    _maxAnimals = param [1,10,[0]];
};
