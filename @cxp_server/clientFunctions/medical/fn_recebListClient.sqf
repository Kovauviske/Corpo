/*
  File: fn_recebListClient.sqf
  Author: Casperento
*/
private _listaRecebida = param [0,[],[[]]];
private _silent = param [1,false,[false]];
if !(_listaRecebida isEqualType []) exitWith {hint"Lista de mortos recebida em formato diferente do esperado...Contate aos desenvolvedores!"};

cxp_dead_list_recebida = _listaRecebida;

if !(_silent) then {
  playSound "sms";
  hint "Sua lista de mortos recebeu uma nova atualização. Abra-a (PAGE-UP) para conferir !";
};
