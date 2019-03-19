#include "\life_server\script_macros.hpp"
/*
    File: fn_clothingMenu.sqf
    Author: Bryan "Tonic" Boardwine
    Modified : Casperento
    Description:
    Opens and initializes the clothing store menu.
    Started clean, finished messy.
*/
params ["","","",["_shop","",[""]]];

if (_shop isEqualTo "") exitWith {};
if !(isNull objectParent player) exitWith {titleText[localize "STR_NOTF_ActionInVehicle","PLAIN"];};

/* License check & config validation */
if !(isClass(missionConfigFile >> "Clothing" >> _shop)) exitWith {}; //Bad config entry.

private _shopTitle = M_CONFIG(getText,"Clothing",_shop,"title");
private _shopSide = M_CONFIG(getText,"Clothing",_shop,"side");
private _conditions = M_CONFIG(getText,"Clothing",_shop,"conditions");

private _exit = false;

private "_flag";

if !(_shopSide isEqualTo "") then {
    _flag = switch (playerSide) do {case west: {"cop"}; case independent: {"med"}; default {"civ"};};
    if !(_flag isEqualTo _shopSide) then {_exit = true;};
};

if (_exit) exitWith {};

_exit = [_conditions] call cxp_fnc_levelCheck;
if !(_exit) exitWith {hint localize "STR_Shop_Veh_NoLicense";};

//Save old inventory
cxp_oldClothes = uniform player;
cxp_olduniformItems = uniformItems player;
cxp_oldBackpack = backpack player;
cxp_oldVest = vest player;
cxp_oldVestItems = vestItems player;
cxp_oldBackpackItems = backpackItems player;
cxp_oldGlasses = goggles player;
cxp_oldHat = headgear player;

/* Open up the menu */
createDialog "Cxp_Clothing";
disableSerialization;

if (playerSide != civilian) then {ctrlShow[9581,false];};

ctrlSetText [3103,localize _shopTitle];

(findDisplay 3100) displaySetEventHandler ["KeyDown","if ((_this select 1) isEqualTo 1) then {closeDialog 0; varAntiShopDupe = false; [] call cxp_fnc_playerSkins;}"]; //Fix Custom Skin after ESC

sliderSetRange [3107, 0, 360];

//Cop / Civ Pre Check
if (_shop in ["bruce","dive","reb","kart"] && {!(playerSide isEqualTo civilian)}) exitWith {hint localize "STR_Shop_NotaCiv"; closeDialog 0; varAntiShopDupe = false;};
if (_shop == "reb" && {!license_civ_rebel}) exitWith {hint localize "STR_Shop_NotaReb"; closeDialog 0; varAntiShopDupe = false;};
if (_shop == "cop" && {!(playerSide isEqualTo west)}) exitWith {hint localize "STR_Shop_NotaCop"; closeDialog 0; varAntiShopDupe = false;};
if (_shop == "dive" && {!license_civ_dive}) exitWith {hint localize "STR_Shop_NotaDive"; closeDialog 0; varAntiShopDupe = false;};

private ["_pos","_oldPos","_oldDir","_oldBev","_testLogic","_nearVeh","_light"];
private ["_ut1","_ut2","_ut3","_ut4","_ut5"];

