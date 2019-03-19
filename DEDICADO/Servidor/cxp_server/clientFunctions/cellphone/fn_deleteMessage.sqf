/*
	Author: GetSomePanda / Panda
	Modified: Casperento
	SteamID: 76561198145366418
	File Name: fn_messagesMenu.sqf
	Information: Sets up message menu.
*/
disableSerialization;

private _lbSelectedData = (call compile (lbData[98112,lbCurSel (98112)]));
private _name = _lbSelectedData select 0;
private _msg = _lbSelectedData select 1;
private _time = _lbSelectedData select 2;

private _messages = player getVariable ["cellphone_messages",[]];
_messages = _messages - [[_name,_msg,_time]];
player setVariable ["cellphone_messages",_messages,true];

closeDialog 0;
[] spawn cxp_fnc_messagesMenu;

hint "Mensagem removida com sucesso!";