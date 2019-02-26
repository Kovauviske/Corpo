#include "\cxp_server\script_macros.hpp"
/*
    File: fn_houseGarage.sqf
    Author: BoGuu
    Description:
    Database functionality for house garages.
*/
params [
    ["_uid","",[""]],
    ["_house",objNull,[objNull]],
	["_mode",0,[0]]
];

if (_uid isEqualTo "") exitWith {};
if (isNull _house) exitWith {};
if (_mode isEqualTo -1) exitWith {};

private _housePos = getPosATL _house;
private "_query";

if (_mode isEqualTo 0) then {
    _query = format ["INSERT INTO houses (pid, pos, owned, garage) VALUES('%1', '%2', '1', '1')",_uid,_housePos];
} else {
    _query = format ["UPDATE houses SET owned='0' WHERE pid='%1' AND pos='%2'",_uid,_housePos];
};
if (EXTSQLCXP_STNG(getNumber,"DebugMode") isEqualTo 1) then {diag_log format ["Query: %1",_query];};
[_query,1] call CXPDB_fnc_asyncCall;