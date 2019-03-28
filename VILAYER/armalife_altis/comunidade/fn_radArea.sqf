/*
	fn_radArea.sqf
	Modified: Casperento
	Created by Fuel for RebornRoleplay.com
	[UK/EU] Reborn Roleplay | RebornRoleplay.co.uk
*/
if (getNumber(missionConfigFile >> "CxpBasic_Settings" >> "cxp_radCorp") isEqualTo 0 && playerSide != civilian) exitWith {};

_damage = getDammage player;
_rad1 = ppEffectCreate ["ChromAberration",200];
_rad2 = ppEffectCreate ["DynamicBlur",500];
_rad3 = ppEffectCreate ["FilmGrain",2000];

if (!alive player || (_damage == 1) || (player getVariable ["exitRad",true])) exitWith {
	player setVariable ["exitRad",true];
	_rad1 ppEffectEnable false;
	_rad1 ppEffectAdjust [0,0,true];
	_rad1 ppEffectCommit 1;
	_rad2 ppEffectEnable false;
	_rad2 ppEffectAdjust [0];
	_rad2 ppEffectCommit 1;
	_rad3 ppEffectEnable false;
	_rad3 ppEffectAdjust [0,0,0,0,0,true];
	_rad3 ppEffectCommit 1;
};

// this is the check to see if they are wearing protective clothing
if (((uniform player) isEqualTo "U_C_Scientist") && ((headgear player) isEqualTo "H_HelmetSpecO_blk")) then {
	//rad sound
	playSound "radiation";

	// edit this for the length of the effect
	for "_i" from 0 to 4 do {
		_rad1 ppEffectEnable true;
		_rad1 ppEffectAdjust [-0.02,0,true];
		_rad1 ppEffectCommit 1;
		_rad2 ppEffectEnable true;
		_rad2 ppEffectAdjust [0.03];
		_rad2 ppEffectCommit 1;
		_rad3 ppEffectEnable true;
		_rad3 ppEffectAdjust [0.12,1.52,3.54,2,2,true];
		_rad3 ppEffectCommit 1;
	};
	sleep 5;

	//loops the script until they exit
	[] spawn cxp_fnc_radArea;

} else {
	//rad sound
	playSound "radiation";

	// edit this for the length of the effect
	for "_i" from 0 to 4 do {
		_rad1 ppEffectEnable true;
		_rad1 ppEffectAdjust [-0.02,0,true];
		_rad1 ppEffectCommit 1;
		_rad2 ppEffectEnable true;
		_rad2 ppEffectAdjust [0.03];
		_rad2 ppEffectCommit 1;
		_rad3 ppEffectEnable true;
		_rad3 ppEffectAdjust [0.12,1.52,3.54,2,2,true];
		_rad3 ppEffectCommit 1;
	};
	sleep 5;

	//set the damage to player
	player setDamage (_damage + 0.1);

	//loops the script until they exit
	[] spawn cxp_fnc_radArea;
};
