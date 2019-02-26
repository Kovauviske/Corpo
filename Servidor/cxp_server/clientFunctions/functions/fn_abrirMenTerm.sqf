#include "\cxp_server\script_macros.hpp"
/*
  File: fn_abrirMenTerm.sqf
  Author: Casperento
  Description:
  Configura o menu de termos e abre para o cliente final
*/
disableSerialization;
createDialog "cxp_menu_entrada";

if (isNull (findDisplay 66669) || !((CXP_SETTINGS(getArray,("regras_basicas_menuInit_alertON")) select 0) isEqualType 0)) exitWith {hint"Erro no menu de avisos iniciais, contate aos desenvolvedores!"};

private _btnConcord = CONTROL(66669,4692);
private _btnDiscord = CONTROL(66669,4691);
CONTROL(66669,4695) buttonSetAction "[] spawn cxp_fnc_discordTerm;"; // BOTAO X
CONTROL(66669,4696) ctrlSetText (localize "STR_Men_Ent_Titulo"); // TITULO
private _subTit = CONTROL(66669,4694);

if ((CXP_SETTINGS(getArray,("regras_basicas_menuInit_alertON")) select 0) isEqualTo 1) then {
	cxp_bntPassou=false;

	//Botao CONCORDAR
	_btnDiscord ctrlShow false;
	//Botao DISCORDAR
	_btnConcord ctrlSetText "PASSAR";
	_btnConcord buttonSetAction "cxp_bntPassou=true;";
	//Subtitulo
	_subTit ctrlSetText (localize "STR_Men_Ent_SubTitulo2");
	
	private _arrAvisos = (CXP_SETTINGS(getArray,("regras_basicas_menuInit_alertON")) select 1);
	private _listaAvisos = CONTROL(66669,4693);
	private _av = "";
	{_av = _av + "<t size='0.5' color='#ff0000'><img image='A3\Ui_f\data\IGUI\RscIngameUI\RscUnitInfo\arrow_right_ca'/></t>" + " " + "<t color='#ffffff'>"+ _x +"</t>"+"<br />";} forEach _arrAvisos;
	_listaAvisos ctrlSetStructuredText (parseText _av);

	// Ajustando tamanho do texto estruturado automaticamente (Thanks for Tonic)
	private _yLstAv = (ctrlPosition _listaAvisos) select 1;
	private _hLstAv = ctrlTextHeight _listaAvisos;
	_listaAvisos ctrlSetPosition [(ctrlPosition _listaAvisos) select 0, _yLstAv, (ctrlPosition _listaAvisos) select 2, _hLstAv];
	_listaAvisos ctrlCommit 0;
	
	waitUntil {cxp_bntPassou};
	
	//Botao CONCORDAR
	_btnDiscord ctrlShow true;
	_btnDiscord ctrlSetText (localize "STR_Men_Ent_BtnDiscord");
	_btnDiscord buttonSetAction "[] spawn cxp_fnc_discordTerm;";
	//Botao DISCORDAR
	_btnConcord ctrlSetText (localize "STR_Men_Ent_BtnConcord");
	_btnConcord buttonSetAction "[] call cxp_fnc_concordTerm;";
	//Subtitulo
	_subTit ctrlSetText (localize "STR_Men_Ent_SubTitulo1");
	
	private _arrRegras = CXP_SETTINGS(getArray,"regras_basicas_menuInit");
	private _listaRegras = CONTROL(66669,4693);
	private _regra = "";
	{_regra = _regra + "<t size='0.5' color='#ff0000'><img image='A3\Ui_f\data\IGUI\RscIngameUI\RscHint\indent_square'/></t>" + " " + "<t color='#ffffff'>"+ _x +"</t>"+"<br />";} forEach _arrRegras;
	_listaRegras ctrlSetStructuredText (parseText _regra);

	// Ajustando tamanho do texto estruturado automaticamente (Thanks for Tonic)
	private _yLstReg = (ctrlPosition _listaRegras) select 1;
	private _hLstReg = ctrlTextHeight _listaRegras;
	_listaRegras ctrlSetPosition [(ctrlPosition _listaRegras) select 0, _yLstReg, (ctrlPosition _listaRegras) select 2, _hLstReg];
	_listaRegras ctrlCommit 0;
	
} else {

	//Botao CONCORDAR
	_btnConcord ctrlSetText (localize "STR_Men_Ent_BtnConcord");
	_btnConcord buttonSetAction "[] call cxp_fnc_concordTerm;";
	//Botao DISCORDAR
	_btnDiscord ctrlSetText (localize "STR_Men_Ent_BtnDiscord");
	_btnDiscord buttonSetAction "[] spawn cxp_fnc_discordTerm;";
	//Subtitulo
	_subTit ctrlSetText (localize "STR_Men_Ent_SubTitulo1");
	
	private _arrRegras = CXP_SETTINGS(getArray,"regras_basicas_menuInit");
	private _listaRegras = CONTROL(66669,4693);
	private _regra = "";
	{_regra = _regra + "<t size='0.5' color='#ff0000'><img image='A3\Ui_f\data\IGUI\RscIngameUI\RscHint\indent_square'/></t>" + " " + "<t color='#ffffff'>"+ _x +"</t>"+"<br />";} forEach _arrRegras;
	_listaRegras ctrlSetStructuredText (parseText _regra);

	// Ajustando tamanho do texto estruturado automaticamente (Thanks for Tonic)
	private _yLstReg = (ctrlPosition _listaRegras) select 1;
	private _hLstReg = ctrlTextHeight _listaRegras;
	_listaRegras ctrlSetPosition [(ctrlPosition _listaRegras) select 0, _yLstReg, (ctrlPosition _listaRegras) select 2, _hLstReg];
	_listaRegras ctrlCommit 0;

};