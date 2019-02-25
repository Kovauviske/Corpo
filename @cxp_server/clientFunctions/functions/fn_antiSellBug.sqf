/*
  File : fn_antiSellBug.sqf
  Author : Casperento
*/
private _status = param [0,"",[""]];
private _verification = param [1,false,[false]];

switch (_status) do {
  case "suspeito" : {
    varAntidupe = _verification;
    contadorAntiCheat = contadorAntiCheat + 1;
    if (contadorAntiCheat > 3) then {
      ["detectado",false] spawn cxp_fnc_antiSellBug;
    };
  };
  case "detectado" : {
    [1,format["O jogador %1 foi detectado pelo AntiCheat (By Casperento) usando AutoClick !", name player]] remoteExecCall ["cxp_fnc_broadcast", civilian];
    contadorAntiCheat = 0;
    varAntidupe = _verification;
    disableUserInput true;
    ["AutoClickDetected",false,true,true] call BIS_fnc_endMission;
  };
  case "checagem" : {
    varAntidupe = _verification;
    sleep 3;
    varAntidupe = false;
  };
};
