#include "\cxp_server\script_macros.hpp"
/*
    File: fn_receiveMoney.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Receives money
*/

params [
    ["_unit",objNull,[objNull]],
    ["_val","",[""]],
    ["_from",objNull,[objNull]]
];

if (isNull _unit || isNull _from || _val isEqualTo "") exitWith {};
if !(player isEqualTo _unit) exitWith {};
if (!([_val] call CXPSV_fnc_isnumber)) exitWith {};
if (_unit == _from) exitWith {}; //Bad boy, trying to exploit his way to riches.

hint format [localize "STR_NOTF_GivenMoney",_from getVariable ["realname",name _from],[(parseNumber (_val))] call cxp_fnc_numberText];
CASH = CASH + parseNumber(_val);
[true] call cxp_fnc_hudUpdate;
[0] call CXPSKT_fnc_updatePartial;