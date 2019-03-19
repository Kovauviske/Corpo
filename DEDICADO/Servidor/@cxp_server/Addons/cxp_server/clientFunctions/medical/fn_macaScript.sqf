/*
	File: fn_macaScript.sqf
	Author: Casperento
	Description:
	Voce esta proibido de usar este codigo sem a autorizacao do referido autor!
	
	E-mail para compra: devcjax@gmail.com

	ALERTA: SE VOCE MODIFICAR O CODIGO E QUEBRA-LO, NAO SERA PROBLEMA MEU!
*/

/* !!!! NAO MODIFIQUE OS CODIGOS A SEGUIR SEM SABER O QUE ELES REALMENTE FAZEM !!!! */
// Pre-verific
if !((getText(missionConfigFile >> "cxp_maca_config" >> "cxp_maca_gMd")) in ["altislife","coop"]) exitWith {hint "ERRO DE CONFIGURACAO DO SISTEMA DE MACAS: MODO DE JOGO NAO IDENTIFICADO!";diag_log "ERRO DE CONFIGURACAO DO SISTEMA DE MACAS: MODO DE JOGO NAO IDENTIFICADO!";};
if (((getText(missionConfigFile >> "cxp_maca_config" >> "cxp_maca_gMd")) isEqualTo "altislife") && (isNil "cxp_actions")) exitWith {hint "ERRO DE CONFIGURACAO DO SISTEMA DE MACAS: APARENTEMENTE VOCE NAO ESTA RODANDO UM SERVIDOR DE ALTISLIFE!";diag_log "ERRO DE CONFIGURACAO DO SISTEMA DE MACAS: APARENTEMENTE VOCE NAO ESTA RODANDO UM SERVIDOR DE ALTISLIFE!";};

// Cxp Functions
cxp_fnc_animate = compileFinal "
	params [
		[""_unit"",objNull,[objNull]],
		""_anim""
	];
	
	if (isNull _unit) exitWith {};
	_unit switchMove _anim;
";

cxp_fnc_onGetInMan = compileFinal "
	params [
		[""_unit"",objNull,[objNull]],
		""_role"",
		[""_vehicle"",objNull,[objNull]],
		[""_turret"",[],[[]]]
	];

	if (!(side _unit isEqualTo independent) && ((getText(missionConfigFile >> ""cxp_maca_config"" >> ""cxp_maca_gMd"")) isEqualTo ""altislife"")) exitWith {};
	if ((vehicle _unit != _unit) && (count (attachedObjects _unit) > 0) && (count cxp_maca_vName > 0)) then {
		_unit action [""GetOut"",(vehicle _unit)];
		_unit action [""Eject"",(vehicle _unit)];
		titleText [(getText(missionConfigFile >> ""cxp_maca_config"" >> ""cxp_maca_msg_inVeh"")),""PLAIN"",3];
	};
";

