/*
----------------------------------------------|
Author: Backer
Description: To much Drugs biatch! Lets start the effekt every 5 Mins. Called in Init Survival!
Modified: Casperento
----------------------------------------------|
*/

if (cxp_usingDroga) then {
    hint "Espere o efeito da droga que voce acabou de usar passar para usar outra !";
}else{
	if !(player getVariable["drogado",TRUE]) then {
		player setVariable ["drogado",true,true];
	};
	cxp_usingDroga = true;

  // Remove item do inventario
  if(([false,"methp",1] call cxp_fnc_handleInv)) then {
  	player say3D "addicted";
  	//Activate ppEffects we need
  	"radialBlur" ppEffectEnable true;
  	enableCamShake true;
  	cxp_thirst = cxp_thirst - 20;
      cxp_hunger = cxp_hunger - 20;

  	//Let's go for 36secs of effetcs
  	for "_i" from 0 to 36 do {
  		"radialBlur" ppEffectAdjust [random 1,random 0.5,1,0.5];
  		"radialBlur" ppEffectCommit 1;
  		addcamShake[random 10, 1, random 10];
  		sleep 1;
  	};

  	//Stop effects
  	"radialBlur" ppEffectAdjust [0,0,0,0];
  	"radialBlur" ppEffectCommit 5;
  	sleep 6;

  	//Deactivate ppEffects
  	"radialBlur" ppEffectEnable false;
  	resetCamShake;
  	cxp_usingDroga = false;
  };
};