if (CXP_SETTINGS(getNumber,"clothing_noTP") isEqualTo 1) then {
    _pos = getPosATL player;
} else {
    if (CXP_SETTINGS(getNumber,"clothing_box") isEqualTo 1) then {
        _pos = [1000,1000,10000];
    } else {
        _pos = switch _shop do {
            case "reb": {[13590,12214.6,0.00141621]};
            case "cop": {[12817.5,16722.9,0.00151062]};
            case "kart": {[14120.5,16440.3,0.00139236]};
            default {[17088.2,11313.6,0.00136757]};
        };
    };

    _oldDir = getDir player;
    _oldPos = visiblePositionASL player;
    _oldBev = behaviour player;

    _testLogic = "Logic" createVehicleLocal _pos;
    _testLogic setPosATL _pos;

    _nearVeh = _testLogic nearEntities ["AllVehicles", 20];

    if (CXP_SETTINGS(getNumber,"clothing_box") isEqualTo 1) then {
        _ut1 = "UserTexture10m_F" createVehicleLocal (_testLogic modelToWorld [0,5,10]);
        _ut1 attachTo [_testLogic,[0,5,5]];
        _ut1 setDir 0;
        _ut2 = "UserTexture10m_F" createVehicleLocal (_testLogic modelToWorld [5,0,10]);
        _ut2 attachTo [_testLogic,[5,0,5]];
        _ut2 setDir (getDir _testLogic) + 90;
        _ut3 = "UserTexture10m_F" createVehicleLocal (_testLogic modelToWorld [-5,0,10]);
        _ut3 attachTo [_testLogic,[-5,0,5]];
        _ut3 setDir (getDir _testLogic) - 90;
        _ut4 = "UserTexture10m_F" createVehicleLocal (_testLogic modelToWorld [0,-5,10]);
        _ut4 attachTo [_testLogic,[0,-5,5]];
        _ut4 setDir 180;
        _ut5 = "UserTexture10m_F" createVehicleLocal (_testLogic modelToWorld [0,0,10]);
        _ut5 attachTo [_testLogic,[0,0,0]];
        _ut5 setObjectTexture [0,"a3\map_data\gdt_concrete_co.paa"];
        detach _ut5;
        _ut5 setVectorDirAndUp [[0,0,-.33],[0,.33,0]];
    };

    _light = "#lightpoint" createVehicleLocal _pos;
    _light setLightBrightness 0.5;
    _light setLightColor [1,1,1];
    _light setLightAmbient [1,1,1];
    _light lightAttachObject [_testLogic, [0,0,0]];

    {
        if (_x != player) then {_x hideObject true;};
        true
    } count playableUnits;

    if (CXP_SETTINGS(getNumber,"clothing_box") isEqualTo 0) then {
        {
            if (_x != player && _x != _light) then {_x hideObject true;};
            true
        } count _nearVeh;
    };

    if (CXP_SETTINGS(getNumber,"clothing_box") isEqualTo 1) then {
        {
            _x setObjectTexture [0,"#(argb,8,8,3)color(0,0,0,1)"];
            true
        } count [_ut1,_ut2,_ut3,_ut4];
    };

    player setBehaviour "SAFE";
    if (_shop == "dive") then {
        player setPosATL [-1000, -1000, 10];
        sleep 0.0005;
    };
    player attachTo [_testLogic,[0,0,0]];
    player switchMove "";
    player setDir 360;
};

cxp_clothing_store = _shop;

/* Store license check */
if (isClass(missionConfigFile >> "Licenses" >> cxp_clothing_store)) then {
    _flag = M_CONFIG(getText,"Licenses",cxp_clothing_store,"side");
    _displayName = M_CONFIG(getText,"Licenses",cxp_clothing_store,"displayName");
    if !(LICENSE_VALUE(cxp_clothing_store,_flag)) exitWith {
        hint format [localize "STR_Shop_YouNeed",localize _displayName];
        closeDialog 0;
        varAntiShopDupe = false; // Nao tire essa var daqui!!
    };
};

//initialize camera view
cxp_shop_cam = "CAMERA" camCreate getPos player;
showCinemaBorder false;
cxp_shop_cam cameraEffect ["Internal", "Back"];
cxp_shop_cam camSetTarget (player modelToWorld [0,0,1]);
cxp_shop_cam camSetPos (player modelToWorld [1,4,2]);
cxp_shop_cam camSetFOV .33;
cxp_shop_cam camSetFocus [50, 0];
cxp_shop_cam camCommit 0;
cxp_cMenu_lock = false;

if (isNull (findDisplay 3100)) exitWith {};

private _list = (findDisplay 3100) displayCtrl 3101;
private _filter = (findDisplay 3100) displayCtrl 3105;
lbClear _filter;
lbClear _list;

_filter lbAdd localize "STR_Shop_UI_Clothing";
_filter lbAdd localize "STR_Shop_UI_Hats";
_filter lbAdd localize "STR_Shop_UI_Glasses";
_filter lbAdd localize "STR_Shop_UI_Vests";
_filter lbAdd localize "STR_Shop_UI_Backpack";

_filter lbSetCurSel 0;

[] call cxp_fnc_playerSkins;

