#include "\cxp_server\script_macros.hpp"
/*
    File: fn_processAction.sqf
    Author: Bryan "Tonic" Boardwine

    Modified : NiiRoZz & Casperento

    Description:
    Master handling for processing an item.
    NiiRoZz : Added multiprocess
    Casperento : Code optimization && fuck the NoLicenseCost code
*/
private _vendor = param [0,objNull,[objNull]];
private _type = param [3,"",[""]];

//Error check
if (vehicle player != player) exitWith {hint"Saia do veiculo para processar seu farm !"};
if (isNull _vendor || _type isEqualTo "" || (player distance _vendor > 10)) exitWith {};
cxp_action_inUse = true;//Lock out other actions during processing.

private "_filter";
private "_materialsRequired";
private "_materialsGiven";
private "_text";
if (isClass (missionConfigFile >> "ProcessAction" >> _type)) then {
    _filter = false;
    _materialsRequired = M_CONFIG(getArray,"ProcessAction",_type,"MaterialsReq");
    _materialsGiven = M_CONFIG(getArray,"ProcessAction",_type,"MaterialsGive");
    _text = M_CONFIG(getText,"ProcessAction",_type,"Text");
} else {
    _filter = true;
};

if (_filter) exitWith {cxp_action_inUse = false;};

private _itemInfo = [_materialsRequired,_materialsGiven,(localize format ["%1",_text])];
if (count _itemInfo isEqualTo 0) exitWith {cxp_action_inUse = false;};

//Setup vars.
private _oldItem = _itemInfo select 0;
private _newItem = _itemInfo select 1;
private _upp = _itemInfo select 2;
private _exit = false;

if (count _oldItem isEqualTo 0) exitWith {cxp_action_inUse = false;};

private _totalConversions = [];
{
    _var = ITEM_VALUE(_x select 0);
    if (_var isEqualTo 0) exitWith {_exit = true;};
    if (_var < (_x select 1)) exitWith {_exit = true;};
    _totalConversions pushBack (floor (_var/(_x select 1)));
} forEach _oldItem;

if (_exit) exitWith {
    cxp_is_processing = false;
    hint localize "STR_NOTF_NotEnoughItemProcess";
    cxp_action_inUse = false;
};

// process from ganghideout
private "_hasLicense";
if (_vendor in [gang_proc_1,gang_proc_2,gang_proc_3]) then {
    _hasLicense = true;
} else {
    _hasLicense = LICENSE_VALUE(_type,"civ");
};

private _minimumConversions = _totalConversions call BIS_fnc_lowestNum;
private _oldItemWeight = 0;
{
    _weight = ([_x select 0] call cxp_fnc_itemWeight) * (_x select 1);
    _oldItemWeight = _oldItemWeight + _weight;
} count _oldItem;

private _newItemWeight = 0;
{
    _weight = ([_x select 0] call cxp_fnc_itemWeight) * (_x select 1);
    _newItemWeight = _newItemWeight + _weight;
} count _newItem;

_exit = false;

if (_newItemWeight > _oldItemWeight) then {
    _netChange = _newItemWeight - _oldItemWeight;
    _freeSpace = cxp_maxWeight - cxp_carryWeight;
    if (_freeSpace < _netChange) exitWith {_exit = true;};
    private _estConversions = floor(_freeSpace / _netChange);
    if (_estConversions < _minimumConversions) then {
        _minimumConversions = _estConversions;
    };
};

if (_exit) exitWith {
    hint localize "STR_Process_Weight";
    cxp_is_processing = false;
    cxp_action_inUse = false;
};

//Setup our progress bar.
disableSerialization;
"progressBar" cutRsc ["cxp_progress","PLAIN"];
private _ui = uiNamespace getVariable "cxp_progress";
private _progress = _ui displayCtrl 38201;
private _pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format ["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
private _cP = 0.01;

cxp_is_processing = true;

if (_hasLicense) then {
    for "_i" from 0 to 1 step 0 do {
        sleep  0.28;
        _progress progressSetPosition _cP;
        _pgText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_upp];
        if (_cP >= 1) exitWith {};
        if (vehicle player != player) exitWith {hint"Saia do veiculo para processar seu farm !"};
        if (player distance _vendor > 10) exitWith {};
        if (player getVariable ["downed",false]) exitWith {};
    };
    if (player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; "progressBar" cutText ["","PLAIN"]; cxp_is_processing = false; cxp_action_inUse = false;};
	if (player getVariable ["downed",false]) exitWith {titleText[localize "STR_NOTF_ActionCancel","PLAIN"];cxp_is_processing = false; cxp_action_inUse = false;};
    if (vehicle player != player) exitWith {hint"Saia do veiculo para processar seu farm !"};

    {
        [false,(_x select 0),((_x select 1)*(_minimumConversions))] call cxp_fnc_handleInv;
    } count _oldItem;

    {
        [true,(_x select 0),((_x select 1)*(_minimumConversions))] call cxp_fnc_handleInv;
    } count _newItem;

    "progressBar" cutText ["","PLAIN"];
    if (_minimumConversions isEqualTo (_totalConversions call BIS_fnc_lowestNum)) then {hint localize "STR_NOTF_ItemProcess";} else {hint localize "STR_Process_Partial";};
    [0] call CXPSKT_fnc_updatePartial;
    cxp_is_processing = false; 
    cxp_action_inUse = false;
} else {
    for "_i" from 0 to 1 step 0 do {
        sleep  0.7;
        _cP = _cP + 0.01;
        _progress progressSetPosition _cP;
        _pgText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_upp];
        if (_cP >= 1) exitWith {};
		if (vehicle player != player) exitWith {hint"Saia do veiculo para processar seu farm !"};
        if (player distance _vendor > 10) exitWith {};
    };
    if (player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; "progressBar" cutText ["","PLAIN"]; cxp_is_processing = false; cxp_action_inUse = false;};
    if (vehicle player != player) exitWith {hint"Saia do veiculo para processar seu farm !"};

	{
        [false,(_x select 0),((_x select 1)*(_minimumConversions))] call cxp_fnc_handleInv;
    } count _oldItem;

    {
        [true,(_x select 0),((_x select 1)*(_minimumConversions))] call cxp_fnc_handleInv;
    } count _newItem;

    "progressBar" cutText ["","PLAIN"];
    if (_minimumConversions isEqualTo (_totalConversions call BIS_fnc_lowestNum)) then {hint localize "STR_NOTF_ItemProcess";} else {hint localize "STR_Process_Partial";};
    [0] call CXPSKT_fnc_updatePartial;
    cxp_is_processing = false;
    cxp_action_inUse = false;
};
