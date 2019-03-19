#include "\life_server\script_macros.hpp"
/*
	File : fn_initGangZoneModule.sqf
	Author : Casperento
	Description:
	Inicializa todo o sistema das bases de gangue doadoras no cliente
*/
if (isDedicated) exitWith {};
if (playerSide != civilian) exitWith {};

// Montando processadores das bases de gangue
{
  private _objNameUm = call compile format ["%1",((_x select 0) select 0)];
  private _pUmAction = [((_x select 2) select 0),(_x select 1)] call cxp_fnc_procInitList;
  if (_pUmAction isEqualType []) then {
    _objNameUm addAction ([(_pUmAction select 0)] call cxp_fnc_convertStrToArr);
    _objNameUm addAction ([(_pUmAction select 1)] call cxp_fnc_convertStrToArr);
  };

  private _objNameDois = call compile format ["%1",((_x select 0) select 1)];
  private _pDoisAction = [((_x select 2) select 1),(_x select 1)] call cxp_fnc_procInitList;
  if (_pDoisAction isEqualType []) then {
    _objNameDois addAction ([(_pDoisAction select 0)] call cxp_fnc_convertStrToArr);
    _objNameDois addAction ([(_pDoisAction select 1)] call cxp_fnc_convertStrToArr);
  };
} forEach BASEGANG_CFG(getArray,"g_basesProcs");

// Montando plaquinhas de veiculos das bases de gangue
{
  private _plVehNameUm = call compile format ["%1",(((_x select 0) select 0) select 0)];
  private _plVehUmAction = [((_x select 2) select 0),(_x select 1),"vRebel",(((_x select 0) select 0) select 1)] call cxp_fnc_plVehInitList;
  if (_plVehUmAction isEqualType []) then {
    _plVehNameUm addAction ([(_plVehUmAction select 0)] call cxp_fnc_convertStrToArr);
    _plVehNameUm addAction ([(_plVehUmAction select 1)] call cxp_fnc_convertStrToArr);
    _plVehNameUm addAction ([(_plVehUmAction select 2)] call cxp_fnc_convertStrToArr);
  };

  private _plVehNameDois = call compile format ["%1",(((_x select 0) select 1) select 0)];
  private _plVehDoisAction = [((_x select 2) select 1),(_x select 1),"vAvCiv",(((_x select 0) select 1) select 1)] call cxp_fnc_plVehInitList;
  if (_plVehDoisAction isEqualType []) then {
    _plVehNameDois addAction ([(_plVehDoisAction select 0)] call cxp_fnc_convertStrToArr);
    _plVehNameDois addAction ([(_plVehDoisAction select 1)] call cxp_fnc_convertStrToArr);
    _plVehNameDois addAction ([(_plVehDoisAction select 2)] call cxp_fnc_convertStrToArr);
  };

  private _plVehNameTres = call compile format ["%1",(((_x select 0) select 2) select 0)];
  private _plVehTresAction = [((_x select 2) select 2),(_x select 1),"vTrucks",(((_x select 0) select 2) select 1)] call cxp_fnc_plVehInitList;
  if (_plVehTresAction isEqualType []) then {
    _plVehNameTres addAction ([(_plVehTresAction select 0)] call cxp_fnc_convertStrToArr);
    _plVehNameTres addAction ([(_plVehTresAction select 1)] call cxp_fnc_convertStrToArr);
  };

} forEach BASEGANG_CFG(getArray,"g_plaquinhasVeh");

// Montando plaquinhas basicas das bases de gangue
{
  private _plNameUm = call compile format ["%1",((_x select 0) select 0)];
  private _plUmAction = [((_x select 2) select 0),(_x select 1),"prefeitura"] call cxp_fnc_plaquinhasInitList;
  if (_plUmAction isEqualType []) then {
    _plNameUm addAction ([(_plUmAction select 0)] call cxp_fnc_convertStrToArr);
    _plNameUm addAction ([(_plUmAction select 1)] call cxp_fnc_convertStrToArr);
    _plNameUm addAction ([(_plUmAction select 2)] call cxp_fnc_convertStrToArr);
    _plNameUm addAction ([(_plUmAction select 3)] call cxp_fnc_convertStrToArr);
  };

  private _plNameDois = call compile format ["%1",((_x select 0) select 1)];
  private _plDoisAction = [((_x select 2) select 1),(_x select 1),"rebelde"] call cxp_fnc_plaquinhasInitList;
  if (_plDoisAction isEqualType []) then {
    _plNameDois addAction ([(_plDoisAction select 0)] call cxp_fnc_convertStrToArr);
    _plNameDois addAction ([(_plDoisAction select 1)] call cxp_fnc_convertStrToArr);
    _plNameDois addAction ([(_plDoisAction select 2)] call cxp_fnc_convertStrToArr);
    _plNameDois addAction ([(_plDoisAction select 3)] call cxp_fnc_convertStrToArr);
    _plNameDois addAction ([(_plDoisAction select 4)] call cxp_fnc_convertStrToArr);
  };

  private _plNameTres = call compile format ["%1",((_x select 0) select 2)];
  private _plTresAction = [((_x select 2) select 2),(_x select 1),"mercado"] call cxp_fnc_plaquinhasInitList;
  if (_plTresAction isEqualType []) then {
    _plNameTres addAction ([(_plTresAction select 0)] call cxp_fnc_convertStrToArr);
  };

  private _plNameQuatro = call compile format ["%1",((_x select 0) select 3)];
  private _plQuatroAction = [((_x select 2) select 3),(_x select 1),"lojageral"] call cxp_fnc_plaquinhasInitList;
  if (_plQuatroAction isEqualType []) then {
    _plNameQuatro addAction ([(_plQuatroAction select 0)] call cxp_fnc_convertStrToArr);
  };

  private _plNameCinco = call compile format ["%1",((_x select 0) select 4)];
  private _plCincoAction = [((_x select 2) select 4),(_x select 1),"lojaroupas"] call cxp_fnc_plaquinhasInitList;
  if (_plCincoAction isEqualType []) then {
    _plNameCinco addAction ([(_plCincoAction select 0)] call cxp_fnc_convertStrToArr);
  };

} forEach BASEGANG_CFG(getArray,"g_plaquinhasBasicas");

// Configurando casas das bases de gangue
{
  private _baseNum = _forEachIndex+1;
  private _baseLic = (_x select 1);
  private _casasNum = [];
  for "_i" from 1 to (_x select 0) do {_casasNum pushBack _i;};
  private _casasCompiladas = [];
  {_casasCompiladas pushBack [format["casa_%1_base_%2",str(_x),str(_baseNum)],_baseLic];} forEach _casasNum;
  {
    private _casaVar = call compile format ["%1",(_x select 0)];
    _casaVar setVariable ["bloqueadaParaCompra",(_x select 1),true];
  } forEach _casasCompiladas;
} forEach BASEGANG_CFG(getArray,"g_casasConfig");
