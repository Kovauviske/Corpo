/*
	File: initPlayerServer.sqf
	Author: Casperento
	Description:
	Inicializa no servidor para todos os clientes
*/
if (getNumber(missionConfigFile >> "CxpBasic_Settings" >> "player_death_custom_msg") isEqualTo 1) then {(_this select 0) addMPEventHandler ["MPKilled", {_this call fn_whoDoneIt}];};