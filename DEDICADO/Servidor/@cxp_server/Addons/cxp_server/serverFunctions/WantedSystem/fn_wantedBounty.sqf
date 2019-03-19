/*
    File: fn_wantedBounty.sqf
    Author: Bryan "Tonic" Boardwine"
    Database Persistence By: ColinM
    Assistance by: Paronity
    Stress Tests by: Midgetgrimm
    Modified: Casperento
    Description:
    Checks if the person is on the bounty list and awards the cop for killing them.
*/
params [
    ["_uid","",[""]],
    ["_civ",objNull,[objNull]],
    ["_cop",objNull,[objNull]],
    ["_half",false,[false]]
];

if (isNull _civ || isNull _cop) exitWith {};

private _query = format ["SELECT wantedID, wantedName, wantedCrimes, wantedBounty FROM wanted WHERE active='1' AND wantedID='%1'",_uid];
private _queryResult = [_query,2] call CXPDB_fnc_asyncCall;

// Remove alvo da lista de procurados dos BHs também
if ((_queryResult select 0) in cxp_bounty_procurados) then {
    [[[(_queryResult select 0)]],"rm",(side _civ)] call cxp_fnc_checarGlobal;
    _civ setVariable ["alvo_recompensa",false,true];
    _civ setVariable ["procurado",false,true];
};

if !(count _queryResult isEqualTo 0) then {
    private _amount = _queryResult param [3];
    if !(_amount isEqualTo 0) then {
        if (_half) then {
            [((_amount) / 2),_amount] remoteExecCall ["cxp_fnc_bountyReceive",(owner _cop)];
        } else {
            [_amount,_amount] remoteExecCall ["cxp_fnc_bountyReceive",(owner _cop)];
        };
    };
};