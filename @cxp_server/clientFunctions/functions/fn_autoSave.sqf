#include "\cxp_server\script_macros.hpp"
/*
    File: fn_autoSaveInv.sqf
    Author: Leon "DerL30N" Beeser"

    Description:
    Used for player automatic sync to the server.
*/
if (!isServer) then {
	for "_i" from 0 to 1 step 0 do {
		if (CXP_SETTINGS(getNumber,"lockManuelSync") isEqualTo 1) then {
			sleep ((CXP_SETTINGS(getNumber,"autosaveInterval") - CXP_SETTINGS(getNumber,"lockManuelSync")) * 60);
		} else {
			sleep ((CXP_SETTINGS(getNumber,"autosaveInterval")) * 60);
		};
		if (CXP_SETTINGS(getNumber,"waitforManSave") isEqualTo 1) then {
			if (isNil "cxp_session_time") then { cxp_session_time = false; };
				waitUntil { (!cxp_session_time)
			};
		};

		if (alive player) then {
			[] call CXPSKT_fnc_updateRequest;
			if (CXP_SETTINGS(getNumber,"chatInfo") isEqualTo 1) then {
				if (CXP_SETTINGS(getNumber,"advancedChatInfo") isEqualTo 1) then {
					if (CXP_SETTINGS(getNumber,"lockManuelSync") isEqualTo 1) then {
						systemChat format["Seus dados serao salvos automaticamente ! Sync manual desativado por %1 minuto(s) !", (CXP_SETTINGS(getNumber,"lockManuelSync"))];
					};
				} else {
					systemChat "Seus dados serao salvos automaticamente de 10 em 10 minutos";
				};
			};
			if (CXP_SETTINGS(getNumber,"lockManuelSync") isEqualTo 1) then {
				cxp_session_time = true;
				sleep ((CXP_SETTINGS(getNumber,"lockSyncTime")) * 60);
				cxp_session_time = false;
			};
		};
	};
};
