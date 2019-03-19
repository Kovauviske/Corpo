/*
	File: initServer.sqf
	Author: Casperento
	Description:
	Inicializa o servidor
*/
// Inicializa servidor
if (isServer) then {[] call compile preprocessFileLineNumbers "\life_server\init.sqf";};