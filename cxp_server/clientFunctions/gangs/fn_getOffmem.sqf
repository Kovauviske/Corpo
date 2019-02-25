/*
    File: fn_getOffmem.sqf
    Author: Casperento
*/
params [
	["_membarr",[],[[]]]
];

if (count _membarr isEqualTo 0) exitWith {};

cxp_membOff = _membarr;
cxp_gngSetWaitOffline = true;