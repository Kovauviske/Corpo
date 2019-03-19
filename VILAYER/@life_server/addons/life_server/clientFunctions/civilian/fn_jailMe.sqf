#include "\life_server\script_macros.hpp"
/*
	Author Bryan "Tonic" Boardwine
	Description:
	Once word is received by the server the rest of the jail execution is completed.
*/
params [
	["_ret",[],[[]]],
	["_bad",false,[false]],
	["_time",15,[0]]
];

_time = time + (_time * 60);
if (count _ret > 0) then {
	cxp_bail_amount = (_ret select 2);
} else {
	cxp_bail_amount = 1500;
};

private _esc = false;
private _bail = false;
if(_time <= 0) then {
	_time = time + (15 * 60);
	hintC "Por favor, reporte o seguinte erro para algum administrador: 'JAIL_FALLBACK_15, time is zero!'";
};

[_bad,_time] spawn {
	cxp_canpay_bail = false;
	cxp_bail_amount = cxp_bail_amount * 5;
	if(_this select 0) then {
		sleep ( (_this select 1) * 0.5 );
	} else {
		sleep ( (_this select 1) * 0.2 );
	};
	cxp_canpay_bail = nil;
};

player setVariable ["prisoner", true, true]; // BountyHunter Depend.

for "_i" from 0 to 1 step 0 do {
	if((round(_time - time)) > 0) then {
		private _countDown = if(round (_time - time) > 60) then {format["%1 Minutos",round(round(_time - time) / 60)]} else {format["%1 Segundos",round(_time - time)]};
		if (isNil "cxp_canpay_bail") then {
			hintSilent format["Tempo Restante:\n %1\n\nPode Pagar a Fiança ? : %3\nPreço da Fiança: $%2",_countDown,[cxp_bail_amount] call cxp_fnc_numberText, "Nao"];
		} else {
			hintSilent format["Tempo Restante:\n %1\n",_countDown];
		};
	};

	if (CXP_SETTINGS(getNumber,"jail_forceWalk") isEqualTo 1) then {
        player forceWalk true;
    };

	if(player distance (getMarkerPos "jail_marker") > 75) exitWith {
		_esc = true;
	};
	if(cxp_bail_paid) exitWith {
		_bail = true;
	};
	if (round(_time - time) < 1) exitWith {hint ""};
	if (!alive player && round(_time - time) > 0) exitWith {};
	sleep 1;
};

switch (true) do {
	case (_bail): {
		cxp_is_arrested = false;
		cxp_bail_paid = false;
		hint localize "STR_Jail_Paid";
		serv_wanted_remove = [player];
		player setPos (getMarkerPos "jail_release");
		[getPlayerUID player] remoteExecCall ["cxp_fnc_wantedRemove",RSERV];
		player setVariable ["procurado",false,true];
		[5] call CXPSKT_fnc_updatePartial;
	};
	case (_esc): {
		cxp_is_arrested = false;
		hint localize "STR_Jail_EscapeSelf";
		[0,"STR_Jail_EscapeNOTF",true,[profileName]] remoteExecCall ["cxp_fnc_broadcast",RCLIENT];
		[getPlayerUID player,profileName,"901"] remoteExecCall ["cxp_fnc_wantedAdd",RSERV];
		[5] call CXPSKT_fnc_updatePartial;
	};
	case (alive player && !_esc && !_bail): {
		cxp_is_arrested = false;
		hint localize "STR_Jail_Released";
		[getPlayerUID player] remoteExecCall ["cxp_fnc_wantedRemove",RSERV];
		player setVariable ["procurado",false,true];
		player setPos (getMarkerPos "jail_release");
		[5] call CXPSKT_fnc_updatePartial;
	};
};

player setVariable ["prisoner", nil, true]; // BountyHunter Depend.
player forceWalk false; // habilita correr e pular novamente
