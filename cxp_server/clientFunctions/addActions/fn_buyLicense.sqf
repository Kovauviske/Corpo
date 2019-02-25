#include "\cxp_server\script_macros.hpp"
/*
    File: fn_buyLicense.sqf
    Author: Bryan "Tonic" Boardwine

    Modified : Casperento

    Description:
    Called when purchasing a license. May need to be revised.
*/
params ["", "", "", "_type"];

if (!isClass (missionConfigFile >> "Licenses" >> _type)) exitWith {}; //Bad entry?
private _displayName = M_CONFIG(getText,"Licenses",_type,"displayName");
private _price = M_CONFIG(getNumber,"Licenses",_type,"price");
private _sideFlag = M_CONFIG(getText,"Licenses",_type,"side");
private _varName = LICENSE_VARNAME(_type,_sideFlag);

if (CASH < _price) exitWith {hint format [localize "STR_NOTF_NE_1",[_price] call cxp_fnc_numberText,localize _displayName];};
CASH = CASH - _price;
[true] call cxp_fnc_hudUpdate;

// Revoga licenca de rebelde
if (_varName isEqualTo "license_civ_bHunterLic") then {
	if (license_civ_rebellic) then {
		missionNamespace setVariable [LICENSE_VARNAME("rebellic","civ"),false];
		[2] call CXPSKT_fnc_updatePartial;
	};
	// remove novo bounty da lista de procurados
	if (player getVariable ["procurado",false]) then {
		[(CXP_SETTINGS(getNumber,"bCFG_perdao_entrada"))] spawn cxp_fnc_calcMoneyRemote;
		if (cxp_CXPHC_isActive) then {
			[(getPlayerUID player)] remoteExecCall ["CXPHC_fnc_wantedRemove",CXP_HC];
		} else {
			[(getPlayerUID player)] remoteExecCall ["cxp_fnc_wantedRemove",RSERV];
		};
		hint format ["Parabéns, você perdeu sua licença rebelde e virou um ajudante da polícia.\nVocê também pagou uma taxa de R$%1 para sair da lista de procurados!",(CXP_SETTINGS(getNumber,"bCFG_perdao_entrada"))];
	} else {
		hint "Parabéns, você perdeu sua licença rebelde e virou um ajudante da polícia!";
	};
	player setVariable ["clienteBounty",true,true];
    "Você é um Bounty Hunter" hintC parseText format["Agora você é um Bounty Hunter, caro %1!<br/><br/>Como um <t color='#FF0000'>Bounty hunter</t>, você deve respeitar a certas regras ou arriscar perder sua licença, ou possivelmente até ser banido do servidor.<br/><br/><t color='#FF0000'>É muito importante que</t> você entenda que ainda é civil, e deve seguir as regras assim como qualquer outro.<br/><br/>Como Bounty Hunter, <t color='#00FF00'>seu dever é ajudar a polícia a prender vagabundo</t> e limpar as ruas de Altis	.<br/><br/>", name player];
};
// Revoga licenca de BountyHunter
if (_varName isEqualTo "license_civ_rebellic") then {
	if (license_civ_bHunterLic) then {
		missionNamespace setVariable [LICENSE_VARNAME("bHunterLic","civ"),false];
		player setVariable ["clienteBounty",false,true];
		[2] call CXPSKT_fnc_updatePartial;
		hint "Parabéns, você perdeu sua licença de Bounty Hunter e virou só mais um rebelde.";
	};
};

[0] call CXPSKT_fnc_updatePartial;

titleText[format [localize "STR_NOTF_B_1", localize _displayName,[_price] call cxp_fnc_numberText],"PLAIN"];
missionNamespace setVariable [_varName,true];

[2] call CXPSKT_fnc_updatePartial;
playSound "purchaseS";
