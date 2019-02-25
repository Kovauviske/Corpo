#include "\cxp_server\script_macros.hpp"
/*
    File: fn_medInteractionMenu.sqf
    Author: Casperento

    Description:
    Menu especifico para o medico
*/
disableSerialization;
private _curTarget = param [0,objNull,[objNull]];

if (player getVariable ["Escorting", false]) then {
    if (isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
    if (!isPlayer _curTarget && side _curTarget isEqualTo civilian) exitWith {closeDialog 0;}; //Bad side check?
    if (player distance _curTarget > 4 ) exitWith {closeDialog 0;}; // Prevents menu accessing from far distances.
};

if !(dialog) then {createDialog "pInteraction_Menu";};

private _Btn1 = CONTROL(37400,37450);
private _Btn2 = CONTROL(37400,37451);
private _Btn3 = CONTROL(37400,37452);
private _Btn4 = CONTROL(37400,37453);
private _Btn5 = CONTROL(37400,37454);
private _Btn6 = CONTROL(37400,37455);
private _Btn7 = CONTROL(37400,37456);
private _Btn8 = CONTROL(37400,37457);
private _Btn9 = CONTROL(37400,37458);
private _Btn10 = CONTROL(37400,37459);
cxp_pInact_curTarget = _curTarget;

if (!isNull cxp_pInact_curTarget || player getVariable["isEscorting",false]) then {
  {
    _x ctrlShow false;
  } forEach [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7,_Btn8,_Btn9,_Btn10];
};

// Pre-verific
if !(player getVariable["isEscorting",false]) then {
  _Btn1 ctrlShow true;
  _Btn3 ctrlShow true;
  _Btn4 ctrlShow true;
  _Btn5 ctrlShow true;
  _Btn6 ctrlShow true;
};

// Algemar/Desalgemar
if !(_curObject getVariable ["restrained",false]) then {
	_Btn1 ctrlSetText localize "STR_pInAct_Restrain";
	_Btn1 buttonSetAction "[cxp_pInact_curTarget] call cxp_fnc_restrainAction; closeDialog 0;";
} else {
	_Btn1 ctrlSetText localize "STR_pInAct_Unrestrain";
	_Btn1 buttonSetAction "[cxp_pInact_curTarget] call cxp_fnc_unrestrain; closeDialog 0;";
};

// Escoltar
_Btn2 ctrlShow true;
if (player getVariable["isEscorting",false]) then {
	_Btn2 ctrlSetText localize "STR_pInAct_StopEscort";
	_Btn2 buttonSetAction "[cxp_pInact_curTarget] call cxp_fnc_stopEscorting; closeDialog 0;";
} else {
	_Btn2 ctrlSetText localize "STR_pInAct_Escort";
	_Btn2 buttonSetAction "[cxp_pInact_curTarget] call cxp_fnc_escortAction; closeDialog 0;";
};

// Colocar no veh
_Btn3 ctrlSetText localize "STR_pInAct_PutInCar";
_Btn3 buttonSetAction "[cxp_pInact_curTarget] call cxp_fnc_putInCar; closeDialog 0;";

// Apreender Armas (Funcao parecida com a da polícia)
_Btn4 ctrlSetText localize "STR_pInAct_Seize";
_Btn4 buttonSetAction "[cxp_pInact_curTarget] spawn cxp_fnc_seizePlayerAction; closeDialog 0;";

// Curar CU
_Btn5 ctrlSetText localize "STR_pInAct_CurarRabo";
if (cxp_pInact_curTarget getVariable "plPerdeuCabaco") then {
  _Btn5 ctrlEnable true;
  _Btn5 buttonSetAction "[cxp_pInact_curTarget] spawn cxp_fnc_curarRabo; closeDialog 0;";
  _Btn5 ctrlSetTooltip "O jogador precisa de um CU novo!";
} else {
  _Btn5 ctrlEnable false;
  _Btn5 ctrlSetTooltip "O jogador não precisa de um CU novo.";
};

// Checar Licencas
_Btn6 ctrlSetText localize "STR_pInAct_checkLicenses";
_Btn6 buttonSetAction "[player] remoteExecCall [""cxp_fnc_licenseCheck"",cxp_pInact_curTarget]; closeDialog 0;";