cxp_fnc_moveInCargo = compileFinal "
	params [
		[""_veh"",objNull,[objNull]],
		[""_unit"",objNull,[objNull]],
		[""_index"",-1,[0]]
	];
	
	detach _unit;
	[_paciente,""""] remoteExecCall [""cxp_fnc_animate"",0];
	
	if !(isPlayer _unit) then {[_unit] allowGetIn true;};
	if (((getText(missionConfigFile >> ""cxp_maca_config"" >> ""cxp_maca_gMd"")) isEqualTo ""altislife"") && ((getNumber(missionConfigFile >> ""cxp_maca_config"" >> ""cxp_maca_lockIn"")) isEqualTo 1)) then {cxp_disable_getIn = false;};
	if (_index > 0) then {_unit moveInCargo [_veh,_index];} else {_unit moveInCargo _veh;};
	if (((getText(missionConfigFile >> ""cxp_maca_config"" >> ""cxp_maca_gMd"")) isEqualTo ""altislife"") && ((getNumber(missionConfigFile >> ""cxp_maca_config"" >> ""cxp_maca_lockIn"")) isEqualTo 1)) then {cxp_disable_getOut = true;};
";

cxp_fnc_macaScriptPegar = compileFinal "
	params [[""_targetP"",objNull,[objNull]]];
	
	if (isNil ""cxp_maca"") then {cxp_maca = [];};
	if (isNil ""cxp_maca_vName"") then {cxp_maca_vName = [];};
	if (isNil ""cxp_maca_inUse"") then {cxp_maca_inUse = false;};
	if (cxp_maca_inUse) exitWith {hint (getText(missionConfigFile >> ""cxp_maca_config"" >> ""cxp_maca_msg_actBlk""))};
	if (isNull _targetP) exitWith {hint (getText(missionConfigFile >> ""cxp_maca_config"" >> ""cxp_maca_msg_nullTg""))};
	if (count (attachedObjects player) > 0 && ((vehicleVarName ((attachedObjects player) select 0)) in cxp_maca_vName)) exitWith {hint (getText(missionConfigFile >> ""cxp_maca_config"" >> ""cxp_maca_msg_pegBlk""))};
	if ((count cxp_maca) isEqualTo (getNumber(missionConfigFile >> ""cxp_maca_config"" >> ""cxp_maca_nb""))) exitWith {hint (getText(missionConfigFile >> ""cxp_maca_config"" >> ""cxp_maca_msg_pegLimt""))};

	_maca = (getText(missionConfigFile >> ""cxp_maca_config"" >> ""cxp_maca_name"")) createVehicle (getPos player);
	_maca attachTo [player, [0,2,0.6]];
	if ((count cxp_maca > 0) && !((format[""cxp_maca_med_%1"",(count cxp_maca)+1]) in cxp_maca_vName)) then {
		_maca setVehicleVarName format[""cxp_maca_med_%1"",(count cxp_maca)+1];
	} else {
		_maca setVehicleVarName ""cxp_maca_med_1"";
	};
	cxp_maca_vName pushBack (vehicleVarName _maca);
	_maca setVariable [""cxp_maca_comPac"",false,true];
	cxp_maca pushBack _maca;
	[_maca, (getText(missionConfigFile >> ""cxp_maca_config"" >> ""cxp_maca_msg_btnGd"")), ""\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa"", ""\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa"", ""_this distance _target < 3 && (count (attachedObjects _target) < 1) && !(cxp_maca_inUse) && {(switch (side _this) do {case independent:{""""med""""};case west:{""""cop""""};case civilian:{""""civ""""};case east:{""""red""""};} in (getArray(missionConfigFile >> """"cxp_maca_config"""" >> """"cxp_maca_retSide"""")))}"", ""_caller distance _target < 3"", { systemChat (getText(missionConfigFile >> ""cxp_maca_config"" >> ""cxp_maca_msg_sysCt1"")) }, {}, { if (count (attachedObjects player) < 1) then {if !(isNil ""cxp_maca"") then {cxp_maca deleteAt (cxp_maca find _target); cxp_maca_vName deleteAt (cxp_maca_vName find (vehicleVarName _target));}; deleteVehicle _target; systemChat (getText(missionConfigFile >> ""cxp_maca_config"" >> ""cxp_maca_msg_sysCt3""));} else {hint (getText(missionConfigFile >> ""cxp_maca_config"" >> ""cxp_maca_msg_rmBlk""))}; }, { hint (getText(missionConfigFile >> ""cxp_maca_config"" >> ""cxp_maca_msg_rmAdv"")); systemChat (getText(missionConfigFile >> ""cxp_maca_config"" >> ""cxp_maca_msg_sysCt2"")); }, [], (getNumber(missionConfigFile >> ""cxp_maca_config"" >> ""cxp_maca_timer"")), nil, true, false] remoteExec [""BIS_fnc_holdActionAdd"",0,_maca];
";

cxp_fnc_macaScriptColPl = compileFinal "
	if (cxp_maca_inUse) exitWith {hint (getText(missionConfigFile >> ""cxp_maca_config"" >> ""cxp_maca_msg_actBlk""))};
	if !(cursorTarget isKindOf ""Man"") exitWith {hint (getText(missionConfigFile >> ""cxp_maca_config"" >> ""cxp_maca_msg_invdTg""))};
	{
		if (((vehicleVarName _x) in cxp_maca_vName) && {!(_x getVariable [""cxp_maca_comPac"",false])}) then {
			[cursorTarget,""Helper_InjuredRfl""] remoteExecCall [""cxp_fnc_animate"",0];
			cursorTarget attachTo [_x,[-0.17,1,0.25]];
			_x setVariable [""cxp_maca_comPac"",true,true];
		};
	} forEach cxp_maca;
";

cxp_fnc_macaScriptRetPl = compileFinal "
	private _paciente = objNull;
	private _maca = objNull;
	{if ((vehicleVarName _x) in cxp_maca_vName) then {_maca = _x;_maca setVariable [""cxp_maca_comPac"",nil,true];{if (_x isKindOf ""Man"") then {_paciente = _x;};} forEach (attachedObjects _x);};} forEach (attachedObjects player);
	if (!(_paciente isKindOf ""Man"") || (isNull _maca)) exitWith {hint (getText(missionConfigFile >> ""cxp_maca_config"" >> ""cxp_maca_msg_invdTg""))};
	if (count (crew cursorTarget) isEqualTo (([(typeOf cursorTarget),true] call BIS_fnc_crewCount)-1)) exitWith {hint (getText(missionConfigFile >> ""cxp_maca_config"" >> ""cxp_maca_msg_vehFull""));};
	detach _maca;
	if ((typeOf cursorTarget) isEqualTo ""C_Van_02_medevac_F"") then {
		if (count (crew cursorTarget) > 0) then {
			private _indexCarr = [];
			{if (alive _x) then {_indexCarr pushBack (cursorTarget getCargoIndex _x);};} forEach (crew cursorTarget);
			if ((3 in _indexCarr) && !(4 in _indexCarr)) then {
				[cursorTarget,_paciente,4] remoteExecCall [""cxp_fnc_moveInCargo"",_paciente];
			} else {
				if (!(3 in _indexCarr) && (4 in _indexCarr)) then {
					[cursorTarget,_paciente,3] remoteExecCall [""cxp_fnc_moveInCargo"",_paciente];
				} else {
					[cursorTarget,_paciente] remoteExecCall [""cxp_fnc_moveInCargo"",_paciente];
				};
			};
 		} else {
			[cursorTarget,_paciente,3] remoteExecCall [""cxp_fnc_moveInCargo"",_paciente];
		};
	} else {
		if ((cursorTarget isKindOf ""Car"") || (cursorTarget isKindOf ""Air"") || (cursorTarget isKindOf ""Ship"")) then {[cursorTarget,_paciente] remoteExecCall [""cxp_fnc_moveInCargo"",_paciente];};
	};
	cxp_maca deleteAt (cxp_maca find _maca);
	cxp_maca_vName deleteAt (cxp_maca_vName find (vehicleVarName _maca));
	deleteVehicle _maca;
	systemChat (getText(missionConfigFile >> ""cxp_maca_config"" >> ""cxp_maca_msg_mcStrd""));
	cxp_maca_inUse = false;
";

cxp_fnc_macaScriptRetBotC = compileFinal "
	{[_x] remoteExecCall [""cxp_fnc_macaScriptRetBot"",_x];} forEach (crew cursorTarget);
";

cxp_fnc_macaScriptRetBot = compileFinal "
	params [[""_unit"",objNull,[objNull]]];
	[_unit] allowGetIn false;
	_unit action[""Eject"",(vehicle _unit)];
";

cxp_fnc_macaScriptCarregar = compileFinal "
	if (cxp_maca_inUse) exitWith {hint (getText(missionConfigFile >> ""cxp_maca_config"" >> ""cxp_maca_msg_actBlk""))};
	if ((vehicleVarName cursorObject) in cxp_maca_vName) then {cursorObject attachTo [player, [0,2,0.6]]; cxp_maca_inUse = true;};
";

cxp_fnc_macaScriptSoltar = compileFinal "
	{if ((vehicleVarName _x) in cxp_maca_vName) then {detach _x;cxp_maca_inUse = false;};} forEach (attachedObjects player);
";

// Life Actions
if ((getText(missionConfigFile >> "cxp_maca_config" >> "cxp_maca_gMd")) isEqualTo "altislife") then {
	cxp_actions pushBack (player addAction[(getText(missionConfigFile >> "cxp_maca_config" >> "cxp_maca_msg_btnPg")),cxp_fnc_macaScriptPegar,cursorTarget,0,false,false,"",'!(isNull cursorTarget) && ((typeOf cursorTarget) in (getArray(missionConfigFile >> "cxp_maca_config" >> "cxp_veh_maca"))) && (locked cursorTarget isEqualTo 0) && (vehicle player isEqualTo player) && (playerSide isEqualTo independent) && (player distance cursorTarget < 20) && (count (crew cursorTarget) != (([(typeOf cursorTarget),true] call BIS_fnc_crewCount)-1))']);
	cxp_actions pushBack (player addAction[(getText(missionConfigFile >> "cxp_maca_config" >> "cxp_maca_msg_btnCg")),cxp_fnc_macaScriptCarregar,cursorObject,0,false,false,"",'!(isNull cursorObject) && (count cxp_maca > 0) && ((vehicleVarName cursorObject) in cxp_maca_vName) && !(cursorObject in (attachedObjects player)) && (vehicle player isEqualTo player) && (playerSide isEqualTo independent) && (player distance cursorTarget < 3)']);
	cxp_actions pushBack (player addAction[(getText(missionConfigFile >> "cxp_maca_config" >> "cxp_maca_msg_btnSt")),cxp_fnc_macaScriptSoltar,"",0,false,false,"",'(count cxp_maca > 0) && (count (attachedObjects player) > 0) && (vehicle player isEqualTo player) && (playerSide isEqualTo independent)']);
	cxp_actions pushBack (player addAction[(getText(missionConfigFile >> "cxp_maca_config" >> "cxp_maca_msg_btnCv")),cxp_fnc_macaScriptRetPl,cursorTarget,0,false,false,"",'cursorTarget in cxp_vehicles && !(isNull cursorTarget) && ((typeOf cursorTarget) in (getArray(missionConfigFile >> "cxp_maca_config" >> "cxp_veh_maca"))) && (locked cursorTarget isEqualTo 0) && (count (attachedObjects player) > 0) && (vehicle player isEqualTo player) && (playerSide isEqualTo independent) && (player distance cursorTarget < 7)']);
	cxp_actions pushBack (player addAction[(getText(missionConfigFile >> "cxp_maca_config" >> "cxp_maca_msg_btnCm")),cxp_fnc_macaScriptColPl,"",0,false,false,"",'!(isNull cursorTarget) && (isNull attachedTo cursorTarget) && (cursorTarget != player) && (isPlayer cursorTarget) && (cursorTarget isKindOf "Man") && {(count (nearestObjects[player,[(getText(missionConfigFile >> "cxp_maca_config" >> "cxp_maca_name"))],10]) > 0)} && (vehicle player isEqualTo player) && (playerSide isEqualTo independent) && (player distance cursorTarget < 3)']);
} else {
	player addAction[(getText(missionConfigFile >> "cxp_maca_config" >> "cxp_maca_msg_btnPg")),cxp_fnc_macaScriptPegar,cursorTarget,0,false,false,"",'!(isNull cursorTarget) && ((typeOf cursorTarget) in (getArray(missionConfigFile >> "cxp_maca_config" >> "cxp_veh_maca"))) && (vehicle player isEqualTo player) && '+(getText(missionConfigFile >> "cxp_maca_config" >> "cxp_maca_condition"))+' && (player distance cursorTarget < 20) && (count (crew cursorTarget) != (([(typeOf cursorTarget),true] call BIS_fnc_crewCount)-1))'];
	player addAction[(getText(missionConfigFile >> "cxp_maca_config" >> "cxp_maca_msg_btnCg")),cxp_fnc_macaScriptCarregar,cursorObject,0,false,false,"",'!(isNull cursorObject) && (count cxp_maca > 0) && ((vehicleVarName cursorObject) in cxp_maca_vName) && !(cursorObject in (attachedObjects player)) && (vehicle player isEqualTo player) && '+(getText(missionConfigFile >> "cxp_maca_config" >> "cxp_maca_condition"))+' && (player distance cursorTarget < 3)'];
	player addAction[(getText(missionConfigFile >> "cxp_maca_config" >> "cxp_maca_msg_btnSt")),cxp_fnc_macaScriptSoltar,"",0,false,false,"",'(count cxp_maca > 0) && (count (attachedObjects player) > 0) && (vehicle player isEqualTo player) && '+(getText(missionConfigFile >> "cxp_maca_config" >> "cxp_maca_condition"))+''];
	player addAction[(getText(missionConfigFile >> "cxp_maca_config" >> "cxp_maca_msg_btnCv")),cxp_fnc_macaScriptRetPl,cursorTarget,0,false,false,"",'!(isNull cursorTarget) && ((typeOf cursorTarget) in (getArray(missionConfigFile >> "cxp_maca_config" >> "cxp_veh_maca"))) && (count (attachedObjects player) > 0) && (vehicle player isEqualTo player) && '+(getText(missionConfigFile >> "cxp_maca_config" >> "cxp_maca_condition"))+' && (player distance cursorTarget < 7)'];
	if ((getNumber(missionConfigFile >> "cxp_maca_config" >> "cxp_maca_IAComp")) isEqualTo 0) then {
		player addAction[(getText(missionConfigFile >> "cxp_maca_config" >> "cxp_maca_msg_btnCm")),cxp_fnc_macaScriptColPl,"",0,false,false,"",'!(isNull cursorTarget) && (isNull attachedTo cursorTarget) && (cursorTarget != player) && (isPlayer cursorTarget) && (cursorTarget isKindOf "Man") && {(count (nearestObjects[player,[(getText(missionConfigFile >> "cxp_maca_config" >> "cxp_maca_name"))],10]) > 0)} && (vehicle player isEqualTo player) && '+(getText(missionConfigFile >> "cxp_maca_config" >> "cxp_maca_condition"))+' && (player distance cursorTarget < 3)'];
	} else {
		player addAction[(getText(missionConfigFile >> "cxp_maca_config" >> "cxp_maca_msg_retBots")),cxp_fnc_macaScriptRetBotC,"",0,false,false,"",'!(isNull cursorTarget) && (count (crew cursorTarget) > 0) && ((typeOf cursorTarget) in (getArray(missionConfigFile >> "cxp_maca_config" >> "cxp_veh_maca"))) && (vehicle player isEqualTo player) && '+(getText(missionConfigFile >> "cxp_maca_config" >> "cxp_maca_condition"))+' && (player distance cursorTarget < 5)'];
		player addAction[(getText(missionConfigFile >> "cxp_maca_config" >> "cxp_maca_msg_btnCm")),cxp_fnc_macaScriptColPl,"",0,false,false,"",'!(isNull cursorTarget) && (isNull attachedTo cursorTarget) && (cursorTarget != player) && (cursorTarget isKindOf "Man") && {(count (nearestObjects[player,[(getText(missionConfigFile >> "cxp_maca_config" >> "cxp_maca_name"))],10]) > 0)} && (vehicle player isEqualTo player) && '+(getText(missionConfigFile >> "cxp_maca_config" >> "cxp_maca_condition"))+' && (player distance cursorTarget < 3)'];
	};
};

// GetInMan Event Handler
player addEventHandler ["GetInMan",{_this call cxp_fnc_onGetInMan}];

/* !!!! NAO MODIFIQUE OS CODIGOS ANTERIORES SEM SABER O QUE ELES REALMENTE FAZEM !!!! */