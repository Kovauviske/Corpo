#include "\cxp_server\script_macros.hpp"
/*
    File: fn_baternaporta.sqf
    Author: Casperento

    Description:
    Bater na porta da casa.
*/
private _casa = param [0,ObjNull,[ObjNull]];

if (cxp_houselocked) then {
	[_casa, "knockDoor", 100, 1] remoteExec ["cxp_fnc_say3D",RANY];
}else{
	hint "A casa está aberta !\nPossivelmente o dono está por perto, chame-o pelo direct.";
};
