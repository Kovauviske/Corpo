#include "\life_server\script_macros.hpp"
/*
    File: fn_restrainAction.sqf
    Author: Bryan "Tonic" Boardwine

	Modified : Casperento

    Description:
    Retrains the target.
*/
private _target = param [0,ObjNull,[ObjNull]];

private "_unit";
if !(isNull _target) then {
	_unit = _target;
}else{
	_unit = cursorTarget;
};

if (isNull _unit) exitWith {hint"Alvo inválido. Tente ficar mais próximo do alvo usando a câmera de primeira pessoa."}; //Not valid

// Custom RestrainAction for medics
if (playerSide isEqualTo independent && animationState _unit != "Incapacitated") exitWith {
	hint "NOCAUTEIE SEU PACIENTE PRIMEIRO (SHIFT + G), PARA DEPOIS ALGEMÁ-LO !";
};

if !(isPlayer _unit) exitWith {};
if (player distance _unit > 3) exitWith {};
if (_unit getVariable "restrained") exitWith {};
if (side _unit isEqualTo west) exitWith {};
if (player isEqualTo _unit) exitWith {};
if (_unit getVariable["downed", false]) exitWith {hint "Nocauteie seu alvo apos ele ter se recuperado do coma da bala de borracha e com uma injeção de adrenalina!"};

//Broadcast!
_unit setVariable ["playerSurrender",false,true];
_unit setVariable ["restrained",true,true];
titleText ["Algemando alvo...","PLAIN"];
[_unit,"handcuffs", 20, 1] remoteExec ["cxp_fnc_say3D",RANY];
[player] remoteExec ["cxp_fnc_restrain",_unit];
[0,"STR_NOTF_Restrained",true,[_unit getVariable["realname", name _unit], profileName]] remoteExecCall ["cxp_fnc_broadcast",west];
