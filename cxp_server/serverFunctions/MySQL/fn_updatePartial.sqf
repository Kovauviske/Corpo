/*
    File: fn_updatePartial.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Casperento
    Description:
    Takes partial data of a player and updates it, this is meant to be
    less network intensive towards data flowing through it for updates.
*/
private _uid = [_this,0,"",[""]] call BIS_fnc_param;
private _side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param;
private _mode = [_this,3,-1,[0]] call BIS_fnc_param;

if (_uid isEqualTo "" || _side isEqualTo sideUnknown) exitWith {}; //Bad.
private _query = "";
private "_value1";
private "_value2";
switch (_mode) do {
    case 0: {
        _value = [_this,2,0,[0]] call BIS_fnc_param;
        _value = [_value] call CXPDB_fnc_numberSafe;
        _query = format ["UPDATE players SET cash='%1' WHERE pid='%2'",_value,_uid];
    };

    case 1: {
        _value = [_this,2,0,[0]] call BIS_fnc_param;
        _value = [_value] call CXPDB_fnc_numberSafe;
        _query = format ["UPDATE players SET bankacc='%1' WHERE pid='%2'",_value,_uid];
    };

    case 2: {
        _value = [_this,2,[],[[]]] call BIS_fnc_param;
        //Does something license related but I can't remember I only know it's important?
        for "_i" from 0 to count(_value)-1 do {
            _bool = [(_value select _i) select 1] call CXPDB_fnc_bool;
            _value set[_i,[(_value select _i) select 0,_bool]];
        };
        _value = [_value] call CXPDB_fnc_mresArray;
        switch (_side) do {
            case west: {_query = format ["UPDATE players SET cop_licenses='%1' WHERE pid='%2'",_value,_uid];};
            case civilian: {_query = format ["UPDATE players SET civ_licenses='%1' WHERE pid='%2'",_value,_uid];};
            case independent: {_query = format ["UPDATE players SET med_licenses='%1' WHERE pid='%2'",_value,_uid];};
        };
    };

    case 3: {
        _value = [_this,2,[],[[]]] call BIS_fnc_param;
        _value = [_value] call CXPDB_fnc_mresArray;
        switch (_side) do {
            case west: {_query = format ["UPDATE players SET cop_gear='%1' WHERE pid='%2'",_value,_uid];};
            case civilian: {_query = format ["UPDATE players SET civ_gear='%1' WHERE pid='%2'",_value,_uid];};
            case independent: {_query = format ["UPDATE players SET med_gear='%1' WHERE pid='%2'",_value,_uid];};
        };
    };

    case 4: {
        _value = [_this,2,false,[true]] call BIS_fnc_param;
        _value = [_value] call CXPDB_fnc_bool;
        _value2 = [_this,4,[],[[]]] call BIS_fnc_param;
        _value2 = if (count _value2 isEqualTo 3) then {_value2} else {[0,0,0]};
        _value2 = [_value2] call CXPDB_fnc_mresArray;
        _query = format ["UPDATE players SET civ_alive='%1', civ_position='%2' WHERE pid='%3'",_value,_value2,_uid];
    };

    case 5: {
        _value = [_this,2,false,[true]] call BIS_fnc_param;
        _value = [_value] call CXPDB_fnc_bool;
        _query = format ["UPDATE players SET arrested='%1' WHERE pid='%2'",_value,_uid];
    };

    case 6: {
        _value1 = [_this,2,0,[0]] call BIS_fnc_param;
        _value2 = [_this,4,0,[0]] call BIS_fnc_param;
        _value1 = [_value1] call CXPDB_fnc_numberSafe;
        _value2 = [_value2] call CXPDB_fnc_numberSafe;
        _query = format ["UPDATE players SET cash='%1', bankacc='%2' WHERE pid='%3'",_value1,_value2,_uid];
    };

    case 7: {
        _array = [_this,2,[],[[]]] call BIS_fnc_param;
        [_uid,_side,_array,0] call CXPSV_fnc_keyManagement;
    };

    case 8: {
        _value = [_this,2,0,[0]] call BIS_fnc_param;
        _value = [_value] call CXPDB_fnc_numberSafe;
        _query = format ["UPDATE players SET donorlevel='%1' WHERE pid='%2'",_value,_uid];
    };

    case 9: {
        _value = [_this,2,0,[0]] call BIS_fnc_param;
        _value = [_value] call CXPDB_fnc_numberSafe;
        _query = format ["UPDATE players SET alvo_BH='%1' WHERE pid='%2'",_value,_uid];
    };

};

if (_query isEqualTo "") exitWith {};

[_query,1] call CXPDB_fnc_asyncCall;
