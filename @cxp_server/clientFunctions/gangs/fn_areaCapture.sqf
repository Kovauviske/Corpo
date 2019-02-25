#include "\cxp_server\script_macros.hpp"
/*
    File: fn_areaCapture.sqf
    Author: Fuel RebornRoleplay.com

	Modified : Casperento

    Description:
    checks the area for gangs or police before allowing you to capture an area
*/
private ["_cartelType","_gangNum","_gName","_group","_area","_nil","_pos","_xname","_action","_cpRate","_cP","_nearUnits","_areaContested","_progressBar","_title","_titleText","_ui"];

_area = getpos player nearestObject "Flag_Red_F"; // teste com localizaçao de bandeira mais especifico !!!!
_group = _area getVariable ["gangOwner",grpNull]; //gets the owner of the flag
_xname = ""; //setup for popo name
_nearUnits = _area nearEntities ["Man",500]; //searches area for players
 _areaContested = false; //sets the area to not contested
if ((player distance _area) > 50) exitWith { hint "Voce precisa estar em menos de 50m da bandeira para poder domina-lo !"; }; //too far away

/*
#########################################
#       The Police Capture System       #
#########################################
*/

if (playerside isEqualTo west) exitWith {

// anuncio de inicio
_cartelType = _area getVariable ["gangNum", ""];

if (_cartelType isEqualTo "Gang_Area_1") then {
	[2,"STR_GNOTF_CaptureAreaAttemptCop",true,[name player,(group player) getVariable "gang_name"]] remoteExecCall ["cxp_fnc_broadcast",RCLIENT];
};

//set the cp rate
if (!isNull _group) then {
    _cpRate = 0.0045;
} else {
    _cpRate = 0.0075;
};

//Police officer checks
{

    //check for other members of same side
    if ((isPlayer _x) && (_x != player) && (side _x isEqualTo west)) then {
        _areaContested = false;
    };

    //checks for rebels
    if ((isPlayer _x) && (_x != player) && (side _x isEqualTo civilian)) then {
        _areaContested = true;
        _xname = "Rebels";
    };

    //closes the capture
    if (_areaContested && _xname isEqualTo "Rebels") then {
        hint "Existem rebeldes por perto !\nAcabe com eles primeiro!";
    };

} forEach _nearUnits;

//exit if contested
if (_areaContested) exitWith {};

//Setup our progress bar.
disableSerialization;
_title = localize "STR_GNOTF_CapturingArea";
"progressBar" cutRsc ["cxp_progress","PLAIN"];
_ui = uiNamespace getVariable "cxp_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

if (!(_areaContested)) then {
    for "_i" from 0 to 1 step 0 do {
        sleep 3; //police capture time * 100
        _cP = _cP + _cpRate;
        _progressBar progressSetPosition _cP;
        _titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];

        //sets the area to incapture
        _area setVariable ["inCapture",true,true];

        //interuption checks
        if (_cP >= 1 || !alive player) exitWith {_area setVariable ["inCapture",false,true];};
        if (player distance _area > 50) exitWith {_area setVariable ["inCapture",false,true];}; //how far they can go from the hideout while capturing
        if (_areaContested) exitWith {hint "Tente novamente apos eliminar os inimigos presentes nesta area !";}; //Future testing
        if (cxp_istazed) exitWith {_area setVariable ["inCapture",false,true];}; //Tazed
        if (cxp_isknocked) exitWith {_area setVariable ["inCapture",false,true];}; //Knocked
        if (cxp_isBorrachado) exitWith {_area setVariable ["inCapture",false,true];}; //Borrachado
        if (player getVariable ["downed",false]) exitWith {_area setVariable ["inCapture",false,true];};
        if (cxp_interrupted) exitWith {_area setVariable ["inCapture",false,true];}; //interrupted
    };
    if (player distance _area > 50) exitWith {_area setVariable ["inCapture",false,true];}; //how far they can go from the hideout while capturing
};

