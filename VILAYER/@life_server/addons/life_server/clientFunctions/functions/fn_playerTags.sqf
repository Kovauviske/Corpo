#include "\life_server\script_macros.hpp"
/*
    File: fn_playerTags.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Adds the tags above other players heads when close and have visible range.
*/
if !(cxp_settings_tagson) exitWith {};
#define iconID 78000
#define scale 0.8
 
if (visibleMap || {!alive player} || {dialog}) exitWith {500 cutText["","PLAIN"];};
 
private _ui = uiNamespace getVariable ["Cxp_HUD_nameTags",displayNull];
if (isNull _ui) then {
    500 cutRsc["Cxp_HUD_nameTags","PLAIN"];
    _ui = uiNamespace getVariable ["Cxp_HUD_nameTags",displayNull];
};
 
private _masks = CXP_SETTINGS(getArray,"tagsCFG_clothing_masks");
{
    _idc = _ui displayCtrl (iconID + _forEachIndex);
    if (!(lineIntersects [eyePos player, eyePos _x, player, _x]) && alive _x && {!isNil {_x getVariable "realname"}}) then {
        _pos = switch (typeOf _x) do {
            case "Land_Pallet_MilBoxes_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1.5]};
            case "Land_Sink_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2]};
            default {[visiblePosition _x select 0, visiblePosition _x select 1, ((_x modelToWorld (_x selectionPosition "head")) select 2)+.5]};
        };
        _sPos = worldToScreen _pos;
        _distance = _pos distance player;
        if (!((headgear _x) in _masks || (goggles _x) in _masks || (uniform _x) in _masks)) then {
            if (count _sPos > 1 && {_distance < 15}) then {
                _text = switch (true) do {
                    // POLICIA
                    case ((side _x isEqualTo west && {!isNil {_x getVariable "rank"}} && playerSide != west) || (_x in (units group player) && playerSide isEqualTo west) && alive _x): {
                        format ["<img image='%1' size='1.5'></img><t size='1.35' color='#1723c9'>%2</t><br/><t size='0.8'>[%3]</t>",
                            switch ((_x getVariable "rank")) do {
                                case 1: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 0)};
                                case 2: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 1)};
                                case 3: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 2)};
                                case 4: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 3)};
                                case 5: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 4)};
                                case 6: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 5)};
                                case 7: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 6)};
                                case 8: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 7)};
                                case 9: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 8)};
                                case 10: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 9)};
                                case 11: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 10)};
                                case 12: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 11)};
                                case 13: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 12)};
                                case 14: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 13)};
                                case 15: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 14)};
                                case 16: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 15)};
                                case 17: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 16)};
                                case 18: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 17)};
                                case 19: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 18)};
                                case 20: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 19)};
                                case 21: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 20)};
                                case 22: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 21)};
                                case 23: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 22)};
                                case 24: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 23)};
                                case 25: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 24)};
                                case 26: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 25)};
                                case 27: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 26)};
                                case 28: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 27)};
                                case 29: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 28)};
                                case 30: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 29)};
                                case 31: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 30)};
                                case 32: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 31)};
                                case 33: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 32)};
                                case 34: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 33)};
                                case 35: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 34)};
                                case 36: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 35)};
                                case 37: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 36)};
                                case 38: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 37)};
                                case 39: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 38)};
                                case 40: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 39)};
                            },
                            _x getVariable ["realname",name _x],
                            switch ((_x getVariable "rank")) do {
                                case 1: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 0)};
                                case 2: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 1)};
                                case 3: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 2)};
                                case 4: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 3)};
                                case 5: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 4)};
                                case 6: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 5)};
                                case 7: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 6)};
                                case 8: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 7)};
                                case 9: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 8)};
                                case 10: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 9)};
                                case 11: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 10)};
                                case 12: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 11)};
                                case 13: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 12)};
                                case 14: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 13)};
                                case 15: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 14)};
                                case 16: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 15)};
                                case 17: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 16)};
                                case 18: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 17)};
                                case 19: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 18)};
                                case 20: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 19)};
                                case 21: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 20)};
                                case 22: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 21)};
                                case 23: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 22)};
                                case 24: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 23)};
                                case 25: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 24)};
                                case 26: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 25)};
                                case 27: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 26)};
                                case 28: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 27)};
                                case 29: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 28)};
                                case 30: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 29)};
                                case 31: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 30)};
                                case 32: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 31)};
                                case 33: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 32)};
                                case 34: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 33)};
                                case 35: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 34)};
                                case 36: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 35)};
                                case 37: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 36)};
                                case 38: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 37)};
                                case 39: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 38)};
                                case 40: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 39)};
                            }
                        ]
                    };
                    // Bounty Hunter é destacado para cop e med
                    case (side _x isEqualTo civilian && playerSide in [west,independent] && _x getVariable ["clienteBounty",false] && alive _x) : {
                        format ["<t size='1.35' color='#00dfff'>BOUNTY-HUNTER: %1</t><br/>",_x getVariable ["realname",name _x]];
                    };
                    // BOMBEIROS
                    case ((side _x isEqualTo independent && {!isNil {_x getVariable "rankmedic"}} && playerSide != independent) || (_x in (units group player) && playerSide isEqualTo independent) && alive _x): {
                        format["<img image='%1' size='1.5'></img><t size='1.35' color='#FF0000'>%2</t><br/><t size='0.8'>[%3]</t>",
                            switch ((_x getVariable "rankmedic")) do {
                                case 1: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 0)};
                                case 2: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 1)};
                                case 3: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 2)};
                                case 4: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 3)};
                                case 5: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 4)};
                                case 6: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 5)};
                                case 7: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 6)};
                                case 8: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 7)};
                                case 9: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 8)};
                                case 10: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 9)};
                                case 11: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 10)};
                                case 12: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 11)};
                                case 13: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 12)};
                                case 14: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 13)};
                                case 15: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 14)};
                                case 16: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 15)};
                                case 17: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 16)};
                                case 18: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 17)};
                                case 19: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 18)};
                                case 20: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 19)};
                                case 21: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 20)};
                                case 22: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 21)};
                                case 23: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 22)};
                                case 24: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 23)};
                                case 25: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 24)};
                                case 26: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 25)};
                                case 27: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 26)};
                                case 28: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 27)};
                                case 29: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 28)};
                                case 30: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 29)};
                                case 31: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 30)};
                                case 32: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 31)};
                                case 33: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 32)};
                                case 34: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 33)};
                                case 35: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 34)};
                                case 36: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 35)};
                                case 37: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 36)};
                                case 38: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 37)};
                                case 39: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 38)};
                                case 40: {(CXP_SETTINGS(getArray,"tagsCFG_icons_COP") select 39)};
                            },
                            _x getVariable ["realname",name _x],
                            switch ((_x getVariable "rank")) do {
                                case 1: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 0)};
                                case 2: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 1)};
                                case 3: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 2)};
                                case 4: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 3)};
                                case 5: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 4)};
                                case 6: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 5)};
                                case 7: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 6)};
                                case 8: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 7)};
                                case 9: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 8)};
                                case 10: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 9)};
                                case 11: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 10)};
                                case 12: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 11)};
                                case 13: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 12)};
                                case 14: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 13)};
                                case 15: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 14)};
                                case 16: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 15)};
                                case 17: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 16)};
                                case 18: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 17)};
                                case 19: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 18)};
                                case 20: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 19)};
                                case 21: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 20)};
                                case 22: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 21)};
                                case 23: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 22)};
                                case 24: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 23)};
                                case 25: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 24)};
                                case 26: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 25)};
                                case 27: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 26)};
                                case 28: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 27)};
                                case 29: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 28)};
                                case 30: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 29)};
                                case 31: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 30)};
                                case 32: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 31)};
                                case 33: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 32)};
                                case 34: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 33)};
                                case 35: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 34)};
                                case 36: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 35)};
                                case 37: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 36)};
                                case 38: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 37)};
                                case 39: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 38)};
                                case 40: {(CXP_SETTINGS(getArray,"tagsCFG_subTitles_COP") select 39)};
                            }
                        ]
                    };
                    // CIVIL
                    case (side _x isEqualTo civilian && alive _x) : {
                        if (!isNil {(group _x) getVariable "gang_name"}) then {
                            if (_x getVariable["alvo_recompensa", false] && player getVariable ["clienteBounty",false] && getPlayerUID _x in cxp_bounty_uid) then { // ALVO DO BOUNTY HUNTER
                                if ((headgear _x) in _masks || (goggles _x) in _masks || (uniform _x) in _masks || _x getVariable["alvo_recompensa", false]) then {
                                    format["<t color='#ff00f3'>ALVO-RECOMPENSA: %1</t><br/><t size='0.8' color='#B6B6B6'>%2</t><br/>",_x getVariable ["realname",name _x],(group _x) getVariable ["gang_name",""]];
                                };
                            } else {
                                if (_x getVariable ["clienteBounty",false] && player getVariable ["clienteBounty",false] && !(_x in (units group player))) then {
                                    if ((headgear _x) in _masks || (goggles _x) in _masks || (uniform _x) in _masks || _x getVariable ["clienteBounty",false]) then {
                                        format["<t color='#FF0000'>%1<br/><t size='0.8' color='#B6B6B6'>%2</t><br/>",_x getVariable ["realname",name _x],(group _x) getVariable ["gang_name",""]];
                                    };
                                } else {
                                    if (_x in (units group player)) then {
                                        format["<t color='#00e913'>%1</t>",_x getVariable ["realname",name _x]];
                                    } else {
                                        "<t color='#ffffff'>CIDADAO</t>"; // jogador comum
                                    };
                                };
                            };
                        } else {
                            if (_x getVariable["alvo_recompensa", false] && player getVariable ["clienteBounty",false] && getPlayerUID _x in cxp_bounty_uid) then { // ALVO DO BOUNTY HUNTER
                                if ((headgear _x) in _masks || (goggles _x) in _masks || (uniform _x) in _masks || _x getVariable["alvo_recompensa", false]) then {
                                    format["<t color='#ff00f3'>ALVO-RECOMPENSA: %1</t>",_x getVariable ["realname",name _x]];
                                };
                            } else {
                                if (_x getVariable ["clienteBounty",false] && player getVariable ["clienteBounty",false]  && !(_x in (units group player))) then {
                                    if ((headgear _x) in _masks || (goggles _x) in _masks || (uniform _x) in _masks || _x getVariable ["clienteBounty",false]) then {
                                        format["<t color='#FF0000'>%1</t>",_x getVariable ["realname",name _x]];
                                    };
                                } else {
                                    if (_x in (units group player)) then {
                                        format["<t color='#00e913'>%1</t>",_x getVariable ["realname",name _x]];
                                    } else {
                                        "<t color='#ffffff'>CIDADAO</t>"; // jogador comum
                                    };
                                };
                            };
                        };
                    };
                };
 
                _idc ctrlSetStructuredText parseText _text;
                _idc ctrlSetPosition [_sPos select 0, _sPos select 1, 0.4, 0.65];
                _idc ctrlSetScale scale;
                _idc ctrlSetFade 0;
                _idc ctrlCommit 0;
                _idc ctrlShow true;
            } else {
                _idc ctrlShow false;
            };
        } else {
            _idc ctrlShow false;
        };
    } else {
        _idc ctrlShow false;
    };
} forEach ((nearestObjects[(visiblePosition player),["CAManBase","Land_Pallet_MilBoxes_F","Land_Sink_F"],50]) - [player]);