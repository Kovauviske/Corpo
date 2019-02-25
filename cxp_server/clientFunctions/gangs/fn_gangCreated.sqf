#include "\cxp_server\script_macros.hpp"
/*
    File: fn_gangCreated.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Casperento
    Description:
    Tells the player that the gang is created and throws him into it.
*/
cxp_action_gangInUse = nil;

if (BANK < (CXP_SETTINGS(getNumber,"gang_price"))) exitWith {
    hint format [localize "STR_GNOTF_NotEnoughMoney",[((CXP_SETTINGS(getNumber,"gang_price"))-BANK)] call cxp_fnc_numberText];
    {group player setVariable [_x,nil,true];} forEach ["gang_owner","gang_name","gang_members","gang_maxmembers","gang_bank"];
    [5,group player] remoteExec ["CXPSV_fnc_updateGang",RSERV];
    group player setVariable ["gang_id",nil,true];
};

BANK = BANK - CXP_SETTINGS(getNumber,"gang_price");
[true] call cxp_fnc_hudUpdate;
[1] call CXPSKT_fnc_updatePartial;

hint format [localize "STR_GNOTF_CreateSuccess",(group player) getVariable "gang_name",[(CXP_SETTINGS(getNumber,"gang_price"))] call cxp_fnc_numberText];