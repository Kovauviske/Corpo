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
    if(([false,"cocap",1] call cxp_fnc_handleInv)) then {
      hint "Que briza maluco, huaaai!";
      sleep 2;

      playSound "cocaina";

      //Activate ppEffects we need
      "chromAberration" ppEffectEnable true;
      "radialBlur" ppEffectEnable true;
      enableCamShake true;
      cxp_thirst = cxp_thirst - 20;
      cxp_hunger = cxp_hunger - 20;
      private _smoke = "SmokeShell" createVehicle position player;
      if (vehicle player != player) then {
          _smoke attachTo [vehicle player, [-0.6,-1,0]];
      }else{
          _smoke attachTo [player, [0,-0.1,1.5]];
      };

      //1 minute with the effects
      for "_i" from 0 to 60 do
      {
          "chromAberration" ppEffectAdjust [random 0.25,random 0.25,true];
          "chromAberration" ppEffectCommit 1;
          "radialBlur" ppEffectAdjust  [random 0.02,random 0.02,0.15,0.15];
          "radialBlur" ppEffectCommit 1;
          addcamShake[random 3, 1, random 3];
          sleep 1;
      };

      //Stop effects
      "chromAberration" ppEffectAdjust [0,0,true];
      "chromAberration" ppEffectCommit 5;
      "radialBlur" ppEffectAdjust  [0,0,0,0];
      "radialBlur" ppEffectCommit 5;
      sleep 0.02;

      //Deactivate ppEffects
      "chromAberration" ppEffectEnable false;
      "radialBlur" ppEffectEnable false;
      resetCamShake;
      sleep 2;
      cxp_usingDroga = false;
    };
};
