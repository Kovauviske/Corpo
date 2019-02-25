#include "\cxp_server\script_macros.hpp"
/*
	File: fn_initMapFilter.sqf
	Author: Casperento
	Description:
	Inicializa o map filter de acordo com o side
*/
mapAnimAdd [1,1,(markerPos "cxp_mpfl_center")];mapAnimCommit;
[true] spawn cxp_fnc_resetarCbList;