#include "\cxp_server\script_macros.hpp"
/*
	File: fn_hudUpdateInfo.sqf
	Author: Casperento
	Description:
	Atualiza a mini-barra de informacoes, separadamente
*/
disableSerialization;

if (isNull CXP_Display) exitWith {[] call cxp_fnc_hudSetup;};

// Carteira e Banco
CXP_Ctrl(6963) ctrlSetStructuredText parseText format["<t size='1.2' color='#000000'>| - </t><img shadown='false' size='1.2' image='icons\ico_money.paa'/><t size='1.2' color='#63ff00'> R$%1 </t><t size='1.2' color='#000000'>- </t><img shadown='false' size='1.2' image='icons\ico_bank.paa'/><t size='1.2' color='#00ecff'> R$%2</t><t size='1.2' color='#000000'> - |</t>",([CASH] call cxp_fnc_numberText),([BANK] call cxp_fnc_numberText)];

// Players Info
if !(cxp_hudInfo_init) then {
	cxp_hudInfo_init = true;
	[] spawn {
		for "_i" from 0 to 1 step 0 do {
			_cwest = (playersNumber west);
			_cind = (playersNumber independent);
			_cciv = (playersNumber civilian);
			CXP_Ctrl(6965) ctrlSetStructuredText parseText format["<t size='1.2' color='#000000'>| - </t><img shadown='false' size='1.2' image='textures\interface\ico_copOn.paa'/><t size='1.2'> %1 </t><img shadown='false' size='1.2' image='textures\interface\ico_medOn.paa'/><t size='1.2'> %2 </t><img shadown='false' size='1.2' image='textures\interface\ico_civOn.paa'/><t size='1.2'> %3</t><t size='1.2' color='#000000'> - |</t>",_cwest,_cind,_cciv];
			waitUntil {(playersNumber west) != _cwest || (playersNumber independent) != _cind || (playersNumber civilian) != _cciv};
		};
	};
};
