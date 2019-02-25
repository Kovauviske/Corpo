/* Author: Casperento */
class BasesGang_cfg {
	// SYNTAX >> {(numeroDeCasasNaBase),licencaNecessaria} (nome da var da casa>> "casa_(numeroDaCasa)_base_(numeroDaBase))")
	// Add nome de todas as casas de determinada base de gangue aqui!!!
	g_casasConfig[] = {
	    {10,"license_civ_josTrex"},
	    {10,"license_civ_dxcTrex"},
	    {10,"license_civ_pbTrex"},
	    {10,"license_civ_s1dTrex"},
	    {10,"license_civ_o2dTrex"},
	    {10,"license_civ_b1dTrex"},
	    {15,"license_civ_lynxTrex"}
		//{10,"license_civ_tyxTrex8i"},
		//{10,"license_civ_josTrexton"},
		//{10,"license_civ_uipTrexy"}
	};

	// SYNTAX >> { { {"NomePlaquinhaUm","MarcadorDeSpawnDessaPlaca"},  {"NomePlaquinhaDois","MarcadorDeSpawnDessaPlaca"},  {"NomePlaquinhaTres","MarcadorDeSpawnDessaPlaca"} }, "LicencaNecessariaParaPlaquinha", {(1/0),(1/0),(1/0)} } --> 1:ligada/0:desligada
	// o ultimo elemento se refere as seguintes plaquinhas (nessa ordem mesmo) { VehsRebeldes(garagemIncluidaAqui), VehAereoCivil(garagemIncluidaAqui), LojaCaminhoes(LojaDeCarrosIncluidaAqui) }
	g_plaquinhasVeh[] = {
		{ { {"plVehUm_base_1","pl_mk_1_spw_base_1"},   {"plVehDois_base_1","pl_mk_2_spw_base_1"},   {"plVehTres_base_1","pl_mk_3_spw_base_1"} },     "license_civ_josTrex",    {1,1,1} },
		{ { {"plVehUm_base_2","pl_mk_1_spw_base_2"},   {"plVehDois_base_2","pl_mk_2_spw_base_2"},   {"plVehTres_base_2","pl_mk_3_spw_base_2"} },     "license_civ_dxcTrex",    {1,1,1} },
		{ { {"plVehUm_base_3","pl_mk_1_spw_base_3"},   {"plVehDois_base_3","pl_mk_2_spw_base_3"},   {"plVehTres_base_3","pl_mk_3_spw_base_3"} },     "license_civ_pbTrex",     {1,1,1} },
		{ { {"plVehUm_base_4","pl_mk_1_spw_base_4"},   {"plVehDois_base_4","pl_mk_2_spw_base_4"},   {"plVehTres_base_4","pl_mk_3_spw_base_4"} },     "license_civ_s1dTrex",    {1,1,1} },
		{ { {"plVehUm_base_5","pl_mk_1_spw_base_5"},   {"plVehDois_base_5","pl_mk_2_spw_base_5"},   {"plVehTres_base_5","pl_mk_3_spw_base_5"} },     "license_civ_o2dTrex",    {1,1,1} },
		{ { {"plVehUm_base_6","pl_mk_1_spw_base_6"},   {"plVehDois_base_6","pl_mk_2_spw_base_6"},   {"plVehTres_base_6","pl_mk_3_spw_base_6"} },     "license_civ_b1dTrex",    {1,1,1} },
		{ { {"plVehUm_base_7","pl_mk_1_spw_base_7"},   {"plVehDois_base_7","pl_mk_2_spw_base_7"},   {"plVehTres_base_7","pl_mk_3_spw_base_7"} },     "license_civ_lynxTrex",   {1,1,1} }
		//{ { {"plVehUm_base_8","pl_mk_1_spw_base_8"},   {"plVehDois_base_8","pl_mk_2_spw_base_8"},   {"plVehTres_base_8","pl_mk_3_spw_base_8"} },     "license_civ_tyxTrex8i",  {1,1,1} },
		//{ { {"plVehUm_base_9","pl_mk_1_spw_base_9"},   {"plVehDois_base_9","pl_mk_2_spw_base_9"},   {"plVehTres_base_9","pl_mk_3_spw_base_9"} },     "license_civ_josTrexton", {1,1,1} },
		//{ { {"plVehUm_base_10","pl_mk_1_spw_base_10"}, {"plVehDois_base_10","pl_mk_2_spw_base_10"}, {"plVehTres_base_10","pl_mk_3_spw_base_10"} },   "license_civ_uipTrexy",   {1,1,1} },
		//{ { {"plVehUm_base_11","pl_mk_1_spw_base_11"}, {"plVehDois_base_11","pl_mk_2_spw_base_11"}, {"plVehTres_base_11","pl_mk_3_spw_base_11"} },   "license_civ_bdsctn",     {1,1,1} },
		//{ { {"plVehUm_base_12","pl_mk_1_spw_base_12"}, {"plVehDois_base_12","pl_mk_2_spw_base_12"}, {"plVehTres_base_12","pl_mk_3_spw_base_12"} },   "license_civ_ctnseg",     {1,1,1} },
		//{ { {"plVehUm_base_13","pl_mk_1_spw_base_13"}, {"plVehDois_base_13","pl_mk_2_spw_base_13"}, {"plVehTres_base_13","pl_mk_3_spw_base_13"} },   "license_civ_bdcpter",    {1,1,1} },
		//{ { {"plVehUm_base_14","pl_mk_1_spw_base_14"}, {"plVehDois_base_14","pl_mk_2_spw_base_14"}, {"plVehTres_base_14","pl_mk_3_spw_base_14"} },   "license_civ_dsqrt",      {1,1,1} },
		//{ { {"plVehUm_base_15","pl_mk_1_spw_base_15"}, {"plVehDois_base_15","pl_mk_2_spw_base_15"}, {"plVehTres_base_15","pl_mk_3_spw_base_15"} },   "license_civ_dbcapqnt",   {1,1,1} },
	};

