#include "\life_server\script_macros.hpp"
/*
    File: fn_autoMessages.sqf (V2)
    Author: Casperento
    Description:
    Mostra mensagens diferentes automaticamente (aleatoriamente)
*/
sleep 300; // aguarda 5min apos ter sido chamado..

private _msgArr = CXP_SETTINGS(getArray,"cxp_autoMessages");
private _limit = 0;
private _msgOld = "";

for "_i" from 0 to 1 step 0 do {
    _msg = (selectRandom _msgArr);
    if (_msg isEqualTo _msgOld) then {
        _msg = (selectRandom _msgArr);
    } else {
        _msgOld = _msg;
        ["Lembrete",_msg,10,"verde","center"] call cxp_fnc_hintDinamico;
        _limit = _limit + 1;
        sleep CXP_SETTINGS(getNumber,"cxp_autoMessages_delay"); // delay entre cada mensagem (padrao 10min=600segundos)
    };
    if (_limit isEqualTo (count _msgArr)) exitwith {};
};
