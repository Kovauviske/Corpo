#include "\life_server\script_macros.hpp"
/*
    File: fn_sellHouseGarage.sqf
    Author: BoGuu
    Modified : Casperento
    Description:
    Sell functionality for house garages.
*/
if (contadorAntiCheat >= 0) then {["checagem",true] spawn cxp_fnc_antiSellBug;};
if (varAntidupe) exitWith {["suspeito",true] spawn cxp_fnc_antiSellBug;cxp_action_delay = time;closeDialog 0;};

private _house = param [0,objNull,[objNull]];
private _uid = getPlayerUID player;

if (isNull _house) exitWith {};
if !(_house getVariable ["garageBought",false]) exitWith {hint localize "STR_Garage_NotOwned";};
if ((_house getVariable "house_owner") select 0 != getPlayerUID player) exitWith {hint localize "STR_Garage_NotOwner";};

//Anti-dupe
if ((time - cxp_action_delay) < 0.2) exitWith {hint localize "STR_NOTF_ActionDelay";};
cxp_action_delay = time;

closeDialog 0;

private _houseCfg = [(typeOf _house)] call cxp_fnc_houseConfig;
private _sellPrice = (round((_houseCfg select 0)/2));
if (count _houseCfg isEqualTo 0) exitWith {};

private _action = [
    format [localize "STR_House_SellGarageMSG",[_sellPrice] call cxp_fnc_numberText],
    localize "STR_House_GarageSell",
    localize "STR_Global_Sell",
    localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if (_action) then {

    if (cxp_CXPHC_isActive) then {
        [_uid,_house,1] remoteExec ["CXPHC_fnc_houseGarage",CXP_HC];
    } else {
        [_uid,_house,1] remoteExec ["CXPSV_fnc_houseGarage",RSERV];
    };

    BANK = BANK + _sellPrice;
	[true] call cxp_fnc_hudUpdate;
    [1] call CXPSKT_fnc_updatePartial;
	
	private _index = cxp_vehicles find _house;
    if !(_index isEqualTo -1) then {cxp_vehicles deleteAt _index;};

    _house setVariable ["garageBought",false,true];
	deleteMarkerLocal format["house_%1",(_house getVariable "uid")];
	_house setVariable ["uid",-1,true];

    if (CXP_SETTINGS(getNumber,"player_advancedLog") isEqualTo 1) then {
        if (CXP_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
            advanced_log = format [localize "STR_DL_AL_soldGarage_BEF",[_sellPrice] call cxp_fnc_numberText,[BANK] call cxp_fnc_numberText];
        } else {
            advanced_log = format [localize "STR_DL_AL_soldGarage",profileName,(getPlayerUID player),[_sellPrice] call cxp_fnc_numberText,[BANK] call cxp_fnc_numberText];
        };
        publicVariableServer "advanced_log";
    };
	
};
