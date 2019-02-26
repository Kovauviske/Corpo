#include "\cxp_server\script_macros.hpp"
/*
  File : fn_curarRabo.sqf
  Author : Casperento
  Description:
  Cura o CU do arrombado ai
*/
private _arrombado = param [0,ObjNull,[ObjNull]];

if (isNull _arrombado) exitWith {hint"Alvo inválido!"};

cxp_action_inUse = true;

[1,format["Fique parado, pois o Dr.%1 está corrigindo seu orifício anal gratuitamente !", name player]] remoteExecCall ["cxp_fnc_broadcast",_arrombado];

player playMove "AinvPknlMstpSnonWnonDnon_medic";

cxp_action_inUse = false;

sleep 5;

["Seu CU foi remodelado com sucesso !"] remoteExec ["cxp_fnc_terminarCurarAnal", _arrombado];
