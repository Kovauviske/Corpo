#include "\cxp_server\script_macros.hpp"
/*
    File: fn_searchVehAction.sqf
    Author:?
    Modified : Casperento
*/
private _vehicle = cursorObject;
if ((_vehicle isKindOf "Car") || !(_vehicle isKindOf "Air") || !(_vehicle isKindOf "Ship")) then {
    private _owners = _vehicle getVariable "vehicle_info_owners";
    if (isNil "_owners") exitWith {hint localize "STR_NOTF_VehCheat"; deleteVehicle _vehicle;};

    cxp_action_inUse = true;
    hint localize "STR_NOTF_Searching";
    sleep 3;
    cxp_action_inUse = false;

    if (player distance _vehicle > 10 || !alive player || !alive _vehicle) exitWith {hint localize "STR_NOTF_SearchVehFail";};
    _owners = [_owners] call cxp_fnc_vehicleOwners;

    if (_owners isEqualTo "any<br/>") then {_owners = "Sem dono, apreenda!<br/>";};
    hint parseText format [localize "STR_NOTF_SearchVeh",_owners];
};
