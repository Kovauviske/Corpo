/*
	File : fn_desmontarBarraca.sqf
	Author : Casperento
	Description:
	Desmontar Barraca
*/
params [["_barraca",objNull,[objNull]]];
private _timer = getNumber(missionConfigFile >> "CxpBasic_Settings" >> "cxp_barracas" >> (typeOf _barraca) >> "timerDes");

// Desmontar Barraca .. Inicio do Processo
cxp_action_inUse = true;
[player,"AinvPknlMstpSnonWnonDnon_medicUp3","playMove",1] remoteExec ["cxp_fnc_animDynSync",-2];

for "_i" from 0 to 1 step 0 do {
	_timer = _timer - 1;
	titleText [format["Desmontando barraca, tempo restante : %1s..",(str _timer)],"PLAIN"];
	sleep 1;
	if (_timer isEqualTo 0) exitWith {};
	if (!alive player) exitWith {};
	if (cxp_interrupted) exitWith {};
};
[player,""] remoteExec ["cxp_fnc_animDynSync",-2];
cxp_action_inUse = false;
if (cxp_interrupted) exitWith {cxp_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"];cxp_action_inUse = false;};

_barraca setVariable ["Trunk",nil,false];
deleteVehicle _barraca;

private _objName = switch (typeOf _barraca) do {case "Land_TentA_F":{"barracaP"};case "Land_TentDome_F":{"barracaG"};};
[true,_objName,1] call cxp_fnc_handleInv;
cxp_barracas_limite = cxp_barracas_limite - 1;

titleText ["Barraca desmontada com sucesso !","PLAIN",2];
