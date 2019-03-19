#include "\life_server\script_macros.hpp"
/*
    File: fn_chopShopMenu.sqf
    Author: Bryan "Tonic" Boardwine

	Modified : Casperento

    Description:
    Opens & initializes the chop shop menu.
*/
if (cxp_action_inUse) exitWith {hint localize "STR_NOTF_ActionInProc"};
if (playerSide != civilian) exitWith {hint localize "STR_NOTF_notAllowed"};
disableSerialization;
private _chopable = CXP_SETTINGS(getArray,"chopShop_vehicles");
private _nearVehicles = nearestObjects [getMarkerPos (_this select 3),_chopable,25];
private _nearUnits = (nearestObjects[player,["CAManBase"],5]) arrayIntersect playableUnits;
if (count _nearUnits > 1) exitWith {hint localize "STR_NOTF_PlayerNear"};

cxp_chopShop = _this select 3;
//Error check
if (count _nearVehicles isEqualTo 0) exitWith {titleText[localize "STR_Shop_NoVehNear","PLAIN"];};
if !(createDialog "Chop_Shop") exitWith {hint localize "STR_Shop_ChopShopError"};

private _control = CONTROL(39400,39402);
{
    if (alive _x) then {
        private _className = typeOf _x;
        private _classNameCxp = _className;
        private _displayName = getText(configFile >> "CfgVehicles" >> _className >> "displayName");
        private _picture = getText(configFile >> "CfgVehicles" >> _className >> "picture");

        if (!isClass (missionConfigFile >> "CxpCfgVehicles" >> _classNameCxp)) then {
            _classNameCxp = "Default"; //Use Default class if it doesn't exist
            diag_log format["%1: CxpCfgVehicles class doesn't exist",_className];
        };

        private "_price";
        switch (playerSide) do {
          case civilian: {
            _price = M_CONFIG(getNumber,"CxpCfgVehicles",_classNameCxp,"price");
          };
          case west: {
            _price = M_CONFIG(getNumber,"CxpCfgVehicles",_classNameCxp,"price_cop");
          };
          case independent: {
            _price = M_CONFIG(getNumber,"CxpCfgVehicles",_classNameCxp,"price_samu");
          };
        };
        ////////////////////////////////// CALCULO DE PRECO //////////////////////////////////////////////////
        private _chopMultiplier = CXP_SETTINGS(getNumber,"vehicle_chopShop_multiplier");
        private _realChopPrice = _price*_chopMultiplier;
        //////////////////////////////////////////////////////////////////////////////////////////////////////

        if (!isNil "_realChopPrice" && count crew _x isEqualTo 0) then {
            _control lbAdd _displayName;
            _control lbSetData [(lbSize _control)-1,str(_forEachIndex)];
            _control lbSetPicture [(lbSize _control)-1,_picture];
            _control lbSetValue [(lbSize _control)-1,_realChopPrice];
        };
    };
} forEach _nearVehicles;
