/*
    Author: Casperento
    Description:
    (civ|cop|medic)Markers (versao do Casperento :)
*/
for "_i" from 0 to 1 step 0 do {
    waitUntil {visibleMap};
    private _marcArr = [];
    private "_marcador";

    {
        //Voce
        if (_x isEqualTo player) then {
            _marcador = createMarkerLocal [format["%1_civ_pl_marc",_x],getPos _x];
            _marcador setMarkerColorLocal "ColorRed"; // Marcador Vermelho
            _marcador setMarkerTypeLocal "mil_arrow2";
            _marcador setMarkerTextLocal "Você";
            _marcArr pushBack [_marcador,_x];
        };
        //Time
        if (side _x isEqualTo civilian && !(_x getVariable ["sequestrado",false]) && !(_x isEqualTo player) && _x in (units (group player))) then {
            _marcador = createMarkerLocal [format["%1_civ_terc_marc",_x],getPos _x];
            _marcador setMarkerColorLocal "ColorGreen"; // Marcador Verde
            _marcador setMarkerTypeLocal "Mil_dot";
            _marcador setMarkerTextLocal format ["%1", _x getVariable ["realname",name _x]];
            _marcArr pushBack [_marcador,_x];
        };
    } foreach playableUnits;
	
    while {visibleMap} do {
        {
            private _marc = _x select 0;
            private _veh = _x select 1;
            if !(isNil "_veh" && isNull _veh) then {
                _marc setMarkerPosLocal (getPos _veh);
                _marc setMarkerDirLocal (getDir _veh);
            };
        } foreach _marcArr;
        if !(visibleMap) exitWith {};
    };

    {
        deleteMarkerLocal (_x select 0);
    } foreach _marcArr;
};
