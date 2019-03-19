#include "\life_server\script_macros.hpp"
/*
  File: fn_wantedMenu.sqf
  Author: Bryan "Tonic" Boardwine

	Modified : Casperento

  Description:
  Opens the Wanted menu and connects to the APD.
*/
disableSerialization;

createDialog "cxp_wanted_menu";

switch (playerSide) do {
	case west : {
		if (FETCH_CONST(cxp_coplevel) < CXP_SETTINGS(getNumber,"patente_min_perdao_wanted")) then {ctrlShow[2405,false];};
	};
	case independent : {
		ctrlShow[9800,false];
		ctrlShow[2405,false];
	};
	case civilian : {
		ctrlShow[9800,false];
		ctrlShow[2405,false];
	};
};

private _list = CONTROL(2400,2401);
private _players = CONTROL(2400,2406);
lbClear _list;
lbClear _players;

{
  if (side _x isEqualTo civilian) then {
    _players lbAdd format["%1", name _x];
    _players lbSetdata [(lbSize _players)-1,str(_x)];
  };
} forEach playableUnits;

private _list2 = CONTROL(2400,2407);
lbClear _list2; //Purge the list

private _crimes = CXP_SETTINGS(getArray,"crimes");
{
  if (isLocalized (_x select 0)) then {
    _list2 lbAdd format["%1 - R$%2 (CÓDIGO: %3)",localize (_x select 0),(_x select 1),(_x select 2)];
  } else {
    _list2 lbAdd format["%1 - R$%2 (CÓDIGO: %3)",(_x select 0),(_x select 1),(_x select 2)];
  };
  _list2 lbSetData [(lbSize _list2)-1,(_x select 2)];
} forEach _crimes;

ctrlSetText[2404,"Carregando.."];

if (cxp_CXPHC_isActive) then {
  [player] remoteExec ["CXPHC_fnc_wantedFetch",CXP_HC];
} else {
  [player] remoteExec ["cxp_fnc_wantedFetch",RSERV];
};
