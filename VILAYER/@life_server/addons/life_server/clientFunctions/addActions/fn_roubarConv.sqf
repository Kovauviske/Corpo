#include "\life_server\script_macros.hpp"
/*
	File : fn_roubarConv.sqf
	Author : Casperento
	Description:
	Novo script de assaltar postos, e não aquela porcaria achada no altisliferpg.com
*/
private _npcLoja = _this select 0;
private _assaltante = _this select 1;
private _actions = [
	"['Assaltar Posto de Gasolina',cxp_fnc_roubarConv,'',0,false,false,'','isNull objectParent player && player distance _target < 4 && playerSide isEqualTo civilian']",
	"[localize'STR_MAR_Station_Shop',cxp_fnc_weaponShopMenu,'f_station_store',0,false,false,'','isNull objectParent player && player distance _target < 4 && playerSide isEqualTo civilian']",
	"[localize'STR_Shop_Station_Coffee',cxp_fnc_virtMenu,'f_station_coffee',0,false,false,'','isNull objectParent player && player distance _target < 4 && playerSide isEqualTo civilian']"
];

if (cxp_safezone) exitWith {hint"Voce nao pode assaltar postos de gasolina dentro de zonas seguras !"};
if (side _assaltante != civilian) exitWith { hint "Voce nao pode assaltar este posto !" };
if (_assaltante distance _npcLoja > 10) exitWith { hint "Voce deve estar a menos de 10 metros de distância" };
if (vehicle player != _assaltante) exitWith { hint "Você não pode completar esta ação estando dentro de um veiculo !" };
if !(alive _assaltante) exitWith {hint"O assalto falhou..que pena!"};
if (currentWeapon _assaltante isEqualTo "" || (currentWeapon _assaltante isKindOf ["Binocular", configFile >> "CfgWeapons"])) exitWith { hint "Haha, eu nao tenho medo de lutar com voce !" };
if (west countSide playableUnits < CXP_SETTINGS(getNumber,"minCopOn_assalto_posto")) exitWith {hint format ["Não há policiais suficientes para assaltar postos de gasolina no momento. (NUMERO MINIMO : %1)",(CXP_SETTINGS(getNumber,"minCopOn_assalto_posto"))];};

cxp_assaltando_posto = true;

removeAllActions _npcLoja;
private _bonecoDetc = false;
if (_npcLoja isKindOf "Man") then {_bonecoDetc = true;_npcLoja switchMove "AmovPercMstpSsurWnonDnon";};
	
private _chance = random(100);
if (_chance < 30) then {
	[1,format["DENÚNCIA ANÔNIMA: O Posto %1 esta sendo assaltado !!!",_npcLoja]] remoteExecCall ["cxp_fnc_broadcast",west];
	hint "O caixa tinha um alarme escondido. CUIDADO, a policia foi avisada e ja esta a caminho. Quem avisa amigo é mané!";
};

disableSerialization;
5 cutRsc ["cxp_progress","PLAIN"];

private _ui = uiNameSpace getVariable "cxp_progress";
private _progress = _ui displayCtrl 38201;
private _pgText = _ui displayCtrl 38202;

_pgText ctrlSetText format["Assaltando posto (fique em menos de 10m da vitima) (1%1)...","%"];
_progress progressSetPosition 0.01;
private _cP = 0.01;

// alarme do posto
[_npcLoja, "alarmePosto", 300, 1] remoteExec ["cxp_fnc_say3D",RANY];

private _mkName = format["AlertPstMk_%1",round(random 99999)];
private _numAvis = 0;
for "_i" from 0 to 1 step 0 do {
	sleep 4;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format ["Assaltando posto (fique em menos de 10m da vitima) (%1%2)...",round(_cP * 100),"%"];

	private _marcadorAsPst = createMarker [_mkName,_npcLoja];
	_mkName setMarkerColor "ColorRed";
	_mkName setMarkerText "ATENÇÃO: ESTE POSTO DE GASOLINA ESTA SENDO ASSALTADO";
	_mkName setMarkerType "mil_warning";

	// Correção do bug da msg infinita...
	if (_numAvis < 6) then {[1,format["ALERTA : Um posto de gasolina esta sendo assaltado !!!"]] remoteExecCall ["cxp_fnc_broadcast",RANY];};
	if (_cP >= 1) exitWith {};
	if (_assaltante distance _npcLoja > 10) exitWith {cxp_assaltando_posto = false;};
	if !(alive _assaltante) exitWith {cxp_assaltando_posto = false;};
	if (_assaltante getVariable ["downed",false]) exitWith {cxp_assaltando_posto = false;};
	if !(cxp_assaltando_posto) exitWith {};
	if !(isNull (findDisplay 49)) exitWith {};
	_numAvis = _numAvis + 1;
};

if !(isNull (findDisplay 49)) exitWith {
	hint "Assalto cancelado!";
	deleteMarker _mkName;
	5 cutText ["","PLAIN"];
	cxp_assaltando_posto = false;
};

if !(alive _assaltante) exitWith {
	hint "Assalto cancelado!";
	deleteMarker _mkName;
	5 cutText ["","PLAIN"];
	cxp_assaltando_posto = false;
};

if (_assaltante getVariable ["downed",false]) exitWith {
	hint "Assalto cancelado!";
	deleteMarker _mkName;
	5 cutText ["","PLAIN"];
	cxp_assaltando_posto = false;
};

if (_assaltante distance _npcLoja > 10) exitWith {
	deleteMarker _mkName;
	if (_bonecoDetc) then {_npcLoja switchMove "";};
	hint "Voce precisa ficar a menos de 10m da vitima para concluir o assalto...";
	5 cutText ["","PLAIN"];
	cxp_assaltando_posto = false;
};

5 cutText ["","PLAIN"];
titleText[format["Você roubou R$%1, fuja para não ser pego pela polícia !",[(CXP_SETTINGS(getNumber,"premio_assalto_posto"))] call cxp_fnc_numberText],"PLAIN"];
deleteMarker _mkName;

// add grana pro assaltante
CASH = CASH + (CXP_SETTINGS(getNumber,"premio_assalto_posto"));
[true] call cxp_fnc_hudUpdate;

cxp_assaltando_posto = false;

[] spawn {
	cxp_use_atm = false;
	sleep (60 + random(180));
	cxp_use_atm = true;
};

// add player na lista de procurado
if (cxp_CXPHC_isActive) then {
	[getPlayerUID _assaltante,_assaltante getVariable ["realname",name _assaltante],"211"] remoteExecCall ["cxp_fnc_wantedAdd",CXP_HC];
} else {
	[getPlayerUID _assaltante,_assaltante getVariable ["realname",name _assaltante],"211"] remoteExecCall ["cxp_fnc_wantedAdd",RSERV];
};

sleep (CXP_SETTINGS(getNumber,"tempoVoltarNpc_assalto_posto"));

if (_bonecoDetc) then {_npcLoja switchMove "";};
{_npcLoja addAction (call compile format["%1",_x]);} forEach _actions;


