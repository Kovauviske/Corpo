#include "\cxp_server\script_macros.hpp"
/*
    File: fn_sAssaltoMSG.sqf
    Author: Casperento
    Description:
	  Envia alerta para o alvo desejado com audio personalizado
*/
// params
params [
	["_alvo",objNull,[objNull]],
	["_msg","",[""]],
	["_audio","",[""]]
];

if (_msg isEqualTo "") exitWith {hint"Msg invalida! Reporte este erro aos desenvolvedores!"};
if ((player getVariable ["alvoTab",false]) || (_alvo getVariable ["alvoTab",false])) then {player setVariable ["alvoTab",false,true];_alvo setVariable ["alvoTab",false,true];};

//Mensagem para o remetente e destinatario
private _distPlayerAlvo = floor(player distance _alvo);

[4,format ["<t color='#ffffff' size='2'>ALERTA</t><br/><br/><t color='#ff0000' size='1.7'> Enviado Por : %2 </t><br/><br/><t color='#fffc00' size='1.2'> %1 </t><br/><t color ='#fffc00'> Distancia do emissor : %3m </t><br/>",_msg,name player,_distPlayerAlvo]] remoteExecCall ["cxp_fnc_broadcast",_alvo];
if !(_audio isEqualTo "") then {[_audio] remoteExec ["cxp_fnc_custPlaySound",_alvo];};
_alvo setVariable ["alvoTab",true,true];
[(getPos _alvo)] remoteExec ["cxp_fnc_avisarPvpEntorno",RANY];

//final-verific
if (cxp_multaAutoEnviada && !isNil "cxp_multaAutoEnviada") then {
	[player] remoteExecCall ["cxp_fnc_multaAutomatica",_alvo];
	cxp_multaAutoEnviada = false;
};

//Confirmacao de seguranca
[4,format["<t color='#ffffff' size='2'>!-LEIA-ME-!</t><br/><br/><t size='1.2'>Você enviou um anúncio para %1 a %2m de distancia dele !</t>",name _alvo,_distPlayerAlvo]] call cxp_fnc_broadcast;