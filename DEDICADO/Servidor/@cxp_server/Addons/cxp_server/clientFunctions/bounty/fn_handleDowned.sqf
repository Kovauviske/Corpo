/*
	File: fn_handleDowned.sqf
	Author: John "Paratus" VanderZwet
	Modified: Casperento
	Description: Downed state for rubber bullets
*/
private _source = param [0,objNull,[objNull]];

player setDamage 0;

if (isNull _source) exitWith {
	player allowDamage true;
	cxp_isBorrachado = false;
};

private _inVehicle = false;
if (!cxp_isBorrachado && alive player && isNull (findDisplay 7300) && {_source isKindOf "Man"}) then  {
	[2,format["Você foi baleado por uma bala de borracha de %1, e estará inconsciente em breve...", name _source]] call cxp_fnc_broadcast;

	if (!isNull (player getVariable ["currentlyEscorting", objNull])) then {
		[] call cxp_fnc_stopEscorting;
	};
	
	if (player getVariable ["Escorting",false]) then {
		_escort = (player getVariable ["escorted_by",[objNull,false]]) select 0;
		[] remoteExec ["cxp_fnc_stopEscorting",_escort];
	};

	cxp_isBorrachado = true;
	player setVariable["downed",true,true];
	
	if (vehicle player == player) then {
		_inVehicle = false;
	} else {
		player allowdamage false;
		player action ["Eject",vehicle player];
		[] spawn {
			sleep 3;
			player allowDamage true;
		};
		_inVehicle = true;
	};
	player setUnconscious true;
	
	disableUserInput true;
	[] spawn { sleep 2; if (userInputDisabled) then { disableUserInput false; sleep 0.1; disableUserInput true; } };
	private _hndlBlur = ppEffectCreate ["DynamicBlur", 501];
	_hndlBlur ppEffectEnable true;
	_hndlBlur ppEffectAdjust [5];
	_hndlBlur ppEffectCommit 0;

	private _hndlBlack = ppEffectCreate ["colorCorrections", 1501];
	_hndlBlack ppEffectEnable true;
	_hndlBlack ppEffectAdjust [1.0, 1.0, 0.0, [0, 0, 0, 0.9], [1.0, 1.0, 1.0, 1.0],[1.0, 1.0, 1.0, 0.0]];
	_hndlBlack ppEffectCommit 0;
	private _effects = true;
	private _eff1 = 5;
	private _eff2 = 0.9;
	private _time = 0;
	private _downed = true;
	private _dead = false;

	while {_downed} do {
		if (vehicle player == player) then {
			_inVehicle = false;
		} else {
			_inVehicle = true;
		};
		if (alive player) then {
			if (player getVariable["adrenaline",false]) exitWith {
				_downed = false;
				player setVariable["adrenaline",false];
			};
		} else {
			_downed = false;
			_dead = true;
		};
		_time = _time + 1;
		sleep 1;
	};
	
	// The below kills pre-downed user input, which would resume on its own if only re-enabled once. ~Gnash
	disableUserInput false;
	disableUserInput true;
	disableUserInput false;
	[_hndlBlur,_hndlBlack,_eff1,_eff2,_effects] spawn {
		_hndlBlur = _this select 0;
		_hndlBlack = _this select 1;
		_eff1 = _this select 2;
		_eff2 = _this select 3;
		_effects = _this select 4;
		while {_effects} do {
			_eff1 = _eff1 - 0.025;
			_eff2 = _eff2 - 0.0045;

			_hndlBlur ppEffectAdjust [_eff1];
			_hndlBlur ppEffectCommit 0;

			_hndlBlack ppEffectAdjust [1.0, 1.0, 0.0, [0, 0, 0, _eff2], [1.0, 1.0, 1.0, 1.0],[1.0, 1.0, 1.0, 0.0]];
			_hndlBlack ppEffectCommit 0;

			sleep 0.01;
			if (_eff2 <= 0) then {_effects = false;};
		};
		ppEffectDestroy _hndlBlur;
		ppEffectDestroy _hndlBlack;
	};
	
	player setUnconscious false;
	if (stance player == "STAND") then { 
		[player,"AidlPercMstpSnonWnonDnon_G01","playNow"] remoteExec ["cxp_fnc_animDynSync",-2];
	} else { 
		[player,"AmovPpneMstpSnonWnonDnon","playNow"] remoteExec ["cxp_fnc_animDynSync",-2];
	};
	
	cxp_isBorrachado = false;
	player setVariable["downed",false,true];
	disableUserInput false;
	sleep 1;
	disableUserInput false;
};