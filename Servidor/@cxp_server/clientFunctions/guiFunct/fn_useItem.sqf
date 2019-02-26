#include "\cxp_server\script_macros.hpp"
/*
    File: fn_useItem.sqf
    Author: Bryan "Tonic" Boardwine

	Modified : Casperento

    Description:
    Main function for item effects and functionality through the player menu.
*/
disableSerialization;
private _isInventoryI = param [0,false,[true]];

if ((lbCurSel 2005) isEqualTo -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
private _item = CONTROL_DATA(2005);

switch (true) do {
    case (_item in ["waterBottle","coffee","redgull"]): {
		    private ["_checkT","_boost"];
		    _boost =  M_CONFIG(getNumber,"VirtualItems",_item,"edible");
        if (cxp_thirst isEqualTo 100) exitWith {hint "Você não esta com sede no momento. Não desperdice bebida !"};
        if ([false,_item,1] call cxp_fnc_handleInv) then {
            player say3D "Drink";
			      if (CXP_SETTINGS(getNumber,"enable_fatigue") isEqualTo 1) then {player setFatigue 0;};
            if (_item isEqualTo "redgull") then {
                cxp_thirst = cxp_thirst + _boost;
                _checkT = cxp_thirst;
                if (_checkT > 100) then {
                    cxp_thirst = 100;
                    hint "Agora você esta completamente hidratado.";
                };
            }else{
                if (_item isEqualTo "waterBottle") then {
                    cxp_thirst = cxp_thirst + _boost;
                    _checkT = cxp_thirst;
                    if (_checkT > 100) then {
                        cxp_thirst = 100;
                        hint "Agora você esta completamente hidratado.";
                    };
                }else{
                    if (_item isEqualTo "coffee") then {
                        cxp_thirst = cxp_thirst + _boost;
                        _checkT = cxp_thirst;
                        if (_checkT > 100) then {
                            cxp_thirst = 100;
                            hint "Agora você esta completamente hidratado.";
                        };
                    };
                };
            };
        };
    };

    case (_item isEqualTo "latacerveja"): {
        if (playerSide in [west,independent]) exitWith {hintSilent localize "STR_MISC_WestIndNoNo";};
        if ((player getVariable ["inDrink",FALSE])) exitWith {hintSilent localize "STR_MISC_AlreadyDrinking";};
        if (([false,_item,1] call cxp_fnc_handleInv)) then {
            if (isNil "cxp_drink") then {cxp_drink = 0;};
            cxp_drink = cxp_drink + 0.4;
			if (cxp_drink >= 1) then {cxp_drink = 0.9;};
            [] spawn cxp_fnc_drinkbeer;
        };
    };

    case (_item isEqualTo "pinga"): {
        if (playerSide in [west,independent]) exitWith {hintSilent localize "STR_MISC_WestIndNoNo";};
        if ((player getVariable ["inDrink",FALSE])) exitWith {hintSilent localize "STR_MISC_AlreadyDrinking";};
        if (([false,_item,1] call cxp_fnc_handleInv)) then {
            if (isNil "cxp_drink") then {cxp_drink = 0;};
            cxp_drink = cxp_drink + 0.7;
            if (cxp_drink >= 1) then {cxp_drink = 0.9;};
            [] spawn cxp_fnc_drinkwhiskey;
        };
    };

    case (_item in ["boltcutter","boltcutter_cop"]): {
        if (cxp_safezone && playerSide isEqualTo civilian) exitWith {
            [1,format["O jogador %1 tentou roubar uma casa na safezone e foi denunciado por um morador da cidade. Pena que não funcionou..ladraozinho de merda !",name player]] remoteExecCall ["cxp_fnc_broadcast",RANY];
        };
        [cursorObject] spawn cxp_fnc_boltcutter;
        closeDialog 0;
    };

    case (_item isEqualTo "blastingcharge"): {
        if !(typeOf cursorObject in ["Land_CargoBox_V1_F","Land_Atm_02_F"]) exitWith {
            hint "Bombas podem ser usadas apenas na reserva(Banco Central) e/ou em caixas eletronicos de agências de banco !";
        };
        if (typeOf cursorObject isEqualTo "Land_CargoBox_V1_F") exitWith {
            player reveal fed_bank;
            (group player) reveal fed_bank;
            [cursorObject] spawn cxp_fnc_blastingCharge;
        };
        if (typeOf cursorObject isEqualTo "Land_Atm_02_F") exitWith {
            if !(cxp_insideAgencia) exitWith {hint "Voce precisa estar dentro de uma agencia para poder explodir um caixa eletronico!"};
            [cursorObject] spawn cxp_fnc_blastingCharge;
            closeDialog 0;
        };
    };

    case (_item isEqualTo "defusekit"): {
        [cursorObject] spawn cxp_fnc_defuseKit;
        closeDialog 0;
    };

    case (_item isEqualTo "storagesmall"): {
        [false] call cxp_fnc_storageBox;
    };

    case (_item isEqualTo "storagebig"): {
        [true] call cxp_fnc_storageBox;
    };

    case (_item isEqualTo "spikeStrip"): {
        if !(isNull cxp_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"; closeDialog 0};
        if ([false,_item,1] call cxp_fnc_handleInv) then {
            [] spawn cxp_fnc_spikeStrip;
            closeDialog 0;
        };
    };

    case (_item isEqualTo "fuelFull"): {
        if (vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
        [] spawn cxp_fnc_jerryRefuel;
        closeDialog 0;
    };

    case (_item isEqualTo "fuelEmpty"): {
        [] spawn cxp_fnc_jerrycanRefuel;
        closeDialog 0;
    };

    case (_item in ["lockpick","lockpick_cop"]): {
        if (cxp_safezone && playerSide isEqualTo civilian) exitWith {
            [1,format["O jogador %1 tentou roubar um veiculo na safezone e foi denunciado por um morador da cidade. Pena que não funcionou..ladraozinho de merda !",name player]] remoteExecCall ["cxp_fnc_broadcast",RANY];
        };
        [_item] spawn cxp_fnc_lockpick;
        closeDialog 0;
    };

    case (_item isEqualTo "cigarro"): {
        [] spawn cxp_fnc_useCigarette;
        closeDialog 0;
    };

    case (_item isEqualTo "methp"): {
        if(playerSide in [west,independent]) exitWith {hintSilent "Policiais/Médicos não podem usar drogas !"};
        [] spawn cxp_fnc_meth;
        closeDialog 0;
    };

    case (_item isEqualTo "heroinp"): {
		[] spawn cxp_fnc_heroinaE;
		closeDialog 0;
    };

    case (_item isEqualTo "cocap"): {
    	[] spawn cxp_fnc_cocainaE;
    	closeDialog 0;
    };

    case (_item in ["marijuana","marijuana_med"]): {
  	    [_item] spawn cxp_fnc_weed;
        closeDialog 0;
    };

    case (_item isEqualTo "barracaG"): {
  		["barracaG"] spawn cxp_fnc_montarBarraca;
  		closeDialog 0;
    };

    case (_item isEqualTo "barracaP"): {
  		["barracaP"] spawn cxp_fnc_montarBarraca;
  		closeDialog 0;
    };

    case (_item isEqualTo "campFire"): {
        [] spawn cxp_fnc_campFire;
        closeDialog 0;
    };

    case (_item isEqualTo "rastreVeh"): {
  		[cursorTarget] spawn cxp_fnc_rastreadorVeh;
  		closeDialog 0;
    };

    case (_item isEqualTo "rastreJog"): {
  		[cursorTarget] spawn cxp_fnc_rastreadorPlayer;
  		closeDialog 0;
    };

    case (_item in ["rabbit_raw", "hen_raw", "rooster_raw", "sheep_raw", "goat_raw", "salema_raw", "ornate_raw", "mackerel_raw", "tuna_raw", "mullet_raw", "catshark_raw"]): {
		if !(typeOf cursorObject isEqualTo "Land_Campfire_F") exitWith {hint "Você so pode cozinhar carnes cruas na fogueira. Monte sua fogueria no menu de craft, sente, olhe para ela e selecione a carne desejada em seu inventario virtual ('Y'), em seguida clique em 'USE/USAR' !"};
        [cursorObject,_item] spawn cxp_fnc_cook;
        closeDialog 0;
    };

    case (_item in ["apple","chocolat_processed","abacaxi", "batata", "cenoura","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle_soup","hen","rooster","sheep","goat","donuts","tbacon","peach","cestaCS", "chocolatBB", "chocolatbarWW"]): {
        if (cxp_hunger isEqualTo 100) exitWith {hint "Você não esta com fome no momento. Não desperdice comida !"};
        if (!(M_CONFIG(getNumber,"VirtualItems",_item,"edible") isEqualTo -1)) then {
            if ([false,_item,1] call cxp_fnc_handleInv) then {
                _val = M_CONFIG(getNumber,"VirtualItems",_item,"edible");
                _sum = cxp_hunger + _val;
                switch (true) do {
                    case (_val < 0 && _sum < 1): {cxp_hunger = 5;}; //This adds the ability to set the entry edible to a negative value and decrease the hunger without death
                    case (_sum > 100): {
                        cxp_hunger = 100;
                        hint "Agora você esta completamente sem fome.";
                    };
                    player say3d "eat";
                    default {cxp_hunger = _sum;};
                };
            };
        };
    };

    default {
        hint localize "STR_ISTR_NotUsable";
    };
};

if (_isInventoryI) then {
    [] call cxp_fnc_vrtExtInvUPDATE;
} else {
    [] call cxp_fnc_pupdateMenu;
};

[false,false] call cxp_fnc_hudUpdate;
