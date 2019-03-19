#include "\life_server\script_macros.hpp"
/*
    File: fn_wireTransfer.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Initiates the wire-transfer
*/
params [
    ["_value",0,[0]],
    ["_from","",[""]]
];

if (_value isEqualTo 0 || _from isEqualTo "" || _from isEqualTo profileName) exitWith {}; //No
BANK = BANK + _value;
[true] call cxp_fnc_hudUpdate;
[1] call CXPSKT_fnc_updatePartial;
hint format [localize "STR_ATM_WireTransfer",_from,[_value] call cxp_fnc_numberText];