#include "\cxp_server\script_macros.hpp"
/*
	File: fn_pacienteAceito.sqf
	Author: Casperento
*/
params [
	["_medico",objNull,[objNull]],
	["_cancelado",false,[false]]
];

if !(_cancelado) exitWith {cxp_deadClient_Atendido = [true,_medico];};
if (_cancelado) exitWith {cxp_deadClient_Atendido = [false,objNull];};