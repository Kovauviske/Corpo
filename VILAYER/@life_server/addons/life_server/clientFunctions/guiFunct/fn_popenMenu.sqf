#include "\life_server\script_macros.hpp"
/*
    File: fn_p_openMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Opens the players virtual inventory menu
*/
if (cxp_is_processing || cxp_action_inUse) exitWith {};
if (!alive player || dialog) exitWith {}; //Prevent them from opening this for exploits while dead.
createDialog "playerSettings";
disableSerialization;

switch (playerSide) do {
    case west: {
		ctrlShow[2011,false];//gang
  		ctrlShow[2025,false];//craft
  		ctrlShow[3025,false];//market
  		ctrlShow[3026,false];//wantedlistciv
    };

    case civilian: {
		ctrlShow[2012,false];//wantedlistcop
		ctrlShow[20003,false];//objetos
		if ((CXP_SETTINGS(getNumber, "dynamic_market")) isEqualTo 0) then {ctrlShow[3025,false];};
    };

    case independent: {
		ctrlShow[2012,false];//wantedlistcop
		ctrlShow[2011,false];//gang
  		ctrlShow[2025,false];//craft
  		ctrlShow[3025,false];//market
        ctrlShow[3026,false];//wantedlistciv
    };
};

[] call cxp_fnc_pupdateMenu;
