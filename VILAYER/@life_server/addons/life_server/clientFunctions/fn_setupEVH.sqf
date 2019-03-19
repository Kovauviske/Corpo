/*
    File: fn_setupEVH.sqf
    Author: Bryan "Tonic" Boardwine

    Modified: Casperento

    Description:
    Master eventhandler file
*/

//PLAYER EVENT HANDLER
player addEventHandler ["GetOutMan", {_this call cxp_fnc_onGetOutMan}];
player addEventHandler ["Killed", {_this call cxp_fnc_onPlayerKilled}];
player addEventHandler ["handleDamage", {_this call cxp_fnc_handleDamage}];
player addEventHandler ["Respawn", {_this call cxp_fnc_onPlayerRespawn}];
player addEventHandler ["Take", {_this call cxp_fnc_onTakeItem}];
player addEventHandler ["Put",{_this call cxp_fnc_onPutItem}];
player addEventHandler ["Fired", {_this call cxp_fnc_onFired}];
player addEventHandler ["InventoryClosed", {_this call cxp_fnc_inventoryClosed}];
player addEventHandler ["InventoryOpened", {_this call cxp_fnc_inventoryOpened}];
player addEventHandler ["HandleRating", {0}];

//MISSION EVENT HANDLER
addMissionEventHandler ["Map", {_this call cxp_fnc_checkMap}];