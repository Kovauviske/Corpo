/*
    File: fn_manageSC.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Casperento
    Description:
    User management of whether or not they want to be on a sidechat for their side.
*/
private _unit = param [0,objNull,[objNull]];
private _bool = param [1,false,[false]];
private _side = param [2,civilian,[west]];

if (isNull _unit) exitWith {};

switch (_side) do {
    case west: {
        if (_bool) then {
            cxp_radio_west radioChannelAdd [_unit];
        } else {
            cxp_radio_west radioChannelRemove [_unit];
        };
    };

    case civilian: {
        if (_bool) then {
            cxp_radio_civ radioChannelAdd [_unit];
        } else {
            cxp_radio_civ radioChannelRemove [_unit];
        };
    };

    case independent: {
        if (_bool) then {
            cxp_radio_indep radioChannelAdd [_unit];
        } else {
            cxp_radio_indep radioChannelRemove [_unit];
        };
    };
};
