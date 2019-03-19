/*
	File: fn_limparInvPlayer.sqf
	Author: Casperento
	Description:
	Limpa inventario fisico (do 'I') do jogador quando ele aperta uma tecla de disconnect
*/
params [["_tipo","",[""]]];

// Bye Armas
removeAllWeapons player;

// Bye Municao
{
	player removeMagazine _x;
} foreach (magazines player);

// Bye Roupas
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;

// Bye Resto dos Itens
{
	player unassignItem _x;
	player removeItem _x;
} foreach (assignedItems player);
player unlinkItem (hmd player);

// Agora a funcao pd ser usada simplesmente para limpar o inv do jogador
if (_tipo isEqualTo "") then {
	// Add roupa de prisioneiro no player caso ele tenha sido preso
	if (cxp_is_arrested) then {player addUniform "U_C_WorkerCoveralls";};

	[] call cxp_fnc_playerSkins;
	[] call cxp_fnc_saveGear;
};