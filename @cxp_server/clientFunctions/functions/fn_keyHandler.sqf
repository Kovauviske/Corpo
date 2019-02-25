#include "\cxp_server\script_macros.hpp"
/*
*    File: fn_keyHandler.sqf
*    Author: Bryan "Tonic" Boardwine
*
*    Modified : Casperento
*
*    Description:
*    Main key handler for event 'keyDown'.
*/
params ["_ctrl", "_code", "_shift", "_ctrlKey", "_alt"];
private _speed = speed cursorObject;
private _handled = false;
private _target = cursorTarget;
private _interactionKey = if (count (actionKeys "User10") isEqualTo 0) then {219} else {(actionKeys "User10") select 0};
private _interruptionKeys = [17,30,31,32]; //A,S,W,D

//Vault handling...
if ((_code in (actionKeys "GetOver") || _code in (actionKeys "salute") || _code in (actionKeys "SitDown") || _code in (actionKeys "Throw") || _code in (actionKeys "GetIn") || _code in (actionKeys "GetOut") || _code in (actionKeys "Fire") || _code in (actionKeys "ReloadMagazine") || _code in [16,18]) && ((player getVariable ["restrained",false]) || (player getVariable ["tied",false]) || (player getVariable ["downed", false]) || (player getVariable ["playerSurrender",false]) || cxp_isknocked || cxp_istazed || cxp_isBorrachado)) exitWith {
    true;
};

