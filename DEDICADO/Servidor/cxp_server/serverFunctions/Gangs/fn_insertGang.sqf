#include "\cxp_server\script_macros.hpp"
/*
    File: fn_insertGang.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Inserts the gang into the database.
*/
params [
    ["_ownerID",objNull,[objNull]],
    ["_uid","",[""]],
    ["_gangName","",[""]]
];
private _group = group _ownerID;

if (isNull _ownerID || _uid isEqualTo "" || _gangName isEqualTo "") exitWith {}; //Fail

_ownerID = owner _ownerID;
_gangName = [_gangName] call CXPDB_fnc_mresString;
private _query = format ["SELECT id FROM gangs WHERE name='%1' AND active='1'",_gangName];
private _queryResult = [_query,2] call CXPDB_fnc_asyncCall;

//Check to see if the gang name already exists.
if !(count _queryResult isEqualTo 0) exitWith {
    [1,"Este nome ja esta sendo usado por outra gangue, tente cria-la novamente com outro!"] remoteExecCall ["cxp_fnc_broadcast",_ownerID];
    cxp_action_gangInUse = nil;
    _ownerID publicVariableClient "cxp_action_gangInUse";
};

_query = format ["SELECT id FROM gangs WHERE members LIKE '%2%1%2' AND active='1'",_uid,"%"];
_queryResult = [_query,2] call CXPDB_fnc_asyncCall;

//Check to see if this person already owns or belongs to a gang.
if !(count _queryResult isEqualTo 0) exitWith {
    [1,"Voce ja esta em uma gangue, por favor saia dela para entrar em outra!"] remoteExecCall ["cxp_fnc_broadcast",_ownerID];
    cxp_action_gangInUse = nil;
    _ownerID publicVariableClient "cxp_action_gangInUse";
};

//Check to see if a gang with that name already exists but is inactive.
_query = format ["SELECT id, active FROM gangs WHERE name='%1' AND active='0'",_gangName];
_queryResult = [_query,2] call CXPDB_fnc_asyncCall;
_gangMembers = [[_uid]] call CXPDB_fnc_mresArray;

if !(count _queryResult isEqualTo 0) then {
    _query = format ["UPDATE gangs SET active='1', owner='%1',members='%2' WHERE id='%3'",_uid,_gangMembers,(_queryResult select 0)];
} else {
    _query = format ["INSERT INTO gangs (owner, name, members) VALUES('%1','%2','%3')",_uid,_gangName,_gangMembers];
};

_queryResult = [_query,1] call CXPDB_fnc_asyncCall;

_group setVariable ["gang_name",_gangName,true];
_group setVariable ["gang_owner",_uid,true];
_group setVariable ["gang_bank",0,true];
_group setVariable ["gang_maxMembers",8,true];
_group setVariable ["gang_members",[_uid],true];
[_group] remoteExecCall ["cxp_fnc_gangCreated",_ownerID];

uiSleep 0.35;
_query = format ["SELECT id FROM gangs WHERE owner='%1' AND active='1'",_uid];
_queryResult = [_query,2] call CXPDB_fnc_asyncCall;
_group setVariable ["gang_id",(_queryResult select 0),true];
