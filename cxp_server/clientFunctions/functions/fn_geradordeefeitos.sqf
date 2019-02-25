/*
	File : fn_geradordeefeitos.sqf
	Author : Casperento (THX Bohemia)
	Description:
	Gerador de efeitos visuais
*/
params [
  ["_duration",-1,[0]],
  ["_effectName","",[""]],
  ["_priority",-1,[0]],
  ["_effect",[],[[]]]
];

private "_handle";
private _timer = 60 * _duration;
while {
	_handle = ppEffectCreate [_effectName, _priority];
	_handle < 0
} do {
	_priority = _priority + 1;
};

_handle ppEffectEnable true;
_handle ppEffectAdjust _effect;
_handle ppEffectCommit 5;
uiSleep _timer;
_handle ppEffectEnable false;
ppEffectDestroy _handle;