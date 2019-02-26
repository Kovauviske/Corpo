#include "\cxp_server\script_macros.hpp"
/*
	File: fn_reportarBug.sqf
	Author: Casperento
	Description:
	Envia msgs do cliente (que esta reportando) para o servidor salvar no banco de dados
*/
disableSerialization;
private _bugTxt = ctrlText CONTROL(717273,7302);
private _behavTxt = ctrlText CONTROL(717273,7301);

if ((_bugTxt isEqualTo "") || (_behavTxt isEqualTo "")) exitWith {closeDialog 0;hint "Voce precisa digitar algo para enviar para a gente!";};

private _allowedChar = toArray(CXP_SETTINGS(getText,"cxp_bt_allowedChar"));
private _allowedLen = CXP_SETTINGS(getNumber,"cxp_bt_lenChar");
private _buglen = count(toArray(_bugTxt));
private _behavelen = count(toArray(_behavTxt));
private _bugbyteChar = toArray(_bugTxt);
private _behavebyteChar = toArray(_behavTxt);
private _badChar = false;

if (_buglen > _allowedLen || _behavelen > _allowedLen) exitWith {hint format [localize "STR_CXPBT_CharLen",_allowedLen];};
{if !(_x in _allowedChar) exitWith {_badChar = true;};} forEach _bugbyteChar;
if !(_badChar) then {{if !(_x in _allowedChar) exitWith {_badChar = true;};} forEach _behavebyteChar;};
if (_badChar) exitWith {hint localize "STR_CXPBT_UnsuppChar"};

[(getPlayerUID player),profileName,_bugTxt,_behavTxt,player] remoteExecCall ["CXPSV_fnc_saveBugReported",RSERV];