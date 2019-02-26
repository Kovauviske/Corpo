/*
	File: fn_updateBountyListLocal.sqf
	Author: Casperento
	Description:
	Atualiza lista de UIDs dos bounty hunters (CLIENTE)
*/
params [
	["_bLista",[],[[]]]
];
if !(_bLista isEqualType []) exitWith {hint"Lista de mortos recebida em formato diferente do esperado...Contate aos desenvolvedores!"};
cxp_bountyList_client = _bLista;