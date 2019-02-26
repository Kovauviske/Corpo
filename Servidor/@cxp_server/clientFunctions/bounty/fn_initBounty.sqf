/*
	File: fn_initBounty.sqf
	Author: Casperento
	Description:
	Inicia nucleo do modulo Bounty Hunter
*/
// Limpa lista de 'bountys ativos' no momento, caso precise (p/ quando alvo desconecta)
[] spawn {
	for "_i" from 0 to 1 step 0 do {
        waitUntil {!isNil "cxp_bounty_uid" && (count cxp_bounty_uid > 1 || !([(cxp_bounty_uid select 0)] call cxp_fnc_isUIDActive)) && !cxp_transact_bounty && (player getVariable ["clienteBounty",false])};
        _zera = false;
        _uid = "";
        {
            if !([_x] call cxp_fnc_isUIDActive) exitWith {
                _zera = true;
                _uid = _x;
            };
        } forEach cxp_bounty_uid;
        if (_zera && !(_uid isEqualTo "")) then {
            [_uid] call cxp_fnc_removeLocalBounty;
            systemChat "BOUNTY HUNTER STATUS: Os seus contratos (e de seus amigos) foram encerrados no momento...Volte ao HQ e localize um novo alvo-recompensa!";
        };
        sleep 10;
    };
};