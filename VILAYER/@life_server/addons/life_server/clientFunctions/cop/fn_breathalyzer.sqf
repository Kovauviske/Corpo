#include "\life_server\script_macros.hpp"
/*
	File: fn_breathalyzer.sqf
	Author: [midgetgrimm]
	Modified : Casperento
	Description:
	allows cop to breathalyze player
*/
private _cop = param [0,objNull,[objNull]];
if (isNull _cop) exitWith {}; // protect from null bugs

private _drinky = cxp_drink;
private _limite = 0.8;
if(_drinky > _limite) then {
	// msg cop
	[1,format["Resultado do Teste do Sr. %1. Limite: %2. Taixa de Alcoolismo : %3. Ele está acima do limite !",name player,str _limite,[_drinky] call cxp_fnc_numberText]] remoteExecCall ["cxp_fnc_broadcast",_cop];
	// msg civ
	hint format ["Resultado de seu teste do bafometro. Limite: %1. Sua taixa de Alcoolismo : %2. Voce está acima do limite !",str _limite,[_drinky] call cxp_fnc_numberText];
} else {
	// msg cop
	[1,format["Resultado do Teste do Sr. %1. Limite: %2. Taixa de Alcoolismo : %3. Ele está abaixo do limite.",name player,str _limite,[_drinky] call cxp_fnc_numberText]] remoteExecCall ["cxp_fnc_broadcast",_cop];
	// msg civ
	hint format ["Resultado de seu teste do bafometro. Limite: %1. Sua taixa de Alcoolismo : %2. Voce está abaixo do limite !",str _limite,[_drinky] call cxp_fnc_numberText];
};