//Kill the UI display and check for various states
"progressBar" cutText ["","PLAIN"];
if (player distance _area > 50) exitWith {_area setVariable ["inCapture",false,true];}; //how far they can go from the hideout while capturing
if (!alive player || cxp_istazed || cxp_isBorrachado || cxp_isknocked) exitWith {cxp_action_inUse = false;_area setVariable ["inCapture",false,true];}; //knocked out or tazed revert state
if ((player getVariable ["restrained",false]) || (player getVariable ["tied",false])) exitWith {titleText[localize "STR_NOTF_ActionCancel","PLAIN"];cxp_action_inUse = false;_area setVariable ["inCapture",false,true];}; //restrained revert state
if (player getVariable ["downed",false]) exitWith {titleText[localize "STR_NOTF_ActionCancel","PLAIN"];cxp_action_inUse = false;_area setVariable ["inCapture",false,true];};
if (cxp_interrupted) exitWith {cxp_interrupted = false; titleText[localize "STR_GNOTF_CaptureCancel","PLAIN"]; cxp_action_inUse = false;_area setVariable ["inCapture",false,true];}; //interupted revert state
cxp_action_inUse = false;
titleText[localize "STR_GNOTF_CapturedArea","PLAIN"];

//marker system
_gangNum = _area getVariable ["gangNum", ""];

_gName = group player getVariable "gang_name";
_pText = format["Cartel de Drogas Neutralizado pela policia !"];

if (_gangNum isEqualTo "Gang_Area_1") then {
    "gang_cap_1" setMarkerText _pText;
	"gang_cap_1" setMarkerColor "ColorBlue";
};

[[0,1],"STR_GNOTF_CaptureAreaSuccessCop",true] remoteExecCall ["cxp_fnc_broadcast",RCLIENT];

_area setVariable ["inCapture",false,true];
_area setVariable ["gangOwner",group player,true];
private _areaD = _area getVariable ["gangOwner",grpNull];
if (CXP_SETTINGS(getNumber,"log_dono_cartel") isEqualTo 1) then {
	diag_log format ["(REB) : Dono chegou no areaCapture, Dono: %1",_areaD];
};
};

/*
#############################################
#       End Of Police Capture System        #
#############################################
*/

/*
#########################################
#       The Rebel Capture System        #
#########################################
*/

_area = getpos player nearestObject "Flag_Red_F"; // teste com localizaçao de bandeira mais especifico !!!!
_group = _area getVariable ["gangOwner",grpNull]; //gets the ownerr of the flag
_xname = ""; //setup for popo name
_nearUnits = _area nearEntities ["Man",500]; //searches area for players
if (isNil {group player getVariable "gang_name"}) exitWith { hint "Voce precisa estar em alguma gangue para dominar esta area !"; }; //not in a gang
if (_group isEqualTo group player) exitWith { hint "Sua gangue ja domina esta area !"; }; //already own it
if ((_area getVariable ["inCapture",FALSE])) exitWith {hint "Apenas uma pessoa deve capturar de cada vez !"; }; //stops 2 people capturing at the same time

// anuncio de inicio
_cartelType = _area getVariable ["gangNum", ""];

if (_cartelType isEqualTo "Gang_Area_1") then {
	[2,"STR_GNOTF_CaptureAreaAttemptCiv",true,[name player,(group player) getVariable "gang_name"]] remoteExecCall ["cxp_fnc_broadcast",RCLIENT];
};

if (!isNull _group) then {

	_gangName = _group getVariable ["gang_name",""]; //gets the gang name

    //check if they want to capture someones elses area
    _action = [
        format[localize "STR_GNOTF_AlreadygangControlled",_gangName],
        localize "STR_Gang_captuerr",
        localize "STR_Global_Yes",
        localize "STR_Global_No"
    ] call BIS_fnc_guiMessage;

    _cpRate = 0.0045;
} else {
    _cpRate = 0.0075;
};

//check if area is contested
{

    //check for other members of same gang
    if ((isPlayer _x) && (_x != player) && (side _x isEqualTo civilian) && (group _x isEqualTo group player)) then {
        _areaContested = false;
    };

    //check for other rebels
    if ((isPlayer _x) && (_x != player) && (side _x isEqualTo civilian) && (!(group _x isEqualTo group player))) then {
        _areaContested = true;
    };

    //checks for cops
    if ((isPlayer _x) && (_x != player) && (side _x isEqualTo west)) then {
        _areaContested = true;
        _xname = "COP";
    };

    //closes the capture
    if (_areaContested) exitWith {
        if (_xname isEqualTo "COP") then {
            hint "A policia esta por perto!\nAcabe com eles primeiro!";
        } else {
            hint "Outros rebeldes estao por perto!\nAcabe com eles primeiro!";
        };
    };

} forEach _nearUnits;