	// SYNTAX >> { { "NomePlaquinhaUm",  "NomePlaquinhaDois",  "NomePlaquinhaTres",  "NomePlaquinhaQuatro", ... },"LicencaNecessariaParaPlaquinha", {(1/0),(1/0),(1/0),(1/0),(1/0)} } --> em que 1=ativa/0=desativa, indica se a placa esta ativa ou nao
	// o ultimo elemento se refere as seguintes plaquinhas (nessa ordem mesmo) { Prefeitura(e MedicalAssistance), LojasRebeldes, Mercado, LojaGeral, LojaRoupas }
	g_plaquinhasBasicas[] = {
		{ { "plaquinhaUm_base_1",  "plaquinhaDois_base_1",  "plaquinhaTres_base_1",    "plaquinhaQuatro_base_1",   "plaquinhaCinco_base_1" },    "license_civ_josTrex",    {1,1,1,1,1} },
		{ { "plaquinhaUm_base_2",  "plaquinhaDois_base_2",  "plaquinhaTres_base_2",    "plaquinhaQuatro_base_2",   "plaquinhaCinco_base_2" },    "license_civ_dxcTrex",    {1,1,1,1,1} },
		{ { "plaquinhaUm_base_3",  "plaquinhaDois_base_3",  "plaquinhaTres_base_3",    "plaquinhaQuatro_base_3",   "plaquinhaCinco_base_3" },    "license_civ_pbTrex",     {1,1,1,1,1} },
		{ { "plaquinhaUm_base_4",  "plaquinhaDois_base_4",  "plaquinhaTres_base_4",    "plaquinhaQuatro_base_4",   "plaquinhaCinco_base_4" },    "license_civ_s1dTrex",    {1,1,1,1,1} },
		{ { "plaquinhaUm_base_5",  "plaquinhaDois_base_5",  "plaquinhaTres_base_5",    "plaquinhaQuatro_base_5",   "plaquinhaCinco_base_5" },    "license_civ_o2dTrex",    {1,1,1,1,1} },
		{ { "plaquinhaUm_base_6",  "plaquinhaDois_base_6",  "plaquinhaTres_base_6",    "plaquinhaQuatro_base_6",   "plaquinhaCinco_base_6" },    "license_civ_b1dTrex",    {1,1,1,1,1} },
		{ { "plaquinhaUm_base_7",  "plaquinhaDois_base_7",  "plaquinhaTres_base_7",    "plaquinhaQuatro_base_7",   "plaquinhaCinco_base_7" },    "license_civ_lynxTrex",   {1,1,1,1,1} }
		//{ { "plaquinhaUm_base_8",  "plaquinhaDois_base_8",  "plaquinhaTres_base_8",    "plaquinhaQuatro_base_8",   "plaquinhaCinco_base_8" },    "license_civ_tyxTrex8i",  {1,1,1,1,1} },
		//{ { "plaquinhaUm_base_9",  "plaquinhaDois_base_9",  "plaquinhaTres_base_9",    "plaquinhaQuatro_base_9",   "plaquinhaCinco_base_9" },    "license_civ_josTrexton", {1,1,1,1,1} },
		//{ { "plaquinhaUm_base_10", "plaquinhaDois_base_10", "plaquinhaTres_base_10",   "plaquinhaQuatro_base_10",  "plaquinhaCinco_base_10" },   "license_civ_uipTrexy",   {1,1,1,1,1} },
		//{ { "plaquinhaUm_base_11", "plaquinhaDois_base_11", "plaquinhaTres_base_11",   "plaquinhaQuatro_base_11",  "plaquinhaCinco_base_11" },   "license_civ_bdsctn",     {1,1,1,1,1} },
		//{ { "plaquinhaUm_base_12", "plaquinhaDois_base_12", "plaquinhaTres_base_12",   "plaquinhaQuatro_base_12",  "plaquinhaCinco_base_12" },   "license_civ_ctnseg",     {1,1,1,1,1} },
		//{ { "plaquinhaUm_base_13", "plaquinhaDois_base_13", "plaquinhaTres_base_13",   "plaquinhaQuatro_base_13",  "plaquinhaCinco_base_13" },   "license_civ_bdcpter",    {1,1,1,1,1} },
		//{ { "plaquinhaUm_base_14", "plaquinhaDois_base_14", "plaquinhaTres_base_14",   "plaquinhaQuatro_base_14",  "plaquinhaCinco_base_14" },   "license_civ_dsqrt",      {1,1,1,1,1} },
		//{ { "plaquinhaUm_base_15", "plaquinhaDois_base_15", "plaquinhaTres_base_15",   "plaquinhaQuatro_base_15",  "plaquinhaCinco_base_15" },   "license_civ_dbcapqnt",   {1,1,1,1,1} }
	};

