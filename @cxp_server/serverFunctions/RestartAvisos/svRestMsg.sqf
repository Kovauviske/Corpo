/*
	----------------------------------------------------------------------------------------------

	Copyright � 2016 soulkobk (soulkobk.blogspot.com)

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU Affero General Public License as
	published by the Free Software Foundation, either version 3 of the
	License, or (at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
	GNU Affero General Public License for more details.

	You should have received a copy of the GNU Affero General Public License
	along with this program. If not, see <http://www.gnu.org/licenses/>.

	----------------------------------------------------------------------------------------------

	Name: serverRestartMessages.sqf
	Version: 1.3
	Author: soulkobk (soulkobk.blogspot.com)
	MODIFIED : CASPERENTO

	Change Log:
	1.0	-	original base script.
	1.1	-	fixed client messages to reflect if server is locked at 5 minutes until restart or not.
	1.2	-	created new call routines for time checking and formatting output. fixed error when using
			time string 00:00:00 in _hardResetTimes, it now accepts 00:00:00 or 24:00:00 for midnight.
			script now also allows 24 hour roll-over. tidied up some code structure.
	1.3 -   there's no dll being used on this code, which allow us use in both server's (LINUX/WIN) ---> BY CASPERENTO ;)
	1.4 -   new type of showing messages ---> BY CASPERENTO ;)

	----------------------------------------------------------------------------------------------
*/

/*
	Procure pela seguinte linha no codigo abaixo (MUDAR SENHA PARA A DE SEU SERVIDOR):
	_lockServer = "senhaAqui" serverCommand "#lock";
*/

_hardResetTimes = ["00:00:00","06:00:00","12:00:00","18:00:00"]; // HARD RESET TIMES IN HH:MM:SS
_lockServerAt5Minutes = true; // LOCK THE SERVER 5 MINUTES BEFORE RESTART?

/*	------------------------------------------------------------------------------------------
	DO NOT EDIT BELOW HERE!
	------------------------------------------------------------------------------------------	*/

#define SECSPERHOUR 3600
#define SECSPERMIN 60

_doubleDigits = {
    if (_this < 10) exitWith {"0"+str _this};
    str _this
};

_isTime = false;
_checkTimeRange = {
	_nowTime = _realSecondsTime; _startTime = _hardSecondsTime - (_this * 60); _endTime = _hardSecondsTime - ((_this * 60) - 60);

	if (_startTime <= 0) then {_startTime = (86400 + _startTime);};
	if (_endTime <= 0) then {_endTime = (86400 + _endTime);};
	if ((_endTime - _startTime) < 0) then
	{
		_startTime = ((_endTime - _startTime) + (86400 - 60));
	};
	if ((_nowTime >= _startTime) && (_nowTime <= _endTime)) then {_isTime = true;} else {_isTime = false;};
	_isTime
};

_outputServerTime = "";

_checkServerTime = {
	// LINUX COMPATIBLE ///////
    _currServerTime = missionStartServer;
    _currServerTimeHour = _currServerTime select 3;
    _currServerTimeMin = _currServerTime select 4;
    _currServerTimeSec = _currServerTime select 5;
	// ///////////////////////
	if (_this == "HHMMSS") then {
		_outputServerTime = format ["%1:%2:%3", _currServerTimeHour call _doubleDigits, _currServerTimeMin call _doubleDigits, _currServerTimeSec call _doubleDigits];
	}
	else
	{
		_outputServerTime = [_currServerTimeHour, _currServerTimeMin, _currServerTimeSec];
	};
	_outputServerTime
};

diag_log format ["[AVISO-RESTART] -> NOSSO SV REINICIA SOZINHO NOS SEGUINTES HORARIOS : %1 - HORARIO ATUAL : %2", _hardResetTimes, 'HHMMSS' call _checkServerTime];

_realServerTime = "" call _checkServerTime; _realSecondsTime = (((_realServerTime select 0) * SECSPERHOUR) + ((_realServerTime select 1) * SECSPERMIN) + (_realServerTime select 2));
_30minCheck = false; _20minCheck = false; _10minCheck = false; _5minCheck = false; _2minCheck = false; _1minCheck = false;

