#include "\cxp_server\script_macros.hpp"
/*
	File: fn_adrenalineShot.sqf
	Author: Mike "Revir" Berlin
	Modified: Casperento
	Description:
	Brings a player back from being downed.
*/
params [
	["_alvo",objNull,[objNull]],
	["_modo",0,[0]]
];

[false,"adrenalineShot",1] call cxp_fnc_handleInv;

// Injeta em si mesmo (usado no inventario do jogador)
if (_modo isEqualTo 0 && _alvo isEqualTo player && CXP_SETTINGS(getNumber,"enable_fatigue") isEqualTo 1) exitWith {
	cxp_action_in_use = true;
	//Setup our progress bar.
	disableSerialization;
	private _upp = "Injetando adrenalina em você mesmo...";
	"progressBar" cutRsc ["cxp_progress","PLAIN"];
	private _ui = uiNameSpace getVariable "cxp_progress";
	private _progress = _ui displayCtrl 38201;
	private _pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	private _cP = 0.01;

	private _success = false;
	for "_i" from 0 to 1 step 0 do {
		sleep 0.1;
		_cP = _cP + 0.1;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if (_cP >= 1) exitWith {_success=true;};
		if (isWeaponDeployed _alvo) exitWith {};
		if !(alive _alvo) exitWith {};
		if !(cxp_action_in_use) exitWith {};
	};
	"progressBar" cutText ["","PLAIN"];
	cxp_action_in_use = false;

	if !(_success) then {
		[true,"adrenalineShot",1] call cxp_fnc_handleInv;
		hint"O processo falhou e você não usou sua injeção de adrenalina!";
	} else {
		player playActionNow "Medic";
		player setFatigue 0; // Deixa player sem fadiga aumentada quando ele usa a adrenalina
		player forceWalk false;
		hint "Você acabou de tomar uma injeção de adrenalina e agora sua fadiga acabou, corra garoto, corra!";
	};
};

// Injeta num alvo específico (usado no menu de interação do player)
if (_modo isEqualTo 1 && _alvo != player && _alvo getVariable ["downed",false]) exitWith {
	cxp_action_in_use = true;
	//Setup our progress bar.
	disableSerialization;
	private _upp = "Injetando adrenalina no alvo...";
	"progressBar" cutRsc ["cxp_progress","PLAIN"];
	private _ui = uiNameSpace getVariable "cxp_progress";
	private _progress = _ui displayCtrl 38201;
	private _pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	private _cP = 0.01;

	private _success = false;
	for "_i" from 0 to 1 step 0 do {
		sleep 0.1;
		_cP = _cP + 0.1;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if (_cP >= 1) exitWith {_success=true;};
		if (isWeaponDeployed _alvo) exitWith {};
		if !(alive _alvo) exitWith {};
		if !(cxp_action_in_use) exitWith {};
	};
	"progressBar" cutText ["","PLAIN"];
	cxp_action_in_use = false;

	if !(_success) then {
		[true,"adrenalineShot",1] call cxp_fnc_handleInv;
		[1,"A injeção de adrenalina que lhe fora dada falhou..."] remoteExecCall ["cxp_fnc_broadcast",_alvo];
	} else {
		player playActionNow "MedicOther";
		_alvo setVariable ["adrenaline",true,true];
		[1,"Você acabou de tomar uma injeção de adrenalina e estará bem em breve!"] remoteExecCall ["cxp_fnc_broadcast",_alvo];
	};
};
