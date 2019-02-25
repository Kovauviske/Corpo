#include "\cxp_server\script_macros.hpp"
/*
  File : fn_menuPrefeituraUPDATE.sqf
  Author : Casperento
  Description:
  Atualiza o menu de comprar licencas
*/
if (CXP_SETTINGS(getNumber,"menu_prefeitura_on") isEqualTo 0) exitWith {diag_log "Menu Prefeitura desligado!";};
private _licenDisp = CXP_SETTINGS(getArray,"menu_prefeitura_licenses");

disableSerialization;

if (isNull (findDisplay 5546)) exitWith {hint"Display de atualização da prefeitura invalido, contate aos desenvolvedores!"};
private _licListBox = CONTROL(5546,55126);
private _myLicListBox = CONTROL(5546,55131);

lbclear _licListBox;
lbclear _myLicListBox;

// Atualizando Listas das licencas
{
    private _price = M_CONFIG(getNumber,"Licenses",_x,"price");
    private _displayName = localize (M_CONFIG(getText,"Licenses",_x,"displayName"));
    private _side = M_CONFIG(getText,"Licenses",_x,"side");
    if !(LICENSE_VALUE(_x,_side)) then {
      _licListBox lbAdd format["%1 - (R$%2)", _displayname, _price];
      _licListBox lbSetData [(lbSize _licListBox) - 1, _x];
    } else {
      _myLicListBox lbAdd format["%1", _displayname];
      _myLicListBox lbSetData [(lbSize _myLicListBox) - 1, _x];
    };
} forEach _licenDisp;
