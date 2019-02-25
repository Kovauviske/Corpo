#include "\cxp_server\script_macros.hpp"
/*
  File: fn_rmMorteListaSv.sqf
  Author: Casperento
  Description:
  Retira cliente morto da lista de jogadores mortos e devolve informacoes para o medico cliente
*/
params [
	["_jogadorRm","",["",[]]]
];

waitUntil {!cxp_sv_lista_emuso};
cxp_sv_lista_emuso = true;

// Um morto a ser atendido e removido da lista
if (_jogadorRm isEqualType "" && !(_jogadorRm isEqualTo "")) exitWith {
	// Identifica 'pacote' do player atraves do nome dele
	private _arrDel = [];
	{
		// identifica player e manda para o array final q sera deletado
		if ((_x select 1) isEqualTo _jogadorRm) then {
			_arrDel pushBack (_x select 0);
			_arrDel pushBack (_x select 1);
			_arrDel pushBack (_x select 2);
		};
	} forEach ListMortosNoMomento;

	if (_arrDel in ListMortosNoMomento) then {
		ListMortosNoMomento deleteAt (ListMortosNoMomento find _arrDel);
		// Envia lista atualizada de volta para os medicos de plantao
		[ListMortosNoMomento] remoteExecCall ["cxp_fnc_recebListClient",independent];
	};

	cxp_sv_lista_emuso = false;
};

// Mais de um morto a ser atendido e removido da lista
if (_jogadorRm isEqualType [] && count _jogadorRm > 0) exitWith {
	// Trabalhando com mais de um morto na area
	{
		// nome do cara do array a ser deletado
		_defunto = _x;
		// Identifica 'pacote' do player atraves do nome dele
		_arrDel = [];
		{
			// identifica player e manda para o array final q sera deletado
			if ((_x select 1) isEqualTo _defunto) then {
				_arrDel pushBack (_x select 0);
				_arrDel pushBack (_x select 1);
				_arrDel pushBack (_x select 2);
			};
		} forEach ListMortosNoMomento;

		if (_arrDel in ListMortosNoMomento) then {ListMortosNoMomento deleteAt (ListMortosNoMomento find _arrDel);};
	} forEach _jogadorRm;

	// Envia lista atualizada de volta para os medicos de plantao
	[ListMortosNoMomento] remoteExecCall ["cxp_fnc_recebListClient",independent];

	cxp_sv_lista_emuso = false;
};
