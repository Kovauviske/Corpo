#include "\cxp_server\script_macros.hpp"
/*
	File: fn_parcelaCartel.sqf
	Author: Casperento

	Description:
	Passa 10% do valor total ganho no trafico de drogas feito por um jogador, para a gangue que domina cada mercado de drogas
*/
private _total   = param [0,0,[0]];
private _dCartel = param [1,grpNull,[grpNull]];

//pega o local da bandeira de determinado cartel
private _donoCartel = _dCartel;

//adiciona o lucro no saldo da gangue
private _gFund = _donoCartel getVariable ["gang_bank",0];
_gFund = _gFund + _total;

if (CXP_SETTINGS(getNumber,"log_money_cartel") isEqualTo 1) then {
	diag_log format ["Dinheiro chegou no parcelaCartel, quantia(%3) + total da gangue = %1 ... Dono : %2",_gFund,_donoCartel,(str _total)];
};

//adiciona valor ganho pela venda dos outros players
_donoCartel setVariable ["gang_bank",_gFund,true];

//atualiza info da gangue no banco de dados
[1,_donoCartel] call CXPSV_fnc_updateGang;
