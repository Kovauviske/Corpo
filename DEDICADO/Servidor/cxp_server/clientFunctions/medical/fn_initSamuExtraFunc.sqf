#include "\cxp_server\script_macros.hpp"
/*
	File : fn_initSamuExtraFunc.sqf
	Author : Casperento
	Description:
	Init modulo novo do samu
*/
if (playerSide != independent) exitWith {};

cxp_sef_boteSolto = false;
cxp_multaAutoEnviada = false;

// Lista de veiculos capazes de 'dropar' o bote
esf_helisDispBote = CXP_SETTINGS(getArray,"heli_samu_bote");
if (isNil "esf_helisDispBote") exitWith {hint"Erro encontrado no script de configuracao do bote salva-vidas do samu. Por favor, reporte aos desenvolvedores do servidor !"};
