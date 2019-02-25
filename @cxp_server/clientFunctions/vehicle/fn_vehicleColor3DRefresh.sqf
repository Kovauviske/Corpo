/*
    File: fn_vehicleColor3DRefresh.sqf
    Author:
    Modified: NiiRoZz && Casperento

    Description:
    Called when a new selection is made in the rsc box and paint the vehicle with the color selected.
*/
disableSerialization;

_colorIndex = lbValue[2304, (lbCurSel 2304)];
if (isNull cxp_3dPreview_object) exitWith {};

[cxp_3dPreview_object, _colorIndex] call cxp_fnc_colorVehicle;
