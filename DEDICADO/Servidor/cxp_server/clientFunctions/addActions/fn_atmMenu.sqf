#include "\cxp_server\script_macros.hpp"
/*
    File: fn_atmMenu.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Casperento
    Description:
    Opens and manages the bank menu.
*/

if !(cxp_use_atm) exitWith {
    hint format [localize "STR_Shop_ATMRobbed",(CXP_SETTINGS(getNumber,"noatm_timer"))];
};

if !(dialog) then {
    if (!(createDialog "cxp_atm_menu")) exitWith {};
};

disableSerialization;
private _units = CONTROL(2700,2703);

lbClear _units;
CONTROL(2700,2701) ctrlSetStructuredText parseText format ["<img size='1.7' image='icons\ico_bank.paa'/> R$%1<br/><img size='1.6' image='icons\ico_money.paa'/> $%2",[BANK] call cxp_fnc_numberText,[CASH] call cxp_fnc_numberText];

{
    private "_type";
    private _name = _x getVariable ["realname",name _x];
    if (alive _x && !(_name isEqualTo profileName)) then {
        switch (side _x) do {
            case west: {_type = "Cop"};
            case civilian: {_type = "Civ"};
            case independent: {_type = "MED"};
        };
        _units lbAdd format ["%1 (%2)",_x getVariable ["realname",name _x],_type];
        _units lbSetData [(lbSize _units)-1,str(_x)];
    };
} forEach playableUnits;

lbSetCurSel [2703,0];

if (isNil {(group player getVariable "gang_bank")}) then {
    (CONTROL(2700,2705)) ctrlEnable false;
    (CONTROL(2700,2706)) ctrlEnable false;
};
