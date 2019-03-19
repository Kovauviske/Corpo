#include "\life_server\script_macros.hpp"
/*
  File : fn_perdeuRabo.sqf
  Author : Casperento
*/
private _estuprador = param [0,Objnull,[Objnull]];
if(isNull _estuprador) exitWith {};

// Fala pra todo mundo quem arrombou quem
if (side _estuprador isEqualTo west) then {
	[1,format["%1 arrombou o CU do estuprador %2 com areia no cacete !!!",name _estuprador,name player]] remoteExecCall ["cxp_fnc_broadcast",RANY];
} else {
	[1,format["%1 arrombou o CU de %2 com vontade e sem lubrificante !!!",name _estuprador,name player]] remoteExecCall ["cxp_fnc_broadcast",RANY];	
};

if (cxp_CXPHC_isActive) then {
    [getPlayerUID _estuprador,_estuprador getVariable ["realname",name _estuprador],"1000"] remoteExecCall ["CXPHC_fnc_wantedAdd",CXP_HC];
} else {
    [getPlayerUID _estuprador,_estuprador getVariable ["realname",name _estuprador],"1000"] remoteExecCall ["cxp_fnc_wantedAdd",RSERV];
};

sleep 600; // 10min para deixar o estuprador arrombar cuzes novamente

_estuprador setVariable["podeArrombarCu",false,true];
