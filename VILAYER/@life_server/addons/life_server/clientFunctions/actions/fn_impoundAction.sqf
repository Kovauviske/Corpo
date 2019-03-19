#include "\life_server\script_macros.hpp"
/*
    File: fn_impoundAction.sqf
    Author: Bryan "Tonic" Boardwine

	Modified : Casperento

    Description:
    Apreende veiculos
*/
private _vehicle = param [0,ObjNull,[ObjNull]];
private _filters = ["Car","Air","Ship"];

if !(KINDOF_ARRAY(_vehicle,_filters)) exitWith {};
if (player distance cursorObject > 10) exitWith {};
if (_vehicle getVariable "NPC") exitWith {hint localize "STR_NPC_Protected"};

private _vehicleData = _vehicle getVariable ["vehicle_info_owners",[]];
if (_vehicleData isEqualTo 0) exitWith {deleteVehicle _vehicle}; //Bad vehicle.

// Verificação anti-bug para nao estragar a string de aviso!
private _nomeMot = ((_vehicleData select 0) select 1);
if (_nomeMot isEqualTo "any") then {_nomeMot="Jogador";};
private _vehicleName = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _vehicle),"displayName");

if !(_vehicle in cxp_vehicles) then {
    switch (playerSide) do {
        case west : {
            [0,"STR_NOTF_CBeingImpounded",true,[_nomeMot,_vehicleName]] remoteExecCall ["cxp_fnc_broadcast",RCLIENT];
        };
        case independent : {
            [0,"STR_NOTF_MBeingImpounded",true,[_nomeMot,_vehicleName]] remoteExecCall ["cxp_fnc_broadcast",RCLIENT];
        };
    };
};

cxp_action_inUse = true;

// Monta barra de progresso
private _upp = localize "STR_NOTF_Impounding";
disableSerialization;
"progressBar" cutRsc ["cxp_progress","PLAIN"];
private _ui = uiNamespace getVariable "cxp_progress";
private _progress = _ui displayCtrl 38201;
private _pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format ["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
private _cP = 0.01;

for "_i" from 0 to 1 step 0 do {
    sleep 0.09;
    _cP = _cP + 0.01;
    _progress progressSetPosition _cP;
    _pgText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_upp];
    if (_cP >= 1) exitWith {};
    if (player distance _vehicle > 10) exitWith {hint localize "STR_NOTF_ImpoundingCancelled";cxp_action_inUse = false;};
    if !(alive player) exitWith {hint localize "STR_NOTF_ImpoundingCancelled";cxp_action_inUse = false;};
	if (cxp_interrupted) exitWith {hint localize "STR_NOTF_ImpoundingCancelled";cxp_action_inUse = false;};
};

"progressBar" cutText ["","PLAIN"];

if (cxp_interrupted) exitWith {hint localize "STR_NOTF_ImpoundingCancelled";cxp_action_inUse = false;};
if (player distance _vehicle > 10) exitWith {hint localize "STR_NOTF_ImpoundingCancelled"; cxp_action_inUse = false;};
if !(alive player) exitWith {hint localize "STR_NOTF_ImpoundingCancelled";cxp_action_inUse = false;};

if (count crew _vehicle isEqualTo 0) then {
    if !(KINDOF_ARRAY(_vehicle,_filters)) exitWith {cxp_action_inUse = false;};
    private _type = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _vehicle),"displayName");

    cxp_impound_inuse = true;

    if (cxp_CXPHC_isActive) then {
        [_vehicle,true,player] remoteExec ["CXPHC_fnc_vehicleStore",CXP_HC];
    } else {
        [_vehicle,true,player] remoteExec ["CXPSV_fnc_vehicleStore",RSERV];
    };

    waitUntil {!cxp_impound_inuse};

    if (playerSide isEqualTo west) then {
		[0,"STR_NOTF_CopHasImpounded",true,[profileName,_nomeMot,_vehicleName]] remoteExecCall ["cxp_fnc_broadcast",RCLIENT];
		if (_vehicle in cxp_vehicles) then {
			hint format[localize "STR_NOTF_OwnImpounded",[(CXP_SETTINGS(getNumber,"vehicle_cop_impound_price"))] call cxp_fnc_numberText,_type];
			BANK = BANK - (CXP_SETTINGS(getNumber,"vehicle_cop_impound_price"));
		} else {
			hint format[localize "STR_NOTF_Impounded",_type,[(CXP_SETTINGS(getNumber,"vehicle_cop_impound_price"))] call cxp_fnc_numberText];
			BANK = BANK + (CXP_SETTINGS(getNumber,"vehicle_cop_impound_price"));
		};
    };
	if (playerSide isEqualTo independent) then {
		[0,"STR_NOTF_MedHasImpounded",true,[profileName,_nomeMot,_vehicleName]] remoteExecCall ["cxp_fnc_broadcast",RCLIENT];
		if (_vehicle in cxp_vehicles) then {
			hint format[localize "STR_NOTF_OwnImpounded",[(CXP_SETTINGS(getNumber,"vehicle_med_impound_price"))] call cxp_fnc_numberText,_type];
			BANK = BANK - (CXP_SETTINGS(getNumber,"vehicle_med_impound_price"));
		} else {
			hint format[localize "STR_NOTF_Impounded",_type,[(CXP_SETTINGS(getNumber,"vehicle_med_impound_price"))] call cxp_fnc_numberText];
			BANK = BANK + (CXP_SETTINGS(getNumber,"vehicle_med_impound_price"));
		};
	};
	if (BANK < 0) then {BANK = 0;};
	[true] call cxp_fnc_hudUpdate;
	[1] call CXPSKT_fnc_updatePartial;
} else {
    hint localize "STR_NOTF_ImpoundingCancelled";
};
cxp_action_inUse = false;
