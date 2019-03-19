#include "\life_server\script_macros.hpp"
/*
    File: fn_pAssalto.sqf
    Author: Casperento
    Description:
	Carrega o menu de avisos
*/
params [["_alvo",objNull,[objNull]]];
disableSerialization;
if (dialog) exitWith {};
if (visibleMap) exitWith {};

createDialog "dgAssalto";
private _Btn1 = CONTROL(9000,2401);
private _Btn2 = CONTROL(9000,2402);
private _Btn3 = CONTROL(9000,2403);
private _side = switch (playerSide) do {case civilian: {"civ"}; case west: {"cop"}; case independent: {"med"};};

cxp_temp_trgt = _alvo;
cxp_temp_msg = "";
cxp_temp_msg2 = "";
cxp_temp_msg3 = "";
cxp_temp_snd = "";
cxp_temp_snd2 = "";
cxp_temp_snd3 = "";

{
	if ((_x select 0) isEqualTo _side) exitWith {
		if !(((_x select 1) select 0) isEqualTo "") then {
			_Btn1 ctrlShow true;
			_Btn1 ctrlSetText ((_x select 1) select 0);
			_Btn1 ctrlSetTooltip ((_x select 1) select 1);
			cxp_temp_msg = ((_x select 1) select 2);
			cxp_temp_snd = ((_x select 1) select 3);
			_Btn1 buttonSetAction "[cxp_temp_trgt,cxp_temp_msg,cxp_temp_snd] call cxp_fnc_sAssaltoMSG; closeDialog 0;";
		};
		if !(((_x select 2) select 0) isEqualTo "") then {
			cxp_temp_msg2 = ((_x select 2) select 2);
			cxp_temp_snd2 = ((_x select 2) select 3);
			_Btn2 ctrlShow true;
			if (playerSide isEqualTo independent) then {
				_Btn2 ctrlSetTooltip (format [((_x select 2) select 1),(CXP_SETTINGS(getNumber,"multa_autom_samu"))]);
				_Btn2 buttonSetAction "cxp_multaAutoEnviada = true; [cxp_temp_trgt,cxp_temp_msg2,cxp_temp_snd2] call cxp_fnc_sAssaltoMSG; closeDialog 0;";
			} else {
				_Btn2 ctrlSetTooltip ((_x select 2) select 1);
				_Btn2 buttonSetAction "[cxp_temp_trgt,cxp_temp_msg2,cxp_temp_snd2] call cxp_fnc_sAssaltoMSG; closeDialog 0;";
			};
			_Btn2 ctrlSetText ((_x select 2) select 0);
		};
		if !(((_x select 3) select 0) isEqualTo "") then {
			_Btn3 ctrlShow true;
			_Btn3 ctrlSetText ((_x select 3) select 0);
			_Btn3 ctrlSetTooltip ((_x select 3) select 1);
			cxp_temp_msg3 = ((_x select 3) select 2);
			cxp_temp_snd3 = ((_x select 3) select 3);
			_Btn3 buttonSetAction "[cxp_temp_trgt,cxp_temp_msg3,cxp_temp_snd3] call cxp_fnc_sAssaltoMSG; closeDialog 0;";
		};
	};
} forEach (CXP_SETTINGS(getArray,"avisos_tab_cfg"));