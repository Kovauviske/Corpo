/* Author: Casperento */
class CXP_MAP_FILTER_CFG {
    class Altis {
		class Civilian {
			catego_Names[] = {"Farms","Lojas","Missoes","Governo","Ilegais","Garagens"}; // Nome das categorias contidas aqui embaixo

			class Farms {
				subcatego_Names[] = {"Processadores","Compradores","Areas"}; // Nome das subcategorias contidas aqui embaixo
				class Processadores {
					mpfl_mks[] = {
						{"OilP","Processador de Petróleo"},
						{"iron_processing","Processador de Ferro"},
						{"rock_processing","Processador de Pedra"},
						{"heroin_p","Processador de Heroína"},
						{"sand_processing","Processador de Areia"},
						{"copper_process","Processador de Cobre"},
						{"Weed_p_1","Processador de Maconha"},
						{"diamond_processing","Processador de Diamante"},
						{"wood_processing","Procesador de Madeira"},
						{"cana_processing_2","Engarrafador de Pinga"},
						{"cana_processing_1","Destilador de Cana de Açucar"},
						{"cevada_processing_2","Enlatador de Cerveja"},
						{"cevada_processing_1","Destilador de Cevada"},
						{"cacao_processing","Fábrica de Chocolate"},
						{"meth_processing","Laboratório de Metanfetamina"},
						{"uranio_processing", "Processador de Uranio"}
					};
				};
				class Compradores {
					mpfl_mks[] = {
						{"gold_bar_dealer","Comprador de Barras de Ouro"},
						{"cement_trader_3_1","Comprador de Cimento (Pedra)"},
						{"iron_copper_trader","Comprador de Ferro e Cobre"},
						{"glass_trader","Comprador de Vidro"},
						{"diamond_trader","Comprador de Diamante"},
						{"salt_trader","Comprador de Sal"},
						{"oil_trader","Comprador de Petróleo"},
						{"wood_dealer","Comprador de Madeira"},
						{"turle_dealer","Traficante de Tartarugas 1"},
						{"turle_dealer_1","Traficante de Tartarugas 2"},
						{"turle_dealer_2","Traficante de Tartarugas 3"},
						{"Dealer_M1","Traficante de Drogas 1"},
						{"Dealer_M2","Traficante de Drogas 2"},
						{"Dealer_M3","Traficante de Drogas 3"},
						{"uranio_buyer","Comprador de Uranio"}
					};
				};
				class Areas {
					mpfl_mks[] = {
						{"sand_mk","Campo de Areia"},
						{"diamond_mk","Mina de Diamante"},
						{"iron_mk","Mina de Ferro"},
						{"copper_mk","Mina de Cobre"},
						{"hunting_marker","Área de Caça"},
						{"turtle_1_name_2","Área de Tartarugas"},
						{"turtle_1_name_1","Área de Tartarugas"},
						{"turtle_1_name","Área de Tartarugas"},
						{"heroin_mk","Campo de Heroína"},
						{"cocaine_mk","Campo de Cocaína"},
						{"weed_mk","Campo de Maconha"},
						{"oil_field_mk","Campo de Petróleo"},
						{"cana_mk3","Campo de Cana de Açucar"},
						{"cevada_mk3","Campo de Cevada"},
						{"wood_mk","Campo de Madeira 1"},
						{"wood_mk2","Campo de Madeira 2"},
						{"meth_mk","Campo de Metanfetamina"},
						{"cacao_mk","Campo de Cacau"},
						{"abacaxi_mk","Campo de Abacaxi"},
						{"cenoura_mk","Campo de Cenoura"},
						{"batata_mk3","Campo de Batata"},
						{"rock_mk","Mina de Pedra"},
						{"uranio_mina","Mina de Uranio"}
					};
				};
			};

