#include "\cxp_server\script_macros.hpp"
/*
	File: fn_clientConnect.sqf
	Author: Casperento
	Description:
	Evento: player conecta no servidor
*/
params [
	["_id",-1,[0]],
	"_uid",
	"_name",
	["_jip",false,[false]],
	["_owner",-1,[0]]
];
if (_name isEqualTo "__SERVER__" || _name isEqualTo "headlessclient") exitWith {};
if (_uid isEqualTo "") exitWith {};

ListaPlayersNome pushBack _name;