checkServerTime = true;
while {checkServerTime} do
{
	_ticksLoop = round(diag_TickTime);
	{
		_hardServerTime = _x splitString ":";
		_hardServerTimeHour = parseNumber (_hardServerTime select 0);
		_hardServerTimeMin = parseNumber (_hardServerTime select 1);
		_hardServerTimeSec = parseNumber (_hardServerTime select 2);
		_hardSecondsTime = (_hardServerTimeHour * SECSPERHOUR);
		_hardSecondsTime = (_hardSecondsTime + (_hardServerTimeMin * SECSPERMIN));
		_hardSecondsTime = (_hardSecondsTime + _hardServerTimeSec);
		switch true do
		{
			case ((30 call _checkTimeRange) && !_30minCheck) :
			{
				_30minCheck = true;
				["<t color='#FFFF00' size='0.65'>%1</t><br/>","AVISO - RESTART AUTOMATICO","<t size='0.65'>%1</t>","O SERVIDOR RENICIARA EM","<t size='0.65' color='#FF0000'>%1</t>","30min"] remoteExec ["cxp_fnc_showRRMessage",0];
				diag_log format ["[AVISO-RESTART] -> FALTAM 30min PARA O SV RESETAR - HORARIO ATUAL : %1", 'HHMMSS' call _checkServerTime];
			};
			case ((20 call _checkTimeRange) && !_20minCheck) :
			{
				_30minCheck = true; _20minCheck = true;
				["<t color='#FFFF00' size='0.65'>%1</t><br/>","AVISO - RESTART AUTOMATICO","<t size='0.65'>%1</t>","O SERVIDOR RENICIARA EM","<t size='0.65' color='#FF0000'>%1</t>","20min"] remoteExec ["cxp_fnc_showRRMessage",0];
				diag_log format ["[AVISO-RESTART] -> FALTAM 20min PARA O SV RESETAR - HORARIO ATUAL : %1", 'HHMMSS' call _checkServerTime];
			};
			case ((10 call _checkTimeRange) && !_10minCheck) :
			{
				_30minCheck = true; _20minCheck = true; _10minCheck = true;
				["<t color='#FFFF00' size='0.65'>%1</t><br/>","AVISO - RESTART AUTOMATICO","<t size='0.65'>%1</t>","O SERVIDOR RENICIARA EM","<t size='0.65' color='#FF0000'>%1</t>","10min"] remoteExec ["cxp_fnc_showRRMessage",0];
				diag_log format ["[AVISO-RESTART] -> FALTAM 10min PARA O SV RESETAR - HORARIO ATUAL : %1", 'HHMMSS' call _checkServerTime];
			};
			case ((5 call _checkTimeRange) && !_5minCheck) :
			{
				_30minCheck = true; _20minCheck = true; _10minCheck = true; _5minCheck = true;
				if (_lockServerAt5Minutes) then
				{
					_lockServer = "0jyT_Kr4uboT" serverCommand "#lock";
					["<t color='#FF5500' size='0.65'>%1</t><br/>","AVISO - RESTART AUTOMATICO","<t size='0.65'>%1</t>","O SERVIDOR RENICIARA EM","<t size='0.65' color='#FF0000'>%1</t>","5min"] remoteExec ["cxp_fnc_showRRMessage",0];
					diag_log format ["[AVISO-RESTART] -> FALTAM 5min PARA O SV RESETAR - HORARIO ATUAL : %1 - SERVER LOCKED!", 'HHMMSS' call _checkServerTime];
				}
				else
				{
					["<t color='#FF5500' size='0.65'>%1</t><br/>","AVISO - RESTART AUTOMATICO","<t size='0.65'>%1</t>","O SERVIDOR RENICIARA EM","<t size='0.65' color='#FF0000'>%1</t>","5min"] remoteExec ["cxp_fnc_showRRMessage",0];
					diag_log format ["[AVISO-RESTART] -> FALTAM 5min PARA O SV RESETAR - HORARIO ATUAL : %1", 'HHMMSS' call _checkServerTime];
				};
			};
			case ((2 call _checkTimeRange) && !_2minCheck) :
			{
				_30minCheck = true; _20minCheck = true; _10minCheck = true; _5minCheck = true; _2minCheck = true;
				["<t color='#FF5500' size='0.65'>%1</t><br/>","AVISO - RESTART AUTOMATICO","<t size='0.65'>%1</t>","O SERVIDOR RENICIARA EM","<t size='0.65' color='#FF0000'>%1</t>","2min"] remoteExec ["cxp_fnc_showRRMessage",0];
				diag_log format ["[AVISO-RESTART] -> FALTAM 2min PARA O SV RESETAR - HORARIO ATUAL : %1", 'HHMMSS' call _checkServerTime];
			};
			case ((1 call _checkTimeRange) && !_1minCheck) :
			{
				_30minCheck = true; _20minCheck = true; _10minCheck = true; _5minCheck = true; _2minCheck = true; _1minCheck = true;
				["<t color='#FF0000' size='0.65'>%1</t><br/>","AVISO - RESTART AUTOMATICO","<t size='0.65'>%1</t>","O SERVIDOR RENICIARA EM","<t size='0.65' color='#FF0000'>%1</t>","60seg"] remoteExec ["cxp_fnc_showRRMessage",0];
				diag_log format ["[AVISO-RESTART] -> FALTAM 60seg PARA O SV RESETAR - HORARIO ATUAL : %1", 'HHMMSS' call _checkServerTime];
				uiSleep 60;
				diag_log format ["[AVISO-RESTART] -> RESTART AUTOMATICO EFETUADO COM SUCESSO - HORARIO ATUAL : %1", 'HHMMSS' call _checkServerTime];
				checkServerTime = false;
			};
		};
	} forEach _hardResetTimes;
	uiSleep 1;
	_ticksEnd = round(diag_TickTime);
	_ticksEndLoop = round(_ticksEnd - _ticksLoop);
	if (_realSecondsTime >= 86400) then
	{
		_realSecondsTime = 0;
	};
	_realSecondsTime = _realSecondsTime + _ticksEndLoop;
};
