#include "\cxp_server\script_macros.hpp"
/*
    File: fn_gangSetBaseMenu.sqf
    Author: Casperento
    Description:
    Carrega listas de membros da gangue para serem colocados/retirados da base de gangue
*/
disableSerialization;
if !(createDialog "cxp_gZone_menu") exitWith {hint "Erro inesperado ocorrido no gangSetBaseMenu ... Contate aos desenvolvedores!"};

cxp_membOff = [];
cxp_gngSetWaitOffline = false;
cxp_gngMembersName = [];
cxp_gngSetWait = false;

private _lstBxMemOn = CONTROL(919497,91002);
private _btnDesetON = CONTROL(919497,91005);
private _btnSetON = CONTROL(919497,91006);
private _grMembOn = (units group player);

private _lstBxMemOff = CONTROL(919497,91001);
private _btnDesetOFF = CONTROL(919497,91003);
private _btnSetOFF = CONTROL(919497,91004);

[(getPlayerUID player),player] remoteExecCall ["CXPSV_fnc_getOfflineMemb",RSERV];
waitUntil {cxp_gngSetWaitOffline};
private _grMembOff = cxp_membOff;

{_plUID = (getPlayerUID _x);if (_plUID in _grMembOff) then {_grMembOff deleteAt (_grMembOff find _plUID);};} forEach _grMembOn;

if (count _grMembOff > 0) then {
    [_grMembOff,player] remoteExecCall ["CXPSV_fnc_getNameByUID",RSERV];
    waitUntil {cxp_gngSetWait};
    lbClear _lstBxMemOff;
    {
        if ((_x select 1) > 0 && (_x select 1) isEqualTo (FETCH_CONST(cxp_gdonorLevel))) then {
            _lstBxMemOff lbAdd format ["%1 (*D*)",(_x select 0)];
        } else {
            _lstBxMemOff lbAdd format ["%1",(_x select 0)];
        };
        _lstBxMemOff lbSetData [(lbSize _lstBxMemOff)-1,str(_x)];
    } forEach cxp_gngMembersName;
} else {
    lbClear _lstBxMemOff;
    _lstBxMemOff lbAdd "Nenhum offline...";
};

lbClear _lstBxMemOn;
{
    if (_x getVariable "rankgbVip" > 0 && (_x getVariable "rankgbVip") isEqualTo (player getVariable "rankgbVip")) then {
        _lstBxMemOn lbAdd format ["%1 (*D*)",(_x getVariable ["realname",name _x])];
    } else {
        _lstBxMemOn lbAdd format ["%1",(_x getVariable ["realname",name _x])];
    };
    _lstBxMemOn lbSetData [(lbSize _lstBxMemOn)-1,str(_x)];
} forEach _grMembOn;