#include "\cxp_server\script_macros.hpp"
/*
  File : fn_procInitList.sqf
  Author : Casperento
  Description :
  Init de cada processador disponivel para as bases de gangue
*/
private _procName = param [0,"",[""]];
private _licNecessaria = param [1,"",[""]];

private _return = [];
private _strArrUm = "["""",""""]";
private _strArrDois = "["""",""""]";

if (_procName isEqualTo "") exitWith {
  _return = [_strArrUm,_strArrDois];
  _return
};

if !(_licNecessaria isEqualTo "") then {
  _licNecessaria = format [" && %1",_licNecessaria];
};

switch (_procName) do {
  /*
    Bem simples e facil de configurar!
    Exemplo explicativo:
    case "SiglaFarm" : {
      // --> '_licNecessaria' nesse caso eh o de uma determinada base, a qual ja eh declarada no CfgBasesGangue!(Nao apague esta variavel)
      _strArrUm = "[localize""STR_Process_NomeFarmNoStringTable"",cxp_fnc_processAction,""NomeCurtoDaLicencaDoFarm"",0,false,false,"""",' cxp_inv_NomeDoItemNecessarioParaProcessar > 0 && !cxp_is_processing && !cxp_action_inUse && license_civ_NomeDaLicencaDoFarm"+ _licNecessaria +"']";
      _strArrDois = "[format[""%1 ($%2)"",localize (getText(missionConfigFile >> ""Licenses"" >> ""NomeCurtoDaLicencaDoFarm"" >> ""displayName"")), [(getNumber(missionConfigFile >> ""Licenses"" >> ""NomeCurtoDaLicencaDoFarm"" >> ""price""))] call cxp_fnc_numberText],cxp_fnc_buyLicense,""NomeCurtoDaLicencaDoFarm"",0,false,false,"""",' !license_civ_NomeCurtoDaLicencaDoFarm && playerSide isEqualTo civilian"+ _licNecessaria +"']";
    };

    OBS:
    Nome curto de uma licenca do farm: marijuana (Nome de uma classe no CfgLicenses)
      Nome completo de uma licenca do farm: license_civ_marijuana (Nome final da variavel formada para o cliente)
        Nome de uma Key do StringTable referente ao farm: STR_Process_Marijuana
          NUNCA APAGUE A VARIAVEL CONCATENADA '_licNecessaria', POIS EH ELA QUE GARANTE QUE O CLIENTE DE DETERMINADA BASE SOH VAI MEXER NO PROCESSADOR DE SUA BASE, E NAO NO DE OUTRA!
  */
  // Ilegais
  case "COCA" : {
    _strArrUm = "[localize""STR_Process_Cocaine"",cxp_fnc_processAction,""cocaine"",0,false,false,"""",' cxp_inv_cocaineUnprocessed > 0 && !cxp_is_processing && !cxp_action_inUse && license_civ_cocaine"+ _licNecessaria +"']";
    _strArrDois = "[format[""%1 ($%2)"",localize (getText(missionConfigFile >> ""Licenses"" >> ""cocaine"" >> ""displayName"")), [(getNumber(missionConfigFile >> ""Licenses"" >> ""cocaine"" >> ""price""))] call cxp_fnc_numberText],cxp_fnc_buyLicense,""cocaine"",0,false,false,"""",' !license_civ_cocaine && playerSide isEqualTo civilian"+ _licNecessaria +"']";
  };
  case "HERO" : {
    _strArrUm = "[localize""STR_Process_Heroin"",cxp_fnc_processAction,""heroin"",0,false,false,"""",' cxp_inv_heroinUnprocessed > 0 && !cxp_is_processing && !cxp_action_inUse && license_civ_heroin"+ _licNecessaria +"']";
    _strArrDois = "[format[""%1 ($%2)"",localize (getText(missionConfigFile >> ""Licenses"" >> ""heroin"" >> ""displayName"")), [(getNumber(missionConfigFile >> ""Licenses"" >> ""heroin"" >> ""price""))] call cxp_fnc_numberText],cxp_fnc_buyLicense,""heroin"",0,false,false,"""",' !license_civ_heroin && playerSide isEqualTo civilian"+ _licNecessaria +"']";
  };
  case "META" : {
    _strArrUm = "[localize""STR_Process_Meth"",cxp_fnc_processAction,""methPure"",0,false,false,"""",' cxp_inv_methi > 0 && !cxp_is_processing && !cxp_action_inUse && license_civ_methL"+ _licNecessaria +"']";
    _strArrDois = "[format[""%1 ($%2)"",localize (getText(missionConfigFile >> ""Licenses"" >> ""methL"" >> ""displayName"")), [(getNumber(missionConfigFile >> ""Licenses"" >> ""methL"" >> ""price""))] call cxp_fnc_numberText],cxp_fnc_buyLicense,""methL"",0,false,false,"""",' !license_civ_methL && playerSide isEqualTo civilian"+ _licNecessaria +"']";
  };
  // Legais
  case "DIAM" : {
    _strArrUm = "[localize""STR_Process_Diamond"",cxp_fnc_processAction,""diamond"",0,false,false,"""",' cxp_inv_diamondUncut > 0 && !cxp_is_processing && !cxp_action_inUse && license_civ_diamond"+ _licNecessaria +"']";
    _strArrDois = "[format[""%1 ($%2)"",localize (getText(missionConfigFile >> ""Licenses"" >> ""diamond"" >> ""displayName"")), [(getNumber(missionConfigFile >> ""Licenses"" >> ""diamond"" >> ""price""))] call cxp_fnc_numberText],cxp_fnc_buyLicense,""diamond"",0,false,false,"""",' !license_civ_diamond && playerSide isEqualTo civilian"+ _licNecessaria +"']";
  };
  case "MACO" : {
    _strArrUm = "[localize""STR_Process_Marijuana"",cxp_fnc_processAction,""marijuana"",0,false,false,"""",' cxp_inv_cannabis > 0 && !cxp_is_processing && !cxp_action_inUse && license_civ_marijuana"+ _licNecessaria +"']";
    _strArrDois = "[format[""%1 ($%2)"",localize (getText(missionConfigFile >> ""Licenses"" >> ""marijuana"" >> ""displayName"")), [(getNumber(missionConfigFile >> ""Licenses"" >> ""marijuana"" >> ""price""))] call cxp_fnc_numberText],cxp_fnc_buyLicense,""marijuana"",0,false,false,"""",' !license_civ_marijuana && playerSide isEqualTo civilian"+ _licNecessaria +"']";
  };
};

_return = [_strArrUm,_strArrDois];
_return
