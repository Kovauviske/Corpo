#include "\cxp_server\script_macros.hpp"
/*
    File: fn_buyHouseGarage.sqf
    Author: BoGuu
    Description:
    Buy functionality for house garages.
*/
private _house = param [0,objNull,[objNull]];

if (isNull _house) exitWith {};
if (_house getVariable ["garageBought",false]) exitWith {hint localize "STR_Garage_alreadyOwned";};
if ((_house getVariable "house_owner") select 0 != getPlayerUID player) exitWith {hint localize "STR_Garage_NotOwner";};
if (_house getVariable ["blacklistedGarage",false]) exitWith {};
closeDialog 0;

private _houseCfg = [(typeOf _house)] call cxp_fnc_houseConfig;
private _price = (_houseCfg select 0);
if (count _houseCfg isEqualTo 0) exitWith {};

_action = [
    format [localize "STR_Garage_HouseBuyMSG",[_price] call cxp_fnc_numberText],
    localize "STR_House_GaragePurchase",
    localize "STR_Global_Buy",
    localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if (_action) then {

    if (BANK < _price) exitWith {hint format [localize "STR_House_NotEnough"]};
    BANK = BANK - _price;
    [true] call cxp_fnc_hudUpdate;
    [1] call CXPSKT_fnc_updatePartial;

    if (cxp_CXPHC_isActive) then {
        [(getPlayerUID player),_house] remoteExec ["CXPHC_fnc_houseGarage",CXP_HC];
    } else {
        [(getPlayerUID player),_house] remoteExec ["CXPSV_fnc_houseGarage",RSERV];
    };
	
      if (CXP_SETTINGS(getNumber,"player_advancedLog") isEqualTo 1) then {
          if (CXP_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
              advanced_log = format [localize "STR_DL_AL_boughtGarage_BEF",[_price] call cxp_fnc_numberText,[BANK] call cxp_fnc_numberText,[CASH] call cxp_fnc_numberText];
          } else {
              advanced_log = format [localize "STR_DL_AL_boughtGarage",profileName,(getPlayerUID player),[_price] call cxp_fnc_numberText,[BANK] call cxp_fnc_numberText,[CASH] call cxp_fnc_numberText];
          };
          publicVariableServer "advanced_log";
      };
	  
	  _house setVariable ["garageBought",true,true];
	  _house setVariable ["house_owner",[(getplayeruid player),profileName],true];
	  _house setVariable ["uid",round(random 99999),true];

      cxp_vehicles pushBack _house;
      cxp_houses pushBack [str(getPosATL _house),[]];
      private _marker = createMarkerLocal [format ["house_%1",(_house getVariable "uid")],getPosATL _house];
      private _houseName = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _house), "displayName");
      _marker setMarkerTextLocal _houseName;
      _marker setMarkerColorLocal "ColorBlue";
      _marker setMarkerTypeLocal "loc_Lighthouse";

};
