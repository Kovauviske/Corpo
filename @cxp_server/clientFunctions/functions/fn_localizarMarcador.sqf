/*
	File: fn_localizarMarcador.sqf
	Author: Casperento
	Description:
	Foca no marcador escolhido
*/
disableSerialization;
private _mkName = lbData[88003,lbCurSel 88003];
if (_mkName isEqualTo "") exitwith {hint "Marcador invalido selecionado no CXP MAP FILTER..."};
mapAnimAdd [1,0.08,(getMarkerPos _mkName)];mapAnimCommit;