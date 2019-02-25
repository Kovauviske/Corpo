/*
    File: fn_setupActions.sqf
    Author:

    Description:
    Master addAction file handler for all client-based actions.
*/
switch (playerSide) do {
    case civilian: {
      //Drop fishing net
      cxp_actions pushBack (player addAction[localize "STR_pAct_DropFishingNet",cxp_fnc_dropFishingNet,"",0,false,false,"",'(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && cxp_carryWeight < cxp_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !cxp_net_dropped ']);
      //Pegar Cevada
  		cxp_actions pushBack (player addAction["<t color='#FFB124'>Pegar Cevada</t>",cxp_fnc_gatherObject,["cevada",1,"neriumo2d"],1,true,true,"""",'(player distance cursorObject < 3) && {["neriumo2d",(str cursorObject)] call cxp_fnc_inString} && (!(player getVariable ["restrained",false]) && !(player getVariable ["tied",false]))']);
  		//Dominar Cartel
  		cxp_actions pushBack (player addAction["<t color='#FF0000'>Dominar Cartel de Drogas</t>",cxp_fnc_areaCapture,"",0,false,false,"",'((typeOf cursorTarget) == "Flag_Red_F")']);
    };

    case west: {
      //CopEnter - Entrar Piloto
      cxp_actions pushBack (player addAction["<t color='#1723c9'>Entrar como Piloto</t>",cxp_fnc_forceEnter,"driver",200,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']);
      //CopEnter - Entrar CoPiloto
      cxp_actions pushBack (player addAction["<t color='#1723c9'>Entrar como CoPiloto</t>",cxp_fnc_forceEnter,"copilot",200,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']);
      //CopEnter - Entrar Passageiro
      cxp_actions pushBack (player addAction["<t color='#1723c9'>Entrar como Passageiro</t>",cxp_fnc_forceEnter,"passenger",100,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']);
      //CopEnter - Entrar Gunner1
      cxp_actions pushBack (player addAction["<t color='#1723c9'>Entrar como Gunner1</t>",cxp_fnc_forceEnter,"gunner1",100,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']);
      //CopEnter - Entrar Gunner2
      cxp_actions pushBack (player addAction["<t color='#1723c9'>Entrar como Gunner2</t>",cxp_fnc_forceEnter,"gunner2",100,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']);
      //CopEnter - Sair
      cxp_actions pushBack (player addAction["<t color='#1723c9'>Sair</t>",cxp_fnc_forceEnter,"exit",100,false,false,"",'(vehicle player != player) && (locked(vehicle player) isEqualTo 2)']);
      //Neutralizar Cartel
      cxp_actions pushBack (player addAction["<t color='#1723c9'>Neutralizar Cartel  de Drogas</t>",cxp_fnc_areaCapture,"",0,false,false,"",' ((typeOf cursorTarget) == "Flag_Red_F") ']);
      //Apreender itens no chao
      cxp_actions pushBack (player addAction["<t color='#1723c9'>Apreender Itens</t>",cxp_fnc_apreenderItens,"",0,false,false,"",'((count (nearestObjects [player,["WeaponHolder"],3]) > 0) || (count (nearestObjects [player,["GroundWeaponHolder"],3]) > 0) || (count (nearestObjects [player,["WeaponHolderSimulated"],3]) > 0))']);
    };

    case independent: {
      //MedEnter - Entrar Piloto
      cxp_actions pushBack (player addAction["<t color='#ff0000'>Entrar como Piloto</t>",cxp_fnc_forceEnter,"driver",200,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']);
      //MedEnter - Entrar CoPiloto
      cxp_actions pushBack (player addAction["<t color='#ff0000'>Entrar como CoPiloto</t>",cxp_fnc_forceEnter,"copilot",200,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']);
      //MedEnter - Entrar Passageiro
      cxp_actions pushBack (player addAction["<t color='#ff0000'>Entrar como Passageiro</t>",cxp_fnc_forceEnter,"passenger",100,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']);
      //MedEnter - Entrar Gunner1
      cxp_actions pushBack (player addAction["<t color='#ff0000'>Entrar como Gunner1</t>",cxp_fnc_forceEnter,"gunner1",100,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']);
      //MedEnter - Entrar Gunner2
      cxp_actions pushBack (player addAction["<t color='#ff0000'>Entrar como Gunner2</t>",cxp_fnc_forceEnter,"gunner2",100,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']);
      //MedEnter - Sair
      cxp_actions pushBack (player addAction["<t color='#ff0000'>Sair</t>",cxp_fnc_forceEnter,"exit",100,false,false,"",'(vehicle player != player) && (locked(vehicle player) isEqualTo 2)']);
      //Lançar bote salva-vidas
      cxp_actions pushBack (player addAction["<t color='#f000ff'>Lançar Bote Salva-Vidas</t>",cxp_fnc_lancarBoteSalvaVidas,(vehicle player),0,false,false,"",'(surfaceisWater (getPos vehicle player)) && (player isEqualTo driver vehicle player) && ((typeof (vehicle player)) in esf_helisDispBote) && !cxp_sef_boteSolto']);
      //Apreender itens no chao
	    cxp_actions pushBack (player addAction["<t color='#ff0000'>Apreender Itens</t>",cxp_fnc_apreenderItens,"",0,false,false,"",'((count (nearestObjects [player,["WeaponHolder"],3]) > 0) || (count (nearestObjects [player,["GroundWeaponHolder"],3]) > 0) || (count (nearestObjects [player,["WeaponHolderSimulated"],3]) > 0))']);
	  };
};
// Cordas no Heli
cxp_actions pushBack (player addAction["Soltar Cordas", SHK_Fastrope_fnc_createRopes, [], -1, false, false, '','call SHK_Fastrope_fnc_canCreate']);
cxp_actions pushBack (player addAction["Recolher Cordas", SHK_Fastrope_fnc_cutRopes, [], -1, false, false, '','call SHK_Fastrope_fnc_canCut']);
cxp_actions pushBack (player addAction["Descer com Rapel", SHK_Fastrope_fnc_queueUp, [], 15, false, false, '','call SHK_Fastrope_fnc_canFastrope']);

// Ejetar do heli com Paraquedas
cxp_actions pushBack (player addAction["<t color='#f000ff'>Ejetar (Paraquedas)</t>", cxp_fnc_parachuteEspecial, "", 0, false, false, "", '!isNull vehicle player && vehicle player isKindOf "Air" && (!(player getVariable ["restrained",false]) && !(player getVariable ["tied",false]))']);

// Cinto de Segurança
cxp_actions pushBack (player addAction["<img image='icons\seatOn.paa' /><t color='#BBBB00'>Colocar cinto de segurança</t>", {cxp_seatbelt=true; playSound "sintodeseg"}, "", 3, false, true, "", 'vehicle player isKindOf "Car" && !cxp_seatbelt && (!(player getVariable ["restrained",false]) && !(player getVariable ["tied",false]))']);
cxp_actions pushBack (player addAction["<img image='icons\seatOff.paa' /><t color='#BBBB00'>Retirar cinto de segurança</t>", {cxp_seatbelt=false; playSound "sintodeseg"}, "", 3, false, true, "", 'vehicle player isKindOf "Car" && cxp_seatbelt && (!(player getVariable ["restrained",false]) && !(player getVariable ["tied",false]))']);

// Sentar
cxp_actions pushBack (player addAction["Sentar",cxp_fnc_sitDown,cursorTarget,10,false,false,"",'!isNull cursorTarget && (player distance cursorTarget) < 3 && (cursorTarget isKindOf "Land_CampingChair_V1_F" || cursorTarget isKindOf "Land_ChairWood_F" || cursorTarget isKindOf "Land_ChairPlastic_F" || cursorTarget isKindOf "Land_OfficeChair_01_F" || cursorTarget isKindOf "Land_CampingChair_V2_F")']);

// Levantar
cxp_actions pushBack (player addAction["Levantar",cxp_fnc_sitDown,cursorTarget,10,false,false,"",'cxp_sitting']);

// ATM
cxp_actions pushBack (player addAction["<t color='#56ff00'>Caixa Eletronico</t>",cxp_fnc_atmMenu,"",0,false,false,"",'(call cxp_fnc_nearATM) && {!dialog}']);

// Pegar Itens
cxp_actions pushBack (player addAction["Pegar Item(s)",{createDialog "cxp_pickup_items"},"",0,false,false,"",'!isNull cursorObject && (count (cursorObject getVariable ["item",[]]) > 0) && (player distance cursorObject < 5) && (!(player getVariable ["restrained",false]) && (!(player getVariable ["tied",false])))']);

// Inventario barraca
cxp_actions pushBack (player addAction["Abrir Inventario",cxp_fnc_openBarracaInv,'',0,false,false,"",'!isNull cursorObject && (count (cursorObject getVariable ["item",[]]) > -1) && (player distance cursorObject < 7) && (!(player getVariable ["restrained",false]) && (!(player getVariable ["tied",false]))) && ((typeOf cursorObject isEqualTo "Land_TentA_F") || (typeOf cursorObject isEqualTo "Land_TentDome_F"))']);