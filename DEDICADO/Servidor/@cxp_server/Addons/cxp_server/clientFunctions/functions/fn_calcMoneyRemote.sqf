#include "\cxp_server\script_macros.hpp"
/*
  File: fn_calcMoneyRemote.sqf
  Author: Casperento
  Description: Desconta alguma quantia de dinheiro da conta bancaria do player remoto
*/
params [
	["_valor",0,[0]],
	["_modo",0,[0]],
	["_tipo","",[""]],
	["_silent",true,[true]]
];
if (_valor < 0 || !(_modo in [0,1,2])) exitWith {hint"Transacao bancaria bugada. Contate aos desenvolvedores..."};

// Subtrai
if (_modo isEqualTo 0) exitWith {
	if (CASH < _valor) then {
		// calc Banco entao
		BANK = BANK - _valor;
		hint format["Você não tinha o valor necessário em sua carteira para efetuar a transação e logo R$%1 foram descontados de sua conta bancária!",[_valor] call cxp_fnc_numberText];
	} else {
		// calc carteira entao
		CASH = CASH - _valor;
		hint format["R$%1 foram descontados de sua carteira!",[_valor] call cxp_fnc_numberText];
	};
	[true] call cxp_fnc_hudUpdate;
};

// Soma
if (_modo isEqualTo 1) exitWith {
	// mao
	if (_tipo isEqualTo "m") then {
		CASH = CASH + _valor;
		if !(_silent) then {hint format["Voce recebeu R$%1",[CASH] call cxp_fnc_numberText]};
	} else {
		// banco
		BANK = BANK + _valor;
		if !(_silent) then {hint format["Voce recebeu R$%1",[BANK] call cxp_fnc_numberText]};
	};
	[true] call cxp_fnc_hudUpdate;
};

// SubtExtra
if (_modo isEqualTo 2) exitWith {
	// mao
	if (_tipo isEqualTo "m") then {
		CASH = CASH - _valor;
		if !(_silent) then {hint format["Voce perdeu R$%1",[CASH] call cxp_fnc_numberText]};
	} else {
		// banco
		BANK = BANK - _valor;
		if !(_silent) then {hint format["Voce perdeu R$%1",[BANK] call cxp_fnc_numberText]};
	};
	[true] call cxp_fnc_hudUpdate;
};