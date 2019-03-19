/*
    File: fn_updateViewDistance.sqf
    Author: Bryan "Tonic" Boardwine
    
    Description:
    Updates the view distance dependant on whether the player is on foot, a car or an aircraft.
*/
switch (true) do    
{
    case ((vehicle player) isKindOf "CAManBase"): {setViewDistance cxp_settings_viewDistanceFoot};
    case ((vehicle player) isKindOf "LandVehicle"): {setViewDistance cxp_settings_viewDistanceCar};
    case ((vehicle player) isKindOf "Ship"): {setViewDistance cxp_settings_viewDistanceCar};
    case ((vehicle player) isKindOf "Air"): {setViewDistance cxp_settings_viewDistanceAir};
};
