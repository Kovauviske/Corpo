#include "\cxp_server\script_macros.hpp"
/*
    File: fn_wantedList.sqf
    Author: Casperento

    Description:
    Carrega lista de procurados no Cliente
*/
params [
    ["_wantedList",[],[[]]]
];
disableSerialization;

private _listBox = CONTROL(2400,2401);
if (count _wantedList > 0) then {
    {
        if (count cxp_bountyList_client > 0 && (_x select 0) in cxp_bountyList_client) then {
            _listBox lbAdd format [">-%1-<",(_x select 1)];
        } else {
            _listBox lbAdd format ["%1",(_x select 1)];
        };
        _listBox lbSetData [(lbSize _listBox)-1,str(_x)];
    } forEach _wantedList;
} else {
    _listBox lbAdd "Sem Procurados";
};

ctrlSetText[2404,"Carregado!"];
