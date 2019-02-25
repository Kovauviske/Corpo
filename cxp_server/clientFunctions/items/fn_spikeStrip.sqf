#include "\cxp_server\script_macros.hpp"
/*
    File: fn_spikeStrip.sqf
    Author: Bryan "Tonic" Boardwine

    Modified : Casperento

    Description:
    Creates a spike strip and preps it.
*/
if !(isNil "cxp_action_spikeStripPickup") exitWith {hint localize "STR_ISTR_SpikesDeployment"};    // avoid conflicts with addactions allowing duplication.
// vars
private _spikeStrip = "Land_Razorwire_F" createVehicle [0,0,0];
_spikeStrip attachTo[player,[0,5.5,0]];
_spikeStrip setDir 90;
_spikeStrip setVariable ["item","spikeDeployed",true];

cxp_action_spikeStripDeploy = player addAction[localize "STR_ISTR_Spike_Place",{if (!isNull cxp_spikestrip) then {detach cxp_spikeStrip; cxp_spikeStrip = objNull;}; player removeAction cxp_action_spikeStripDeploy; cxp_action_spikeStripDeploy = nil;},"",999,false,false,"",'!isNull cxp_spikestrip'];
cxp_spikestrip = _spikeStrip;
waitUntil {isNull cxp_spikeStrip};

if !(isNil "cxp_action_spikeStripDeploy") then {player removeAction cxp_action_spikeStripDeploy;};
if (isNull _spikeStrip) exitWith {cxp_spikestrip = objNull;};

_spikeStrip setPos [(getPos _spikeStrip select 0),(getPos _spikeStrip select 1),0];
_spikeStrip setDamage 1;

cxp_action_spikeStripPickup = player addAction[localize "STR_ISTR_Spike_Pack",cxp_fnc_packupSpikes,"",0,false,false,"",
' _spikes = nearestObjects[getPos player,["Land_Razorwire_F"],8] select 0; !isNil "_spikes" && !isNil {(_spikes getVariable "item")}'];

if (cxp_CXPHC_isActive) then {
    [_spikeStrip] remoteExec ["CXPHC_fnc_spikeStrip",CXP_HC]; //Send it to the HeadlessClient for monitoring.
} else {
    [_spikeStrip] remoteExec ["CXPSV_fnc_spikeStrip",RSERV]; //Send it to the server for monitoring.
};
