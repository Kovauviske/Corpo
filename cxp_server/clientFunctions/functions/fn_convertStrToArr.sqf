/*
	File : fn_convertStrToArr.sqf
	Author : Casperento
*/
private _strArr = param [0,"",[""]];
if !(_strArr isEqualType "") exitWith {
	hint"Entrada errada no conversor de strToarr. (Valor diferente de 'STR' detectado!)";
	_strArr = ["Error:EntradaIncorreta"];
	_strArr
};
_strArr = call compile format ["%1",_strArr];

// Array pronto para retorno
if (_strArr isEqualType []) exitWith {_strArr};