waitUntil {isNull (findDisplay 3100)};
if (CXP_SETTINGS(getNumber,"clothing_noTP") isEqualTo 0) then {
    {
        if (_x != player) then {_x hideObject false;};
        true
    } count playableUnits;
    if (CXP_SETTINGS(getNumber,"clothing_box") isEqualTo 0) then {
        {
            if (_x != player && _x != _light) then {_x hideObject false;};
            true
        } count _nearVeh;
    };
    detach player;
    player setBehaviour _oldBev;
    player setPosASL _oldPos;
    player setDir _oldDir;
    if (CXP_SETTINGS(getNumber,"clothing_box") isEqualTo 1) then {
        {
            deleteVehicle _x;
        } count [_testLogic,_ut1,_ut2,_ut3,_ut4,_ut5,_light];
    } else {
        {
            deleteVehicle _x;
            true
        } count [_testLogic,_light];
    };
};
cxp_shop_cam cameraEffect ["TERMINATE","BACK"];
camDestroy cxp_shop_cam;
cxp_clothing_filter = 0;
if (isNil "cxp_clothesPurchased") exitWith {
    cxp_clothing_purchase = [-1,-1,-1,-1,-1];
    if !(cxp_oldClothes isEqualTo "") then {player addUniform cxp_oldClothes;} else {removeUniform player};
    if !(cxp_oldHat isEqualTo "") then {player addHeadgear cxp_oldHat} else {removeHeadgear player;};
    if !(cxp_oldGlasses isEqualTo "") then {player addGoggles cxp_oldGlasses;} else {removeGoggles player};
    if !(backpack player isEqualTo "") then {
        if (cxp_oldBackpack isEqualTo "") then {
            removeBackpack player;
        } else {
            removeBackpack player;
            player addBackpack cxp_oldBackpack;
            clearAllItemsFromBackpack player;
            if (count cxp_oldBackpackItems > 0) then {
                {
                    [_x,true,true] call cxp_fnc_handleItem;
                    true
                } count cxp_oldBackpackItems;
            };
        };
    };

    if (count cxp_oldUniformItems > 0) then {
        {
            [_x,true,false,false,true] call cxp_fnc_handleItem;
            true
        } count cxp_oldUniformItems;
    };

    if (vest player != "") then {
        if (cxp_oldVest isEqualTo "") then {
            removeVest player;
        } else {
            player addVest cxp_oldVest;
            if (count cxp_oldVestItems > 0) then {
                {
                    [_x,true,false,false,true] call cxp_fnc_handleItem;
                    true
                } count cxp_oldVestItems;
            };
        };
    };
    [] call cxp_fnc_playerSkins;
};
cxp_clothesPurchased = nil;

//Check uniform purchase.
if ((cxp_clothing_purchase select 0) isEqualTo -1) then {
    if (cxp_oldClothes != uniform player) then {player addUniform cxp_oldClothes;};
};
//Check hat
if ((cxp_clothing_purchase select 1) isEqualTo -1) then {
    if (cxp_oldHat != headgear player) then {
        if (cxp_oldHat isEqualTo "") then {
            removeHeadGear player;
        } else {
            player addHeadGear cxp_oldHat;
        };
    };
};
//Check glasses
if ((cxp_clothing_purchase select 2) isEqualTo -1) then {
    if (cxp_oldGlasses != goggles player) then {
        if (cxp_oldGlasses isEqualTo "") then  {
            removeGoggles player;
        } else {
            player addGoggles cxp_oldGlasses;
        };
    };
};
//Check Vest
if ((cxp_clothing_purchase select 3) isEqualTo -1) then {
    if (cxp_oldVest != vest player) then {
        if (cxp_oldVest isEqualTo "") then {removeVest player;} else {
            player addVest cxp_oldVest;
            {
                [_x,true,false,false,true] call cxp_fnc_handleItem;
                true
            } count cxp_oldVestItems;
        };
    };
};

//Check Backpack
if ((cxp_clothing_purchase select 4) isEqualTo -1) then {
    if (cxp_oldBackpack != backpack player) then {
        if (cxp_oldBackpack isEqualTo "") then {removeBackpack player;} else {
            removeBackpack player;
            player addBackpack cxp_oldBackpack;
            {
                [_x,true,true] call cxp_fnc_handleItem;
                true
            } count cxp_oldBackpackItems;
        };
    };
};

cxp_clothing_purchase = [-1,-1,-1,-1,-1];
[] call cxp_fnc_saveGear;
