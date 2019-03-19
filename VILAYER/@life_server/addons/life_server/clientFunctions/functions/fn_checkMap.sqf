/*
    File: fn_checkMap.sqf
    Author: DomT602
	Modified: Casperento
    Description:
    Checks if the map is being opened or closed, then puts markers according to side.
*/
params [
	["_mapOpen",false,[false]]
];

if (_mapOpen) then {
    switch playerSide do {
        case west: {[] spawn cxp_fnc_copMarkers};
        case independent: {[] spawn cxp_fnc_medicMarkers};
        case civilian: {[] spawn cxp_fnc_civMarkers};
    };
};