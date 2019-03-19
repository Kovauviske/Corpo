#include "\life_server\script_macros.hpp"
/*
	File: fn_baseGangueSet.sqf
	Author: Casperento
	Description:
	Add/remove gdonorLevel do jogador
*/
params [
	["_act",-1,[0]],
	["_lider",objNull,[objNull]],
	["_jogUid","",["",objNull]],
	["_base",0,[0]]
];

if ((_jogUid isEqualTo objNull) || (_jogUid isEqualTo "") || (_act < 0)) exitWith {hint "Jogador invalido para receber/perder permissao da base de gangue..."};

// Dar permissao
if (_act isEqualTo 0) exitWith {
	private _query = "";
	if (_jogUid isEqualType objNull) then {
		_query = format ["UPDATE players SET gdonorLevel='%1' WHERE pid='%2'",_base,(getPlayerUID _jogUid)]; //on
	} else {
		_query = format ["UPDATE players SET gdonorLevel='%1' WHERE pid='%2'",_base,_jogUid]; //off
	};
	[_query,1] call CXPDB_fnc_asyncCall;
	
	if (_jogUid isEqualType objNull) then {
		[_base,"Voce recebeu a permissao para usar a base de sua gangue!"] remoteExecCall ["cxp_fnc_updateBaseLic",(owner _jogUid)];
		[1,format["Voce deu permissao para %1 usar sua base de gangue!",(name _jogUid)]] remoteExec ["cxp_fnc_broadcast",(owner _lider)];
	} else {
		[1,"Voce deu permissao a um membro offline com sucesso!"] remoteExec ["cxp_fnc_broadcast",(owner _lider)];
	};
};

// Retirar permissao
if (_act isEqualTo 1) exitWith {
	private _query = "";
	if (_jogUid isEqualType objNull) then {
		_query = format ["UPDATE players SET gdonorLevel='0' WHERE pid='%1'",(getPlayerUID _jogUid)]; //on
	} else {
		_query = format ["UPDATE players SET gdonorLevel='0' WHERE pid='%1'",_jogUid]; //off
	};
	[_query,1] call CXPDB_fnc_asyncCall;
	
	if (_jogUid isEqualType objNull) then {
		[_base,"Voce perdeu a permissao de uso da base de sua antiga/atual gangue!"] remoteExecCall ["cxp_fnc_updateBaseLic",(owner _jogUid)];
		[1,format["Voce retirou a permissao de %1 para usar a sua base de gangue!",(name _jogUid)]] remoteExec ["cxp_fnc_broadcast",(owner _lider)];
	} else {
		[1,"Voce retirou a permissao de um membro offline com sucesso!"] remoteExec ["cxp_fnc_broadcast",(owner _lider)];
	};
};