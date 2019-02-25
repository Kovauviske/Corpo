/*
    File: fn_teargas.sqf
    Author: Blackd0g
    Updated by Jokahghost
    Description:
*/

playerNearGas = false;

[] spawn {
    for "_i" from 0 to 1 step 0 do {

        if ( (((nearestObject [getpos player, "SmokeShellYellow"]) distance player < 20)) ) then {
          playerNearGas = true;
        } else {
          playerNearGas = false;
        };

        uiSleep 3;
    };
};

[] spawn {
    for "_i" from 0 to 1 step 0 do {

         "dynamicBlur" ppEffectEnable true; // enables ppeffect
         "dynamicBlur" ppEffectAdjust [0]; // enables normal vision
         "dynamicBlur" ppEffectCommit 15; // time it takes to normal
         resetCamShake; // resets the shake
         20 fadeSound 1; //fades the sound back to normal

        waituntil {playerNearGas}; // Wait till a Gas Grenade is near player


        if (headgear player != "H_CrewHelmetHeli_B") then {antidote1 = 2583}; // Player has no Suit
        if (headgear player == "H_CrewHelmetHeli_B") then {antidote1 = 2581}; // Player carries the Gas Suit

        if (antidote1 == 2583) then {
         "dynamicBlur" ppEffectEnable true; // enables ppeffect
         "dynamicBlur" ppEffectAdjust [20]; // intensity of blur
         "dynamicBlur" ppEffectCommit 3; // time till vision is fully blurred
         enableCamShake false; // enables camera shake
         addCamShake [10, 45, 10]; // sets shakevalues
         5 fadeSound 0.1; // fades the sound to 10% in 5 seconds
        };

        uiSleep 1;
    };
};
