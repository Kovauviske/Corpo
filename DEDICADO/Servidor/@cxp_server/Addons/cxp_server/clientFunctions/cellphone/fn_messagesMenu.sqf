/*
	Author: GetSomePanda / Panda
	Helped: BoGuu
	Modified: Casperento
	SteamID: 76561198145366418
	File Name: fn_messagesMenu.sqf
	Information: Sets up message menu.
*/
disableSerialization;

createDialog "cxp_cell_old_msgs";
waitUntil {!isNull (findDisplay 98111)};
private _playerList = ((findDisplay 98111) displayCtrl 98112);
private _delButton = ((findDisplay 98111) displayCtrl 98114);
_delButton ctrlShow false;
private _replyButton = ((findDisplay 98111) displayCtrl 98115);
_replyButton ctrlShow false;

private _messages = player getVariable ["cellphone_messages",[]];

lbClear _playerlist;

if (count _messages < 1) exitWith {
	_playerList lbAdd format["Nenhuma mensagem encontrada!"];
	_playerList lbSetdata [(lbSize _playerList)-1,"Msg Invalida..."];
};

{
	private _time = _x select 2;
	private _timeArray = _time select 1;
	private _year = _timeArray select 0;
	private _month = _timeArray select 1;
	private _day = _timeArray select 2;
	private _hour = _timeArray select 3;
	private _minutes = _timeArray select 4;
		
	_minutes = toArray(str _minutes);
	if (count _minutes isEqualTo 1) then {
		_minutes = [48,(_minutes select 0)];
		_minutes = toString(_minutes);
	} else {
		_minutes = toString(_minutes);
	};
		
	private _infoToPass = format["%1", _x];
	_playerList lbAdd format["%1 - %2:%3 %4/%5/%6", _x select 0, _hour, _minutes, _day, _month, _year];
	_playerList lbSetdata [(lbSize _playerList)-1, _infoToPass];
} forEach _messages;