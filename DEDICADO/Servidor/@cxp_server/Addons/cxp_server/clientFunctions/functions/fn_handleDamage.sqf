#include "\cxp_server\script_macros.hpp"
/*
    File: fn_handleDamage.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Casperento
    Description:
    Handles damage, specifically for handling the 'tazer' pistol and something else.
*/
params [
    ["_unit",objNull,[objNull]],
    ["_part","",[""]],
    ["_damage",0,[0]],
    ["_source",objNull,[objNull]],
    ["_projectile","",[""]],
    ["_index",0,[0]]
];

//Handle the tazer first (Top-Priority).
if !(isNull _source) then {
    if (_source != _unit) then {
        // COP/MED TASER
        if !(_unit getVariable["alvo_recompensa", false]) then {
            if (currentWeapon _source in ["hgun_P07_snds_F","arifle_SDAR_F"] && _projectile in ["B_9x21_Ball","B_556x45_dual"]) then {
                if (side _source in [west,independent] && playerSide isEqualTo civilian) then {
                    _damage = 0;
                    if (alive player && !cxp_istazed && !cxp_isBorrachado && !cxp_isknocked && (!(_unit getVariable ["restrained",false]) || !(_unit getVariable ["tied",false]))) then {
                        private _distance = 35;
                        if (_projectile isEqualTo "B_556x45_dual") then {_distance = 100;};
                        if (_unit distance _source < _distance) then {
                            if !(isNull objectParent player) then {
                                if (typeOf (vehicle player) isEqualTo "B_Quadbike_01_F") then {
                                    player action ["Eject",vehicle player];
                                    [_unit,_source] spawn cxp_fnc_tazed;
                                };
                            } else {
                                [_unit,_source] spawn cxp_fnc_tazed;
                            };
                        };
                    };
                };

                //Temp fix for super tasers on cops.
                if (side _source isEqualTo west && playerSide in [west,independent]) then {
                    _damage = 0;
                };
            };
        } else {
            // By Casperento ;)
            if (currentWeapon _source in (CXP_SETTINGS(getArray,"bCFG_bounty_armas")) && _projectile in (CXP_SETTINGS(getArray,"bCFG_bounty_bullet")) && side _source isEqualTo civilian && side _unit isEqualTo civilian && alive player && !cxp_isBorrachado && !cxp_istazed && !cxp_isknocked && (!(_unit getVariable ["restrained",false]) || !(_unit getVariable ["tied",false]))) then {
                private _distance = CXP_SETTINGS(getNumber,"bCFG_distancia_borracha");
                if (_unit distance _source < _distance) then {
                    if !(isNull objectParent player) then {
                        if (typeOf (vehicle player) isEqualTo "B_Quadbike_01_F") then {
                            player action ["Eject",vehicle player];
                        };
                    };
                    private _hitDam = if (_part isEqualTo "") then { damage _unit } else { (_unit getHit _part) };
                    if (getDammage _unit >= 0.95 || (_hitDam + _damage >= 0.95)) then {
                        _damage = 0;
                        [_source] spawn cxp_fnc_handleDowned;
                    };
                };
            };
        };
        //ANTI-VDM -- (By Casperento ;)
        if (vehicle _source isKindOf "LandVehicle") then {
            if ((alive _unit) && (isPlayer _source)) then {
                _damage = 0.001;
                // Retirando licenca de motorista caso configurado para..        
                if (CXP_SETTINGS(getNumber,"remover_lic_motorista_navaia") isEqualTo 1) then {
                    if (cxp_CXPHC_isActive) then {
                        [getPlayerUID _driver,_driver getVariable ["realname",name _driver],"187V"] remoteExecCall ["CXPHC_fnc_wantedAdd",CXP_HC];
                    } else {
                        [getPlayerUID _driver,_driver getVariable ["realname",name _driver],"187V"] remoteExecCall ["cxp_fnc_wantedAdd",RSERV];
                    };
                    if !(local _driver) then {
                        [2] remoteExecCall ["cxp_fnc_removeLicenses",_driver];
                    };
                };
            };
        };
    };
};

// Cinto de seguranca (THX ASYLUM) -- Modified by Casperento
if (((vehicle _unit) isKindOf "Car") && (isNull _source || _source isEqualTo _unit)) then {
    if (cxp_seatbelt) then {
        _damage = _damage / 2;
        private _myDamage = if (_part isEqualTo "") then {damage player} else {_unit getHit _part};
        if (_damage < _myDamage) then {_damage = _myDamage};
    };
};

[false,false] call cxp_fnc_hudUpdate;

_damage;
