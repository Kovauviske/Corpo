#include "\life_server\script_macros.hpp"
/*
	Thanks to UPM notification system, but i made my own!
	File: fn_notify.sqf
	Author: Casperento
	Description:
	Exibe notificacao mais bem desenhada para o jogador..
*/
params [
	["_tit","",[""]],
	["_subTit","",[""]],
	["_msg","",[""]],
	["_stripColor",[1,1,1,1],[[]]],
	["_snd","turn",[""]]
];

disableSerialization;
"cxp_notify" cutRsc ["CXP_Notify_RscNotification", "PLAIN"];

_ctrlText = (uiNamespace getVariable "CXP_RscNotification") displayCtrl 1000;
_ctrlStrip = (uiNamespace getVariable "CXP_RscNotification") displayCtrl 1001;

_ctrlText ctrlSetStructuredText parseText format ["<t size='0.9' font='PuristaBold' align='right'>%1</t><br/><br/><t size='0.85' font='PuristaMedium' align='left' color='#22ff00'>%2</t><br/><t size='0.6' font='EtelkaMonospacePro' color='#ffffff'>%3</t>",_tit,_subTit,_msg];
_ctrlText ctrlSetPosition [safezoneX, (safezoneH/24), ((ctrlPosition _ctrlText) select 2), (ctrlTextHeight _ctrlText)+0.01];
_ctrlText ctrlCommit 0.5;

_ctrlStrip ctrlSetBackgroundColor _stripColor;
_ctrlStrip ctrlSetPosition [(safezoneX + ((ctrlPosition _ctrlText) select 2)), (safezoneH/24), ((ctrlPosition _ctrlStrip) select 2), (ctrlTextHeight _ctrlText)+0.01];
_ctrlStrip ctrlCommit 0.5;

playSound _snd;