			class Lojas {
				subcatego_Names[] = {"Armas","Veiculos","Roupas","Geral","Mercados","Bares","Tabacarias","Rebeldes"}; // Nome das subcategorias contidas aqui embaixo
				class Armas {
					mpfl_mks[] = {
						{"mnw_1","Mercado Negro de Armas"},
						{"gun_store_1_1","Loja de Armas 2"},
						{"gun_store_1_3","Loja de Armas 3"},
						{"gun_store_1","Loja de Armas 1"}
					};
				};
				class Veiculos {
					mpfl_mks[] = {
						{"kart_shop_text_1","Loja de Karts"},
						{"boat_2_1","Loja de Barcos"},
						{"boat_2_1_1","Loja de Barcos"},
						{"civ_truck_shop1","Loja de Caminhões 1"},
						{"civ_truck_shop1_1","Loja de Caminhões 2"},
						{"car1_1_1","Loja de Veiculos"}
					};
				};
				class Roupas {
					mpfl_mks[] = {
						{"dive_shop_1","Loja de Mergulho"},
						{"cloth_s_1","Loja de Roupas"},
						{"cloth_s_2","Loja de Roupas 2"},
						{"cloth_s_3","Loja de Roupas 3"},
						{"cloth_s_4","Loja de Roupas 4"},
						{"Gen_3_4","Loja de Roupas 5"},
						{"anti_rad_seller","Loja de Roupas Anti-Radioativas"}
					};
				};
				class Mercados {
					mpfl_mks[] = {
						{"acg_1","Açougue 1"},
						{"acg_2","Açougue 2"},
						{"acg_3","Açougue 3"},
						{"acg_4","Açougue 4"},
						{"cs_1","Cacau Show 1"},
						{"cs_2","Cacau Show 2"},
						{"Gen_3_1_1_2","Mercado 1"},
						{"Gen_3_1_1_1","Mercado 2"},
						{"market_3","Mercado 3"},
						{"market_2","Mercado 4"},
						{"lel_1","Leilão 1"},
						{"lel_2","Leilão 2"},
						{"lel_3","Leilão 3"},
						{"lel_4","Leilão 4"}
					};
				};
				class Bares {
					mpfl_mks[] = {
						{"bar_ze_4","Bar da Val 4"},
						{"bar_ze_3","Bar da Val 3"},
						{"bar_ze_2","Bar da Val 2"},
						{"bar_ze_1","Bar da Val 1"}
					};
				};
				class Tabacarias {
					mpfl_mks[] = {
						{"tabacaria_1","Tabacaria 1"},
						{"tabacaria_2","Tabacaria 2"},
						{"tabacaria_3","Tabacaria 3"},
						{"tabacaria_4","Tabacaria 4"}
					};
				};
				class Geral {
					mpfl_mks[] = {
						{"license_shop_2_1","Prefeitura"},
						{"license_shop_2","Prefeitura"},
						{"license_shop_1","Prefeitura"},
						{"mob_4","Mobiliaria 4"},
						{"mob_3","Mobiliaria 3"},
						{"mob_1","Mobiliaria 1"},
						{"mob_2","Mobiliaria 2"},
						{"lcamp_1","Loja de Acampamento 1"},
						{"lcamp_2","Loja de Acampamento 2"},
						{"lcamp_3","Loja de Acampamento 3"},
						{"lcamp_4","Loja de Acampamento 4"},
						{"Gen_4","Loja de Equipamentos"},
						{"Gen_2_1","Loja de Equipamentos"},
						{"Gen_2","Loja de Equipamentos"}
					};
				};
				class Rebeldes {
					mpfl_mks[] = {
						{"reb_shop","Loja Rebelde 1"},
						{"reb_shop_2","Loja Rebelde 2"},
						{"reb_s_car_1","Loja de veiculos rebeldes 1"},
						{"reb_s_car_2","Loja de veiculos rebeldes 2"}
					};
				};
			};

