#include "\cxp_server\script_macros.hpp"
/*
    File: fn_clientDisconnect.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Casperento
    Description:
    Evento: player desconecta do servidor
*/
params [
	["_unit",objNull,[objNull]],
	"",
	["_uid","",[""]],
	"_name"
];
if (isNull _unit) exitWith {};

private _side = side _unit;

// Retira da lista publica de nomes do servidor e remove o player da lista de mortos do sv
ListaPlayersNome deleteAt (ListaPlayersNome find _name);
[_name] spawn CXPSV_fnc_rmMorteListaSv;
[_unit] remoteExecCall ["cxp_fnc_deleteClienteProx",independent];
if (_side isEqualTo independent) then {
    if (_unit getVariable ["emAtendimento",false] && isPlayer (_unit getVariable "pacienteAtual")) then {
        [_unit,true] remoteExecCall ["cxp_fnc_pacienteAceito",(_unit getVariable "pacienteAtual")];
    };
};

// Salva status de procurado no DB
private _queryBounty = format ["SELECT wantedID, wantedName, wantedBounty FROM wanted WHERE active='1' AND wantedID='%1'",_uid];
private _queryBountyResult = [_queryBounty,2] call CXPDB_fnc_asyncCall;
if (count _queryBountyResult > 0) then {
    private _alvoRmArr = [[(_queryBountyResult select 0),(_queryBountyResult select 1),(_queryBountyResult select 2)]];
    [_alvoRmArr,"save_DB_out",_side] call cxp_fnc_checarGlobal;
};

//Save civilian position
if (_side isEqualTo civilian) then {
    if (isNil "CXPHC_UID" || {!(_uid isEqualTo CXPHC_UID)}) then {
        private _position = getPosATL _unit;
        if ((getMarkerPos "respawn_civilian" distance _position) > 300) then {
            private _alive = alive _unit;
            if (cxp_HC_isActive) then {[_uid,_side,_alive,4,_position] remoteExec ["CXPHC_fnc_updatePartial",CXP_HC]} else {[_uid,_side,_alive,4,_position] spawn CXPDB_fnc_updatePartial};
        };
    };
};

if !(alive _unit) then {
    diag_log format["%1 disconnected while dead.(alive)",_uid];
} else {
    {
        _x params [
            ["_corpseUID","",[""]],
            ["_corpse",objNull,[objNull]]
        ];
        if (_corpseUID isEqualTo _uid) exitWith {
            if (isNull _corpse) exitWith {server_corpses deleteAt _forEachIndex};
            [_corpse] remoteExecCall ["cxp_fnc_corpse",0];
            diag_log format["%1 disconnected while dead.(_corpseUID)",_corpseUID];
            server_corpses deleteAt _forEachIndex;
        };
    } forEach server_corpses;
};

private _containers = nearestObjects[_unit,["WeaponHolderSimulated"],5];
{deleteVehicle _x} forEach _containers;
deleteVehicle _unit;

[_uid] spawn CXPSV_fnc_houseCleanup;
