/*
  File: fn_cleanerListaSv.sqf
  Author: Casperento
  Description:
  Limpa lista para enviar para os clientes
*/
private _delArr = [];
private _tmpArr = ListMortosNoMomento;

if (cxp_sv_lista_limpa) exitWith {}; //lista ja foi limpa
cxp_sv_lista_limpa = false;
waitUntil {!cxp_sv_lista_emuso};
cxp_sv_lista_emuso = true;
{
  // Deleta elemento que nao esteja na lista de nomes dos players conectados ou com side indefinido
  if (!((_x select 1) in ListaPlayersNome) || (_x select 2) isEqualTo sideUnknown) exitWith {
    _delArr pushBack (_x select 0);
    _delArr pushBack (_x select 1);
    _delArr pushBack (_x select 2);
    if (_delArr in ListMortosNoMomento) then { // deleta apenas quando o objeto invalido realmente esta na lista
      ListMortosNoMomento deleteAt (ListMortosNoMomento find _delArr);
    };
  };
} forEach _tmpArr;
cxp_sv_lista_limpa = true;
cxp_sv_lista_emuso = false;