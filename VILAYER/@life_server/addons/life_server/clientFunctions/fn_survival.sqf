#include "\life_server\script_macros.hpp"
/*
    File: fn_survival.sqf
    Author: Bryan "Tonic" Boardwine

	Modified : Casperento

    Description:
    Sistema de sobrevivência
*/
private _fnc_food =  {
    if (cxp_hunger < 2) then {
  		player setDamage 1;
        titleText [localize "STR_NOTF_EatMSG_Death", "PLAIN", 1];
	  } else {
        cxp_hunger = cxp_hunger - 10;
        [false,false] call cxp_fnc_hudUpdate;
        if (cxp_hunger < 2) then {player setDamage 1; titleText [localize "STR_NOTF_EatMSG_Death", "PLAIN", 1];};
        switch (cxp_hunger) do {
            case 30: {
                titleText [localize "STR_NOTF_EatMSG_1", "PLAIN", 1];
			};
            case 20: {
                titleText [localize "STR_NOTF_EatMSG_2", "PLAIN", 1];
			};
            case 10: {
                titleText [localize "STR_NOTF_EatMSG_3", "PLAIN", 1];
                if (CXP_SETTINGS(getNumber,"enable_fatigue") isEqualTo 1) then {player setFatigue 1;};
            };
        };
    };
};

private _fnc_water = {
    if (cxp_thirst < 2) then {
		player setDamage 1;
        titleText [localize "STR_NOTF_DrinkMSG_Death", "PLAIN", 1];
	}else{
        cxp_thirst = cxp_thirst - 10;
        [false,false] call cxp_fnc_hudUpdate;
        if (cxp_thirst < 2) then {player setDamage 1; titleText [localize "STR_NOTF_DrinkMSG_Death", "PLAIN", 1];};
        switch (cxp_thirst) do  {
            case 30: {
                titleText [localize "STR_NOTF_DrinkMSG_1", "PLAIN", 1];
			};
            case 20: {
                titleText [localize "STR_NOTF_DrinkMSG_2", "PLAIN", 1];
                if (CXP_SETTINGS(getNumber,"enable_fatigue") isEqualTo 1) then {player setFatigue 1;};
            };
            case 10: {
                titleText [localize "STR_NOTF_DrinkMSG_3", "PLAIN", 1];
                if (CXP_SETTINGS(getNumber,"enable_fatigue") isEqualTo 1) then {player setFatigue 1;};
            };
        };
    };
};

// Monitor do alcoolismo
[] spawn {
    for "_i" from 0 to 1 step 0 do {
        waitUntil {(cxp_drink > 0)};
        while{(cxp_drink > 0)} do {

            if(cxp_drink > 0.8) then {
              "radialBlur" ppEffectEnable true;
              "radialBlur" ppEffectAdjust[0.08, 0,0.35,0.37];
              "radialBlur" ppEffectCommit 3;
              uiSleep 240;
              cxp_drink = cxp_drink - 0.3;
            } else {
              "radialBlur" ppEffectEnable true;
              "radialBlur" ppEffectAdjust[0.05, 0,0.36,0.38];
              "radialBlur" ppEffectCommit 1;
              uiSleep 180;
              cxp_drink = cxp_drink - 0.2;
            };
        };
        "radialBlur" ppEffectAdjust  [0,0,0,0];
        "radialBlur" ppEffectCommit 5;
        "radialBlur" ppEffectEnable false;
        cxp_drink = 0;
		[false,false] call cxp_fnc_hudUpdate;
    };
};

// Monitor do estupro
[] spawn {
	for "_i" from 0 to 1 step 0 do {
		waitUntil {(player getVariable "plPerdeuCabaco")};
		// limitando a perda de dano para que o thirst e hunger nao buguem
		if (cxp_thirst < 20 || cxp_hunger < 20) exitWith {hint"Você foi poupado por uma força do além e logo não sofrerá danos colaterais em seu organismo após ter sido estuprado !";player setVariable ["plPerdeuCabaco",false];};
		cxp_thirst = cxp_thirst - 10;
		cxp_hunger = cxp_hunger - 20;
		player setDamage 0.5;
		[false,false] call cxp_fnc_hudUpdate;
		waitUntil {!(player getVariable "plPerdeuCabaco")};
	};
};

