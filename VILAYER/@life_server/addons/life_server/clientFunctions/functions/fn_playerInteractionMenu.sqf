#include "\life_server\script_macros.hpp"
/*
    File: fn_playerInteractionMenu.sqf
    Author: Casperento

    Description:
    Script baseado no do Tonic, porem aprimorado e otimizado
*/
disableSerialization;
private _curTarget = param [0,objNull,[objNull]];
private _seizeRank = CXP_SETTINGS(getNumber,"seize_minimum_rank");

if (player getVariable ["Escorting", false]) then {
    if (isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
    if (!isPlayer _curTarget && side _curTarget isEqualTo civilian) exitWith {closeDialog 0;}; //Bad side check?
    if (player distance _curTarget > 4 ) exitWith {closeDialog 0;}; // Prevents menu accessing from far distances.
};

if !(dialog) then { createDialog "pInteraction_Menu"; };

private _Btn1 = CONTROL(37400,37450);
private _Btn2 = CONTROL(37400,37451);
private _Btn3 = CONTROL(37400,37452);
private _Btn4 = CONTROL(37400,37453);
private _Btn5 = CONTROL(37400,37454);
private _Btn6 = CONTROL(37400,37455);
private _Btn7 = CONTROL(37400,37456);
private _Btn8 = CONTROL(37400,37457);
private _Btn9 = CONTROL(37400,37458);
private _Btn10 = CONTROL(37400,37459);
cxp_pInact_curTarget = _curTarget;

if (!isNull cxp_pInact_curTarget || player getVariable["isEscorting",false]) then {
  {
    _x ctrlShow false;
  } forEach [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7,_Btn8,_Btn9,_Btn10];
};

switch (playerSide) do {
	case west : {
	    // Pre-verific
	    if !(player getVariable["isEscorting",false]) then {
	    	_Btn1 ctrlShow true;
	    	_Btn2 ctrlShow true;
	    	_Btn3 ctrlShow true;
	    	_Btn5 ctrlShow true;
	    	_Btn6 ctrlShow true;
	    	_Btn7 ctrlShow true;
	    	_Btn8 ctrlShow true;
	    	_Btn9 ctrlShow true;
	    	_Btn10 ctrlShow true;
	    };

  		// Desalgemar
		_Btn1 ctrlSetText localize "STR_pInAct_Unrestrain";
		_Btn1 buttonSetAction "[cxp_pInact_curTarget] call cxp_fnc_unrestrain; closeDialog 0;";

		// Checar Licencas
		_Btn2 ctrlSetText localize "STR_pInAct_checkLicenses";
		_Btn2 buttonSetAction "[player] remoteExecCall [""cxp_fnc_licenseCheck"",cxp_pInact_curTarget]; closeDialog 0;";

		// Procurar itens por ilegais
		_Btn3 ctrlSetText localize "STR_pInAct_SearchPlayer";
		_Btn3 buttonSetAction "[cxp_pInact_curTarget] spawn cxp_fnc_searchAction; closeDialog 0;";

		// Escoltar
    	_Btn4 ctrlShow true;
		if (player getVariable["isEscorting",false]) then {
			_Btn4 ctrlSetText localize "STR_pInAct_StopEscort";
			_Btn4 buttonSetAction "[] call cxp_fnc_stopEscorting; closeDialog 0;";
		} else {
			_Btn4 ctrlSetText localize "STR_pInAct_Escort";
			_Btn4 buttonSetAction "[cxp_pInact_curTarget] call cxp_fnc_escortAction; closeDialog 0;";
		};

		// Multar
		_Btn5 ctrlSetText localize "STR_pInAct_TicketBtn";
		_Btn5 buttonSetAction "[cxp_pInact_curTarget] call cxp_fnc_ticketAction;";

    	// Mandar pra cadeia
		_Btn6 ctrlSetText localize "STR_pInAct_Arrest";
		_Btn6 buttonSetAction "closeDialog 0; createDialog ""jail_time"";";
		_Btn6 ctrlEnable false;
		{
			if (( player distance (getMarkerPos _x) < 30 )) exitWith { _Btn6 ctrlEnable true;};
		} forEach CXP_SETTINGS(getArray,"sendtoJail_locations");

    	// Colocar no veh
		_Btn7 ctrlSetText localize "STR_pInAct_PutInCar";
		_Btn7 buttonSetAction "[cxp_pInact_curTarget] call cxp_fnc_putInCar; closeDialog 0;";

		// Apreender Armas
		_Btn8 ctrlSetText localize "STR_pInAct_Seize";
		_Btn8 buttonSetAction "[cxp_pInact_curTarget] spawn cxp_fnc_seizePlayerAction; closeDialog 0;";
		if (FETCH_CONST(cxp_coplevel) < _seizeRank) then { _Btn8 ctrlEnable false };

    	// Bafometro
		_Btn9 ctrlSetText localize "STR_pInAct_Breathalyzer";
		_Btn9 buttonSetAction "[player] remoteExecCall [""cxp_fnc_breathalyzer"",cxp_pInact_curTarget];closeDialog 0";
		if (cxp_inv_bafom < 1) then { _Btn9 ctrlEnable false };

		// Remover Lic. BountyHunter
		_Btn10 ctrlEnable true;
		if !(_curTarget getVariable ["clienteBounty",false]) then {
			_Btn10 ctrlSetText "Estuprar";
			_Btn10 buttonSetAction "[cxp_pInact_curTarget] call cxp_fnc_estuprar; closeDialog 0;";
			// Estuprar
			if (_curTarget getVariable ["estuprador",false]) then {
				_Btn10 ctrlSetTooltip "Estuprar estuprador...";
			} else {
				_Btn10 ctrlSetTooltip "Este jogador pode ser um estuprador...";
			};
		} else {
			_Btn10 ctrlSetText localize "STR_pInAct_RemoverBtHn";
			_Btn10 buttonSetAction "[cxp_pInact_curTarget] call cxp_fnc_removerBountyLicAct;closeDialog 0;";
			_Btn10 ctrlSetTooltip "Remover licenca de BountyHunter do alvo...";
		};
	};
	case civilian : {
	    // Pre-verific
	    if !(player getVariable["isEscorting",false]) then {
	    	_Btn1 ctrlShow true;
	    	_Btn3 ctrlShow true;
	    	_Btn4 ctrlShow true;
	    	_Btn5 ctrlShow true;
	    	_Btn6 ctrlShow true;
	    	_Btn7 ctrlShow true;
			_Btn8 ctrlshow true;
			_Btn9 ctrlShow true;
	    };

	    // Algemar/Desalgemar
		_Btn1 ctrlEnable false;
		_Btn1 ctrlSetText "Algemar";
		_Btn1 ctrlSetTooltip "Algemar jogador...";
		if (license_civ_rebellic) then {
			if !(_curTarget getVariable ["tied", false]) then {
				_Btn1 buttonSetAction "[cxp_pInact_curTarget,false] call cxp_fnc_tieingAction; closeDialog 0;";
				if (cxp_inv_zipties > 0 && license_civ_rebellic) then {
					if !(player getVariable["isEscorting",false]) then {
						_Btn1 ctrlSetTooltip "Algemar jogador (deve estar nocauteado)...";
						_Btn1 ctrlEnable true;
					};
				} else {
					if !(player getVariable["isEscorting",false]) then {
						_Btn1 ctrlSetTooltip "Você não possui algemas em seu inventário ou nao tem licenca rebelde...";
						_Btn1 ctrlEnable false;
					};
				};
			} else {
				_Btn1 ctrlSetText "Desalgemar";
				_Btn1 buttonSetAction "[cxp_pInact_curTarget,false] call cxp_fnc_untie; closeDialog 0;";
				if (cxp_inv_kzipties > 0 && license_civ_rebellic) then {
					if !(player getVariable["isEscorting",false]) then {
						_Btn1 ctrlSetTooltip "Desalgemar jogador...";
						_Btn1 ctrlEnable true;
					};
				} else {
					if !(player getVariable["isEscorting",false]) then {
						_Btn1 ctrlSetTooltip "Você não possui uma chave de algema em seu inventário ou nao tem licenca rebelde...";
						_Btn1 ctrlEnable false;
					};
				};
			};
		} else {
			if (license_civ_bHunterLic) then {
				if !(_curTarget getVariable ["tied", false]) then {
					_Btn1 buttonSetAction "[cxp_pInact_curTarget,true] call cxp_fnc_tieingAction; closeDialog 0;";
					if (cxp_inv_zipties_legal > 0 && license_civ_bHunterLic) then {
						if !(player getVariable["isEscorting",false]) then {
							_Btn1 ctrlSetTooltip "Algemar jogador (deve estar nocauteado)...";
							_Btn1 ctrlEnable true;
						};
					} else {
						if !(player getVariable["isEscorting",false]) then {
							_Btn1 ctrlSetTooltip "Você não possui algemas em seu inventário ou nao tem licenca rebelde...";
							_Btn1 ctrlEnable false;
						};
					};
				} else {
					_Btn1 ctrlSetText "Desalgemar";
					_Btn1 buttonSetAction "[cxp_pInact_curTarget,true] call cxp_fnc_untie; closeDialog 0;";
					if (cxp_inv_kzipties_legal > 0 && license_civ_bHunterLic) then {
						if !(player getVariable["isEscorting",false]) then {
							_Btn1 ctrlSetTooltip "Desalgemar jogador...";
							_Btn1 ctrlEnable true;
						};
					} else {
						if !(player getVariable["isEscorting",false]) then {
							_Btn1 ctrlSetTooltip "Você não possui uma chave de algema em seu inventário ou nao tem licenca rebelde...";
							_Btn1 ctrlEnable false;
						};
					};
				};
			};
		};

		// Escoltar
    	_Btn2 ctrlShow true;
		if (player getVariable["isEscorting",false]) then {
			_Btn2 ctrlSetText localize "STR_pInAct_StopEscort";
			_Btn2 buttonSetAction "[] call cxp_fnc_stopEscorting; closeDialog 0;";
            _Btn4 ctrlSetTooltip "Soltar jogador...";
		} else {
			_Btn2 ctrlSetText localize "STR_pInAct_Escort";
			_Btn2 buttonSetAction "[cxp_pInact_curTarget] call cxp_fnc_escortAction; closeDialog 0;";
			if (_curTarget getVariable ["tied", false]) then {
        		_Btn2 ctrlEnable true;
        		_Btn4 ctrlSetTooltip "Escoltar jogador...";
      		} else {
        		_Btn2 ctrlEnable false;
        		_Btn4 ctrlSetTooltip "Seu alvo nao esta algemado !";
      		};
		};

    	// Colocar no veh
		_Btn3 ctrlSetText localize "STR_pInAct_PutInCar";
		_Btn3 buttonSetAction "[cxp_pInact_curTarget] call cxp_fnc_putInCar; closeDialog 0;";
		if (_curTarget getVariable ["tied", false]) then {
      		_Btn3 ctrlEnable true;
      		_Btn3 ctrlSetTooltip "Colocar jogador algemado no veiculo...";
    	} else {
      		_Btn3 ctrlEnable false;
      		_Btn3 ctrlSetTooltip "Seu alvo nao esta algemado !";
    	};

    	// Saco de Sequestro
		if !(license_civ_bHunterLic) then {
			if (_curTarget getVariable ["blindfolded", false]) then {
				_Btn4 ctrlSetText "Remover saco";
				_Btn4 buttonSetAction "[] call cxp_fnc_untieb; closeDialog 0;";
			} else {
				_Btn4 ctrlSetText "Colocar saco";
				_Btn4 buttonSetAction "[] call cxp_fnc_tieingActionb; closeDialog 0;";
				if (cxp_inv_blindfold > 0) then {
					_Btn4 ctrlEnable true;
					_Btn4 ctrlSetTooltip "Colocar saco de sequestro no jogador..";
				} else {
					_Btn4 ctrlEnable false;
					_Btn4 ctrlSetTooltip "Você não possui um saco de sequestro em seu inventário !";
				};
			};

			// Fita adesiva
			if (_curTarget getVariable ["gagged", false]) then {
				_Btn5 ctrlSetText "Remover Fita";
				_Btn5 buttonSetAction "[] call cxp_fnc_removeGagAction; closeDialog 0;";
			} else {
				_Btn5 ctrlSetText "Calar vitima";
				_Btn5 buttonSetAction "[] call cxp_fnc_gagAction; closeDialog 0;";
				if (cxp_inv_fitaadesiva > 0) then {
					_Btn5 ctrlEnable true;
					_Btn5 ctrlSetTooltip "Colocar fita adesiva na boca do jogador..";
				} else {
					_Btn5 ctrlEnable false;
					_Btn5 ctrlSetTooltip "Você não possui uma fita adesiva em seu inventário !";
				};
			};

			// Assaltar
			_Btn6 ctrlSetText "Assaltar";
			_Btn6 buttonSetAction "[] call cxp_fnc_robAction; closeDialog 0;";
			if (animationState _curTarget != "Incapacitated") then {
				_Btn6 ctrlEnable false;
				_Btn6 ctrlSetTooltip "Seu alvo deve estar nocauteado (SHIFT + G) !";
			} else {
				_Btn6 ctrlEnable true;
				_Btn6 ctrlSetTooltip "Roubar carteira do jogador..";
			};

			// Estuprar
			_Btn7 ctrlSetText "Estuprar";
			_Btn7 buttonSetAction "[cxp_pInact_curTarget] call cxp_fnc_estuprar; closeDialog 0;";
			if (cxp_inv_camisinha < 1) then {
				_Btn7 ctrlEnable false;
				_Btn7 ctrlSetTooltip "Voce precisa de uma camisinha para estuprar o jogador..";
			} else {
				_Btn7 ctrlEnable true;
				_Btn7 ctrlSetTooltip "Estuprar jogador..";
			};
		} else {
			{
				_x ctrlEnable false;
				_x ctrlSetText "Indisponível";
				_x ctrlSetTooltip "Recurso indisponivel para bounty hunters...";
			} forEach [_Btn4,_Btn5,_Btn6,_Btn7];
		};

    	// Mandar pra cadeia - BountyHunter
		_Btn8 ctrlSetText localize "STR_pInAct_Arrest";
		_Btn8 buttonSetAction "closeDialog 0;createDialog ""jail_time"";";
		_Btn8 ctrlSetTooltip "Mandar alvo algemado para a cadeia (Para BountyHunters)...";
		_Btn8 ctrlEnable false;
		{
			if ((player distance (getMarkerPos _x) < 30) && ((getPlayerUID _curTarget) in cxp_bounty_uid) && license_civ_bHunterLic && (_curTarget getVariable ["tied", false])) exitWith {_Btn8 ctrlEnable true;};
		} forEach CXP_SETTINGS(getArray,"bCFG_cadeia_mrks");

		// Injeção de Adrenalina - BountyHunter
		_Btn9 ctrlSetText localize "STR_pInAct_InjAdrenalina";
		_Btn9 buttonSetAction "closeDialog 0;[cxp_pInact_curTarget,1] spawn cxp_fnc_adrenalineShot;";
		if (_curTarget getVariable ["downed",false] && cxp_inv_adrenalineShot > 0 && license_civ_bHunterLic) then {
			_Btn9 ctrlEnable true;
			_Btn9 ctrlSetTooltip "Injetar Adrenalina no alvo...";
		} else {
			_Btn9 ctrlEnable false;
			_Btn9 ctrlSetTooltip "Não é possível usar esta ação no momento (Para BountyHunters)...";
		};
	};
};
