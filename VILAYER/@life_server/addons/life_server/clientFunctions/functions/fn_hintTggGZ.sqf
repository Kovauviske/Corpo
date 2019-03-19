#include "\life_server\script_macros.hpp"
/*
	File : fn_hintTggGZ.sqf
	Author : Casperento
	Description:
	Imprime mensagem customizada na tela do jogador quando ele passa no trigger da area da base
*/
params [
	"_type",
	["_numBase",0,[0]]
];
if !(playerSide isEqualTo civilian) exitWith {};
if !(_type in ["entrada","saida"]) exitWith {};

private _tituloHint = localize(BASEGANG_CFG(getText,"g_msg_Titulo"));
private _msgIn      = localize(BASEGANG_CFG(getText,"g_msg_in"));
private _msgOut     = localize(BASEGANG_CFG(getText,"g_msg_out"));

if (_type isEqualTo "entrada") exitWith {
	if (FETCH_CONST(cxp_gdonorlevel) isEqualTo _numBase) then {
		[format["%1<br/>",(localize "STR_SAFEZONE_NTFY_Title")],format[(localize "STR_SAFEZONE_NTFY_In")],2,"verde","center",2] spawn cxp_fnc_hintDinamico;
		player allowDamage false;
	} else {
		[format["%1<br/>",_tituloHint],format["%1",_msgIn],2,"vermelho","center",2] spawn cxp_fnc_hintDinamico;
	};
};

if (_type isEqualTo "saida") exitWith {
	if (FETCH_CONST(cxp_gdonorlevel) isEqualTo _numBase) then {
		[format["%1<br/>",(localize "STR_SAFEZONE_NTFY_Title")],format[(localize "STR_SAFEZONE_NTFY_Out")],2,"amarelo","center",2] spawn cxp_fnc_hintDinamico;
		player allowDamage true;
	} else {
		[format["%1<br/>",_tituloHint],format["%1",_msgOut],2,"azul","center",2] spawn cxp_fnc_hintDinamico;
	};
};