#include "\cxp_server\script_macros.hpp"
/*
    File: fn_containerMenu.sqf
    Author: NiiRoZz
    Modified: Casperento
    Description:
    Container interaction menu.
*/
disableSerialization;
private _container = param [0,objNull,[objNull]];
if (isNull _container) exitWith {}; //Bad target

if (!dialog) then {
    createDialog "pInteraction_Menu";
};

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
cxp_pInact_container = _container;
if !(isNull cxp_pInact_container) then {{_x ctrlShow false;} forEach [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7,_Btn8,_Btn9,_Btn10];};

if (playerSide isEqualTo west) then {
    _Btn1 ctrlSetText localize "STR_vInAct_SearchContainer";
    _Btn1 buttonSetAction "[cxp_pInact_container] spawn cxp_fnc_containerInvSearch; closeDialog 0;";
    _Btn1 ctrlShow true;
} else {
    _Btn1 ctrlSetText localize "STR_pInAct_RemoveContainer";
    _Btn1 buttonSetAction "[cxp_pInact_container] spawn cxp_fnc_removeContainer; closeDialog 0;";
    _Btn1 ctrlShow true;
};
