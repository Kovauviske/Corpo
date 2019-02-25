/*
	File: fn_onGetOutMan.sqf
	Author: Casperento
	Description:
	Function for event handler 'GetOutMan'
*/

if (cxp_seatbelt) exitWith {
	cxp_seatbelt = false;
	playSound "sintodeseg";
	systemChat "Voce retirou seu cinto de seguranca para sair do veiculo!";
};