			class Governo {
				subcatego_Names[] = {"Saude","Dinheiro","Policia"};
				class Saude {
					mpfl_mks[] = {
						{"marker_684","Hospital 1"},
						{"marker_683","Hospital 2"},
						{"marker_682","Hospital 3"},
						{"marker_676","Bombeiro Athira"},
						{"marker_690","Bombeiro Kavala"}
					};
				};
				class Dinheiro {
					mpfl_mks[] = {
						{"fed_reserve_2_3","Banco Central"},
						{"atm_marker_10","Agência da Caixa Econômica 1"},
						{"atm_marker_11","Agência da Caixa Econômica 2"},
						{"atm_marker_12","Agência da Caixa Econômica 3"},
						{"atm_marker_13","Agência da Caixa Econômica 4"}
					};
				};
				class Policia {
					mpfl_mks[] = {
						{"hq_3","Estaçao Policial"},
						{"hq_atr","Estaçao Policial Athira"},
						{"marker_654","Estaçao Policial"},
						{"marker_648","HQ - Bounty Hunter"},
						{"marker_681","Quartel General Policial"}
					};
				};
			};
			class Missoes {
				subcatego_Names[] = {"Entrega","Combustivel"};
				class Entrega {
					mpfl_mks[] = {
						{"dp_1_18_1","DP 1"},
						{"dp_1_18_2","DP 2"},
						{"dp_1_1","DP 3"},
						{"dp_1_3","DP 4"},
						{"dp_1_16","DP 5"},
						{"dp_1_21","DP 6"},
						{"dp_1_2","DP 7"},
						{"dp_1_18","DP 8"},
						{"dp_1_20","DP 9"},
						{"dp_1_17","DP 10"},
						{"dp_1_19","DP 11"},
						{"dp_1_9","DP 12"},
						{"dp_1_8","DP 13"},
						{"dp_1_10","DP 14"},
						{"dp_1_11","DP 15"},
						{"dp_1_4","DP 16"},
						{"dp_1_5","DP 17"},
						{"dp_1_7","DP 18"},
						{"dp_1_6","DP 19"},
						{"dp_1_15_1","DP 20"},
						{"dp_1_12","DP 21"},
						{"dp_1_13","DP 22"},
						{"dp_1_15","DP 23"},
						{"dp_1_14","DP 24"},
						{"dp_1_14_1","DP 25"}
					};
				};
				class Combustivel {
					mpfl_mks[] = {
						{"fuel_storage_1","Reserv. Combustível 1"},
						{"fuel_storage_2","Reserv. Combustível 2"}
					};
				};
			};
			class Ilegais {
				subcatego_Names[] = {"Gangues","Zonas","Desmanches"}; // Nome das subcategorias contidas aqui embaixo
				class Gangues {
					mpfl_mks[] = {
						{"gang_cap_1","Cartel de Drogras"},
						{"gang_area_1","Esconderijo de Gangues 1"},
						{"gang_area_2","Esconderijo de Gangues 2"},
						{"gang_area_3","Esconderijo de Gangues 3"}
					};
				};
				class Zonas {
					mpfl_mks[] = {
						{"favela_mk","Favela"},
						{"Rebelop","Zona Rebelde Norte"},
						{"Rebelop_2","Zona Rebelde Sul"},
						{"mk_nolaw_zone","Zona Sem Lei"}
					};
				};
				class Desmanches {
					mpfl_mks[] = {
						{"chop_shop_K","Desmanche 1"},
						{"chop_shop_4","Desmanche 2"},
						{"chop_shop_2","Desmanche 3"}
					};
				};
			};
			class Garagens {
				subcatego_Names[] = {"Barcos","Aereas","Terrestres","Deficientes"}; // Nome das subcategorias contidas aqui embaixo
				class Barcos {
					mpfl_mks[] = {
						{"boat_garage_extra_1","Garagem de Barcos"},
						{"boat_garage_extra","Garagem de Barcos"}
					};
				};
				class Deficientes {
					mpfl_mks[] = {
						{"civ_gar_air_5","Garagem Aerea para Deficientes"},
						{"civ_gar_4","Garagem para Deficientes"}
					};
				};
				class Terrestres {
					mpfl_mks[] = {
						{"civ_gar_1_4","Garagem"},
						{"civ_gar_3","Garagem"},
						{"civ_gar_2","Garagem"},
						{"civ_gar_1_3","Garagem"},
						{"civ_gar_1_2","Garagem"},
						{"civ_gar_1","Garagem"}
					};
				};
				class Aereas {
					mpfl_mks[] = {
						{"civ_gar_air_3","Garagem Aerea"},
						{"civ_gar_air_2","Garagem Aerea"},
						{"civ_gar_air_4","Garagem Aerea"},
						{"civ_gar_air","Garagem Aerea"}
					};
				};
			};
		};

		class West {
			catego_Names[] = {"HQs"}; // Nome das categorias contidas aqui embaixo
			class HQs {
				subcatego_Names[] = {"HQsMarcadores"}; // Nome das subcategorias contidas aqui embaixo
				class HQsMarcadores {
					mpfl_mks[] = {
						{"hq_3","Estaçao Policial"},
						{"hq_atr","Estaçao Policial Athira"},
						{"marker_654","Estaçao Policial"},
						{"marker_648","HQ - Bounty Hunter"},
						{"marker_681","Quartel General Policial"}
					};
				};
			};
		};

		class Independent {
			catego_Names[] = {"Bombeiros","Hospitais"}; // Nome das categorias contidas aqui embaixo
			class Bombeiros {
				subcatego_Names[] = {"BombeirosMarcadores"}; // Nome das subcategorias contidas aqui embaixo
				class BombeirosMarcadores {
					mpfl_mks[] = {
						{"marker_676","Bombeiro Athira"},
						{"marker_690","Bombeiro Kavala"}
					};
				};
			};
			class Hospitais {
				subcatego_Names[] = {"HospitaisMarcadores"}; // Nome das subcategorias contidas aqui embaixo
				class HospitaisMarcadores {
					mpfl_mks[] = {
						{"marker_684","Hospital 1"},
						{"marker_683","Hospital 2"},
						{"marker_682","Hospital 3"}
					};
				};
			};
		};
	};
};