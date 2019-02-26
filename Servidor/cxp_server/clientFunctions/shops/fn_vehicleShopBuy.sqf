#include "\cxp_server\script_macros.hpp"
/*
    File: fn_vehicleShopBuy.sqf
    Author: Bryan "Tonic" Boardwine

	Modified : Casperento

    Description:
    Does something with vehicle purchasing.
*/
params [
  ["_mode",true,[true]],
  ["_gOnlyOrNot", false, [false]]
];

if ((lbCurSel 2302) isEqualTo -1) exitWith {hint localize "STR_Shop_Veh_DidntPick";cxp_action_delay = time;closeDialog 0;};

private _className = lbData[2302,(lbCurSel 2302)];
private _vIndex = lbValue[2302,(lbCurSel 2302)];
private _vehicleList = M_CONFIG(getArray,"CarShops",(cxp_veh_shop select 0),"vehicles");
private _shopSide = M_CONFIG(getText,"CarShops",(cxp_veh_shop select 0),"side");

//Anti-dupe
if ((time - cxp_action_delay) < 0.2) exitWith {hint localize "STR_NOTF_ActionDelay";};

private "_initalPrice";
private "_buyMultiplier";
private "_rentMultiplier";
switch (playerSide) do {
  case civilian: {
    _initalPrice = M_CONFIG(getNumber,"CxpCfgVehicles",_className,"price");
  };
  case west: {
    _initalPrice = M_CONFIG(getNumber,"CxpCfgVehicles",_className,"price_cop");
  };
  case independent: {
    _initalPrice = M_CONFIG(getNumber,"CxpCfgVehicles",_className,"price_samu");
  };
};
////////////////////////////////// CALCULO DE PRECO //////////////////////////////////////////////////
switch (playerSide) do {
  case civilian : {
    if (FETCH_CONST(cxp_donorlevel) isEqualTo 1) then { // VIP 1
      _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_umpLic");
      _rentMultiplier = CXP_SETTINGS(getNumber,"vehicle_rental_multiplier_umpLic");
    }else{
      if (FETCH_CONST(cxp_donorlevel) isEqualTo 2) then { // VIP 2
        _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_uiLic");
        _rentMultiplier = CXP_SETTINGS(getNumber,"vehicle_rental_multiplier_uiLic");
      }else{
        if (FETCH_CONST(cxp_donorlevel) isEqualTo 3) then { // VIP 3
          _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_typeLic");
          _rentMultiplier = CXP_SETTINGS(getNumber,"vehicle_rental_multiplier_typeLic");
        }else{
          if (FETCH_CONST(cxp_donorlevel) in [5,6]) then { // VIP 4
            _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_typeLis");
            _rentMultiplier = CXP_SETTINGS(getNumber,"vehicle_rental_multiplier_typeLis");
          }else{ // sem vip
            _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_CIVILIAN");
            _rentMultiplier = CXP_SETTINGS(getNumber,"vehicle_rental_multiplier_CIVILIAN");
          };
        };
      };
    };
  };
  case west: {
    _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_COP");
    _rentMultiplier = CXP_SETTINGS(getNumber,"vehicle_rental_multiplier_COP");
  };
  case independent: {
    _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_MEDIC");
    _rentMultiplier = CXP_SETTINGS(getNumber,"vehicle_rental_multiplier_MEDIC");
  };
  case east: {
    _buyMultiplier = CXP_SETTINGS(getNumber,"purchase_multiplier_OPFOR");
    _rentMultiplier = CXP_SETTINGS(getNumber,"vehicle_rental_multiplier_OPFOR");
  };
};
private _originalPrice = _initalPrice*_buyMultiplier;
private _rentOriginalPrice = _originalPrice*_rentMultiplier;
///////////////////////////////////////////////////////////////////////////////////////////////////////////

private "_purchasePrice";
private _gPlayerSaldo = GANG_FUNDS;

if (_mode) then {
	_purchasePrice = round(_originalPrice);
} else {
	_purchasePrice = round(_rentOriginalPrice);
};

private _conditions = M_CONFIG(getText,"CxpCfgVehicles",_className,"conditions");

if !([_conditions] call cxp_fnc_levelCheck) exitWith {cxp_action_delay = time;closeDialog 0;hint localize "STR_Shop_Veh_NoLicense";};

private _colorIndex = lbValue[2304,(lbCurSel 2304)];

if (_purchasePrice < 0) exitWith {cxp_action_delay = time;closeDialog 0;}; //Bad price entry
if (CASH < _purchasePrice && !(_gOnlyOrNot)) exitWith {hint format [localize "STR_Shop_Veh_NotEnough",[_purchasePrice - CASH] call cxp_fnc_numberText];cxp_action_delay = time;closeDialog 0;};

