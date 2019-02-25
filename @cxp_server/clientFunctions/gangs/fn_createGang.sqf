#include "\cxp_server\script_macros.hpp"
/*
    File: fn_createGang.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Pulls up the menu and creates the gang with the name the user enters in.
*/
disableSerialization;

private _gangName = ctrlText (CONTROL(2520,2522));
private _length = count (toArray(_gangName));
private _chrByte = toArray (_gangName);
private _allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 ");
if (_length > 32) exitWith {hint localize "STR_GNOTF_Over32"};
private _badChar = false;
{if (!(_x in _allowed)) exitWith {_badChar = true;};} forEach _chrByte;
if (_badChar) exitWith {hint localize "STR_GNOTF_IncorrectChar";};
if (BANK < (CXP_SETTINGS(getNumber,"gang_price"))) exitWith {hint format [localize "STR_GNOTF_NotEnoughMoney",[((CXP_SETTINGS(getNumber,"gang_price")) - BANK)] call cxp_fnc_numberText];};

if (cxp_CXPHC_isActive) then {
    [player,getPlayerUID player,_gangName] remoteExec ["CXPHC_fnc_insertGang",CXP_HC];
} else {
    [player,getPlayerUID player,_gangName] remoteExec ["CXPSV_fnc_insertGang",RSERV];
};

if (CXP_SETTINGS(getNumber,"player_advancedLog") isEqualTo 1) then {
    if (CXP_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        advanced_log = format [localize "STR_DL_AL_createdGang_BEF",_gangName,(CXP_SETTINGS(getNumber,"gang_price"))];
    } else {
        advanced_log = format [localize "STR_DL_AL_createdGang",profileName,(getPlayerUID player),_gangName,(CXP_SETTINGS(getNumber,"gang_price"))];
    };
    publicVariableServer "advanced_log";
};

hint localize "STR_NOTF_SendingData";
closeDialog 0;
cxp_action_gangInUse = true;