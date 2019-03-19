/*
    File: fn_setMapPosition.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Casperento
    Description:
    Sets the given control / maps focus position
*/
disableSerialization;

private _control = param [0,controlNull,[controlNull]];
private _time = param [1,1,[0]];
private _zoom = param [2,0.1,[0]];
private _position = param [3,[],[[]]];
private _listBox = param [4,controlNull,[controlNull]];

if (isNull _control || _position isEqualTo []) exitWith {};

_control ctrlMapAnimAdd [_time,_zoom,_position];
ctrlMapAnimCommit _control;
/*
if !(isNull _listBox) then {
    _lock_mk = (lbCurSel _listBox);
    _lock_mk_local = createMarkerLocal ["lock_mk",_position];
    _lock_mk_local setMarkerTypeLocal "selector_selectedMission";
    _lock_mk_local setMarkerColorLocal "ColorRed";
    [] spawn {
        ["lock_mk",360,true,1,12] spawn BIS_fnc_rotateMarker;
        if !((lbCurSel _listBox) isEqualTo _lock_mk) exitWith {deleteMarkerLocal _lock_mk_local};
    };
};*/