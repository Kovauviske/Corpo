/*
	Author : Sla qm inventou essa merda
	Modified : Casperento (Otimizei essa merda)
*/
private _vehicle = cursorTarget;
private _veh = typeOf _vehicle;

if(!(_veh in["B_G_Offroad_01_armed_F","O_MRAP_02_hmg_F","B_Heli_Light_01_stripped_F","O_MRAP_02_F","B_Heli_Light_01_stripped_F"])) exitWith {hint "Voce nao pode destruir um carro se nao for ilegal";};

if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship"))) exitWith {};
if(player distance cursorTarget > 10) exitWith {};

if((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship")) then {
	private _vehicleData = _vehicle getVariable["vehicle_info_owners",[]];
	if(count _vehicleData isEqualTo 0) exitWith {deleteVehicle _vehicle};
	_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	[0,format["%1 seu %2 esta sendo destruido pela policia porque é um veiculo ilegal.",(_vehicleData select 0) select 1,_vehicleName]] remoteExecCall ["cxp_fnc_broadcast",RANY];
	cxp_action_inUse = true;
	private _upp = "Destuindo veiculo";
	//Setup our progress bar.
	disableSerialization;	5 cutRsc ["cxp_progress","PLAIN"];
	private _ui = uiNameSpace getVariable "cxp_progress";
	private _progress = _ui displayCtrl 38201;
	private _pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
    private _cP = 0.01;
	for "_i" from 0 to 1 step 0 do	{
		sleep 0.09;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if (_cP >= 1) exitWith {};
		if (player distance _vehicle > 10) exitWith {};
		if !(alive player) exitWith {};
	};
	5 cutText ["","PLAIN"];
	if(player distance _vehicle > 10) exitWith {
		hint "Destruiçao cancelada.";
		cxp_action_inUse = false;
	};
	if !(alive player) exitWith {cxp_action_inUse = false;};
	if((count crew _vehicle) isEqualTo 0) then {
		if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship"))) exitWith {cxp_action_inUse = false;};
		private _type = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
		switch (true) do {
			case (_vehicle isKindOf "Car");
			case (_vehicle isKindOf "Ship");
			case (_vehicle isKindOf "Air");
		};
		[player,_vehicle] remoteExec ["CXPSV_fnc_chopShopSell"];
		hint format["Voce destruiu o veiculo %1, esteja ciente que foi por uma boa causa!",_type];
		[0,format["%1 destruiu o(a) %3 de %2",name player,(_vehicleData select 0) select 1,_vehicleName]] remoteExecCall ["cxp_fnc_broadcast",RANY];
	} else {
		hint "Destruiçao cancelada.";
	};
};

cxp_action_inUse = false;