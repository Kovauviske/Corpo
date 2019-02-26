#include "\cxp_server\script_macros.hpp"
/*
    File: fn_blastingCharge.sqf
    Author: Bryan "Tonic" Boardwine
	Modified: Casperento
    Description:
    C4 Usada para explodir reserva e agencia de banco
*/
private _target = param [0,ObjNull,[ObjNull]];
if (!(typeOf _target in ["Land_CargoBox_V1_F","Land_Atm_02_F"]) || isNull _target) exitWith {
    hint "Bombas podem ser usadas apenas na reserva(Banco Central) e/ou em caixas eletronicos de agências de banco !";
};

if (typeOf _target isEqualTo "Land_CargoBox_V1_F") exitWith {
	if (_target getVariable ["chargeplaced",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyPlaced"};
	if (_target getVariable ["safe_open",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyOpen"};
	if (west countSide playableUnits < (CXP_SETTINGS(getNumber,"minimum_cops"))) exitWith {
		hint format [localize "STR_Civ_NotEnoughCops",(CXP_SETTINGS(getNumber,"minimum_cops"))];
	};

	private _targetHouse = [[["Altis", "Land_Research_house_V1_F"], ["Tanoa", "Land_Medevac_house_V1_F"]]] call CXPSV_fnc_terrainSort;
	private _altisArray = [16019.5,16952.9,0];
	private _tanoaArray = [11074.2,11501.5,0.00137329];
	private _pos = [[["Altis", _altisArray], ["Tanoa", _tanoaArray]]] call CXPSV_fnc_terrainSort;

	if ((nearestObject [_pos,_targetHouse]) getVariable ["locked",true]) exitWith {hint localize "STR_ISTR_Blast_Exploit"};
	if !([false,"blastingcharge",1] call cxp_fnc_handleInv) exitWith {}; //Error?

	_target setVariable ["chargeplaced",true,true];
	[0,"STR_ISTR_Blast_Placed",true,[]] remoteExecCall ["cxp_fnc_broadcast",west];
	hint localize "STR_ISTR_Blast_KeepOff";

	[] remoteExec ["cxp_fnc_demoChargeTimer",[west,player]];
	[] remoteExec ["CXPSV_fnc_handleBlastingCharge",2];
};

if (typeOf _target isEqualTo "Land_Atm_02_F") exitWith {
	private _assaltante = player;
	private _premio = CXP_SETTINGS(getNumber,"premio_assalto_banco");

	if !(_target getVariable "podeSerAssaltada") exitWith {hint "Esta agencia nao pode ser assaltada no momento. Tente outra!"};
	if (cxp_assaltando_banco) exitWith {hint"Voce ja esta assaltando uma agencia de banco no momento!"};

	private _chance = random(100);
	if (_chance < 50) then {
		[1,format["DENÚNCIA ANÔNIMA: A agencia do banco %1 esta sendo assaltada !", _target]] remoteExecCall ["cxp_fnc_broadcast",west];
		hint "O caixa tinha um alarme escondido. CUIDADO, a policia foi avisada e ja esta a caminho. Quem avisa amigo é !";
	};
	if (west countSide playableUnits < CXP_SETTINGS(getNumber,"minCopOn_assalto_banco")) exitWith {
		hint format ["Não há policiais suficientes para assaltar agencias de banco no momento. (NUMERO MINIMO : %1)",(CXP_SETTINGS(getNumber,"minCopOn_assalto_banco"))];
	};

	if !([false,"blastingcharge",1] call cxp_fnc_handleInv) exitWith {}; //Error?

	cxp_assaltando_banco = true;
	_target setVariable ["podeSerAssaltada",false,false];

	disableSerialization;
	5 cutRsc ["cxp_progress","PLAIN"];

	private _ui = uiNameSpace getVariable "cxp_progress";
	private _progress = _ui displayCtrl 38201;
	private _pgText = _ui displayCtrl 38202;

	_pgText ctrlSetText format["Assaltando agencia de banco (fique em menos de 15m do caixa) (1%1)...","%"];
	_progress progressSetPosition 0.01;
	private _cP = 0.01;

	private _numAvis = 0;
	for "_i" from 0 to 1 step 0 do {
		sleep 4;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format ["Assaltando agencia de banco (fique a menos de 15m do caixa) (%1%2)...",round(_cP * 100),"%"];

		private _marcadorAsPst = createMarker ["AlertBancoMk_1", _target];
		"AlertBancoMk_1" setMarkerColor "ColorRed";
		"AlertBancoMk_1" setMarkerText "ATENÇÃO: AGENCIA BANCO SENDO ASSALTADA";
		"AlertBancoMk_1" setMarkerType "mil_warning";

		// Correção do bug da msg infinita...
		if (_numAvis < 6) then {
			[1,format["ALERTA : Uma agencia de banco está sendo assaltada. Abra seu mapa para conferir!"]] remoteExecCall ["cxp_fnc_broadcast",RANY];
		};

		if (_cP >= 1) exitWith {};
		if (_assaltante distance _target > 15) exitWith {cxp_assaltando_banco = false;};
		if !(alive _assaltante) exitWith {cxp_assaltando_banco = false;};
		if !(cxp_assaltando_banco) exitWith {};
		if !(isNull (findDisplay 49)) exitWith {};
		_numAvis = _numAvis + 1;
	};

	if !(isNull (findDisplay 49)) exitWith {
		hint "Assalto cancelado!";
		deleteMarker "AlertBancoMk_1";
		5 cutText ["","PLAIN"];
		cxp_assaltando_banco = false;
		_target setVariable ["podeSerAssaltada",true,true];
	};

	if !(alive _assaltante) exitWith {
		hint "Assalto cancelado!";
		deleteMarker "AlertBancoMk_1";
		5 cutText ["","PLAIN"];
		cxp_assaltando_banco = false;
		_target setVariable ["podeSerAssaltada",true,true];
	};

	if (_assaltante distance _target > 15) exitWith {
		deleteMarker "AlertBancoMk_1";
		hint "Voce precisa ficar a menos de 15m do caixa para concluir o assalto..";
		5 cutText ["","PLAIN"];
		cxp_assaltando_banco = false;
		_target setVariable ["podeSerAssaltada",true,true];
	};

	_bomba = "Bo_Mk82" createVehicle [getPosATL _target select 0, getPosATL _target select 1, (getPosATL _target select 2)];
	5 cutText ["","PLAIN"];
	deleteMarker "AlertBancoMk_1";
	titleText[format["Você roubou R$%1, fuja para não ser pego pela polícia !",[_premio] call cxp_fnc_numberText],"PLAIN"];
	cxp_assaltando_banco = false;

	// add grana pro assaltante
	CASH = CASH + _premio;
	[true] call cxp_fnc_hudUpdate;

	// add player na lista de procurado
	if (cxp_CXPHC_isActive) then {
	  	[getPlayerUID _assaltante,_assaltante getVariable ["realname",name _assaltante],"211"] remoteExecCall ["cxp_fnc_wantedAdd",CXP_HC];
	} else {
		[getPlayerUID _assaltante,_assaltante getVariable ["realname",name _assaltante],"211"] remoteExecCall ["cxp_fnc_wantedAdd",RSERV];
	};

	[] spawn {
		cxp_use_atm = false;
		sleep (60 + random(180));
		cxp_use_atm = true;
	};

	// Tempo para assaltar essa agencia novamente
	sleep (CXP_SETTINGS(getNumber,"tempoVoltarNpc_assalto_banco"));

	_target setVariable ["podeSerAssaltada",true,true];
};
