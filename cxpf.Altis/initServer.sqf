/*
	File: initServer.sqf
	Author: Casperento
	Description:
	Inicializa o servidor
*/
// Inicializa servidor
if (isServer) then {[] call compile preprocessFileLineNumbers "\cxp_server\init.sqf";};