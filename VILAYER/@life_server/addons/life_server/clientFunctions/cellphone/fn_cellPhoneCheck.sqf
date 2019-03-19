#include "\life_server\script_macros.hpp"
/*
	Author: GetSomePanda / Panda
	Modified: Casperento
	SteamID: 76561198145366418
	File Name: fn_cellPhoneCheck.sqf
	Information: Checks players cellphone for messages on player init.
*/
if (cxp_CXPHC_isActive) then {
	[player] remoteExecCall ["CXPHC_fnc_cellPhoneRequest",CXP_HC];
} else {
    [player] remoteExecCall ["CXPDB_fnc_cellPhoneRequest",RSERV];
};