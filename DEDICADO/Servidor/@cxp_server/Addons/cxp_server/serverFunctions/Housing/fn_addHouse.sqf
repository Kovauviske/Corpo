#include "\cxp_server\script_macros.hpp"
/*
    File: fn_addHouse.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Inserts the players newly bought house in the database.
*/
private ["_housePos","_query"];
params [
    ["_uid","",[""]],
    ["_house",objNull,[objNull]]
];
if (isNull _house || _uid isEqualTo "") exitWith {};

_housePos = getPosATL _house;

_query = format ["INSERT INTO houses (pid, pos, owned) VALUES('%1', '%2', '1')",_uid,_housePos];

if (EXTSQLCXP_STNG(getNumber,"DebugMode") isEqualTo 1) then {diag_log format ["Query: %1",_query];};

[_query,1] call CXPDB_fnc_asyncCall;

uiSleep 0.3;

_query = format ["SELECT id FROM houses WHERE pos='%1' AND pid='%2' AND owned='1'",_housePos,_uid];
_queryResult = [_query,2] call CXPDB_fnc_asyncCall;
_house setVariable ["house_id",(_queryResult select 0),true];
