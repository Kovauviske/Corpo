/*
	fn_tieingb.sqf
	Author: ?
	Modified: Casperento
*/

//Monitor excessive blindfolding
[] spawn {
	private["_time"];
	for "_i" from 0 to 1 step 0 do {
		uisleep 5;
		
		if !(player getVariable["blindfolded", false]) exitWith {};

		if !(player getVariable ["tied", false]) exitwith {
			player setVariable ["blindfolded", nil, true];
			hint "Voce conseguiu se livrar do saco de sequestro !";
		};

		if (!([west,getPos player,50] call cxp_fnc_nearUnits) && !([civilian,getPos player,50] call cxp_fnc_nearUnits) && (player getVariable["blindfolded", false]) && isNull objectParent player) exitWith {

			player setVariable["blindfolded", nil, true];
			"colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 1],  [0, 0, 0, 0.0]]; 
			"colorCorrections" ppEffectCommit 3;
			"colorCorrections" ppEffectEnable false;	
			hint "Voce conseguiu se livrar do saco de sequestro !";
		};
	};
};

cutText ["Voce esta com um saco de sequestro, provavelmente sera sequestrado !","PLAIN",0,true];

"colorCorrections" ppEffectEnable true;			
"colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 0.01],  [0, 0, 0, 0.0]]; 
"colorCorrections" ppEffectCommit 0.3;

removeHeadGear player;
player addheadgear "H_CrewHelmetHeli_O";
player setVariable ["sequestrado",true,true];

[] spawn {
	for "_i" from 0 to 1 step 0 do {
		if !(player getvariable ["blindfolded", false]) exitWith {
			cutText ["Voce nao esta mais com um saco de sequestro !","PLAIN",2];	
			player setVariable ["blindfolded", nil, true];
		};

		if !(alive player) exitWith {
			cutText ["Voce nao esta mais com um saco de sequestro !","PLAIN",2];	
			player setVariable ["blindfolded", nil, true];
		};

		if (vehicle player != player) then {
			if (driver (vehicle player) == player) then {
				player action["eject",vehicle player]
			};
		};
		
		uiSleep 1;
		"colorCorrections" ppEffectEnable true;			
		"colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 0.01],  [0, 0, 0, 0.0]]; 
		"colorCorrections" ppEffectCommit 0.3;
	};

	"colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 1],  [0, 0, 0, 0.0]]; 
	"colorCorrections" ppEffectCommit 3;
	"colorCorrections" ppEffectEnable false;	

	removeHeadGear player;
	if !(alive player) then {
		player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
		player setVariable ["blindfolded", nil, true];
		detach player;
	};
};