	// SYNTAX >> { { "NomePlaquinhaUm",  "NomePlaquinhaDois" },"LicencaDaBase",{"SiglaFarmProcessadorUm","SiglaFarmProcessadorDois"}}
	/*
		Farms compativeis com o sistema (e suas siglas):
		MACO - maconha
		DIAM - diamante
		META - metanfetamina
		HERO - heroina
		COCA - cocaina
	*/
	g_basesProcs[] = {
		{ { "pUm_base_1",  "pDois_base_1" },    "license_civ_josTrex",    { "", "" }},
		{ { "pUm_base_2",  "pDois_base_2" },    "license_civ_dxcTrex",    { "", "" }},
		{ { "pUm_base_3",  "pDois_base_3" },    "license_civ_pbTrex",     { "", "" }},
		{ { "pUm_base_4",  "pDois_base_4" },    "license_civ_s1dTrex",    { "", "" }},
		{ { "pUm_base_5",  "pDois_base_5" },    "license_civ_o2dTrex",    { "", "" }},
		{ { "pUm_base_6",  "pDois_base_6" },    "license_civ_b1dTrex",    { "HERO", "META" }},
		{ { "pUm_base_7",  "pDois_base_7" },    "license_civ_lynxTrex",   { "", "" }}
		//{ { "pUm_base_8",  "pDois_base_8" },    "license_civ_tyxTrex8i",  { "", "" }},
		//{ { "pUm_base_9",  "pDois_base_9" },    "license_civ_josTrexton", { "", "" }},
		//{ { "pUm_base_10", "pDois_base_10" },   "license_civ_uipTrexy",   { "", "" }},
		//{ { "pUm_base_11", "pDois_base_11" },   "license_civ_bdsctn",     { "", "" }},
		//{ { "pUm_base_12", "pDois_base_12" },   "license_civ_ctnseg",     { "", "" }},
		//{ { "pUm_base_13", "pDois_base_13" },   "license_civ_bdcpter",    { "", "" }}
		//{ { "pUm_base_14", "pDois_base_14" },   "license_civ_dsqrt",      { "", "" }},
		//{ { "pUm_base_15", "pDois_base_15" },   "license_civ_dbcapqnt",   { "", "" }}
	};
	// Strings 'localizadas' no stringTable.xml
	g_msg_Titulo = "STR_BASES_GDN_Titulo"; // Titulo Da mensagem
	g_msg_in = "STR_BASES_GDN_Subtitulo_In"; // Mensagem que aparece quando o jogador entra na área
	g_msg_out = "STR_BASES_GDN_Subtitulo_Out"; // Mensagem que aparece quando o jogador sai da área
};