#include "\cxp_server\script_macros.hpp"
/*
    File: fn_s_onSliderChange.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Called when the slider is changed for any field and updates the view distance for it.
*/
private ["_mode","_value"];
_mode = [_this,0,-1,[0]] call BIS_fnc_param;
_value = [_this,1,-1,[0]] call BIS_fnc_param;
if (_mode isEqualTo -1 || _value isEqualTo -1) exitWith {};
disableSerialization;

switch (_mode) do {
    case 0:
    {
        cxp_settings_viewDistanceFoot = round(_value);
        ctrlSetText[2902,format ["%1",round(_value)]];
        [] call cxp_fnc_updateViewDistance;
        profileNamespace setVariable ["cxp_viewDistanceFoot",round(_value)];
    };

    case 1:
    {
        cxp_settings_viewDistanceCar = round(_value);
        ctrlSetText[2912,format ["%1",round(_value)]];
        [] call cxp_fnc_updateViewDistance;
        profileNamespace setVariable ["cxp_viewDistanceCar",round(_value)];
    };

    case 2:
    {
        cxp_settings_viewDistanceAir = round(_value);
        ctrlSetText[2922,format ["%1",round(_value)]];
        [] call cxp_fnc_updateViewDistance;
        profileNamespace setVariable ["cxp_viewDistanceAir",round(_value)];
    };

    case 3: {
        _classname = lbData[20302,(lbCurSel 20302)];
        _index =  lbValue[20302,(lbCurSel 20302)];
        if ((lbCurSel 20302) isEqualTo -1) exitWith {hint localize "STR_Select_Vehicle_Pump";};
        if (!isNil "_classname" || _classname =="") then {
            _car = (vehiclefuelList select _index) select 0;
            _vehicleInfo = [_className] call cxp_fnc_fetchVehInfo;
            _fuel = fuel _car;
            _fueltank = (_vehicleInfo select 12);
            if (_car isKindOf "B_Truck_01_box_F" || _car isKindOf "B_Truck_01_transport_F") then {
                _fueltank = 450;
            };
            ctrlSetText [20324,format ["Combustivel: %1 litros",round(_value) - (floor(_fuel * _fueltank))]];
            ctrlSetText [20323,format ["Total: R$%1",round (cxp_fuelPrices * (round(_value) -(floor(_fuel * _fueltank)))) ]];
        } else {
            hint localize "STR_Select_Vehicle_Pump";
        };
    };

    case 4: {
        player setDir (360 - _value);
    };
};
