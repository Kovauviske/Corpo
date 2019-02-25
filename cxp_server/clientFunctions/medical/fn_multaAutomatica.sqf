#include "\cxp_server\script_macros.hpp"
/*
  File : fn_multaAutomatica.sqf
  Author : Casperento
  Description:
  Desconta valor da multa automaticamente do jogador desejado
*/
// params
private _medico = param [0,ObjNull,[ObjNull]];
// vars
private _valorMulta = CXP_SETTINGS(getNumber,"multa_autom_samu");
private "_descont";
if (CASH < _valorMulta) then {
  hint localize "STR_SEFUNC_MULTA_AUTO_NCASH";
  BANK = BANK - _valorMulta;
  _descont = "banco";
} else {
  hint localize "STR_SEFUNC_MULTA_AUTO_CASH";
  CASH = CASH - _valorMulta;
  _descont = "carteira";
};
[true] call cxp_fnc_hudUpdate;

[1,format["A multa de R$%1 foi descontada do(a) %2 de %3",_valorMulta,_descont,name player]] remoteExecCall ["cxp_fnc_broadcast",_medico];
