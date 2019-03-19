#include "\life_server\script_macros.hpp"
/*
	File : fn_lancarBoteSalvaVidas.sqf
	Author : Casperento
	Description:
	Permite ao samu atender pacientes no mar atraves do lancamento de seu bote salva-vidas
*/
private _heliSamu = param [0,objNull,[objNull]];
if !(cxp_sef_boteSolto) then {
	private _altura = (position _heliSamu select 2);
	_altura = _altura - 2;
	if (_altura < 2) then {
		hint "Altura insuficiente para lançamento do bote !";
	} else {
	 	_barco = createVehicle [(CXP_SETTINGS(getText,"samu_bote")),[position _heliSamu select 0, position _heliSamu select 1, _altura],[],0, "CAN_COLLIDE"];
	 	cxp_sef_boteSolto = true;
	 	// Controlando uso do bote
	 	[] spawn {
			sleep (CXP_SETTINGS(getNumber,"heli_samu_bote_timer"));
			cxp_sef_boteSolto = false;
			deleteVehicle _barco;
   		};
   	};
} else {
	hint format["Um bote já foi lançado. Aguarde %1seg para lançar outro novamente!",(CXP_SETTINGS(getNumber,"heli_samu_bote_timer"))];
};
