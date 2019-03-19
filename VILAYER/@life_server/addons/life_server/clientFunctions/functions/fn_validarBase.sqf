#include "\life_server\script_macros.hpp"
/*
	File : fn_validarBase.sqf
	Author : Casperento

	Description:
	Ativa as licencas das bases exclusivas automaticamente, sem precisar de seta-las manualmente no banco de dados
*/
private _numBaseG = param [0,0,[0]];

// Setando a licenca correta para o nivel certo da base do player
private _arrLicNames = ["josTrex","dxcTrex","pbTrex","s1dTrex","o2dTrex","b1dTrex","lynxTrex","tyxTrex8i","josTrexton","uipTrexy","bdsctn","ctnseg","bdcpter","dsqrt","dbcapqnt"];
for "_i" from 0 to 15 do {
    if (_numBaseG isEqualTo _i && _i > 0) then {
        private _index = (_i - 1);
        private _xName = _arrLicNames select _index;
        missionNamespace setVariable [LICENSE_VARNAME(_xName,"civ"),true];
        _arrLicNames deleteAt _index;
    } else {
    	{
    		missionNamespace setVariable [LICENSE_VARNAME(_x,"civ"),false];
    	} forEach _arrLicNames;
    };
};
[2] call CXPSKT_fnc_updatePartial;