#include "\cxp_server\script_macros.hpp"
/*
    File: fn_sellHouse.sqf
    Author: Bryan "Tonic" Boardwine
    Modified : NiiRoZz && Casperento
    Description:
    Sells the house and delete all container near house.
*/
if (contadorAntiCheat >= 0) then {["checagem",true] spawn cxp_fnc_antiSellBug;};
if (varAntidupe) exitWith {["suspeito",true] spawn cxp_fnc_antiSellBug;cxp_action_delay = time;closeDialog 0;};

private _house = param [0,objNull,[objNull]];
private _uid = getPlayerUID player;

if (isNull _house) exitWith {};
if (!(_house isKindOf "House_F")) exitWith {};
if (isNil {_house getVariable "house_owner"}) exitWith {hint localize "STR_House_noOwner";};

//Anti-dupe
if ((time - cxp_action_delay) < 0.2) exitWith {hint localize "STR_NOTF_ActionDelay";};
cxp_action_delay = time;
closeDialog 0;

private _houseCfg = [(typeOf _house)] call cxp_fnc_houseConfig;
if (count _houseCfg isEqualTo 0) exitWith {};

private _action = [
    format [localize "STR_House_SellHouseMSG",
    (round((_houseCfg select 0)/2)) call cxp_fnc_numberText,
    (_houseCfg select 1)],localize "STR_pInAct_SellHouse",localize "STR_Global_Sell",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if (_action) then {
    _house setVariable ["house_sold",true,true];

    if (cxp_CXPHC_isActive) then {
        [_house] remoteExecCall ["CXPHC_fnc_sellHouse",CXP_HC];
    } else {
        [_house] remoteExecCall ["CXPSV_fnc_sellHouse",RSERV];
    };

    _house setVariable ["locked",false,true];
    deleteMarkerLocal format ["house_%1",_house getVariable "uid"];
    _house setVariable ["uid",nil,true];

    BANK = BANK + (round((_houseCfg select 0)/2));
	[true] call cxp_fnc_hudUpdate;
    [1] call CXPSKT_fnc_updatePartial;

    if (CXP_SETTINGS(getNumber,"player_advancedLog") isEqualTo 1) then {
        if (CXP_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
            advanced_log = format [localize "STR_DL_AL_soldHouse_BEF",(round((_houseCfg select 0)/2)),[BANK] call cxp_fnc_numberText];
        } else {
            advanced_log = format [localize "STR_DL_AL_soldHouse",profileName,(getPlayerUID player),(round((_houseCfg select 0)/2)),[BANK] call cxp_fnc_numberText];
        };
        publicVariableServer "advanced_log";
    };
	
	private _index = cxp_vehicles find _house;
    if !(_index isEqualTo -1) then {cxp_vehicles deleteAt _index;};

    _index = [str(getPosATL _house),cxp_houses] call CXPSV_fnc_index;
    if !(_index isEqualTo -1) then {cxp_houses deleteAt _index;};
    _numOfDoors = FETCH_CONFIG2(getNumber,"CfgVehicles",(typeOf _house), "numberOfDoors");
    for "_i" from 1 to _numOfDoors do {
        _house setVariable [format ["bis_disabled_Door_%1",_i],0,true];
    };
    _containers = _house getVariable ["containers",[]];
    if (count _containers > 0) then {
        {
            _x setVariable ["Trunk",nil,true];

            if (cxp_CXPHC_isActive) then {
                [_x] remoteExecCall ["CXPHC_fnc_sellHouseContainer",CXP_HC];
            } else {
                [_x] remoteExecCall ["CXPSV_fnc_sellHouseContainer",RSERV];
            };

        } forEach _containers;
    };
    _house setVariable ["containers",nil,true];
};
