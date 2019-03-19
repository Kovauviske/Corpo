#include "\life_server\script_macros.hpp"
/*
	File: fn_envListaClient.sqf
	Author: Casperento
*/
params [
	["_player",objNull,[objNull]]
];

[ListMortosNoMomento,true] remoteExecCall ["cxp_fnc_recebListClient",_player];