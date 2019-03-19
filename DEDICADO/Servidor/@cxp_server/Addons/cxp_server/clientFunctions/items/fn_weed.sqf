/*
    Author: Kuchicha
    Modified: Casperento
*/
params [["_n","",[""]]];
if !(_n in ["marijuana","marijuana_med"]) exitWith {};
if (cxp_usingDroga) then {
    hint "Espere o efeito da droga que voce acabou de usar passar para usar outra !";
}else{
    if !(player getVariable["drogado",TRUE]) then {
        player setVariable ["drogado",true,true];
    };
    cxp_usingDroga = true;

    // Remove item do inventario
    if(([false,_n,1] call cxp_fnc_handleInv)) then {

      hint "Campeões nao usam drogas!";

      sleep 2;
      playSound "maconha";
      cxp_thirst = cxp_thirst - 30;
      cxp_hunger = cxp_hunger - 30;

      //Activate ppEffects we need
      "chromAberration" ppEffectEnable true;
      "radialBlur" ppEffectEnable true;
      enableCamShake true;
      private _smoke = "SmokeShellGreen" createVehicle position player;
      if (vehicle player != player) then {
          _smoke attachTo [vehicle player, [-0.6,-1,0]];
      }else{
          _smoke attachTo [player, [0,-0.1,1.5]];
      };

      //1 minute with the effects
      for "_i" from 0 to 44 do {
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
      sleep 6;

      //Deactivate ppEffects
      "chromAberration" ppEffectEnable false;
      "radialBlur" ppEffectEnable false;
      resetCamShake;

      cxp_usingDroga = false;
      sleep 6;
      hint "Que fome caralho..";
    };
};
