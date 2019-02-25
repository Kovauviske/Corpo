/*
    File: fn_say3D.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Casperento

    Description:
    Pass your sounds that you want everyone nearby to hear through here.

    Example:
    [_veh,"unlock",50,1] remoteExec ["cxp_fnc_say3D",RANY];
*/
params [
    ["_object",objNull,[objNull]],
    ["_sound","",[""]],
    ["_distance",100,[0]],
    ["_pitch",1,[0]]
];

if (isNull _object || {_sound isEqualTo ""}) exitWith {};
if (_distance < 0) then {_distance = 100};
_object say3D [_sound,_distance,_pitch];
