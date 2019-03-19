#include "\cxp_server\script_macros.hpp"
/*
  File: fn_discordTerm.sqf
  Author: Casperento
  Description:
  Não concorda com os termos entao vai embora
*/
closeDialog 0;
disableUserInput true;
["Discorda",false,true] call BIS_fnc_endMission;
sleep 30;
