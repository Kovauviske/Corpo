/*
    File: fn_wantedBountyCiv.sqf
    Author: Casperento (BASED ON TONIC AND PARATUS)

    Description:
    Calcula premios dos hunters
*/
params [
    ["_uid","",[""]],
    ["_alvo",objNull,[objNull]],
    ["_hunter",objNull,[objNull]],
    ["_half",false,[false]],
	["_share",false,[false]]
];

if (isNull _alvo || isNull _hunter) exitWith {};

private _query = format ["SELECT wantedID, wantedName, wantedBounty FROM wanted WHERE active='1' AND wantedID='%1'",_uid];
private _queryResult = [_query,2] call CXPDB_fnc_asyncCall;

// Remove alvo da lista de procurados dos BHs
private _alvoRmArr = [[(_queryResult select 0),(_queryResult select 1),(_queryResult select 2)]];
[_alvoRmArr,"rm",(side _alvo)] call cxp_fnc_checarGlobal;
_alvo setVariable ["alvo_recompensa",false,true];
_alvo setVariable ["procurado",false,true];

if (count _queryResult > 0) then {
    private _amount = (_queryResult select 2);
	private _amountInit = _amount;
    if (_amount > 0) then {
		private _friends = [(units group _hunter), {_hunter distance _x < 100 && _x != _hunter && _x getVariable ["clienteBounty",false]}] call BIS_fnc_conditionalSelect;
		private _countFriends = (count _friends) + 1; // +1 pq tem o _hunter pra dividir a conta
        if (_half) then {
			// Para BountyHunter
            [round(_amount/2),_amountInit] remoteExecCall ["cxp_fnc_bountyReceive",(owner _hunter)];
        } else {
			// Para amigos do BountyHunter
			if (_share && _countFriends > 1) then {
				{
					if (isPlayer _x) then {
						[round(_amount/_countFriends),_amountInit] remoteExec ["cxp_fnc_bountyReceive",(owner _x)];
					};
				} forEach _friends;
				// Para BountyHunter
				[round(_amount/_countFriends),_amountInit] remoteExec ["cxp_fnc_bountyReceive",(owner _hunter)];
			} else {
				// Para BountyHunter
				[_amount,_amountInit] remoteExec ["cxp_fnc_bountyReceive",(owner _hunter)];
			};
        };
    };
};