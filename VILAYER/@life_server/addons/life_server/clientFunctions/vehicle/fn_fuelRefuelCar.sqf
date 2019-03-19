#include "\life_server\script_macros.hpp"
/*
    File: fn_fuelRefuelCar.sqf
    Author: NiiRoZz

    Description:
    Adds fuel in car.
*/
disableSerialization;
private ["_control","_index","_className","_basePrice","_vehicleInfo","_colorArray","_ctrl"];
_classname = lbData[20302,(lbCurSel 20302)];
_index =  lbValue[20302,(lbCurSel 20302)];

if (isNil "_classname" || _classname isEqualTo "") exitWith {
    hint localize "STR_Select_Vehicle_Pump";
    vehiclefuelList = [];
    cxp_action_inUse = false;
    closeDialog 0;
};

_car = (vehiclefuelList select _index) select 0;
_vehicleInfo = [_className]call cxp_fnc_fetchVehInfo;
_fuelNow = fuel _car;
_fueltank = (_vehicleInfo select 12);
if (_car isKindOf "B_Truck_01_box_F" || _car isKindOf "B_Truck_01_transport_F") then {_fueltank = 350;};//hemtt
if (_car isKindOf "C_Van_01_box_F") then {_fueltank = 100;};
if (_car isKindOf "I_Truck_02_covered_F" || _car isKindOf "I_Truck_02_transport_F") then {_fueltank = 175;};
_fueltoput= ((SliderPosition 20901)-(floor(_fuelnow * _fueltank)));
_setfuell = _fuelnow + (_fueltoput/_fueltank);
_timer = ((_fueltoput * .25)/100);
if (_car distance player > 10 && !(isNull objectParent player)) exitWith {
    hint localize "STR_Distance_Vehicle_Pump";
    vehiclefuelList = [];
    cxp_action_inUse = false;
    closeDialog 0;
};

if ((BANK - (_fueltoput * cxp_fuelPrices))> 0)then {
    cxp_is_processing = true;
	closeDialog 0;
    //Setup our progress bar.
    disableSerialization;
    "progressBar" cutRsc ["cxp_progress","PLAIN"];
    _ui = uiNameSpace getVariable "cxp_progress";
    _progress = _ui displayCtrl 38201;
    _pgText = _ui displayCtrl 38202;
    _pgText ctrlSetText format ["%2 (1%1)...","%","Refuel:"];
    _progress progressSetPosition 0.01;
    _cP = 0.01;
    _tp =0;
    _totalcost = _fueltoput * cxp_fuelPrices;
    for "_i" from 0 to 1 step 0 do {
        uiSleep  _timer;
        _cP = _cP + 0.01;
        _progress progressSetPosition _cP;
        _pgText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%","Refuel:"];
        if (_cP >= 1) exitWith {};
        if (player distance _car > 10) exitWith {};
        if !(isNull objectParent player) exitWith {};
        if !((BANK - round(0.01 * _totalcost))> 0) exitWith {};
        BANK = BANK - round((0.01 * _totalcost));
        [true] call cxp_fnc_hudUpdate;
        _tp = _tp +1;
        if (_tp == 9) then {
            _tp = 0;
            [_car,_cp * _setfuell] remoteExecCall ["cxp_fnc_setFuel",_car];
        };
    };
    "progressBar" cutText ["","PLAIN"];
    if (_car distance player > 10 || !(isNull objectParent player)) then {
        hint localize "STR_Distance_Vehicle_Pump";
        vehiclefuelList = [];
        cxp_is_processing = false;
        cxp_action_inUse = false;
        [0] call CXPSKT_fnc_updatePartial;
        closeDialog 0;
    } else {
        cxp_is_processing = false;
        [0] call CXPSKT_fnc_updatePartial;
    };
} else {
    hint localize "STR_NOTF_NotEnoughMoney";
};

vehiclefuelList = [];
cxp_action_inUse = false;
