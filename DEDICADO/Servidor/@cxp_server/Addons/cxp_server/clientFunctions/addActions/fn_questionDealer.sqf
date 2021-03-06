#include "\cxp_server\script_macros.hpp"
/*
    File: fn_questionDealer.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Casperento
    Description:
    Questions the drug dealer and sets the sellers wanted.
*/
private _sellers = (_this select 0) getVariable ["sellers",[]];
if (count _sellers isEqualTo 0) exitWith {hint localize "STR_Cop_DealerQuestion"}; //No data.
cxp_action_inUse = true;
private _crimes = CXP_SETTINGS(getArray,"crimes");

private _names = "";
{
    private _val = 0;
    if ((_x select 2) > 150000) then {
        _val = round((_x select 2) / 16);
    } else {
        _val = ["483",_crimes] call CXPSV_fnc_index;
        _val = ((_crimes select _val) select 1);
        if (_val isEqualType "") then {
            _val = parseNumber _val;
        };
    };
    [(_x select 0),(_x select 1),"483",_val] remoteExecCall ["cxp_fnc_wantedAdd",RSERV];
    _names = _names + format ["%1<br/>",(_x select 1)];
} forEach _sellers;

hint parseText format [(localize "STR_Cop_DealerMSG")+ "<br/><br/>%1",_names];
(_this select 0) setVariable ["sellers",[],true];
cxp_action_inUse = false;
