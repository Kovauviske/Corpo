#include "script_macros.hpp"
/*
    File: functions.sqf
    Author: Bryan "Tonic" Boardwine
	Modified: Casperento
    Description: They are functions.
*/

publicVariable "CXPSV_fnc_terrainSort";

CXPSV_fnc_index = compileFinal "
    params [
        [""_item"","""",[""""]],
        [""_stack"",[],[[]]]
    ];
    
    _stack findIf {_item in _x};
";
publicVariable "CXPSV_fnc_index";

CXPSV_fnc_isnumber = compileFinal "
    params [
        ['_string','',['']]
    ];
    if (_string isEqualTo '') exitWith {false};
    private _array = _string splitString '';
    private _return = true;
    {
        if !(_x in ['0','1','2','3','4','5','6','7','8','9']) exitWith {
            _return = false;
        };
    } forEach _array;
    _return;
";
publicVariable "CXPSV_fnc_isnumber";

CXPSV_fnc_clientGangKick = compileFinal "
    private [""_unit"",""_group""];
    _unit = _this select 0;
    _group = _this select 1;
    if (isNil ""_unit"" || isNil ""_group"") exitWith {};
    if (player isEqualTo _unit && (group player) == _group) then {
        cxp_my_gang = objNull;
        [player] joinSilent (createGroup civilian);
        hint localize ""STR_GNOTF_KickOutGang"";
    };
";
publicVariable "CXPSV_fnc_clientGangKick";

CXPSV_fnc_clientGetKey = compileFinal "
    private [""_vehicle"",""_unit"",""_giver""];
    _vehicle = _this select 0;
    _unit = _this select 1;
    _giver = _this select 2;
    if (isNil ""_unit"" || isNil ""_giver"") exitWith {};
    if (player isEqualTo _unit && !(_vehicle in cxp_vehicles)) then {
        _name = getText(configFile >> ""CfgVehicles"" >> (typeOf _vehicle) >> ""displayName"");
        hint format [localize ""STR_NOTF_gaveKeysFrom"",_giver,_name];
        cxp_vehicles pushBack _vehicle;
        [getPlayerUID player,playerSide,_vehicle,1] remoteExecCall [""CXPSV_fnc_keyManagement"",2];
    };
";
publicVariable "CXPSV_fnc_clientGetKey";

CXPSV_fnc_clientGangLeader = compileFinal "
    private [""_unit"",""_group""];
    _unit = _this select 0;
    _group = _this select 1;
    if (isNil ""_unit"" || isNil ""_group"") exitWith {};
    if (player isEqualTo _unit && (group player) == _group) then {
        player setRank ""COLONEL"";
        _group selectLeader _unit;
        hint localize ""STR_GNOTF_GaveTransfer"";
    };
";
publicVariable "CXPSV_fnc_clientGangLeader";

CXPSV_fnc_clientGangLeft = compileFinal "
    private [""_unit"",""_group""];
    _unit = _this select 0;
    _group = _this select 1;
    if (isNil ""_unit"" || isNil ""_group"") exitWith {};
    if (player isEqualTo _unit && (group player) == _group) then {
        cxp_my_gang = objNull;
        [player] joinSilent (createGroup civilian);
        hint localize ""STR_GNOTF_LeaveGang"";
    };
";
publicVariable "CXPSV_fnc_clientGangLeft";

/* Cell Phone Messaging Functions */
//Para todos os medicos
CXPSV_fnc_cell_emsrequest = compileFinal "
    ctrlShow[3022,false];
    private _msg = ctrlText 3003;
    private _length = count (toArray(_msg));
    if (_length > 400) exitWith {hint localize ""STR_CELLMSG_LIMITEXCEEDED"";ctrlShow[3022,true];};
    private _to = ""EMS Units"";
    if (_msg isEqualTo """") exitWith {hint localize ""STR_CELLMSG_EnterMSG"";ctrlShow[3022,true];};

    [_msg,name player,2,mapGridPosition player,player] remoteExec [""CXPSV_fnc_clientMessage"",independent];
    [] call cxp_fnc_cellphone;
    hint format [localize ""STR_CELLMSG_ToEMS"",_to,_msg];
    ctrlShow[3022,true];
";
//Para alguem especifico
CXPSV_fnc_cell_textmsg = compileFinal "
    ctrlShow[3015,false];
    private _msg = ctrlText 3003;

    _length = count (toArray(_msg));
    if (_length > 400) exitWith {hint localize ""STR_CELLMSG_LIMITEXCEEDED"";ctrlShow[3015,true];};
    if (lbCurSel 3004 isEqualTo -1) exitWith {hint localize ""STR_CELLMSG_SelectPerson""; ctrlShow[3015,true];};

    private _to = call compile format [""%1"",(lbData[3004,(lbCurSel 3004)])];
    if (isNull _to) exitWith {ctrlShow[3015,true];};
    if (isNil ""_to"") exitWith {ctrlShow[3015,true];};
    if (_msg isEqualTo """") exitWith {hint localize ""STR_CELLMSG_EnterMSG"";ctrlShow[3015,true];};

    [_msg,name player,0] remoteExec [""CXPSV_fnc_clientMessage"",_to];
    [] call cxp_fnc_cellphone;
    hint format [localize ""STR_CELLMSG_ToPerson"",name _to,_msg];
    ctrlShow[3015,true];
";
//Para todos os policiais
CXPSV_fnc_cell_textcop = compileFinal "
    ctrlShow[3016,false];
    private _msg = ctrlText 3003;
    private _to = ""The Police"";

    if (_msg isEqualTo """") exitWith {hint localize ""STR_CELLMSG_EnterMSG"";ctrlShow[3016,true];};
    _length = count (toArray(_msg));
    if (_length > 400) exitWith {hint localize ""STR_CELLMSG_LIMITEXCEEDED"";ctrlShow[3016,true];};

    [_msg,name player,1,mapGridPosition player,player] remoteExec [""CXPSV_fnc_clientMessage"",-2];
    [] call cxp_fnc_cellphone;
    hint format [localize ""STR_CELLMSG_ToPerson"",_to,_msg];
    ctrlShow[3016,true];
";
publicVariable "CXPSV_fnc_cell_textmsg";
publicVariable "CXPSV_fnc_cell_textcop";
publicVariable "CXPSV_fnc_cell_emsrequest";

//Client Message
/*
    0 = mensagem privada
    1 = mensagem para policia
    2 = mensagem para bombeiros
*/
CXPSV_fnc_clientMessage = compileFinal "
    if (isServer) exitWith {};
    private _msg = _this select 0;
    private _from = _this select 1;
    private _type = _this select 2;
    if (_from isEqualTo """") exitWith {};
    switch (_type) do {
        case 0 : {
            private _message = format ["">>>VOCE RECEBEU UMA MENSAGEM DE %1, DIZENDO: %2"",_from,_msg];
            
            [""Nova mensagem recebida"",format[""De: %1"",_from],_msg,[0.741,0,1,1]] call cxp_fnc_notify;

            [""TextMessage"",[format [""Voce recebeu uma nova mensagem de %1"",_from]]] call bis_fnc_showNotification;
            systemChat _message;
            private _messages = player getVariable [""cellphone_messages"",[]];
			player remoteExecCall [""CXPDB_fnc_getRealTime"",2];
			waitUntil{!isNil ""realTime""};
			realTime = call compile realTime;
			private _newArray = [[_from,_msg,realTime]];
			
			{
				_newArray pushback _x;
			} foreach _messages;
			
			player setVariable [""cellphone_messages"",_newArray];
			
			realTime = nil;
        };

        case 1 : {
            if (side player != west) exitWith {};
            private _loc = _this select 3;
            private _unit = _this select 4;
            private _message = format ["">>>DENUNCIA/CHAMADO/MSG DE %1, DIZENDO: %2"",_from,_msg];
            if (isNil ""_loc"") then {_loc = ""Unknown"";};
            
            [""Nova denuncia/msg"",format[""De: %1 (COORD: %2)"",_from,_loc],_msg,[0.741,0,1,1]] call cxp_fnc_notify;

            [""PoliceDispatch"",[format [""Denuncia/Chamado/Msg de: %1"",_from]]] call bis_fnc_showNotification;
            systemChat _message;
        };

        case 2: {
            if (side player != independent) exitWith {};
            private _loc = _this select 3;
            private _unit = _this select 4;
            private _message = format ["">>>CHAMADO/MSG: %1"",_msg];
            
            [""Novo(a) chamado/msg"",format[""De: %1 (COORD: %2)"",_from,_loc],_msg,[0.741,0,1,1]] call cxp_fnc_notify;

            [""TextMessage"",[format [""CHAMADO/MSG de %1"",_from]]] call bis_fnc_showNotification;
        };
    };
";
publicVariable "CXPSV_fnc_clientMessage";
