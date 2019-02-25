#include "\cxp_server\script_macros.hpp"
/*
	File: fn_speedCamera.sqf
	Author: Alan

	Modified : Casperento

	Description:
	Charges driver for speeding!
*/
private _multa = CXP_SETTINGS(getNumber, "valor_multa");
private _multaSemMot = CXP_SETTINGS(getNumber, "valor_multa_smot");
private _speed = [_this,0,0,[0]] call BIS_fnc_param;
private _limit = [_this,1,0,[0]] call BIS_fnc_param;
private _loc = _this select 2;

if (_speed < (_limit + 1)) exitWith {};
if (vehicle player isEqualTo player) exitWith {};
if (driver (vehicle player) != player) exitWith {};
if !(vehicle player isKindOf "Car") exitWith {};

private _ticket = "";

[] spawn {
	"colorCorrections" ppEffectEnable true;
	"colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 1],[0.3, 0.3, 0.3, 0.05]];
	"colorCorrections" ppEffectCommit 0;
	sleep 0.01;
	"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];
	"colorCorrections" ppEffectCommit 0.05;
	sleep 0.05;
	"colorCorrections" ppEffectEnable false;
	sleep 0.1;
	"colorCorrections" ppEffectEnable true;
	"colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 1],[0.3, 0.3, 0.3, 0.05]];
	"colorCorrections" ppEffectCommit 0;
	sleep 0.01;
	"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];
	"colorCorrections" ppEffectCommit 0.05;
	sleep 0.05;
	"colorCorrections" ppEffectEnable false;
};
playSound "camera";

if !(license_civ_driver) then {
	BANK = BANK - _multaSemMot;
	[true] call cxp_fnc_hudUpdate;
	[1] call CXPSKT_fnc_updatePartial;
	_ticket = format ["<t align='center'><t size='2'>Multa de velocidade<br/><br/><t size='1.5'>Velocidade Atual: <br/>%1 km/h<br/>Limite de Velocidade: <br/>%2 km/h<br/>Multa: Conduçao de veiculo sem licença<br/><br/><t size='1'>Voce foi fotografado por uma câmera de velocidade e multado por excesso de velocidade. Valor da multa descontado de seu banco : R$%3",round(_speed), _limit,_multaSemMot];
} else {
	_ticket = format ["<t align='center'><t size='2'>Multa de Velocidade<br/><br/><t size='1.5'>Velocidade Atual: <br/>%1 km/h<br/>Limite de Velocidade: <br/>%2 km/h<br/>Multa: Excesso de velocidade<br/><br/><t size='1'>Voce foi fotografado por uma câmera de velocidade e multado por excesso de velocidade. Valor da multa descontado de seu banco : R$%3",round(_speed), _limit,_multa];
};

BANK = BANK - _multa;
[true] call cxp_fnc_hudUpdate;
[1] call CXPSKT_fnc_updatePartial;

hint parseText _ticket;

[0,"STR_NOTF_MultadeVeloc",true,[player getVariable ["realname",name player], triggerText _loc]] remoteExecCall ["cxp_fnc_broadcast",west];
