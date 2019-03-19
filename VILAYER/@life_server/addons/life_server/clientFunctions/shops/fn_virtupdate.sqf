#include "\life_server\script_macros.hpp"
/*
    File: fn_virt_update.sqf
    Author: Bryan "Tonic" Boardwine
    Modified : Casperento
    Description:
    Update and fill the virtual shop menu.
*/
disableSerialization;

//Setup control vars.
private _item_list = CONTROL(2400,2401);
private _gear_list = CONTROL(2400,2402);

//Purge list
lbClear _item_list;
lbClear _gear_list;

if (!isClass(missionConfigFile >> "VirtualShops" >> cxp_shop_type)) exitWith {closeDialog 0; hint localize "STR_NOTF_ConfigDoesNotExist";}; //Make sure the entry exists..
ctrlSetText[2403,localize (M_CONFIG(getText,"VirtualShops",cxp_shop_type,"name"))];
[0, cxp_shop_type] spawn cxp_fnc_retrievePrices;
