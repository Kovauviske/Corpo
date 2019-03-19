#include "\life_server\script_macros.hpp"
/*
 Player clicked arrest/ok
 Modified : Casperento
*/
if (isNil "cxp_pInact_curTarget") exitWith {};

if (cxp_pInact_curTarget getVariable ["arrester",objNull] isEqualTo player && cxp_pInact_curTarget getVariable ["arrester",objNull] != cxp_pInact_curTarget && !(isNull (cxp_pInact_curTarget getVariable ["arrester",objNull]))) exitWith {
    private _cpName = name (cxp_pInact_curTarget getVariable "arrester");
    if (_cpName != profileName && _cpName != name cxp_pInact_curTarget) then {
        hint format["Pare de tentar reenviar este jogador para a cadeia.\n O jogador %1 já tentou antes de você!",_cpName];
    } else {
        hint "Este jogador ja esta preso, pare de encher o saco!";
    };
};

//Get minutes
private _time = ctrlText 1400;
if !([_time] call CXPSV_fnc_isnumber) exitWith {hint localize "STR_ATM_notnumeric";};
_time = parseNumber _time; //requested number
_time = round _time;
if (_time < 5 || _time > 120) exitWith { hint "Voce so pode determinar um tempo dentro do seguinte periodo : 5-60 minutos!"; };
closeDialog 0;
[cxp_pInact_curTarget, _time] call cxp_fnc_arrestAction;
