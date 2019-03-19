#include "\life_server\script_macros.hpp"
/*
    File: fn_escInterupt.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Casperento
    Description:
    Monitors when the ESC menu is pulled up and blocks off
    certain controls when conditions meet.
*/
disableSerialization;

private _escSync = {
    disableSerialization;
    private _abortButton = CONTROL(49,104);
	private _respawnButton = CONTROL(49,1010);
    private _abortTime = CXP_SETTINGS(getNumber,"escapeMenu_timer");
    private _respawnTime = CXP_SETTINGS(getNumber,"escapeMenu_respawn_timer");
    private _timeStamp = time + _abortTime;
    private _timeStampRes = time + _respawnTime;

    waitUntil {
        _abortButton ctrlSetText format [localize "STR_NOTF_AbortESC",[(_timeStamp - time),"SS.MS"] call BIS_fnc_secondsToString];
        _abortButton ctrlCommit 0;
		round(_timeStamp - time) <= 0 || isNull (findDisplay 49);
		// botao de respawn com delay tambem
        _respawnButton ctrlSetText format [localize "STR_NOTF_RespawnESC",[(_timeStampRes - time),"SS.MS"] call BIS_fnc_secondsToString];
        _respawnButton ctrlCommit 0;
		if (dialog && {isNull (findDisplay 7300)}) then {closeDialog 0};
		round(_timeStampRes - time) <= 0 || isNull (findDisplay 49)
    };

    _abortButton ctrlSetText localize "STR_DISP_INT_ABORT";
    _abortButton ctrlCommit 0;
    _abortButton ctrlEnable true;
    _respawnButton ctrlSetText localize "STR_NOTF_RespESC";
    _respawnButton ctrlCommit 0;
    _respawnButton ctrlEnable true;
};

private _canUseControls = {
    (playerSide isEqualTo west) || {!((player getVariable ["restrained",false]) || {player getVariable ["Escorting",false]} || {player getVariable ["transporting",false]} || {cxp_is_arrested} || {cxp_istazed} || {cxp_isBorrachado} || {cxp_isknocked})}
};

for "_i" from 0 to 1 step 0 do {
    waitUntil {!isNull (findDisplay 49)};
    private _abortButton = CONTROL(49,104);
	_abortButton ctrlSetEventHandler ["ButtonClick","[] call CXPSKT_fnc_updateRequest; (findDisplay 49) closeDisplay 2; 'cxp_playerHUD' cutText ['','PLAIN',0.5]; [] spawn cxp_fnc_logeOut; true"];
    private _respawnButton = CONTROL(49,1010);
    private _saveButton = CONTROL(49,103);
    _saveButton ctrlSetText "";

    //Extras
    if (CXP_SETTINGS(getNumber,"escapeMenu_displayExtras") isEqualTo 1) then {
        private _topButton = CONTROL(49,2);
        _topButton ctrlEnable false;
        _topButton ctrlSetText format ["%1",CXP_SETTINGS(getText,"escapeMenu_displayText")];
        _saveButton ctrlEnable false;
        _saveButton ctrlSetText format ["Player UID: %1",getPlayerUID player];
    };

    //Block off our buttons first.
    _abortButton ctrlEnable false;
	_respawnButton ctrlEnable false;
	
	//FieldManual
    (CONTROL(49,122)) ctrlEnable false; //Never re-enable, blocks an old script executor.
    (CONTROL(49,122)) ctrlShow false;

    if (call _canUseControls) then {[] spawn _escSync;};

    waitUntil {isNull (findDisplay 49) || {!alive player}};
    if (!isNull (findDisplay 49) && {!alive player}) then {
        (findDisplay 49) closeDisplay 2;
    };
};
