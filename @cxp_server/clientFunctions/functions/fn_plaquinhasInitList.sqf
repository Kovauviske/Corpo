/*
	CODIGO : 06-BO
  File : fn_plaquinhasInitList.sqf
  Author : Casperento
  Description :
  Init de cada plaquinha disponivel nas bases de gangue
*/
private _plaquinhaAtiva = param [0,0,[0]];
private _licNecessaria = param [1,"",[""]];
private _lojaName = param [2,"",[""]];

private _return = [];
private "_strArrUm";
private "_strArrDois";
private "_strArrTres";
private "_strArrQuatro";
private "_strArrCinco";

switch (_lojaName) do {
  case "prefeitura" : {
  	if (_licNecessaria isEqualTo "") exitWith {
  		hint "Licença inválida encontrada no script 06-BO !";
  	};
    if (_plaquinhaAtiva isEqualTo 1) then {
      _strArrUm = "[""Abrir Menu Prefeitura"",cxp_fnc_menuPrefeituraOPEN,"""",0,true,true,"""",'playerSide isEqualTo civilian && "+ _licNecessaria +"']";
      _strArrDois = "[localize""STR_MAR_Medical_Assistance"",cxp_fnc_healHospital,"""",1.5,false,false,"""",'isNull objectParent player && player distance _target < 5 && "+ _licNecessaria +"']";
      _strArrTres = "[localize'STR_MAR_Mobilia',cxp_fnc_virtMenu,'mobiliaria',0,FALSE,FALSE,'','isNull objectParent player && player distance _target < 4 && "+ _licNecessaria +"']"; // mobiliaria
	  _strArrQuatro = "[localize'STR_MAR_Acamp',cxp_fnc_virtMenu,'acamp',0,FALSE,FALSE,'','isNull objectParent player && player distance _target < 4 && "+ _licNecessaria +"']"; // acampamento
	  _return = [_strArrUm,_strArrDois,_strArrTres,_strArrQuatro];
    };
  };
  case "rebelde" : {
  	if (_licNecessaria isEqualTo "") exitWith {
  		hint "Licença inválida encontrada no script 06-BO !";
  	};
    if (_plaquinhaAtiva isEqualTo 1) then {
      _strArrUm = "[localize""STR_MAR_General_Store"",cxp_fnc_weaponShopMenu,""geneReb"",0,false,false,"""",'license_civ_rebellic && playerSide isEqualTo civilian && "+ _licNecessaria +"']";
      _strArrDois = "[localize""STR_MAR_Rebel_Market"",cxp_fnc_virtMenu,""rebel_B"",0,false,false,"""",'license_civ_rebellic && playerSide isEqualTo civilian && "+ _licNecessaria +"']";
      _strArrTres = "[localize""STR_MAR_Rebel_Clothing_Shop"",cxp_fnc_clothingMenu,""reb_CB"",0,false,false,"""",'license_civ_rebellic && playerSide isEqualTo civilian && "+ _licNecessaria +"']";
      _strArrQuatro = "[localize""STR_MAR_Rebel_Weapon_Shop"",cxp_fnc_weaponShopMenu,""rebel_B"",0,false,false,"""",'license_civ_rebellic && playerSide isEqualTo civilian && "+ _licNecessaria +"']";
      _strArrCinco = "[format[""%1 ($%2)"",localize (getText(missionConfigFile >> ""Licenses"" >> ""rebellic"" >> ""displayName"")), [(getNumber(missionConfigFile >> ""Licenses"" >> ""rebellic"" >> ""price""))] call cxp_fnc_numberText],cxp_fnc_buyLicense,""rebellic"",0,false,false,"""",'!license_civ_rebellic && playerSide isEqualTo civilian && "+ _licNecessaria +"']";
      _return = [_strArrUm,_strArrDois,_strArrTres,_strArrQuatro,_strArrCinco];
    };
  };
  case "mercado" : {
  	if (_licNecessaria isEqualTo "") exitWith {
  		hint "Licença inválida encontrada no script 06-BO !";
  	};
    if (_plaquinhaAtiva isEqualTo 1) then {
      _strArrUm = "[localize""STR_Shops_Market"",cxp_fnc_virtMenu,""market"",0,false,false,"""",'playerSide isEqualTo civilian && "+ _licNecessaria +"']";
      _return = [_strArrUm];
    };
  };
  case "lojageral" : {
  	if (_licNecessaria isEqualTo "") exitWith {
  		hint "Licença inválida encontrada no script 06-BO !";
  	};
    if (_plaquinhaAtiva isEqualTo 1) then {
      _strArrUm = "[localize""STR_MAR_General_Store"",cxp_fnc_weaponShopMenu,""genstore"",0,false,false,"""",'playerSide isEqualTo civilian && "+ _licNecessaria +"']";
      _return = [_strArrUm];
    };
  };
  case "lojaroupas" : {
  	if (_licNecessaria isEqualTo "") exitWith {
  		hint "Licença inválida encontrada no script 06-BO !";
  	};
    if (_plaquinhaAtiva isEqualTo 1) then {
      _strArrUm = "[localize""STR_MAR_Clothing_Store"",cxp_fnc_clothingMenu,""bruce"",0,false,false,"""",'playerSide isEqualTo civilian && "+ _licNecessaria +"']";
      _return = [_strArrUm];
    };
  };
};
if (count _return isEqualTo 0) then {_return = "";};
_return