if (cxp_action_inUse) exitWith {
    if (!cxp_interrupted && _code in _interruptionKeys) then {
        cxp_interrupted = true;
    };
    _handled;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if (!(actionKeys "User10" isEqualTo []) && {(inputAction "User10" > 0)}) exitWith {
    //Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
    if !(cxp_action_inUse) then {
        [] spawn {
            private _handle = [] spawn cxp_fnc_actionKeyHandler;
            waitUntil {scriptDone _handle};
            cxp_action_inUse = false;
        };
    };
    true;
};

if (cxp_container_active) exitwith {
    //ignore movement actions
    private _allowedMoves = [
        "MoveForward",
        "MoveBack",
        "TurnLeft",
        "TurnRight",
        "MoveFastForward",
        "MoveSlowForward",
        "turbo",
        "TurboToggle",
        "MoveLeft",
        "MoveRight",
        "WalkRunTemp",
        "WalkRunToggle",
        "AdjustUp",
        "AdjustDown",
        "AdjustLeft",
        "AdjustRight",
        "Stand",
        "Crouch",
        "Prone",
        "MoveUp",
        "MoveDown",
        "LeanLeft",
        "LeanLeftToggle",
        "LeanRight",
        "LeanRightToggle"
    ];
    if (({_code in (actionKeys _x)} count _allowedMoves) > 0) exitwith {
        false;
    };
    //handle other keys
    if (_code isEqualTo 57) then {//space key -> place
        cxp_storagePlacing = 0 spawn cxp_fnc_placestorage;
    } else { //other keys -> abort
        if (!isNull cxp_storagePlacing) exitWith {}; //already placing down a box
        if (!isNull cxp_container_activeObj) then {
            deleteVehicle cxp_container_activeObj;
            titleText [localize "STR_NOTF_PlaceContainerAbort", "PLAIN"];
        };
        cxp_container_active = false;
    };
    true;
};

// -- Disable commander/tactical view (Optimised by Casperento)
if (CXP_SETTINGS(getNumber,"disableCommanderView") isEqualTo 1) then {
    if (_code in (actionKeys "tacticalView")) then {
        hint localize "STR_NOTF_CommanderView";
        _handled = true;
    };
};

private "_veh";
private "_locked";
switch (_code) do {
    //F1 - Gesto
    case 59: {
		if (player getVariable "restrained") exitWith {hint "Você não pode mexer as mãos enquanto estiver algemado !"};
		if (player getVariable "tied") exitWith {hint "Você não pode mexer as mãos enquanto estiver algemado !"};
        if (player getVariable ["downed", false]) exitWith {};
		if (vehicle player isEqualTo player && !(cxp_action_inUse)) then {player playActionNow "gestureHi";};
    };
    //F2 - Gesto
    case 60: {
        if (isNil "cxp_count_gestos") exitWith {player playActionNow "gestureHiC";};
        if (cxp_count_gestos isEqualTo CXP_SETTINGS(getNumber,"cxp_gestos_limit")) exitWith {cxp_count_gestos=nil;titleText ["Voce ja usou bastante esse efeito sonoro, pare de trollar e jogue direito!","PLAIN",1];};
		if (player getVariable "restrained") exitWith {hint "Você não pode mexer as mãos enquanto estiver algemado !"};
		if (player getVariable "tied") exitWith {hint "Você não pode mexer as mãos enquanto estiver algemado !"};
        if (player getVariable ["downed", false]) exitWith {};
        if (vehicle player isEqualTo player) then {if !(cxp_action_inUse) then {[player, "paipara",50] remoteExec ["cxp_fnc_say3D",RANY];player playActionNow "gestureHiC";cxp_count_gestos=cxp_count_gestos+1;};};
    };
    //F3 - Gesto
    case 61: {
        if (isNil "cxp_count_gestos") exitWith {player playActionNow "gestureHiB";};
        if (cxp_count_gestos isEqualTo CXP_SETTINGS(getNumber,"cxp_gestos_limit")) exitWith {cxp_count_gestos=nil;titleText ["Voce ja usou bastante esse efeito sonoro, pare de trollar e jogue direito!","PLAIN",1];};
		if (player getVariable ["restrained",false]) exitWith {hint "Você não pode mexer as mãos enquanto estiver algemado !"};
		if (player getVariable ["tied",false]) exitWith {hint "Você não pode mexer as mãos enquanto estiver algemado !"};
        if (player getVariable ["downed", false]) exitWith {};
        if (vehicle player isEqualTo player) then {if !(cxp_action_inUse) then {[player, "errou",50] remoteExec ["cxp_fnc_say3D",RANY];player playActionNow "gestureHiB";cxp_count_gestos=cxp_count_gestos+1;};};
    };
    //F4 - Gesto
    case 62: {
        if (!_shift && !_alt && !_ctrlKey) then {
            if (vehicle player isEqualTo player && !(cxp_action_inUse)) then {player playActionNow "gesturenod";};
        }else{
      		if (_alt) then {
                    [] spawn {
      				private _handle = [] spawn cxp_fnc_limparInvPlayer;
      				waitUntil {scriptDone _handle};
      				_msg = format["O jogador %1 apertou ALT+F4 e perdeu todos os seus itens. Denuncie à administraçao !",name player];
      				[1,_msg] remoteExecCall ["cxp_fnc_broadcast",RANY];
      				[] call CXPSKT_fnc_updateRequest;
      			};
      		};
		};
    };

  	// TAB - Assalto (CIV) / Avisos (COP)
  	case 15 : {
		if (playerSide isEqualTo independent) exitWith {hint "Não fique triste, mas a sua tecla de avisos não é esta. Pressione 'INSERT' parceiro !"};
		if (!_alt && !_ctrlKey && (isPlayer _target) && !(isNull _target) && !(player getVariable ["restrained",false]) && !(player getVariable ["tied",false]) && !(player getVariable ["downed", false]) && {!cxp_action_inUse}) then {
			if (player distance _target < CXP_SETTINGS(getNumber,"avisos_tab_distancia")) then {
  				[_target] call cxp_fnc_pAssalto;
  			} else {
  				hint format["Você precisa estar em menos de %1m de distância de seu alvo para enviar-lhe um alerta!",CXP_SETTINGS(getNumber,"avisos_tab_distancia")];
  			};
  		} else {
			hint "Você precisa ter um alvo válido e estar desocupado para enviar um alerta!";
		};
  	};

    // INSERT - Avisos 'TAB' (SAMU/BOMBEIROS)
    case 210: {
        if (playerSide != independent) exitWith {hint"Não fique triste, mas a sua tecla de avisos não é esta. Pressione 'TAB' parceiro !"};
  		if (!_alt && !_ctrlKey && isPlayer _target && !isNull _target) then {
  			if (player distance _target < CXP_SETTINGS(getNumber,"avisos_tab_distancia")) then {
  				[_target] call cxp_fnc_pAssalto;
  			} else {
  				hint format["Você precisa estar em menos de %1m de distância de seu alvo para enviar-lhe um alerta!",CXP_SETTINGS(getNumber,"avisos_tab_distancia")];
  			};
  		} else {
			hint "Você precisa estar armado e ter um alvo válido (JOGADOR) para enviar um alerta!";
		};
    };

    // Page UP - Abre lista de mortos (SAMU/BOMBEIROS)
    case 201: {
      if (playerSide != independent) exitWith {};
      if !(_ctrlKey && _alt && _shift) then {
        [] call cxp_fnc_loadDeadList;
      };
    };

    //Space key for Jumping
    case 57: {
        if (isNil "jumpActionTime") then {jumpActionTime = 0;};
        if (_shift && {!(animationState player isEqualTo "AovrPercMrunSrasWrflDf")} && {isTouchingGround player} && {stance player isEqualTo "STAND"} && {speed player > 2} && {!cxp_is_arrested} && {((velocity player) select 2) < 2.5} && {time - jumpActionTime > 1.5}) then {
            jumpActionTime = time; //Update the time.
            [player] remoteExec ["cxp_fnc_jumpFnc",RANY]; //Global execution
            _handled = true;
        };
    };

    //KEYS ANTI-DISCONNECT
    case 211 : {
        if (_ctrlKey && _alt) then {
            [] spawn {
                private _handle = [] spawn cxp_fnc_limparInvPlayer;
                waitUntil {scriptDone _handle};
                _msg = format["O jogador %1 apertou CTRL+ALT+DEL e perdeu todos os seus itens. Denuncie à administraçao !",name player];
                [1,_msg] remoteExecCall ["cxp_fnc_broadcast",RANY];
                [] call CXPSKT_fnc_updateRequest;
            };
        };
    };
    case 1: {
        if (_ctrlKey OR _alt) then {
            [] spawn {
                private _handle = [] spawn cxp_fnc_limparInvPlayer;
                waitUntil {scriptDone _handle};
                _msg = format["O jogador %1 apertou CTRL+ESC ou ALT+ESC e perdeu todos os seus itens de todo jeito. Denuncie à administraçao !",name player];
                [1,_msg] remoteExecCall ["cxp_fnc_broadcast",RANY];
                [] call CXPSKT_fnc_updateRequest;
            };
        };
    };

    // CXP MAP FILTER - F8 (com mapa aberto)
    case 66: {
        if !(visibleMap) exitWith {hint "Voce precisa estar com o mapa aberto para realizar esta acao!"};
        if !(createDialog "cxp_map_filter") exitWith {hint "Erro ao tentar abrir esse menu...Contate aos desenvolvedores!"};
        hint "Pressione 'ESC' para fechar o menu a direita.";
    };

    // CXP BUG TRACKER - F5
    case 63: {
        if (!_alt && !_ctrlKey && !dialog && !visibleMap && !(player getVariable ["restrained",false]) && !(player getVariable ["tied",false]) && !(player getVariable ["downed",false]) && !(animationState player isEqualTo "Incapacitated") && {!cxp_action_inUse} && {!cxp_is_processing}) then {
            if !(createDialog "cxp_bug_tracker_menu") exitWith {hint "Erro inesperado encontrado ao tentar abrir este menu, contate aos desenvolvedores!"};
        } else {hint "Voce nao pode abrir este menu no momento..."};
    };
	
    //Surrender (Shift + B)
    case 48: {
        if (_shift) then {
            if (player getVariable ["playerSurrender",false]) then {
                player setVariable ["playerSurrender",false,true];
            } else {
                [] spawn cxp_fnc_surrender;
            };
            _handled = true;
        };
    };

    // Shift + END - Menu de Movimentos / END - Menu de gerenciamento da gangue
    case 207: {
        if (_shift) then {
            _handled = true;
            createDialog "cxp_moves_menu";
        } else {
			if (playerSide != civilian || (isNil {group player getVariable "gang_name"}) || ((group player getVariable ["gang_owner",""]) != (getPlayerUID player)) || (player getVariable "rankgbVip" < 1)) exitWith {};
			if !(_ctrlKey && _alt) then {[] spawn cxp_fnc_gangSetBaseMenu;};
		};
    };

    //Holster / recall weapon. (Shift + H)
    case 35: {
        if (_shift && !_ctrlKey && !(currentWeapon player isEqualTo "")) then {
            cxp_curWep_h = currentWeapon player;
            player action ["SwitchWeapon", player, player, 100];
            player switchCamera cameraView;
        };

        if (!_shift && _ctrlKey && !isNil "cxp_curWep_h" && {!(cxp_curWep_h isEqualTo "")}) then {
            if (cxp_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
                player selectWeapon cxp_curWep_h;
            };
        };
    };

    //Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
    case _interactionKey: {
        if !(cxp_action_inUse) then {
            [] spawn  {
                private _handle = [] spawn cxp_fnc_actionKeyHandler;
                waitUntil {scriptDone _handle};
                cxp_action_inUse = false;
            };
        };
    };

    //Restraining (Shift + R)
    case 19: {
        if (_shift) then {_handled = true;};
        if (_shift && playerSide isEqualTo west && {!isNull cursorObject} && {cursorObject isKindOf "CAManBase"} && {(isPlayer cursorObject)} && {(side cursorObject in [civilian,independent])} && {alive cursorObject} && {cursorObject distance player < 3.5} && {!(cursorObject getVariable "Escorting")} && {!(cursorObject getVariable "restrained")} && {speed cursorObject < 1}) then {
            [] call cxp_fnc_restrainAction;
        };
    };

    //Knock out, this is experimental and yeah... (Shift + G)
    case 34: {
        if ((CXP_SETTINGS(getNumber,"nocaute_em_safe") isEqualTo 1) && cxp_safezone) exitWith {hint"Você não pode completar esta ação dentro de uma zona segura!"};
        if (_shift) then {_handled = true;};
        if (_shift && playerSide in [civilian,west,independent] && !isNull cursorObject && cursorObject isKindOf "CAManBase" && isPlayer cursorObject && alive cursorObject && cursorObject distance player < 4 && speed cursorObject < 1) then {
            if ((animationState cursorObject) != "Incapacitated" && (currentWeapon player isEqualTo primaryWeapon player || currentWeapon player isEqualTo handgunWeapon player) && currentWeapon player != "" && !cxp_knockout && !(player getVariable ["restrained",false]) && !(player getVariable ["tied",false]) && !(player getVariable ["downed",false]) && {!cxp_istazed} && {!cxp_isBorrachado} && {!cxp_isknocked}) then {
                [cursorObject] spawn cxp_fnc_knockoutAction;
            };
        };
    };

    //T Key (Trunk)
    case 20: {
        if (!_alt && {!_ctrlKey} && {!dialog} && {!cxp_action_inUse} && {!(player getVariable ["playerSurrender",false])} && {!(player getVariable ["restrained",false])} && {!(player getVariable ["tied",false])} && {!cxp_isknocked} && {!cxp_istazed}) then {
            if (!(isNull objectParent player) && alive vehicle player) then {
                if ((vehicle player) in cxp_vehicles) then {
                    [vehicle player] spawn cxp_fnc_openInventory;
                };
            } else {
                private "_list";
                _list = ((ASLtoATL (getPosASL player)) nearEntities [["Box_IND_Grenades_F","B_supplyCrate_F"], 2.5]) select 0;
                if (!(isNil "_list")) then {
                    _house = nearestObject [(ASLtoATL (getPosASL _list)), "House"];
                    if (_house getVariable ["locked", false]) then {
                        hint localize "STR_House_ContainerDeny";
                    } else {
                        [_list] spawn cxp_fnc_openInventory;
                    };
                } else {
                    _list = ["landVehicle","Air","Ship"];
                    if (KINDOF_ARRAY(cursorObject,_list) && {player distance cursorObject < 7} && {isNull objectParent player} && {alive cursorObject} && {!cxp_action_inUse}) then {
                        if (cursorObject in cxp_vehicles || {locked cursorObject isEqualTo 0}) then {
                            [cursorObject] spawn cxp_fnc_openInventory;
                        };
                    };
                };
            };
        };
    };

    //L Key?
    case 38: {
        if (_shift && playerSide in [west,independent]) then {
            if (vehicle player != player && (typeOf vehicle player) in ["C_Offroad_01_F","O_MRAP_02_F","I_MRAP_03_F","C_SUV_01_F","C_Hatchback_01_sport_F","B_Heli_Light_01_F","O_Heli_Light_02_unarmed_F"]) then {
                if (!isNil {vehicle player getVariable "lights"}) then {
                    if (playerSide isEqualTo west) then {
                        [vehicle player] call cxp_fnc_sirenLights;
                    } else {
                        [vehicle player] call cxp_fnc_medicSirenLights;
                    };
                    _handled = true;
                };
            };
        };
        if (!_alt && !_ctrlKey && playerSide isEqualTo west) then {[] call cxp_fnc_radar;};
    };

    //Y Player Menu
    case 21: {
        if (!_alt && !_ctrlKey && !dialog && !visibleMap && !(player getVariable ["restrained",false]) && !(player getVariable ["tied",false]) && !(player getVariable ["downed",false]) && !(animationState player isEqualTo "Incapacitated") && {!cxp_action_inUse} && {!cxp_is_processing} && {!cxp_isBorrachado}) then {
            [] call cxp_fnc_popenMenu;
        };
    };

    //Shift + F Key (COP/SAMU) - F Key (COP/SAMU)
    case 33: {
		if (_shift) then {
			if (playerSide in [west,independent] && {vehicle player != player} && {!cxp_siren_active} && {((driver vehicle player) isEqualTo player)}) then {
				[] spawn {
					cxp_siren_active = true;
					sleep 4.7;
					cxp_siren_active = false;
				};
				_veh = vehicle player;
				if (isNil {_veh getVariable "siren"}) then {_veh setVariable ["siren",false,true];};
				if ((_veh getVariable "siren")) then {
					titleText [localize"STR_MISC_SirensOFF","PLAIN"];
					_veh setVariable ["siren",false,true];
					if !(isNil {(_veh getVariable "sirenJIP")}) then {
						private _jip = _veh getVariable "sirenJIP";
						_veh setVariable ["sirenJIP",nil,true];
						remoteExec ["",_jip]; //remove from JIP queue
					};
				} else {
					titleText [localize"STR_MISC_SirensON","PLAIN"];
					_veh setVariable ["siren",true,true];
					private "_jip";
					if (playerSide isEqualTo west) then {
						_jip = [_veh] remoteExec ["cxp_fnc_copSiren",RCLIENT,true];
					} else {
						_jip = [_veh] remoteExec ["cxp_fnc_medicSiren",RCLIENT,true];
					};
					_veh setVariable ["sirenJIP",_jip,true];
				};
			};
        }else{
			if (!_shift) then {
				if(playerSide in [west, independent] && {vehicle player != player} && {!cxp_siren2_active} && {((driver vehicle player) isEqualTo player)}) then {
					[] spawn {
						cxp_siren2_active = true;
						sleep 1.2;
						cxp_siren2_active = false;
					};
					_veh = vehicle player;
					if (isNil {_veh getVariable "siren2"}) then {_veh setVariable ["siren2",false,true];};
					if ((_veh getVariable "siren2")) then {
						titleText [localize"STR_MISC_Sirens2OFF","PLAIN"];
						_veh setVariable["siren2",false,true];
						if !(isNil {(_veh getVariable "siren2JIP")}) then {
							private _jip = _veh getVariable "siren2JIP";
							_veh setVariable ["siren2JIP",nil,true];
							remoteExec ["",_jip]; //remove from JIP queue
						};
					} else {
						titleText [localize"STR_MISC_Sirens2ON","PLAIN"];
						_veh setVariable["siren2",true,true];
						private "_jip";
						if (playerSide isEqualTo west) then {
							_jip = [_veh] remoteExec ["cxp_fnc_copSiren2",RCLIENT,true];
						} else {
							_jip = [_veh] remoteExec ["cxp_fnc_medicSiren2",RCLIENT,true];
						};
						_veh setVariable ["siren2JIP",_jip,true];
					};
				};
			};
		};
    };

    case 24: {
        if (!_shift && !_alt && !_ctrlKey && playerSide != civilian && (vehicle player != player)) then {
            [] call cxp_fnc_gateOpener;
        }else{
            if (!_shift && !_alt && !_ctrlKey && (playerSide isEqualTo civilian)) then {
                if (vest player isEqualTo "V_HarnessOGL_gry") then {
					if (player getVariable "restrained") exitWith {hint"Você não pode se explodir com as mãos atadas !"};
					if (player getVariable "tied") exitWith {hint"Você não pode se explodir com as mãos atadas !"};
                    if (player getVariable ["downed",false]) exitWith {};
                    [] spawn cxp_fnc_suicideBomb;
                }else{
                    hint "Você não está usando um colete explosivo para executar esta ação !";
                };
            }else{
                if (_shift) then {
					switch (player getVariable["Earplugs",0]) do {
						case 0: {hintSilent composeText  [ image "icons\bq_on1.paa", format ["Reduzindo som em 90%1","%"]]; 1 fadeSound 0.1; player setVariable ["Earplugs", 10]; };
						case 10: {hintSilent composeText [ image "icons\bq_on2.paa", format ["Reduzindo som em 60%1","%"]]; 1 fadeSound 0.4; player setVariable ["Earplugs", 40]; };
						case 40: {hintSilent composeText [ image "icons\bq_on3.paa", format ["Reduzindo som em 30%1","%"]]; 1 fadeSound 0.7; player setVariable ["Earplugs", 70]; };
						case 70: {hintSilent composeText [ image "icons\bq_on4.paa", "Fones de ouvido removidos"]; 1 fadeSound 1; player setVariable ["Earplugs", 0]; };
					};
                };
            };
        };
    };

    //U Key
    case 22: {
        if (!_alt && !_ctrlKey) then {
            if (isNull objectParent player) then {
                _veh = cursorObject;
            } else {
                _veh = vehicle player;
            };

            if (_veh isKindOf "House_F" && {playerSide isEqualTo civilian}) then {
                if (_veh in cxp_vehicles && {player distance _veh < 20}) then {
                    _door = [_veh] call cxp_fnc_nearestDoor;
                    if (_door isEqualTo 0) exitWith {hint localize "STR_House_Door_NotNear"};
                    _locked = _veh getVariable [format ["bis_disabled_Door_%1",_door],0];

                    if (_locked isEqualTo 0) then {
                        _veh setVariable [format ["bis_disabled_Door_%1",_door],1,true];
                        _veh animateSource [format ["Door_%1_source", _door], 0];
                        systemChat localize "STR_House_Door_Lock";
                    } else {
                        _veh setVariable [format ["bis_disabled_Door_%1",_door],0,true];
                        _veh animateSource [format ["Door_%1_source", _door], 1];
                        systemChat localize "STR_House_Door_Unlock";
                    };
                };
            } else {
                _locked = locked _veh;
                if (_veh in cxp_vehicles && {player distance _veh < 20}) then {
                    if (_locked isEqualTo 2) then {
                        if (local _veh) then {
                            _veh lock 0;

                            // BI
                            _veh animateDoor ["door_back_R",1];
                            _veh animateDoor ["door_back_L",1];
                            _veh animateDoor ['door_R',1];
                            _veh animateDoor ['door_L',1];
                            _veh animateDoor ['Door_L_source',1];
                            _veh animateDoor ['Door_rear',1];
                            _veh animateDoor ['Door_rear_source',1];
                            _veh animateDoor ['Door_1_source',1];
                            _veh animateDoor ['Door_2_source',1];
                            _veh animateDoor ['Door_3_source',1];
                            _veh animateDoor ['Door_4_source',1];
                            _veh animateDoor ['Door_LM',1];
                            _veh animateDoor ['Door_RM',1];
                            _veh animateDoor ['Door_LF',1];
                            _veh animateDoor ['Door_RF',1];
                            _veh animateDoor ['Door_LB',1];
                            _veh animateDoor ['Door_RB',1];
                            _veh animateDoor ['DoorL_Front_Open',1];
                            _veh animateDoor ['DoorR_Front_Open',1];
                            _veh animateDoor ['DoorL_Back_Open',1];
                            _veh animateDoor ['DoorR_Back_Open ',1];
                        } else {
                            [_veh,0] remoteExecCall ["cxp_fnc_lockVehicle",_veh];

                            _veh animateDoor ["door_back_R",1];
                            _veh animateDoor ["door_back_L",1];
                            _veh animateDoor ['door_R',1];
                            _veh animateDoor ['door_L',1];
                            _veh animateDoor ['Door_L_source',1];
                            _veh animateDoor ['Door_rear',1];
                            _veh animateDoor ['Door_rear_source',1];
                            _veh animateDoor ['Door_1_source',1];
                            _veh animateDoor ['Door_2_source',1];
                            _veh animateDoor ['Door_3_source',1];
                            _veh animateDoor ['Door_4_source',1];
                            _veh animateDoor ['Door_LM',1];
                            _veh animateDoor ['Door_RM',1];
                            _veh animateDoor ['Door_LF',1];
                            _veh animateDoor ['Door_RF',1];
                            _veh animateDoor ['Door_LB',1];
                            _veh animateDoor ['Door_RB',1];
                            _veh animateDoor ['DoorL_Front_Open',1];
                            _veh animateDoor ['DoorR_Front_Open',1];
                            _veh animateDoor ['DoorL_Back_Open',1];
                            _veh animateDoor ['DoorR_Back_Open ',1];
                        };
                        null = [] spawn { hint parseText ("<t size ='3.5'<t align='center'><img image='textures\interface\key_vehicle.paa' align='center'/><br/><t color='#FFFFFF'><t align='center'><t size='1'>O veiculo está <t color='#6fd47d'>destrancado<t color='#FFFFFF'>.<br/>"); sleep 4; hint ""; };
                        [_veh,"unlockCarSound",50,1] remoteExec ["cxp_fnc_say3D",RANY];
                    } else {
                        if (local _veh) then {
                            _veh lock 2;

                            _veh animateDoor ["door_back_R",0];
                            _veh animateDoor ["door_back_L",0];
                            _veh animateDoor ['door_R',0];
                            _veh animateDoor ['door_L',0];
                            _veh animateDoor ['Door_L_source',0];
                            _veh animateDoor ['Door_rear',0];
                            _veh animateDoor ['Door_rear_source',0];
                            _veh animateDoor ['Door_1_source',0];
                            _veh animateDoor ['Door_2_source',0];
                            _veh animateDoor ['Door_3_source',0];
                            _veh animateDoor ['Door_4_source',0];
                            _veh animateDoor ['Door_LM',0];
                            _veh animateDoor ['Door_RM',0];
                            _veh animateDoor ['Door_LF',0];
                            _veh animateDoor ['Door_RF',0];
                            _veh animateDoor ['Door_LB',0];
                            _veh animateDoor ['Door_RB',0];
                            _veh animateDoor ['DoorL_Front_Open',0];
                            _veh animateDoor ['DoorR_Front_Open',0];
                            _veh animateDoor ['DoorL_Back_Open',0];
                            _veh animateDoor ['DoorR_Back_Open ',0];
                        } else {
                            [_veh,2] remoteExecCall ["cxp_fnc_lockVehicle",_veh];

                            _veh animateDoor ["door_back_R",0];
                            _veh animateDoor ["door_back_L",0];
                            _veh animateDoor ['door_R',0];
                            _veh animateDoor ['door_L',0];
                            _veh animateDoor ['Door_L_source',0];
                            _veh animateDoor ['Door_rear',0];
                            _veh animateDoor ['Door_rear_source',0];
                            _veh animateDoor ['Door_1_source',0];
                            _veh animateDoor ['Door_2_source',0];
                            _veh animateDoor ['Door_3_source',0];
                            _veh animateDoor ['Door_4_source',0];
                            _veh animateDoor ['Door_LM',0];
                            _veh animateDoor ['Door_RM',0];
                            _veh animateDoor ['Door_LF',0];
                            _veh animateDoor ['Door_RF',0];
                            _veh animateDoor ['Door_LB',0];
                            _veh animateDoor ['Door_RB',0];
                            _veh animateDoor ['DoorL_Front_Open',0];
                            _veh animateDoor ['DoorR_Front_Open',0];
                            _veh animateDoor ['DoorL_Back_Open',0];
                            _veh animateDoor ['DoorR_Back_Open ',0];
                        };
                        null = [] spawn { hint parseText ("<t size ='3.5'<t align='center'><img image='textures\interface\key_vehicle.paa' align='center'/><br/><t color='#FFFFFF'><t align='center'><t size='1'>O veiculo está <t color='#FF0000'>trancado<t color='#FFFFFF'>.<br/>"); sleep 4; hint ""; };
                        [_veh,"lockCarSound",50,1] remoteExec ["cxp_fnc_say3D",RANY];
                    };
                };
            };
        };
    };
};

if (cxp_barrier_active) then {
    switch (_code) do {
        case 57: {
            [] spawn cxp_fnc_placeablesPlaceComplete;
        };
    };
    true;
};

_handled;
