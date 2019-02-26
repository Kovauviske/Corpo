/*
	CODIGO : 06-BF
  File : fn_plVehInitList.sqf
  Author : Casperento
  Description :
  Init de cada plaquinha disponivel nas bases de gangue
*/
private _plaquinhaAtiva = param [0,0,[0]];
private _licNecessaria = param [1,"",[""]];
private _lojaName = param [2,"",[""]];
private _mkSpawnName = param [3,"",[""]];

private _return = [];
private "_strArrUm";
private "_strArrDois";
private "_strArrTres";

switch (_lojaName) do {
  case "vRebel" : {
  	if (_licNecessaria isEqualTo "") exitWith {
  		hint "Licença inválida encontrada no script 06-BF !";
  	};
    if (_plaquinhaAtiva isEqualTo 1) then {
	    _strArrUm = "[localize""STR_MAR_W_E_Vehicle_Shop"",cxp_fnc_vehicleShopMenu,[""reb_car_b"",civilian,["""+ _mkSpawnName +"""],""reb"",""Loja de Veiculos Rebeldes""],0,false,false,"""",'license_civ_rebellic && "+ _licNecessaria +"']";
      _strArrDois = "[localize""STR_Garage_Title"",  {   if (cxp_CXPHC_isActive) then {    [getPlayerUID player,playerSide,""Car"",player] remoteExecCall [""CXPHC_fnc_getVehicles"",CXP_HC]; } else { [getPlayerUID player,playerSide,""Car"",player] remoteExecCall [""CXPSV_fnc_getVehicles"",2];}; cxp_garage_type = ""Car"";  createDialog ""Cxp_impound_menu"";   disableSerialization;   ctrlSetText[2802,""Buscando veiculos no banco de dados...""];   cxp_garage_sp = """+ _mkSpawnName +""";  },"""",0,false,false,"""",'license_civ_rebellic && "+ _licNecessaria +"']";
      _strArrTres = "[localize""STR_MAR_Store_vehicle_in_Garage"",cxp_fnc_storeVehicle,"""",0,false,false,"""",'!cxp_garage_store && "+ _licNecessaria +"']";
      _return = [_strArrUm,_strArrDois,_strArrTres];
	  };
  };
  case "vAvCiv" : {
  	if (_licNecessaria isEqualTo "") exitWith {
  		hint "Licença inválida encontrada no script 06-BF !";
  	};
    if (_plaquinhaAtiva isEqualTo 1) then {
      _strArrUm = "[""Loja De Veiculos Aereos"",cxp_fnc_vehicleShopMenu,[""civ_air"",civilian,["""+ _mkSpawnName +"""],""civ"",""Loja De Veiculos Aereos""],0,false,false,"""",'playerSide isEqualTo civilian && "+ _licNecessaria +"']";
      _strArrDois = "[localize""STR_Garage_Title"",{if (cxp_CXPHC_isActive) then {[getPlayerUID player,playerSide,""Air"",player] remoteExecCall [""CXPHC_fnc_getVehicles"",CXP_HC];} else {[getPlayerUID player,playerSide,""Air"",player] remoteExecCall [""CXPSV_fnc_getVehicles"",2];};cxp_garage_type = ""Air"";createDialog ""Cxp_impound_menu"";disableSerialization;ctrlSetText[2802,""Buscando veiculos no banco de dados...""];cxp_garage_sp = """+ _mkSpawnName +""";   },"""",0,false,false,"""",'playerSide isEqualTo civilian && "+ _licNecessaria +"']";
      _strArrTres = "[localize""STR_MAR_Store_vehicle_in_Garage"",cxp_fnc_storeVehicle,"""",0,false,false,"""",'!cxp_garage_store && "+ _licNecessaria +"']";
      _return = [_strArrUm,_strArrDois,_strArrTres];
	  };
  };
  case "vTrucks" : {
  	if (_licNecessaria isEqualTo "") exitWith {
  		hint "Licença inválida encontrada no script 06-BF !";
  	};
    if (_plaquinhaAtiva isEqualTo 1) then {
      _strArrUm = "[localize""STR_MAR_Truck_Shop"",cxp_fnc_vehicleShopMenu,[""civ_truck"",civilian,["""+ _mkSpawnName +"""],""civ"",""Loja de Caminhoes""],0,false,false,"""",'playerSide isEqualTo civilian && "+ _licNecessaria +"']";
      _strArrDois = "[localize""STR_MAR_Car_shop"",cxp_fnc_vehicleShopMenu,[""civ_car"",civilian,["""+ _mkSpawnName +"""],""civ"",""Loja de Carros""],0,false,false,"""",'playerSide isEqualTo civilian && "+ _licNecessaria +"']";
	    _return = [_strArrUm,_strArrDois];
	  };
  };
};
if (count _return isEqualTo 0) then {_return = "";};
_return
