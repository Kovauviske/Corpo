#include "\life_server\script_macros.hpp"
/*
	File: fn_welcomeCredits.sqf
	Author: Casperento
	Description:
	Mostra os creditos assim que o jogador entra no servidor

	*OBS: essa funcao deve sempre ser chamada com spawn, como:
		[] spawn cxp_fnc_welcomeCredits;
*/
private _msg = [];
{_msg pushBack format["<t color='%3' font='EtelkaMonospaceProBold' size='1.6'>%1</t><br /><t font='EtelkaMonospacePro' size='1.1' color='%4'>%2</t>",_x select 0,_x select 1,_x select 2,_x select 3];} forEach (CXP_SETTINGS(getArray,"cxp_wlc_tits"));

for "_i" from 0 to count(_msg)-1 do {
	[parseText (_msg select _i), [safeZoneX+0.12,0,1,1],nil,(CXP_SETTINGS(getNumber,"cxp_wlc_dur")),(CXP_SETTINGS(getNumber,"cxp_wlc_fades")),0] spawn BIS_fnc_textTiles;
    sleep ((CXP_SETTINGS(getNumber,"cxp_wlc_fades"))+(CXP_SETTINGS(getNumber,"cxp_wlc_dur")));
};