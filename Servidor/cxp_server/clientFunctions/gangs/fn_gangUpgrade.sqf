#include "\cxp_server\script_macros.hpp"
/*
    File: fn_gangUpgrade.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Casperento
    Description:
    Determinds the upgrade price and blah
*/
if (group player getVariable "gang_maxMembers" >= CXP_SETTINGS(getNumber,"gang_memberLimit")) exitWith {
    hint format["Sua gangue já atingiu o limite de membros permitidos no servidor!\n>>(%1)<<",CXP_SETTINGS(getNumber,"gang_memberLimit")];
};

private _maxMembers = group player getVariable ["gang_maxMembers",8];
private _slotUpgrade = _maxMembers + 4;

if (_slotUpgrade > CXP_SETTINGS(getNumber,"gang_memberLimit")) exitWith {
    hint format ["O numero maximo de membros de sua gangue foi ajustado, gratuitamente, para o limite permitido no servidor!\n>>(%1)<<",CXP_SETTINGS(getNumber,"gang_memberLimit")];
    group player setVariable ["gang_maxMembers",CXP_SETTINGS(getNumber,"gang_memberLimit"),true];    
};

private _upgradePrice = round(_slotUpgrade * ((CXP_SETTINGS(getNumber,"gang_upgradeBase"))) / ((CXP_SETTINGS(getNumber,"gang_upgradeMultiplier"))));

private _action = [
    format [(localize "STR_GNOTF_MaxMemberMSG")+ "<br/><br/>" +(localize "STR_GNOTF_CurrentMax")+ "<br/>" +(localize "STR_GNOTF_UpgradeMax")+ "<br/>" +(localize "STR_GNOTF_Price")+ " <t color='#8cff9b'>$%3</t>",_maxMembers,_slotUpgrade,[_upgradePrice] call cxp_fnc_numberText],
    localize "STR_Gang_UpgradeMax",
    localize "STR_Global_Buy",
    localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if (_action) then {
    if (BANK < _upgradePrice) exitWith {
        hint parseText format [
            (localize "STR_GNOTF_NotEoughMoney_2")+ "<br/><br/>" +(localize "STR_GNOTF_Current")+ " <t color='#8cff9b'>$%1</t><br/>" +(localize "STR_GNOTF_Lacking")+ " <t color='#FF0000'>$%2</t>",
            [BANK] call cxp_fnc_numberText,
            [_upgradePrice - BANK] call cxp_fnc_numberText
        ];
    };
    BANK = BANK - _upgradePrice;
    [true] call cxp_fnc_hudUpdate;
    [1] call CXPSKT_fnc_updatePartial;
    group player setVariable ["gang_maxMembers",_slotUpgrade,true];
    hint parseText format [localize "STR_GNOTF_UpgradeSuccess",_maxMembers,_slotUpgrade,[_upgradePrice] call cxp_fnc_numberText];

    if (cxp_CXPHC_isActive) then {
        [2,group player] remoteExec ["CXPHC_fnc_updateGang",CXP_HC];
    } else {
        [2,group player] remoteExec ["CXPSV_fnc_updateGang",RSERV];
    };

} else {
    hint localize "STR_GNOTF_UpgradeCancel";
};