// Jogar jogador sem cinto pra fora do veiculo
[] spawn {
    for "_i" from 0 to 1 step 0 do {
        waitUntil {vehicle player != player};
        if (vehicle player isKindOf "Car") then {
            if (cxp_seatbelt) exitWith {};
            if (speed vehicle player > 100) then {
                oldVehVelocity = velocity (vehicle player);
                sleep 0.5;
                if(speed vehicle player < 2) then {
                    moveOut player;
                    player setVelocity [(oldVehVelocity select 0) * 2,(oldVehVelocity select 1) * 2,((oldVehVelocity select 2) * 2) + 5];
                };
            };
        };
    };
};

// Consumo de gasolina
[] spawn {
    for "_i" from 0 to 1 step 0 do {
        waitUntil {vehicle player != player};
        private _vehicleToFuel = (vehicle player);
        if (isEngineOn _vehicleToFuel && ((driver _vehicleToFuel) isEqualTo player) && !(_vehicleToFuel isKindOf "Air") && (_vehicleToFuel != player) ) then {
            private _velocityOfVehicle = sqrt(((velocity _vehicleToFuel select 0)^2)+((velocity _vehicleToFuel select 1)^2))*3.6;
            private _fuelConsumption = _velocityOfVehicle/100000 + 0.0001;
            if(_fuelConsumption > 0.002) then {
                _fuelConsumption = 0.002;
            };
            _vehicleToFuel setFuel ((fuel _vehicleToFuel)-_fuelConsumption);

            if (fuel _vehicleToFuel < 0.2 && fuel _vehicleToFuel > 0.18) then {
                hint "Seu tanque de gasolina está se esvaziando. Corra até o posto de gasolina mais próximo !";
            } else {
                if(fuel _vehicleToFuel < 0.03) then {
                    hint "Espero que você esteja perto de um posto e tenha fôlego, porque seu combustível acaba de se esgotar !";
                };
            };
        };
        sleep 2;
    };
};

//Setup the time-based variables.
private _foodTime = time;
private _waterTime = time;
private _walkDis = 0;
private _bp = "";
private _lastPos = ((visiblePosition player) select 0) + ((visiblePosition player) select 1);
private _lastState = vehicle player;

for "_i" from 0 to 1 step 0 do {
    /* Thirst / Hunger adjustment that is time based */
    if ((time - _waterTime) > 600) then {[] call _fnc_water; _waterTime = time;};
    if ((time - _foodTime) > 850) then {[] call _fnc_food; _foodTime = time;};

    /* Adjustment of carrying capacity based on backpack changes */
    if (backpack player isEqualTo "") then {
        cxp_maxWeight = CXP_SETTINGS(getNumber,"total_maxWeight");
        _bp = backpack player;
    } else {
        if (!(backpack player isEqualTo "") && {!(backpack player isEqualTo _bp)}) then {
            _bp = backpack player;
            cxp_maxWeight = CXP_SETTINGS(getNumber,"total_maxWeight") + round(FETCH_CONFIG2(getNumber,"CfgVehicles",_bp,"maximumload") / 4);
        };
    };

    /* Check if the player's state changed? */
    if (!(vehicle player isEqualTo _lastState) || {!alive player}) then {
        [] call cxp_fnc_updateViewDistance;
        _lastState = vehicle player;
    };

    /* Check if the weight has changed and the player is carrying to much */
    if (cxp_carryWeight > cxp_maxWeight && {!isForcedWalk player}) then {
        player forceWalk true;
        if (CXP_SETTINGS(getNumber,"enable_fatigue") isEqualTo 1) then {player setFatigue 1;};
        hint localize "STR_NOTF_MaxWeight";
    } else {
        if (isForcedWalk player) then {
            player forceWalk false;
        };
    };

    /* Travelling distance to decrease thirst/hunger which is captured every second so the distance is actually greater then 650 */
    if !(alive player) then {
        _walkDis = 0;
    } else {
        _curPos = visiblePosition player;
        _curPos = (_curPos select 0) + (_curPos select 1);
        if (!(_curPos isEqualTo _lastPos) && {(isNull objectParent player)}) then {
            _walkDis = _walkDis + 1;
            if (_walkDis isEqualTo 650) then {
                _walkDis = 0;
                cxp_thirst = cxp_thirst - 5;
                cxp_hunger = cxp_hunger - 5;
                [false,false] call cxp_fnc_hudUpdate;
            };
        };
        _lastPos = visiblePosition player;
        _lastPos = (_lastPos select 0) + (_lastPos select 1);
    };
    uiSleep 1;
};