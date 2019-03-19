/*
    Author: Kuchicha
    Modified: Casperento
*/
if (cxp_usingDroga) then {
    hint "Espere o efeito da droga que voce acabou de usar passar para usar outra !";
}else{
	if !(player getVariable["drogado",TRUE]) then {
		player setVariable ["drogado",true,true];
	};
	cxp_usingDroga = true;

  // Remove item do inventario
  if(([false,"heroinp",1] call cxp_fnc_handleInv)) then {
  	hint "To muito doidão, bora dançar caralhoo !";
  	sleep 3;
  	private["_force"];
  	playSound "heroina";
  	cxp_thirst = cxp_thirst - 20;
      cxp_hunger = cxp_hunger - 20;

  	for "_i" from 0 to 66 do {
  		_force = random 15;
  		"chromAberration" ppEffectEnable true;
  		"chromAberration" ppEffectAdjust [_force / 24, _force / 24, false];
  		"chromAberration" ppEffectCommit (0.3 + random 0.1);
  		waituntil {ppEffectCommitted "chromAberration"};
  		sleep 0.02;
  	};
  	"chromAberration" ppEffectEnable false;
  	cxp_usingDroga = false;
  	sleep 2;
  };
};