private _spawnPoints = cxp_veh_shop select 1;
private _spawnPoint = "";

if ((cxp_veh_shop select 0) isEqualTo "med_air_hs") then {
    if (nearestObjects[(getMarkerPos _spawnPoints),["Air"],35] isEqualTo []) exitWith {_spawnPoint = _spawnPoints};
} else {
    //Check if there is multiple spawn points and find a suitable spawnpoint.
    if (_spawnPoints isEqualType []) then {
        //Find an available spawn point.
        {
            if ((nearestObjects[(getMarkerPos _x),["Car","Ship","Air"],5]) isEqualTo []) exitWith {_spawnPoint = _x};
            true
        } count _spawnPoints;
    } else {
        if (nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air"],5] isEqualTo []) exitWith {_spawnPoint = _spawnPoints};
    };
};

if (_spawnPoint isEqualTo "") exitWith {hint localize "STR_Shop_Veh_Block"; cxp_action_delay = time; closeDialog 0;};

if (_mode && _gOnlyOrNot) then {
  if (_purchasePrice > _gPlayerSaldo) exitWith {cxp_action_delay = time;closeDialog 0;hint localize "STR_ATM_NotEnoughtMInGangAcc";};
  [3,_purchasePrice,1] call cxp_fnc_buyWithGang;

  [0] call CXPSKT_fnc_updatePartial;
  hint format [localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_purchasePrice] call cxp_fnc_numberText];

  //Spawn the vehicle and prep it.

  private "_vehicle";

  if ((cxp_veh_shop select 0) isEqualTo "med_air_hs") then {
      _vehicle = createVehicle [_className,[0,0,999],[], 0, "NONE"];
      waitUntil {!isNil "_vehicle" && {!isNull _vehicle}}; //Wait?
      _vehicle allowDamage false;
    //  if (_spawnPoint isEqualTo "medic_spawn_atr_heli") then {
    //    _vehicle setPosATL ((nearestObjects[getMarkerPos _spawnPoint,["Land_Hospital_side2_F"],50] select 0) modelToWorld [-0.4,-4,12.65]);
    //  } else {
        _vehicle setPos (getMarkerPos _spawnPoint);
        _vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
    //  };
      sleep 0.6;
  } else {
      _vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
      waitUntil {!isNil "_vehicle" && {!isNull _vehicle}}; //Wait?
      _vehicle allowDamage false; //Temp disable damage handling..
      _vehicle setPos (getMarkerPos _spawnPoint);
      _vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
      _vehicle setDir (markerDir _spawnPoint);
  };

  _vehicle lock 2;

  [_vehicle,_colorIndex] call cxp_fnc_colorVehicle;
  [_vehicle,(typeOf _vehicle)] call cxp_fnc_clearVehicleAmmo;
	_vehicle setVariable ["trunk_in_use",false,true];
    _vehicle setVariable ["trunk_in_use_by",objNull,true];
	_vehicle setVariable ["vehicle_info_owners",[[getPlayerUID player,profileName]],true];

  _vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.

  //Side Specific actions.
  switch (playerSide) do {
      case west: {
          [_vehicle,"cop_offroad",true] spawn cxp_fnc_vehicleAnimate;
      };
      case civilian: {
          if ((cxp_veh_shop select 2) isEqualTo "civ" && {_className isEqualTo "B_Heli_Light_01_F"}) then {
              [_vehicle,"civ_littlebird",true] spawn cxp_fnc_vehicleAnimate;
          };
      };
      case independent: {
          [_vehicle,"med_offroad",true] spawn cxp_fnc_vehicleAnimate;
      };
  };

  _vehicle allowDamage true;

  cxp_vehicles pushBack _vehicle;

  //Always handle key management by the server
  [getPlayerUID player,playerSide,_vehicle,1] remoteExecCall ["CXPSV_fnc_keyManagement",RSERV];

  if (_mode) then {
      if !(_className in CXP_SETTINGS(getArray,"vehicleShop_rentalOnly")) then {
          if (cxp_CXPHC_isActive) then {
              [(getPlayerUID player),playerSide,_vehicle,_colorIndex] remoteExecCall ["CXPHC_fnc_vehicleCreate",CXP_HC];
          } else {
              [(getPlayerUID player),playerSide,_vehicle,_colorIndex] remoteExecCall ["CXPSV_fnc_vehicleCreate",RSERV];
          };
      };
  };

  if (CXP_SETTINGS(getNumber,"player_advancedLog") isEqualTo 1) then {
      if (CXP_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
          advanced_log = format [localize "STR_DL_AL_boughtVehicle_BEF",_className,[_purchasePrice] call cxp_fnc_numberText,[CASH] call cxp_fnc_numberText,[BANK] call cxp_fnc_numberText];
      } else {
          advanced_log = format [localize "STR_DL_AL_boughtVehicle",profileName,(getPlayerUID player),_className,[_purchasePrice] call cxp_fnc_numberText,[CASH] call cxp_fnc_numberText,[BANK] call cxp_fnc_numberText];
      };
      publicVariableServer "advanced_log";
  };

  cxp_action_delay = time;
  closeDialog 0; //Exit the menu.
  true;
}else{
  CASH = CASH - _purchasePrice;
  [true] call cxp_fnc_hudUpdate;
  [0] call CXPSKT_fnc_updatePartial;
  hint format [localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_purchasePrice] call cxp_fnc_numberText];

  //Spawn the vehicle and prep it.

  private "_vehicle";

  if ((cxp_veh_shop select 0) isEqualTo "med_air_hs") then {
      _vehicle = createVehicle [_className,[0,0,999],[], 0, "NONE"];
      waitUntil {!isNil "_vehicle" && {!isNull _vehicle}}; //Wait?
      _vehicle allowDamage false;
    // Spawn de um hospital montado via script
    //  if (_spawnPoint isEqualTo "medic_spawn_atr_heli") then {
    //    _vehicle setPosATL ((nearestObjects[getMarkerPos _spawnPoint,["Land_Hospital_side2_F"],50] select 0) modelToWorld [-0.4,-4,12.65]);
    //  } else {
        _vehicle setPos (getMarkerPos _spawnPoint);
        _vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
    //  };
      sleep 0.6;
  } else {
      _vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
      waitUntil {!isNil "_vehicle" && {!isNull _vehicle}}; //Wait?
      _vehicle allowDamage false; //Temp disable damage handling..
      _vehicle setPos (getMarkerPos _spawnPoint);
      _vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
      _vehicle setDir (markerDir _spawnPoint);
  };

  _vehicle lock 2;

  [_vehicle,_colorIndex] call cxp_fnc_colorVehicle;
  [_vehicle,(typeOf _vehicle)] call cxp_fnc_clearVehicleAmmo;
	_vehicle setVariable ["trunk_in_use",false,true];
	_vehicle setVariable ["vehicle_info_owners",[[getPlayerUID player,profileName]],true];

  _vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.

  //Side Specific actions.
  switch (playerSide) do {
      case west: {
          [_vehicle,"cop_offroad",true] spawn cxp_fnc_vehicleAnimate;
      };
      case civilian: {
          if ((cxp_veh_shop select 2) isEqualTo "civ" && {_className isEqualTo "B_Heli_Light_01_F"}) then {
            [_vehicle,"civ_littlebird",true] spawn cxp_fnc_vehicleAnimate;
          };
      };
      case independent: {
          [_vehicle,"med_offroad",true] spawn cxp_fnc_vehicleAnimate;
      };
  };

  _vehicle allowDamage true;

  cxp_vehicles pushBack _vehicle;

  //Always handle key management by the server
  [getPlayerUID player,playerSide,_vehicle,1] remoteExecCall ["CXPSV_fnc_keyManagement",RSERV];

  if (_mode) then {
      if !(_className in CXP_SETTINGS(getArray,"vehicleShop_rentalOnly")) then {
          if (cxp_CXPHC_isActive) then {
              [(getPlayerUID player),playerSide,_vehicle,_colorIndex] remoteExecCall ["CXPHC_fnc_vehicleCreate",CXP_HC];
          } else {
              [(getPlayerUID player),playerSide,_vehicle,_colorIndex] remoteExecCall ["CXPSV_fnc_vehicleCreate",RSERV];
          };
      };
  };

  if (CXP_SETTINGS(getNumber,"player_advancedLog") isEqualTo 1) then {
      if (CXP_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
          advanced_log = format [localize "STR_DL_AL_boughtVehicle_BEF",_className,[_purchasePrice] call cxp_fnc_numberText,[CASH] call cxp_fnc_numberText,[BANK] call cxp_fnc_numberText];
      } else {
          advanced_log = format [localize "STR_DL_AL_boughtVehicle",profileName,(getPlayerUID player),_className,[_purchasePrice] call cxp_fnc_numberText,[CASH] call cxp_fnc_numberText,[BANK] call cxp_fnc_numberText];
      };
      publicVariableServer "advanced_log";
  };

  cxp_action_delay = time;
  closeDialog 0; //Exit the menu.
  true;
};
[true] call cxp_fnc_hudUpdate;