//exit if contested
if (_areaContested) exitWith {};

//Setup our progress bar.
disableSerialization;
_title = localize "STR_GNOTF_CapturingArea";
"progressBar" cutRsc ["cxp_progress","PLAIN"];
_ui = uiNamespace getVariable "cxp_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

if (!(_areaContested)) then {
    for "_i" from 0 to 1 step 0 do {
        sleep  3; //rebel capture time * 100
        _cP = _cP + _cpRate;
        _progressBar progressSetPosition _cP;
        _titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];

        //sets the area to incapture
        _area setVariable ["inCapture",true,true];

        //interuption checks
        if (_cP >= 1 || !alive player) exitWith {_area setVariable ["inCapture",false,true];};
        if (player distance _area > 50) exitWith {_area setVariable ["inCapture",false,true];}; //how far they can go from the hideout while capturing
        if (_areaContested) exitWith {hint "Tente novamente apos eliminar os inimigos presentes nesta area !";};
        if (cxp_istazed) exitWith {_area setVariable ["inCapture",false,true];}; //Tazed
        if (cxp_isknocked) exitWith {_area setVariable ["inCapture",false,true];}; //Knocked
        if (cxp_isBorrachado) exitWith {_area setVariable ["inCapture",false,true];}; //Borrachado
        if (player getVariable ["downed",false]) exitWith {_area setVariable ["inCapture",false,true];};
        if (cxp_interrupted) exitWith {_area setVariable ["inCapture",false,true];}; //interupted
    };
    if (player distance _area > 50) exitWith {_area setVariable ["inCapture",false,true];}; //how far they can go from the hideout while capturing
};

//Kill the UI display and check for various states
"progressBar" cutText ["","PLAIN"];
if (player distance _area > 50) exitWith {_area setVariable ["inCapture",false,true];}; //how far they can go from the hideout while capturing
if (!alive player || cxp_istazed || cxp_isBorrachado || cxp_isknocked) exitWith {titleText[localize "STR_NOTF_ActionCancel","PLAIN"];cxp_action_inUse = false;_area setVariable ["inCapture",false,true];}; //knocked out or tazed revert state
if ((player getVariable ["restrained",false]) || (player getVariable ["tied",false])) exitWith {titleText[localize "STR_NOTF_ActionCancel","PLAIN"];cxp_action_inUse = false;_area setVariable ["inCapture",false,true];}; //restrained revert state
if (player getVariable ["downed",false]) exitWith {titleText[localize "STR_NOTF_ActionCancel","PLAIN"];cxp_action_inUse = false;_area setVariable ["inCapture",false,true];};
if (cxp_interrupted) exitWith {cxp_interrupted = false; titleText[localize "STR_GNOTF_CaptureCancel","PLAIN"]; cxp_action_inUse = false;_area setVariable ["inCapture",false,true];}; //interupted revert state
cxp_action_inUse = false;
if (player distance _area > 50) exitWith {_area setVariable ["inCapture",false,true];};
titleText[localize "STR_GNOTF_CapturedArea","PLAIN"];

//marker system
_gangNum = _area getVariable ["gangNum", ""];

_gName = group player getVariable "gang_name";
private _text1 = format["Cartel de Drogas dominado pela gangue %1",_gName];

if (_gangNum isEqualTo "Gang_Area_1") then {
    "gang_cap_1" setMarkerText _text1;
	"gang_cap_1" setMarkerColor "ColorRed";
};

[[0,1],"STR_GNOTF_CaptureAreaSuccessCiv",true,[name player,(group player) getVariable "gang_name"]] remoteExecCall ["cxp_fnc_broadcast",RCLIENT];

_area setVariable ["inCapture",false,true];
_area setVariable ["gangOwner",group player,true];
private _areaD = _area getVariable ["gangOwner",grpNull];
if (CXP_SETTINGS(getNumber,"log_dono_cartel") isEqualTo 1) then {
	diag_log format ["(REB) : Dono chegou no areaCapture, Dono: %1",_areaD];
};

/*
#############################################
#       End Of The Rebel Capture System     #
#############################################
*/
