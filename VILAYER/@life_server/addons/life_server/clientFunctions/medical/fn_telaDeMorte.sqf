#include "\life_server\script_macros.hpp"
/*
  File: fn_telaDeMorte.sqf
  Author: Casperento
  Description:
  Tela de morte e suas funcoes
*/
disableSerialization;

//Monitor do botao de respawn
player spawn {
  //Sub-Monitor de chessus!
  if (CXP_SETTINGS(getNumber,"revive_inst_on") isEqualTo 1) then {
    [] spawn {
      disableSerialization;
      if ((FETCH_CONST(cxp_donorLevel) >= 5) && playerSide in [civilian,west]) then {
        private _btnInstRenasc = CONTROL(7300,7312);
        _btnInstRenasc ctrlEnable false;
        _btnInstRenasc ctrlShow true;
        _btnInstRenasc ctrlSetTooltip format["Aguarde %1 segundos para acionar o messias do Pastor Metralhadora...",(CXP_SETTINGS(getNumber,"revive_inst_delay"))];
        sleep (CXP_SETTINGS(getNumber,"revive_inst_delay"));
        _btnInstRenasc ctrlEnable true;
        _btnInstRenasc ctrlSetTooltip format["Revive sem precisar do samu. Custa-te R$%1...",(CXP_SETTINGS(getNumber,"revive_inst_fee"))];
      };
    };
  };
  disableSerialization;
  private _contador = CONTROL(7300,7301);
  private _btnRenascer = CONTROL(7300,7302);
  _btnRenascer ctrlEnable false;
  private _maxTimeMedOn = time + CXP_SETTINGS(getNumber,"respawn_timer");
  waitUntil {_contador ctrlSetText format [localize "STR_Medic_Respawn",[(_maxTimeMedOn - time),"MM:SS"] call BIS_fnc_secondsToString]; round(_maxTimeMedOn - time) <= 0 || isNull _this};
  //private _maxTimeMedOff = time + CXP_SETTINGS(getNumber,"respawn_timer_medOFF");
  /* BACKUP
  if (playersNumber independent > 0) then {
    waitUntil {_contador ctrlSetText format [localize "STR_Medic_Respawn",[(_maxTimeMedOn - time),"MM:SS"] call BIS_fnc_secondsToString]; round(_maxTimeMedOn - time) <= 0 || isNull _this};
  } else {
    waitUntil {_contador ctrlSetText format [localize "STR_Medic_Respawn",[(_maxTimeMedOff - time),"MM:SS"] call BIS_fnc_secondsToString]; round(_maxTimeMedOff - time) <= 0 || isNull _this};
  };
  */
  _btnRenascer ctrlEnable true;
  _contador ctrlSetText localize "STR_Medic_Respawn_2";
};

if (playersNumber independent > 0) then {
  player setVariable ["Revive",false,true];// Deixando o corpse reanimavel
  [player,profileName,playerSide] remoteExec ["CXPSV_fnc_addMorteListaSv",RSERV];
  (CONTROL(7300,7399)) ctrlSetText localize "STR_Medic_Disp";
  (CONTROL(7300,7310)) ctrlSetText localize "STR_Medic_AguardeDisp";
  //Monitor do statusChamado
  [] spawn {
    disableSerialization;
    waitUntil {(cxp_deadClient_Atendido select 0)};
    _bomResp = (cxp_deadClient_Atendido select 1);
    for "_i" from 0 to 1 step 0 do {
      if (!((cxp_deadClient_Atendido select 1) in allPlayers) || (isNull (cxp_deadClient_Atendido select 1))) then {
        (CONTROL(7300,7310)) ctrlSetText "O bombeiro cancelou/desconectou, aguardando outro...";
        [player,profileName,playerSide] remoteExec ["CXPSV_fnc_addMorteListaSv",RSERV]; //Medico desconectou/cancelou, entao volta esse cliente pra lista de mortos
        waitUntil {(!(isNull (cxp_deadClient_Atendido select 1)) && (cxp_deadClient_Atendido select 0)) || player getVariable "UsouReviveInst" || cxp_respawned};
        if (!(isNull (cxp_deadClient_Atendido select 1)) && (cxp_deadClient_Atendido select 0) && ((cxp_deadClient_Atendido select 1) != _bomResp) && ((cxp_deadClient_Atendido select 1) in allPlayers) && !(player getVariable "UsouReviveInst") && !cxp_respawned) then {_bomResp = (cxp_deadClient_Atendido select 1);}; // Atualiza medico que atendera paciente, se ele cair do sv, o paciente ainda está seguro
      } else {
        (CONTROL(7300,7310)) ctrlSetText (format ["%1 esta a %2m de voce!",name (cxp_deadClient_Atendido select 1),(floor((player getVariable "PositionCorpse") distance (cxp_deadClient_Atendido select 1)))]);
      };
      if (cxp_respawned) exitWith {};
      if (player getVariable "UsouReviveInst") exitWith {};
      if ((player getVariable "PositionCorpse") distance (cxp_deadClient_Atendido select 1) <= 20) exitWith {(CONTROL(7300,7310)) ctrlSetText (format["%1 chegou!",name (cxp_deadClient_Atendido select 1)]);};
    };
    if (cxp_respawned) exitWith {};
    if (player getVariable "UsouReviveInst") exitWith {};
    if ((player getVariable "PositionCorpse") distance (cxp_deadClient_Atendido select 1) <= 20) exitWith {(CONTROL(7300,7310)) ctrlSetText (format["%1 chegou!",name (cxp_deadClient_Atendido select 1)]);};
  };
} else {
  (CONTROL(7300,7399)) ctrlSetText localize "STR_Medic_DispNot";
  (CONTROL(7300,7310)) ctrlSetText localize "STR_Medic_AguardeDispNot";
};
