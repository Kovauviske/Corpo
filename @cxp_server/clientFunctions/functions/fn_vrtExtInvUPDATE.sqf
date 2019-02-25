#include "\cxp_server\script_macros.hpp"
/*
  File : fn_vrtExtInvUPDATE.sqf
  Author : Casperento
*/
private _inventory = CONTROL(602,2005);
private _nearPlayer = CONTROL(602,2023);
disableSerialization;

// Atualizar Peso
(CONTROL(602,6667)) progressSetPosition (cxp_carryWeight / cxp_maxWeight);
(CONTROL(602,6678)) ctrlSetStructuredText parseText format["<t align='center'>%1/%2</t>", cxp_carryWeight, cxp_maxWeight];

lbClear _inventory;
lbClear _nearPlayer;

// Identificar nome dos jogadores ao redor do cliente
private _near_units = [];
{
  if (player distance _x < 10) then {_near_units pushBack _x};
} forEach playableUnits;
{
  if (!isNull _x && alive _x && player distance _x < 10 && _x != player) then {
    _nearPlayer lbAdd format ["%1 - %2",_x getVariable ["realname",name _x], side _x];
    _nearPlayer lbSetData [(lbSize _nearPlayer)-1,str(_x)];
  };
} forEach _near_units;

// Preenchimento da ListBox
{
  if (ITEM_VALUE(configName _x) > 0) then {
    _inventory lbAdd format ["%2 [x%1]",ITEM_VALUE(configName _x),localize (getText(_x >> "displayName"))];
    _inventory lbSetData [(lbSize _inventory)-1,configName _x];
    _icone = M_CONFIG(getText,"VirtualItems",configName _x,"icon");
    if !(_icone isEqualTo "") then {
      _inventory lbSetPicture [(lbSize _inventory)-1,_icone];
    };
  };
} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));
