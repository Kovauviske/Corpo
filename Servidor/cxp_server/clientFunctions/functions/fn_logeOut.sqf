#include "\cxp_server\script_macros.hpp"
/*
	File: fn_logeOut.sqf
	Author: Casperento
*/
disableSerialization;

// Desabilitando "informações"
disableUserInput true;
showChat false;
[CXP_ID_PlayerTags,"onEachFrame"] spawn BIS_fnc_removeStackedEventHandler;
1 fadeSound 0;
1 fadeSpeech 0;
cutText ["","BLACK",1];
sleep 1;
4 cutRsc ["SplashNoise","BLACK"];
sleep 0.25;

// final info
[format["<t size='1.3' color='#FF0000'>SAMPA LIFE BRASIL</t><br/>Volte sempre %1.<br/>Agradecemos pela sua presença.<br/><t size='1.2' color='#ffffff'>Chame seus amigos para jogar com gente!</t><br/><t size='1.1' color='#15ff00'>Não se preocupe, seus dados foram sincronizados com sucesso!</t>",name player],0,0.1,8,0,0,8] spawn BIS_fnc_dynamicText;
sleep 8;

// Removendo por completo da lista do samu
[(name player)] remoteExec ["CXPSV_fnc_rmMorteListaSv",RSERV];

// Códigos de sincronização
[] call CXPSKT_fnc_updateRequest;
[player] remoteExec ["CXPSV_fnc_cleanupRequest",RSERV];

// Finalizando desconexão
["",0,0.2,8,0,0,8] spawn BIS_fnc_dynamicText;
["Sair",false,true,true] call BIS_fnc_endMission;
