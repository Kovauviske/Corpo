#include "\cxp_server\script_macros.hpp"
/*
  File: fn_concordTerm.sqf
  Author: Casperento
  Description:
  Concorda com os termos e começa a jogar
*/
closeDialog 0;

if !(cxp_is_alive) exitWith {cxp_concordDiscord = true;[] call cxp_fnc_spawnMenu;};

[] call cxp_fnc_playerSkins;
[] spawn cxp_fnc_autoMessages;
[] spawn cxp_fnc_autoSave;

// soh civil
playSound "introSong";
[] spawn {["Nova mensagem recebida","De: Administração",(localize "STR_Init_Welcome"),[1,0,0,1]] call cxp_fnc_notify;sleep 30;[] spawn cxp_fnc_welcomeCredits;};

// Cliente pronto para spawnar e terminar config
cxp_concordDiscord = true;
0 cutText ["","BLACK IN"];
