#include "\cxp_server\script_macros.hpp"
/*
	File : fn_initVirtualExtraInv.sqf
	Author : Casperento (THX PARATUS)
	Description :
	Inicia o nucleo de funcionamento do VirtExtInv
*/
[] spawn {
	for "_i" from 0 to 1 step 0 do {
		waitUntil {!isNull (findDisplay 602)};
		[] spawn cxp_fnc_vrtExtInvOPEN;
		waitUntil {isNull (findDisplay 602)};
	};
};
