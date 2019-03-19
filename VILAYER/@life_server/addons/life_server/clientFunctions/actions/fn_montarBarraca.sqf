#include "\life_server\script_macros.hpp"
/*
	File : fn_montarBarraca.sqf
	Author : Casperento
	Description:
	Montar Barraca
*/
if (cxp_barracas_limite isEqualTo (getNumber(missionConfigFile >> "CxpBasic_Settings" >> "cxp_barracas" >> "limite"))) exitWith {hint format["Voce pode montar no maximo %1 barraca(s)!\n Desmonte alguma para poder montar outra...",(getNumber(missionConfigFile >> "CxpBasic_Settings" >> "cxp_barracas" >> "limite"))];};
params [["_item","",[""]]];
private _barracaCname = switch (_item) do {case "barracaG": {"Land_TentDome_F"};case "barracaP": {"Land_TentA_F"};};
private _timer = getNumber(missionConfigFile >> "CxpBasic_Settings" >> "cxp_barracas" >> _barracaCname >> "timerMon");
cxp_action_inUse = true;

// Montar Barraca ... Inicio Processo
[player,"AinvPknlMstpSnonWnonDnon_medicUp3","playMove",1] remoteExec ["cxp_fnc_animDynSync",RCLIENT];
for "_i" from 0 to 1 step 0 do {
	_timer = _timer - 1;
	titleText [format["Montando barraca, tempo restante: %1s..",_timer],"PLAIN"];
	sleep 1;
	if (_timer isEqualTo 0) exitWith {};
	if (!alive player) exitWith {};
	if (cxp_interrupted) exitWith {};
};
[player,""] remoteExec ["cxp_fnc_animDynSync",RCLIENT];

cxp_action_inUse = false;
if (cxp_interrupted) exitWith {cxp_interrupted = false;titleText[localize "STR_NOTF_ActionCancel","PLAIN"];cxp_action_inUse = false;};

private _barraca = _barracaCname createVehicle [0,0,0];
_barraca setpos (player modelToWorld [0,2,0]);
_barraca allowDamage false;
_barraca setVariable ["Trunk",[[],0],true];
_barraca addAction ["Desmontar Barraca",cxp_fnc_desmontarBarraca,cursorObject,0,false,false,"","(player distance cursorObject < 4) && !(player getVariable ['restrained',false]) && !(player getVariable ['tied',false])"];

[false,_item,1] call cxp_fnc_handleInv;

cxp_barracas_limite = cxp_barracas_limite + 1;

titleText ["Barraca Montada Com Sucesso!","PLAIN"];
hint "Lembre-se: esta barraca nao salva nenhum de seus itens !!!";
systemChat "Lembre-se: esta barraca nao salva nenhum de seus itens !!!";