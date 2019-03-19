#include "\cxp_server\script_macros.hpp"
/*
	File: fn_vInteractionMenu.sqf
	Author:  Casperento

  Description:
  Menu de interacao dos veiculos,
	para todos : SAMU/COP/CIV
*/
disableSerialization;

if !(dialog) then {createDialog "vInteraction_Menu";};

private _curTarget = param [0,objNull,[objNull]];
if (isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
private _isVehicle = if ((_curTarget isKindOf "landVehicle") || (_curTarget isKindOf "Ship") || (_curTarget isKindOf "Air")) then {true} else {false};
if !(_isVehicle) exitWith {closeDialog 0;};

private _Btn1 = CONTROL(37400,37450);
private _Btn2 = CONTROL(37400,37451);
private _Btn3 = CONTROL(37400,37452);
private _Btn4 = CONTROL(37400,37453);
private _Btn5 = CONTROL(37400,37454);
private _Btn6 = CONTROL(37400,37455);
private _Btn7 = CONTROL(37400,37456);
private _Btn8 = CONTROL(37400,37457);
private _Btn9 = CONTROL(37400,37458);
cxp_vInact_curTarget = _curTarget;
private _dlcVehicles = CXP_SETTINGS(getArray,"dlc_vehicles_list");
private _id = getObjectDLC _curTarget;
if !(isNull cxp_vInact_curTarget) then {{ _x ctrlShow false;} forEach [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7,_Btn8,_Btn9];};

// Consertar veh
_Btn1 ctrlShow true;
_Btn1 ctrlSetText localize "STR_vInAct_Repair";
_Btn1 buttonSetAction "[cxp_vInact_curTarget] spawn cxp_fnc_repairTruck;";
if ((cxp_inv_toolkit >= 1) && {alive cxp_vInact_curTarget} && {([cxp_vInact_curTarget] call cxp_fnc_isDamaged)}) then {_Btn1 ctrlEnable true;} else {_Btn1 ctrlEnable false;};

switch (playerSide) do {
	case west : {
    	// Ver dono do carro
    	_Btn2 ctrlShow true;
		_Btn2 ctrlSetText localize "STR_vInAct_Registration";
		_Btn2 buttonSetAction "[cxp_vInact_curTarget] spawn cxp_fnc_searchVehAction;";

    	// Procurar itens no veh
    	_Btn3 ctrlShow true;
		_Btn3 ctrlSetText localize "STR_vInAct_SearchVehicle";
		_Btn3 buttonSetAction "[cxp_vInact_curTarget] spawn cxp_fnc_vehInvSearch;";

    	// Retirar players do veh
    	_Btn4 ctrlShow true;
		_Btn4 ctrlSetText localize "STR_vInAct_PullOut";
		_Btn4 buttonSetAction "[cxp_vInact_curTarget] spawn cxp_fnc_pulloutAction;";
		if (count crew _curTarget isEqualTo 0) then {_Btn4 ctrlEnable false;};

    	// Apreender veh
    	_Btn5 ctrlShow true;
		_Btn5 ctrlSetText localize "STR_vInAct_Impound";
		_Btn5 buttonSetAction "[cxp_vInact_curTarget] spawn cxp_fnc_impoundAction;closeDialog 0;";

    	// Empurrar/Forcar entrada em veh dlc/Unflip
    	_Btn6 ctrlShow true;
		if (_curTarget isKindOf "Ship") then {
			_Btn6 ctrlSetText localize "STR_vInAct_PushBoat";
			_Btn6 buttonSetAction "[] spawn cxp_fnc_pushObject; closeDialog 0;";
			if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget isEqualTo 0}) then { _Btn6 ctrlEnable true;} else {_Btn6 ctrlEnable false};
		} else {
			if !(isNil "_id") then {
				if (typeOf _curTarget in _dlcVehicles) then {
					_Btn6 ctrlSetText localize "STR_vInAct_GetInVehicle";
					_Btn6 buttonSetAction "player moveInDriver cxp_vInact_curTarget; closeDialog 0;";
					if (!(alive _curTarget) || {!(canMove _curTarget)} || {locked _curTarget in [2,3]}) then {_Btn6 ctrlEnable false;_Btn6 ctrlSetToolTip "Destranque o veiculo p/ entrar ou concerte-o...";} else {_Btn6 ctrlEnable true;};
				} else {
					_Btn6 ctrlSetText localize "STR_vInAct_Unflip";
					_Btn6 buttonSetAction "cxp_vInact_curTarget setPos [getPos cxp_vInact_curTarget select 0, getPos cxp_vInact_curTarget select 1, (getPos cxp_vInact_curTarget select 2)+0.5]; closeDialog 0;";
					if (alive _curTarget && {crew _curTarget isEqualTo []} && {canMove _curTarget}) then { _Btn6 ctrlEnable false;} else {_Btn6 ctrlEnable true;};
				};
			} else {
				_Btn6 ctrlSetText localize "STR_vInAct_Unflip";
				_Btn6 buttonSetAction "cxp_vInact_curTarget setPos [getPos cxp_vInact_curTarget select 0, getPos cxp_vInact_curTarget select 1, (getPos cxp_vInact_curTarget select 2)+0.5]; closeDialog 0;";
				if (alive _curTarget && {crew _curTarget isEqualTo []} && {canMove _curTarget}) then { _Btn6 ctrlEnable false;} else {_Btn6 ctrlEnable true;};
			};
		};

    	// Desmanchar veh
    	_Btn7 ctrlShow true;
		_Btn7 ctrlSetText localize "STR_vInAct_Crush";
		_Btn7 buttonSetAction "[cxp_vInact_curTarget] spawn cxp_fnc_copCrush;";

		// Desvirar veiculo (opcao fixa para veiculos dlc)
		if !(isNil "_id") then {
			_Btn8 ctrlShow true;
			_Btn8 ctrlSetText localize "STR_vInAct_Unflip";
			_Btn8 buttonSetAction "cxp_vInact_curTarget setPos [getPos cxp_vInact_curTarget select 0, getPos cxp_vInact_curTarget select 1, (getPos cxp_vInact_curTarget select 2)+0.5]; closeDialog 0;";
			if (alive _curTarget && {crew _curTarget isEqualTo []} && {canMove _curTarget}) then {_Btn8 ctrlEnable false;_Btn8 ctrlSetTooltip "Para desvirar o veiculo todos os jogadores devem estar fora dele...";} else {_Btn8 ctrlEnable true;};
		};
	};

	case independent : {
    	// Retirar players do veh
    	_Btn2 ctrlShow true;
		_Btn2 ctrlSetText localize "STR_vInAct_PullOut";
		_Btn2 buttonSetAction "[cxp_vInact_curTarget] spawn cxp_fnc_pulloutAction;";
		if (count crew _curTarget isEqualTo 0) then {_Btn2 ctrlEnable false;};

    	// Apreender veh
    	_Btn3 ctrlShow true;
		_Btn3 ctrlSetText localize "STR_vInAct_Impound";
		_Btn3 buttonSetAction "[cxp_vInact_curTarget] spawn cxp_fnc_impoundAction;closeDialog 0;";

    	// Empurrar/Forcar entrada em veh dlc/Unflip
    	_Btn4 ctrlShow true;
		if (_curTarget isKindOf "Ship") then {
			_Btn4 ctrlSetText localize "STR_vInAct_PushBoat";
			_Btn4 buttonSetAction "[] spawn cxp_fnc_pushObject; closeDialog 0;";
			if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget isEqualTo 0}) then {
				_Btn4 ctrlEnable true;
			} else {
				_Btn4 ctrlEnable false
			};
		} else {
			if !(isNil "_id") then {
				if (typeOf _curTarget in _dlcVehicles) then {
					_Btn4 ctrlSetText localize "STR_vInAct_GetInVehicle";
					_Btn4 buttonSetAction "player moveInDriver cxp_vInact_curTarget; closeDialog 0;";
					if (!(alive _curTarget) || {!(canMove _curTarget)} || {locked _curTarget in [2,3]}) then {_Btn4 ctrlEnable false;_Btn4 ctrlSetToolTip "Destranque o veiculo p/ entrar ou concerte-o...";} else {_Btn4 ctrlEnable true;};
				}else{
					_Btn4 ctrlSetText localize "STR_vInAct_Unflip";
					_Btn4 buttonSetAction "cxp_vInact_curTarget setPos [getPos cxp_vInact_curTarget select 0, getPos cxp_vInact_curTarget select 1, (getPos cxp_vInact_curTarget select 2)+0.5]; closeDialog 0;";
					if (alive _curTarget && {crew _curTarget isEqualTo []} && {canMove _curTarget}) then { _Btn4 ctrlEnable false;} else {_Btn4 ctrlEnable true;};
				};
			} else {
				_Btn4 ctrlSetText localize "STR_vInAct_Unflip";
				_Btn4 buttonSetAction "cxp_vInact_curTarget setPos [getPos cxp_vInact_curTarget select 0, getPos cxp_vInact_curTarget select 1, (getPos cxp_vInact_curTarget select 2)+0.5]; closeDialog 0;";
				if (alive _curTarget && {crew _curTarget isEqualTo []} && {canMove _curTarget}) then { _Btn4 ctrlEnable false;} else {_Btn4 ctrlEnable true;};
			};
		};

		// Ver dono do carro
		_Btn5 ctrlShow true;
		_Btn5 ctrlSetText localize "STR_vInAct_Registration";
		_Btn5 buttonSetAction "[cxp_vInact_curTarget] spawn cxp_fnc_searchVehAction;";
		
		// Desvirar veiculo (opcao fixa para veiculos dlc)
		if !(isNil "_id") then {
			_Btn6 ctrlShow true;
			_Btn6 ctrlSetText localize "STR_vInAct_Unflip";
			_Btn6 buttonSetAction "cxp_vInact_curTarget setPos [getPos cxp_vInact_curTarget select 0, getPos cxp_vInact_curTarget select 1, (getPos cxp_vInact_curTarget select 2)+0.5]; closeDialog 0;";
			if (alive _curTarget && {crew _curTarget isEqualTo []} && {canMove _curTarget}) then {_Btn6 ctrlEnable false;_Btn6 ctrlSetTooltip "Para desvirar o veiculo todos os jogadores devem estar fora dele...";} else {_Btn6 ctrlEnable true;};
		};
	};

	case civilian : {
    	// Empurrar/Forcar entrada em veh dlc/Unflip
    	_Btn2 ctrlShow true;
		if (_curTarget isKindOf "Ship") then {
			_Btn2 ctrlSetText localize "STR_vInAct_PushBoat";
			_Btn2 buttonSetAction "[] spawn cxp_fnc_pushObject; closeDialog 0;";
			if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget isEqualTo 0}) then { _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
		} else {
			if !(isNil "_id") then {
				if (typeOf _curTarget in _dlcVehicles) then {
					_Btn2 ctrlSetText localize "STR_vInAct_GetInVehicle";
					_Btn2 buttonSetAction "player moveInDriver cxp_vInact_curTarget; closeDialog 0;";
					if (!(alive _curTarget) || {!(canMove _curTarget)} || {locked _curTarget in [2,3]}) then {_Btn2 ctrlEnable false;_Btn2 ctrlSetToolTip "Destranque o veiculo p/ entrar ou concerte-o...";} else {_Btn2 ctrlEnable true;};
				}else{
					_Btn2 ctrlSetText localize "STR_vInAct_Unflip";
					_Btn2 buttonSetAction "cxp_vInact_curTarget setPos [getPos cxp_vInact_curTarget select 0, getPos cxp_vInact_curTarget select 1, (getPos cxp_vInact_curTarget select 2)+0.5]; closeDialog 0;";
					if (alive _curTarget && {crew _curTarget isEqualTo []} && {canMove _curTarget}) then { _Btn2 ctrlEnable false;} else {_Btn2 ctrlEnable true;};
				};
			} else {
				_Btn2 ctrlSetText localize "STR_vInAct_Unflip";
				_Btn2 buttonSetAction "cxp_vInact_curTarget setPos [getPos cxp_vInact_curTarget select 0, getPos cxp_vInact_curTarget select 1, (getPos cxp_vInact_curTarget select 2)+0.5]; closeDialog 0;";
				if (alive _curTarget && {crew _curTarget isEqualTo []} && {canMove _curTarget}) then { _Btn2 ctrlEnable false;} else {_Btn2 ctrlEnable true;};
			};
		};

    	// Ligar minerador device
    	_Btn3 ctrlShow true;
		_Btn3 ctrlSetText localize "STR_vInAct_DeviceMine";
		if (typeOf _curTarget isEqualTo "O_Truck_03_device_F") then {
			_Btn3 buttonSetAction "[cxp_vInact_curTarget] spawn cxp_fnc_deviceMine";
			if (!isNil {(_curTarget getVariable "mining")} OR !local _curTarget && {_curTarget in cxp_vehicles}) then {
				_Btn3 ctrlEnable false;
			} else {
				_Btn3 ctrlEnable true;
			};
		} else {
			_Btn3 ctrlSetToolTip "Este veículo não farma sozinho!";
			_Btn3 ctrlEnable false;
			if (typeOf (_curTarget) in ["C_Van_01_fuel_F","I_Truck_02_fuel_F","B_Truck_01_fuel_F"] && _curTarget in cxp_vehicles) then {
				_Btn3 ctrlEnable true;
				if (!isNil {_curTarget getVariable "fuelTankWork"}) then {
					_Btn3 ctrlSetText localize "STR_FuelTank_Stop";
					_Btn3 ctrlSetToolTip localize "STR_FuelTank_Stop";
					_Btn3 buttonSetAction "cxp_vInact_curTarget setVariable [""fuelTankWork"",nil,true]; closeDialog 0;";
				} else {
					if (count (nearestObjects [_curTarget, ["Land_FuelStation_Feed_F","Land_fs_feed_F"], 15]) > 0) then {
						_Btn3 ctrlSetText localize "STR_FuelTank_Supply";
						_Btn3 ctrlSetToolTip localize "STR_FuelTank_Supply";
						_Btn3 buttonSetAction "[cxp_vInact_curTarget] spawn cxp_fnc_fuelSupply";
					}else{
						{
							if (player distance (getMarkerPos _x) < 20) exitWith {
								_Btn3 ctrlSetText localize "STR_FuelTank_Store";
								_Btn3 ctrlSetToolTip localize "STR_FuelTank_Store";
								_Btn3 buttonSetAction "[cxp_vInact_curTarget] spawn cxp_fnc_fuelStore";
							};
						} forEach ["fuel_storage_1","fuel_storage_2"];
					};
				};
			};
		};

    	// Retirar players do veh -- só o(s) dono(s) conseguem habilitar esta ação
    	_Btn4 ctrlShow true;
		_Btn4 ctrlSetText localize "STR_vInAct_PullOut";
		_Btn4 buttonSetAction "[cxp_vInact_curTarget] spawn cxp_fnc_pulloutAction;";
		private _realDonos = ((cxp_vInact_curTarget getVariable "vehicle_info_owners") select 0);
		if (CXP_SETTINGS(getNumber,"log_pullOut_dono") isEqualTo 1) then {
			diag_log format["Donos do veículo que esta recebendo o comando PullOut : %1",(cxp_vInact_curTarget getVariable "vehicle_info_owners")];
			diag_log format["Donos Reais do veículo que esta recebendo o comando PullOut : %1",_realDonos];
		};
		if (count crew _curTarget isEqualTo 0 || !(name player in _realDonos)) then {_Btn4 ctrlEnable false;};
	
		// Desvirar veiculo (opcao fixa para veiculos dlc)
		if !(isNil "_id") then {
			_Btn5 ctrlShow true;
			_Btn5 ctrlSetText localize "STR_vInAct_Unflip";
			_Btn5 buttonSetAction "cxp_vInact_curTarget setPos [getPos cxp_vInact_curTarget select 0, getPos cxp_vInact_curTarget select 1, (getPos cxp_vInact_curTarget select 2)+0.5]; closeDialog 0;";
			if (alive _curTarget && {crew _curTarget isEqualTo []} && {canMove _curTarget}) then {_Btn5 ctrlEnable false;_Btn5 ctrlSetTooltip "Para desvirar o veiculo todos os jogadores devem estar fora dele...";} else {_Btn5 ctrlEnable true;};
		};
	};
};