/*
	File: initPlayerLocal.sqf
	Author: Casperento
	Description:
	Inicializa HC e Cliente
*/
waitUntil {!(isNil "allClientFunct")};
[] remoteExec ["CXPSV_fnc_receiveClientFunct",clientOwner];
waitUntil {(!(isNil "cxp_clientFunctReady"))};
waitUntil {cxp_clientFunctReady};
execVM "initClientSetup.sqf";