0 setRain 0;
0 setFog 0;
forceWeatherChange;
999999 setRain 0;
999999 setFog 0;
if !(isDedicated) then {skipTime 1;skipTime -1;};
waitUntil {!(isNil "cxp_clientFunctReady")};
waitUntil {cxp_clientFunctReady};
StartProgress = false;
enableEnvironment [true,false];
if (hasInterface) then {execVM "briefing.sqf";};
execVM "R3F_LOG\init.sqf";
execVM "comunidade\teargas.sqf";
StartProgress = true;