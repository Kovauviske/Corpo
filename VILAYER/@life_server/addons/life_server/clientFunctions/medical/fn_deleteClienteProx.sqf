#include "\life_server\script_macros.hpp"
/*
	File: fn_deleteClienteProx.sqf
	Author: Casperento
	Description:
	Retira cliente que desconectou do servidor da lista de clientesProx
*/
params [["_filhodaputa",objNull,[objNull]]];

if (isNil "cxp_arrCorpsesPerto") exitWith {};
if (isNull _filhodaputa) exitWith {};
if !(cxp_atndVarios) exitWith {};
if (count cxp_arrCorpsesPerto < 1) exitWith {};

// Tira essa porra daqui entao
cxp_arrCorpsesPerto deleteAt (cxp_arrCorpsesPerto find _filhodaputa);
hint "Um paciente desconectou e foi removido da lista de seus clientes atuais!";
