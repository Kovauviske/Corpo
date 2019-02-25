/*
	File: fn_custPlaySound.sqf (V1.0)
	Author: Casperento
	Description:
	Usado para execuções remotas da função 'playSound'
*/
params [
	["_som","",[""]]
];

if (_som isEqualTo "") exitWith {hint"Nome de 'som' inválido, contate aos desenvolvedores!"};

playSound _som;