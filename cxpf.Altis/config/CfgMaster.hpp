#define true 1
#define false 0

/*
    Arquivo principal de configuração da maioria dos sistemas presentes no servidor
*/
class CxpBasic_Settings {

/* Config. Logs (Para Desenvolvedores) */
  /* Logs padroes do Tonic */
  battlEye_friendlyLogging = false; //False [default] - Read the logs from the server.rpt. True - Read the logs from the publicVariable.log. NOTE: Due to how diag_log works it will log to both files either way and the setting is merely for beautification purposes.
  player_advancedLog = true; //False [default] - No advanced logging. True - Logs house purchase and sale, vehicle purchase, sale, and chop shopping, police arrests, and gang creations. Search for: advanced_log
  player_moneyLog = true; //False [default] - No money logging. True - Logs player bank deposits, withdraws, and transfers, gang bank deposits and withdraws, money picked up off of the ground, and player robbery. Search for: money_log

  /* Debugger (Client), sim ... by Casperento */
  log_request_client = false; // debuga o numero de entradas retornadas pelo requestReceived do server, no client -- destivar quando fora de fase de testes
  log_count_request = false; // debuga o numero de entradas retornadas pelo requestReceived do server, no client -- destivar quando fora de fase de testes
  log_pullOut_dono = false; // debuga o dono do veiculo q recebe o comando PullOut, no client -- destivar quando estiver fora de fase de testes
  log_blacklisted_var = false; // debuga o valor da variável blacklisted
  log_money_cartel = false; // True : mostra log de transações efetuadas nos carteis
  log_dono_cartel = false; // True : mostra log de donos das badeiras dos carteis
  log_bounty_atual = false; // True : mostra log do array _bounty recebido do servidor
  log_arr_checker = false; // True : mostra log do array recebido no 'checker' do servidor
  log_arr_checker_hc = false; // True : mostra log do array recebido no 'checker' do HC
/* Config. Logs (Para Desenvolvedores) */

/* Regras Iniciais Basicas -> Casperento */
  // Menu de regras a serem apresentadas ao jogador
  // Procure por '<Package name="MenuEntrada_Termos">' no arquivo 'stringtable.xml' para customizar os titulos do menu
  regras_basicas_menuInit_alertON[] = {
    false, // True: liga pagina extra de aviso EXTREMAMENTE importante ; False: retira tela de aviso e pula direto para as regras do proximo array (regras_basicas_menuInit)
    { // Mensagens EXTREMAMENTE importantes de serem expostas ao player antes de ele concordar com as regras!
      "Este servidor esta em fase de testes",
      "Tenha paciencia e nos ajuda a arrumar o maximo numero de erros possiveis!",
      "Reporte bugs para a administracao para que possa ser corigido e entregue no lancamento oficial",
      "Apertando F5 voce abrira um menu para poder nos enviar o bug que voce presenciou, tente nos dar o maximo de detalhes que conseguir.",
      "E mais, SERVIDORES SEM CREDIBILIDADE ALGUMA ESTAO TENTANDO ATRAPALHAR NOSSO TRABALHO, MAS TENHA PACIENCIA",
      "ENQUANTO ELES USAM CTRL+C CTRL+V DE MISSAO DOS OUTROS, NOS ESTAMOS TRABALHANDO PARA TRAZER ALGO ORIGINAL E DE QUALIDADE PARA VOCES!!!",
      "Pedimos desculpas pelos demais transtornos que estamos tendo em nosa fase BETA."
    }
  };

  regras_basicas_menuInit[] = {
    "LEIA TODAS AS REGRAS EM NOSSO SITE ANTES DE ABRIR QUALQUER RECLAMAÇÃO",
    "Proibido o uso de hack/cheats.",
    "Proibido o abuso de dups e bugs (Glitches).",
    "Proibido desrespeitar qualquer um, tanto player quanto da staff.",
    "Proibido RDM e VDM.",
    "Obrigatório o uso do 'TAB' fora de áreas vermelhas.",
    "Respeitem o RolePlay, antes de julgar uma ação não pense só nas regras, pense no Bom senso.",
    "Lembre-se isso é um jogo, todos estão sujeitos a erros, ninguém nasce sabendo. Respeite para ser respeitado.",
    "Ninguém é melhor do que ninguém. Aceite isso e você se dará bem no servidor."
  };

	/* CXP Bug Tracker Config */
	cxp_bt_allowedChar = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789,.-+*&@$!#();çÇ/\| "; // Caracteres permitidos no sistema de reporte de bug
	cxp_bt_lenChar = 512; // Numero de caracteres permitidos no sistema de reporte de bug
	cxp_bt_delay = 3; // Delay necessario esperar para mandar outro reporte pro servidor [PADRAO: 10min]

/* Database Related Settings */
  /* Player Data Saving */
  save_virtualItems = true; //Save Virtual items (all sides)?
  // Array dos itens que sera salvo no inv. Y do player (Inventario Virtual)
  saved_virtualItems[] = {
  	"pickaxe",
  	"fuelEmpty",
  	"fuelFull",
  	"spikeStrip",
  	"lockpick",
  	"defuseKit",
  	"storageSmall",
  	"storageBig",
  	"redgull",
  	"coffee",
  	"waterBottle",
  	"apple",
  	"peach",
  	"tbacon",
  	"donuts",
  	"rabbit",
  	"salema",
  	"ornate",
  	"mackerel",
  	"tuna",
  	"mullet",
  	"catshark",
  	"rabbit_raw",
  	"salema_raw",
  	"ornate_raw",
  	"mackerel_raw",
  	"tuna_raw",
  	"mullet_raw",
  	"catshark_raw",
  	"turtle_soup",
  	"turtle_raw",
  	"hen",
  	"rooster",
  	"sheep",
  	"goat",
  	"hen_raw",
  	"rooster_raw",
  	"sheep_raw",
  	"goat_raw",
  	"defibrillator",
  	"toolkit",
  	"cenoura",
  	"abacaxi",
  	"batata",
  	"zipties",
  	"kzipties",
  	"cigarro",
  	"barracaP",
  	"barracaG",
  	"firewood",
  	"bafom",
  	"blindfold",
  	"cestaCS",
  	"chocolatBB",
  	"chocolatbarWW",
  	"pinga",
  	"latacerveja",
  	"plank",
  	"wood",
  	"campFire",
  	"woodaxe",
  	"enxada",
  	"cevada",
  	"cana",
    "fitaadesiva",
    "camisinha",
  	"zipties_legal",
  	"kzipties_legal",
  	"lockpick_cop",
    "boltcutter_cop"
  };
  save_playerStats = true; // Salvar sede, fome, HP e taxa de alcoolismo(By Casperento - apenas para civis e rebeldes)
  save_player_weapons = true; // Deixar Bombeiros/PM/Civis-Rebeldes salvarem suas armas?

  /* Vehicle Data Saving */
  save_vehicle_virtualItems = false; //Save virtual items inside the vehicle (all sides)(-- See defined items on next line --)
  save_vehicle_items[] = {
  	"pickaxe",
  	"fuelEmpty",
  	"fuelFull",
  	"spikeStrip",
  	"lockpick",
  	"defuseKit",
  	"storageSmall",
  	"storageBig",
  	"redgull",
  	"coffee",
  	"waterBottle",
  	"apple",
  	"peach",
  	"tbacon",
  	"donuts",
  	"rabbit",
  	"salema",
  	"ornate",
  	"mackerel",
  	"tuna",
  	"mullet",
  	"catshark",
  	"rabbit_raw",
  	"salema_raw",
  	"ornate_raw",
  	"mackerel_raw",
  	"tuna_raw",
  	"mullet_raw",
  	"catshark_raw",
  	"turtle_soup",
  	"turtle_raw",
  	"hen",
  	"rooster",
  	"sheep",
  	"goat",
  	"hen_raw",
  	"rooster_raw",
  	"sheep_raw",
  	"goat_raw",
  	"defibrillator",
  	"toolkit",
  	"cenoura",
  	"abacaxi",
  	"batata",
  	"zipties",
  	"kzipties",
  	"cigarro",
  	"barracaP",
  	"barracaG",
  	"firewood",
  	"bafom",
  	"blindfold",
  	"cestaCS",
  	"chocolatBB",
  	"chocolatbarWW",
  	"pinga",
  	"latacerveja",
  	"plank",
  	"wood",
  	"campFire",
  	"woodaxe",
  	"enxada",
  	"cevada",
  	"cana",
    "fitaadesiva",
    "camisinha",
  	"zipties_legal",
  	"kzipties_legal",
  	"lockpick_cop",
    "boltcutter_cop"
  };
  save_vehicle_inventory = false; //Save Arma inventory of vehicle to the database
  save_vehicle_fuel = true; //Save vehicle fuel level to the database (Impounded/Garaged).
  save_vehicle_damage = true; //Save vehicle damage to the database.
  save_vehicle_illegal = true; //This will allow cops to be advised when a vehicle, with illegal items in it, is impounded. This will also save illegal items as proof of crime, and needs "save_vehicle_virtualItems" set as true. Illegal items don't need to be set in save_vehicle_items[] for being saved, if it's enabled.

  /* Dynamic Market */
  // Se desabilitado com false, os precos serao controlados pelo CfgvItems.hpp..com true, pelo DB
  dynamic_market = true; //True: Desliga todo o sistema, inclusive o menu Mercado
  end_time = 21600; //Last time to sync prices (Default: 4 hours)
  sync_rate = 900; //Seconds between syncs to database (Default: 15 minutes)
  adjustment_delay = 1200; //Seconds it takes for price changes to hit the market (Default: 2 minutes)
  //Order these by factor starting with a factor of 1 (Default: Illegal Farms - 1, Legal Farms - 2, Hunting and Phishing - 3)
  market_categories[] = { "------------Farms Ilegais------------","--------Farms Legais--------","-----Especiarias-----"};

  /* AutoSave */
  autosaveInterval = 10; // Automatic saving intervall in minutes default [15]
  lockManuelSync = true; // locks manuel sync [true]
  lockSyncTime = 5; // Time in minutes [1] for locking manuel sync after automatic saving; ONLY ACTIVE IF lockManuelSync is set to true!
  chatInfo = true; // Turn to false if you don't like to see a saving message, [true] to got a message in system chat
  advancedChatInfo = true; // Turn to false, if you don't like to see extra informations, eg. Manual Saving is now blocked for 1 Minute; ONLY ACTIVE IF chatInfo is set to true!
  waitforManSave = true; // [True] for waiting until manuel saves has been completed; (recommended, saves server traffic)

/* System Settings */
  /* ATM & Federal Reserve System Configurations */
  noatm_timer = 15; //Time in minutes that players cannot deposit money after selling stolen gold.
  minimum_cops = 10; //Minimum cops required online to rob the Federal Reserve

  /* Death settings */
  // Procure por '<Package name="DeathCustomMsgs">' no arquivo 'stringtable.xml' para customizar as msgs
  player_death_custom_msg = true; //False [padrao] - Mensagens padroes de morte. True - Mostra mensagens customizadas de morte, como: Fulano matou beltrano com uma (arma) a (x) metros

  /* Basic System Configurations */
  enable_fatigue = false; //Set to false to disable the ARMA 3 fatigue system.
  total_maxWeight = 24; //Static variable for the maximum weight allowed without having a backpack
  respawn_timer = 300; // Tempo em segundos(dentro do jogo em minutos) que o player deve esperar para renascer, quando ha medicos online [PADRAO: 360seg=6min]
  respawn_timer_medOFF = -1; // Tempo em segundos(dentro do jogo em minutos) que o player deve esperar para renascer, sem ter medicos online [PADRAO: 240seg=4min]

  /* Channel 7 News Station Configurations */
  news_broadcast_cost = 100000; //Cost for a player to send a news station broadcast.
  news_broadcast_cooldown = 30; //Time in minutes that is required between news station broadcasts. (Default = 20 minutes)
  news_broadcast_header_length = 512; //Number of characters that a header can consist of. Anything over this may clip. This depends on the font size and various other factors. Adjust with caution.

  /* Clothing System Configurations */
  clothing_noTP = true;  //Disable clothing preview teleport? (true = no teleport. false = teleport)
  clothing_box = false; //true = teleport to a black box. false = teleport to somewhere on map. (It only affects the game if clothing_noTP is set as false)

  /* Escape Menu Configuration */
  escapeMenu_timer = 10; //Time required to pass before you can click the abort button in the escape menu.
  escapeMenu_respawn_timer = 10; //Time required to pass before you can click the respawn button in the escape menu.
  escapeMenu_displayExtras = false; //Display the players UID & serverName specified below in the escape menu.
  escapeMenu_displayText = "Obg por jogar com a gente!"; //Text displayed in the escape menu. Make it short.. around 20 characters.

  /* Fuel System Configurations */
  pump_service = true; //Allow users to use pump service on the map. Default = false
  fuel_cost = 25; //Cost of fuel per liter at fuel stations (if not defined for the vehicle already).
  service_chopper = 1000; //Cost to service chopper at chopper service station(Repair/Refuel).
  fuelCan_refuel = 100; //Cost to refuel an empty fuel canister at the fuel station pumps. (Be wary of your buy/sell prices on fuel cans to prevent exploits...)

  /* Gang System Configurations */
  gang_price = 300000; //Gang creation price. --Remember they are persistent so keep it reasonable to avoid millions of gangs.
  gang_upgradeBase = 50000; //The base cost for purchasing additional slots in a gang
  gang_upgradeMultiplier = 2.5; //CURRENTLY NOT IN USE
  gang_memberLimit = 50; // Limite de membros que uma gang pode ter (By Casperento)

  /* Housing System Configurations */
  house_limit = 3; // Num. maximo de casas que um jogador pode ter
  house_limit_timerP123 = 7; // Num. maximo de casas que um doador pode ter

  /* Hunting & Fishing System Configurations - Customizado por Casperento! */
  animaltypes_fish[] = { "Salema_F", "Ornate_random_F", "Mackerel_F", "Tuna_F", "Mullet_F", "CatShark_F", "Turtle_F" }; // Classnames dos peixes que você consegue pescar
  animaltypes_hunting[] = { "Sheep_random_F", "Goat_random_F", "Hen_random_F", "Cock_random_F", "Rabbit_F" }; // Classnames dos animais que você consegue caçar
  lista_animais_huntingZone[] = { "Sheep_random_F","Goat_random_F","Hen_random_F","Cock_random_F", "Rabbit_F" }; // Classnames dos animais que devem aparecer na Zona de Caça

  /* Item-related Restrictions */
  restrict_medic_weapons = false; //Set to false to allow medics to use any weapon --true will remove ANY weapon they attempt to use (primary,secondary,launcher)
  restrict_clothingPickup = false; //Set to false to allow civilians to pickup/take any uniform (ground/crates/vehicles)
  restrict_weaponPickup = true; //Set to false to allow civilians to pickup/take any weapon (ground/crates/vehicles)
  restricted_uniforms[] = { "U_Rangemaster", "U_B_CombatUniform_mcam_tshirt", "U_B_CombatUniform_mcam_worn", "U_B_survival_uniform" };
  restricted_weapons[] = { "hgun_P07_snds_F", "arifle_MX_GL_F" };

  /* Jail System Configurations */
  jail_seize_vItems[] = { "camisinha", "spikeStrip","lockpick","goldbar","blastingcharge","boltcutter","defusekit","heroin_unprocessed","heroinp","cannabis","marijuana","cocaine_unprocessed","cocap","turtle_raw","methi","methp", "zipties", "kzipties", "fitaadesiva", "blindfold" }; //Define VIRTUAL items you want to be removed from players upon jailing here. Use "jail_seize_inventory" for Arma inventory items.
  jail_seize_inventory = true; //Set to true to run the cop seize script on inmates. False will remove only weapons and magazines otherwise. (Basically used in case cops forget to seize items). [See Lines 106-111 below]
  sendtoJail_locations[] = { "police_hq_1", "police_hq_2", "police_hq_3", "Correctional_Facility" }; //Enter the variableName from the mission.sqm here to allow cops to send a person to jail at these locations.
  jail_forceWalk = true; // forçar andar dentro da cadeia (anti-pulo)
  jail_cloth = true; // Muda a roupa do jogador quando ele vai para a prisao - True : Sim , False : Nao

  /* Medical System Configurations */
  revive_cops = false; //true to enable cops the ability to revive everyone or false for only medics/ems.
  revive_civ = false; //true to enable civs the ability to revive everyone or false for only medics/ems or medic/ems/cops.
  revive_east = false; //true to enable opfor the ability to revive everyone or false for only medics/ems or medic/ems/cops.
  revive_fee = 10000; //Revive fee that medics will receive for revive that player
  revive_cost_player = 1000; //Revive fee that players have to pay for medics.
  hospital_heal_fee = 500; //Fee to heal at a hospital NPC
  revive_inst_on = true; // True: Liga sistema do revive instantaneo ; False: Desliga o sistema...
  revive_inst_fee = 300000; // Preco do revive instantaneo (APENAS PARA VIP 5 e 6)
  revive_inst_delay = 20; // Delay em segundos para o botao do revive de Chessus funcionar depois do jogador ter morrido, NAO COLOCAR MENOS QUE 20seg POR QUESTOES DE SEGURANÇA

  /* Paycheck & Bank System Configurations */
  bank_cop = 80000; //Quantia inicial de dinheiro no banco para novo COP
  bank_civ = 250000; //Quantia inicial de dinheiro no banco para novo CIV
  bank_med = 80000; //Quantia inicial de dinheiro no banco para novo MED

  /* Config. Customizada para TAGS -> Casperento */
    // Headgears(H_) e Goggles(G_) que sao considerados mascaras e escondem o nome (TAG) do player:
  tagsCFG_clothing_masks[] = { 
    "H_Shemag_olive", 
    "H_Shemag_khk", 
    "H_Shemag_tan", 
    "H_Shemag_olive_hs", 
    "H_ShemagOpen_khk", 
    "H_ShemagOpen_tan", 
    "G_Balaclava_blk", 
    "G_Balaclava_combat", 
    "G_Balaclava_lowprofile", 
    "G_Balaclava_oli", 
    "G_Bandanna_aviator",
    "G_Bandanna_beast", 
    "G_Bandanna_blk", 
    "G_Bandanna_khk", 
    "G_Bandanna_oli", 
    "G_Bandanna_shades", 
    "G_Bandanna_sport", 
    "G_Bandanna_tan", 
    "U_O_GhillieSuit", 
    "U_I_GhillieSuit", 
    "U_B_GhillieSuit",
    "U_B_T_Sniper_F",
    "U_O_T_Sniper_F",
    "U_B_FullGhillie_lsh",
    "U_B_FullGhillie_sard",
    "U_B_FullGhillie_ard",
    "U_O_FullGhillie_lsh",
    "U_O_FullGhillie_sard",
    "U_O_FullGhillie_ard",
    "U_I_FullGhillie_lsh",
    "U_I_FullGhillie_sard",
    "U_B_T_FullGhillie_tna_F",
    "U_O_T_FullGhillie_tna_F",
    "U_I_FullGhillie_ard",
    "H_RacingHelmet_1_black_F", 
    "H_RacingHelmet_1_red_F", 
    "H_RacingHelmet_1_white_F", 
    "H_RacingHelmet_1_blue_F", 
    "H_RacingHelmet_1_yellow_F", 
    "H_RacingHelmet_1_green_F", 
    "H_RacingHelmet_1_F", 
    "H_RacingHelmet_2_F", 
    "H_RacingHelmet_3_F", 
    "H_RacingHelmet_4_F" 
  };
    // ICONES E SUBTITULOS DAS TAGS (O TITULO DAS TAGS SEMPRE SERA O NOME DO JOGADOR)
  tagsCFG_icons_COP[] = {
    // cxp_coplevel : 1 a 17
    "icons\rec.paa",
    "icons\sld.paa",
    "icons\cab.paa",
    "icons\sar.paa",
    "icons\sar.paa",
    "icons\sar.paa",
    "icons\ten.paa",
    "icons\ten.paa",
    "icons\ten.paa",
    "icons\maj.paa",
    "icons\maj.paa",
    "icons\tcor.paa",
    "icons\cor.paa",
    "icons\pf.paa",
    "icons\pf.paa",
    "icons\pf.paa",
    "icons\pf.paa"
  };
  tagsCFG_subTitles_COP[] = {
    // cxp_coplevel : 1 a 17
    "Recruta",
    "Soldado",
    "Cabo",
    "3º Sargento",
    "2º Sargento",
    "1º Sargento",
    "Sub-Tenente",
    "2º Tenente",
    "1º Tenente",
    "Capitao",
    "Major",
    "Tenente-Coronel",
    "Coronel",
    "Estagiario",
    "Agente",
    "Delegado",
    "Superintendente"
  };
  tagsCFG_icons_MED[] = {
    // cxp_mediclevel : 1 a 9
    "icons\logo_supMed.paa",
    "icons\logo_supMed.paa",
    "icons\logo_supMed.paa",
    "icons\logo_supMed.paa",
    "icons\logo_supMed.paa",
    "icons\logo_supMed.paa",
    "icons\logo_supMed.paa",
    "icons\logo_supMed.paa",
    "icons\logo_supMed.paa"
  };
  tagsCFG_subTitles_MED[] = {
    // cxp_mediclevel : 1 a 9
    "Estudante",
    "Técnico em Enfermagem",
    "Enfermeiro",
    "Médico Residente",
    "Médico",
    "Cirurgião",
    "Cirurgião Chefe",
    "Subcomandante",
    "Comandante"
  };

  /* SALARIOS - CIV/COP/MED */
    // Salario CIV/REB
  paycheck_civ[] = {
    3000, // NAO DOADOR
    3900, // DOADOR 1
    4500, // DOADOR 2
    6000, // DOADOR 3
    7000, // DOADOR 4
    9500, // DOADOR 5
    10000  // DOADOR 6
  };
    // Salario COP
  paycheck_cop[] = {
    0,
    30000,  // NIVEL 1
    30000,  // NIVEL 2
    30000,  // NIVEL 3
    35000,  // NIVEL 4
    50000,  // NIVEL 5
    60000,  // NIVEL 6
    80000,  // NIVEL 7
    100000, // NIVEL 8
    30000,  // NIVEL 9
    30000,  // NIVEL 10
    30000,  // NIVEL 11
    35000,  // NIVEL 12
    50000,  // NIVEL 13
    60000,  // NIVEL 14
    80000,  // NIVEL 15
    100000, // NIVEL 16
    200000  // NIVEL 17
  };
    // Salario MED
  paycheck_med[] = {
    0,
    50000,  // NIVEL 1
    55000,  // NIVEL 2
    60000,  // NIVEL 3
    65000,  // NIVEL 4
    70000,  // NIVEL 5
    75000,  // NIVEL 6
    80000,  // NIVEL 7
    90000,  // NIVEL 8
    100000  // NIVEL 9
  };
  paycheck_period = 10;   //Scaled in minutes
  bank_transferTax = .05; //Tax that player pays when transferring money from ATM. Tax = Amount * multiplier

  /* Recursos Automatizados RP -> Casperento */
  remover_lic_motorista_navaia = false; // Remover licença de motorista do jogador navaia que atropelar alguem (True: Sim ; False: Não)
  price_reb_matar_civil = -1; // Preco que o rebelde paga ao matar um civil sem licenca rebelde [Padrao: R$100.000,00](-1 desativa o sistema)
  nocaute_em_safe = false; // Bloquear nocaute dentro da safe (True: bloqueia; False: Desbloqueia)
  atirar_safe_procurado = false; // Se atirar dentro de safe vai pra lista de procurado com Homicidio Involuntario (True: Liga; False: Desliga; Bounty Hunter nao sera adicionado)
  parachuteEspecial_minAltura = 100; // Altura minima para poder usar o para-quedas (em metros, obviamente)
  cxp_autoMessages[] = { // Mensagens automaticas a serem mostradas ao jogador
    "<br/><br/><img shadown='false' size='6' image='textures\interface\jB.paa'/><br/><br/>Doe qualquer quantia e ajude o servidor a permanecer online. Acesse nosso TS para mais informações:<br/> <t color='#ff00e7' size='1.5'>ts3.supremelife.com.br</t>",
    "<br/><br/><img shadown='false' size='6' image='textures\interface\tsl.paa'/><br/><br/>Precisa de se comunicar com seus amigos ? Entre em nosso TS:<br/> <t color='#00ffec' size='1.5'>ts3.supremelife.com.br</t>",
    "<br/><br/><img shadown='false' size='6' image='textures\interface\jB.paa'/><br/><br/>Quer ajudar o servidor a permanecer online ? Entre em contato com o suporte agora mesmo em nosso TS:<br/> <t color='#6fff00' size='1.5'>ts3.supremelife.com.br</t>"
  };
  cxp_autoMessages_delay = 600; // Tempo em segundos de diferenca entre cada mensagem (padrao 10min=600segundos)
  cxp_wlc_tits[] = {{"Administradores","Smoke@xiu e Curcio","#ff0000","#ffffff"},{"Desenvolvedor","Casperento","#ff0000","#ffffff"}}; // ["Titulo","Subtitulo","corDoTituloEmHex","corDoSubTitEmHex"]
  cxp_wlc_dur = 7; // Tempo de duracao de cada um dos creditos de entrada
  cxp_wlc_fades = 1; // Tempo de fadeIn e fadeOut de cada texto dos creditos de entrada
  cxp_gestos_limit = 5; // Quantas vezes o imbecil pode usar os gestos do F1,F2,F3,etc com audio
  cxp_radCorp = false; // True: medicos e policiais tomam dano na zona radiativa, False: nao tomam dano
  
  /* Config Barracas -> Casperento */
  class cxp_barracas {
    limite = 3; // Numero de barracas que um jogador pode montar no servidor!
    class Land_TentA_F {
      timerMon = 10; // Timer para montar barraca
      timerDes = 10; // Timer para desmontar barraca
      armazenamento = 100; // Capacidade do inventario virtual
    };
    class Land_TentDome_F {
      timerMon = 10; // Timer para montar barraca
      timerDes = 10; // Timer para desmontar barraca
      armazenamento = 170; // Capacidade do inventario virtual
    };
  };

  /* Avisos do 'TAB' -> Casperento */
  // Procure por '<Package name="Assalto_DG_strings">' no arquivo 'stringtable.xml' para customizar as msgs
  /*
    Exemplo:
      avisos_tab_cfg[] = {
        {
          "civ", // Nao altere aqui!!! --> "civ", "cop", "med"
          {
            "TituloBotao1",
            "Descricao",
            "MsgFinal",
            "AudioFinal"
          },
          {
            "TituloBotao2",
            "Descricao",
            "MsgFinal",
            "AudioFinal"
          },
          {
            "TituloBotao3",
            "Descricao",
            "MsgFinal",
            "AudioFinal"
          }
        }
      };
  */
  avisos_tab_distancia = 500; // Distancia máxima que um alvo pode estar distante de um player anunciante (em metros) -- A AREA DE PVP GERADA PELO TAB SERA 4x MAIOR QUE ESSA DISTANCIA
  avisos_tab_tempoTgg = 180; // Tempo em segundos pro marcador da area de pvp TAB ficar "online" pra avisar os imbecis ao redor
  avisos_tab_cfg[] = {
    // CIVILIAN
    {
      "civ", // Nao altere esta string!!!
      { // Button 1
        "Assalto",
        "Isso e um assalto, mao na cabeca (SHIFT + B) rapa. Do contrario a gente te mata!",
        "Isso é um assalto, mão na cabeça (SHIFT + B) rapá. Do contrário a gente te mata!",
        "mAssalto_1"
      },
      { // Button 2
        "Veiculo",
        "Pare o carro e saia dele com a mao na cabeca. Isso, desse jeito..do contrario a gente te mata !",
        "Pare o carro e saia dele com a mão na cabeça. Isso, desse jeito..do contrario a gente te mata!",
        "mAssalto_2"
      },
      { // Button 3
        "Vaza",
        "Vaza daqui ou morre playboy !",
        "Vaza daqui ou morre playboy!",
        "sms"
      }
    },
    // COPS
    {
      "cop", // Nao altere esta string!!!
      { // Button 1
        "Abordar",
        "Policia: mao na cabeca (SHIFT + B) cidadao.",
        "Polícia : mão na cabeça (SHIFT + B) cidadão.",
        "MnCCop"
      },
      { // Button 2
        "Veiculo",
        "Policia: saia do veiculo e coloque as maos na cabeca (SHIFT + B).",
        "Polícia: desça do veículo e coloque suas mãos na cabeça (SHIFT + B).",
        "abordagemcop"
      },
      { // Button 3
        "Afaste-se",
        "Policia: afaste-se do local por favor cidadao.",
        "Polícia: afaste-se do local por favor cidadão.",
        "saiadaarea"
      }
    },
    // MEDICS
    {
      "med", // Nao altere esta string!!!
      { // Button 1
        "Aviso 1",
        "Volte aqui e siga o RP meu caro.",
        "Samu : volte aqui e siga o RP meu caro.",
        "avisoUmSamu"
      },
      { // Button 2
        "Aviso 2",
        "Volte aqui e siga o RP meu caro. Com multa automatica de R$%1!", // NAO APAGUE O '%1' DA STRING, CASO CONTRARIO NAO SERA MOSTRADO O PRECO DA LICENCA NO TOOLTIP
        "Samu : volte aqui e siga o RP meu caro. Foi lhe cobrado uma multa automatica por isso !",
        "avisoUmSamu"
      },
      { // Button 3
        "Afaste-se", // --> deixe vazio para desligar o botao
        "Samu: afaste-se do local por favor cidadao.",
        "Samu: afaste-se do local por favor cidadao.",
        ""
      }
    }
  };

  /* Bounty Hunter Config -> Casperento */
  bCFG_bounty_armas[] = {"arifle_SPAR_02_blk_F"}; // Armas com balas de borracha [CONSULTA => https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Weapons ]
  bCFG_bounty_bullet[] = {"B_556x45_Ball_Tracer_Red"}; // Municoes de borracha (projetil), correspondente a municao do bCFG_bounty_muni[] [CONSULTA => https://community.bistudio.com/wiki/Arma_3_CfgMagazines ]
  bCFG_bounty_muni[] = {"150Rnd_556x45_Drum_Mag_Tracer_F"}; // Municoes de borracha (municao) [CONSULTA => https://community.bistudio.com/wiki/Arma_3_CfgMagazines ]
  bCFG_bloquear_arma = true; // True: impede que outros jogadores peguem a arma de bala de borracha, False: nao impede
  bCFG_distancia_borracha = 200; // Distancia em metros que a bala de borracha alcanca (Em METROS)
  bCFG_tempo_bounties = 120; // De quanto em quanto tempo o BH pode ter alvos-recompensas ativos (em seg) [PADRAO: 120seg=2min]
  bCFG_raio_track = 300; // Raio da circunferencia do rastreador no mapa (Padrao: 300m, Diametro: 600m) (Em METROS)
  bCFG_cadeia_mrks[] = {"BH_spawn_veh","Correctional_Facility"}; // Perto de qual marcador o bounty hunter vai conseguir enviar alguem para a prisao
  bCFG_delay_recomp = 60; // Delay que o player deve esperar para localizar outra recompensa novamente (em segundos)
  bCFG_perdao_entrada = 100000; // Taxa cobrada do player para retirar ele da lista de procurados quando ele entra para os BHs , caso esteja nela [PADRAO: 100k]
  bCFG_fire_safezone = false; // True: Bounty Hunter pode atirar na safe. False: BH tomara aviso se atirar dentro de safezone
  bCFG_alvo_valor_min = 2000; // Valor minimo que o jogador deve ter na cabeca para ser escolhido como alvo recompensa, menor que esse valor nao sera cacado pelos BHs

  /* Carteis Config -> Casperento */
  parcela_cartel = true; // True : liga ... False : desliga -> 10% do valor total ganho ao vender drogas (heroina,coca,meta) vai para o cartel(gangue) que domina o mercado
  parcela_cartel_multi = .1;// .1 ou 0.1 = 10% de desconto do farm de todo mundo na hora da venda para o traficante (drogas)

  /* Radares de velocidade -> Casperento */
  veloc_estrada = 130; // Velocidade permitida em radares de estrada
  veloc_cidade = 110; // Velocidade permitida em radares de cidades (safe)
  valor_multa = 3000; //preço a ser descontado se o player levar multa por excesso de veloc. (com licença de motorista)
  valor_multa_smot = 4000; //preço a ser descontado se o player levar multa por excesso de veloc. (sem licença de motorista)

  /* Sistema de Acampamento -> Casperento */
  fogueira_timer = 600; // Tempo em seg. para a fogueira ficar 'viva' antes de ser eliminada do mapa [PADRAO: 600seg=10min]
  quantidade_min_madPfog = 1; // Quantidade minima necessaria de 'Madeira para fogueira' para montar a fogueira

  /* Auction House Settings (Leilao) */
  ah_listing_limit = 2; //Amount of listings per player
  ah_auctioneers[] = { auctioner_1, auctioner_2, auctioner_3, auctioner_4 }; //Object var names of your auctioneers
  ah_percent = 30; // Percentage of tax to pay when selling item.
  ah_time_to_expire = 7; //Time until the listing is expired. in days
  ah_time_to_delete = 3; //Time until the listing is deleted after expiration. in days

  /* Player Job System Configurations */
  delivery_points[] = { "dp_1", "dp_2", "dp_3", "dp_4", "dp_5", "dp_6", "dp_7", "dp_8", "dp_9", "dp_10", "dp_11", "dp_12", "dp_13", "dp_14", "dp_15", "dp_15", "dp_16", "dp_17", "dp_18", "dp_19", "dp_20", "dp_21", "dp_22", "dp_23", "dp_24", "dp_25" };
  fuelTank_winMultiplier = 2; //Win Multiplier in FuelTank Missions. Increase for greater payout. Default = 1

  /* Search & Seizure System Configurations */
  seize_exempt[] = { "Binocular", "ItemWatch", "ItemCompass", "ItemGPS", "ItemMap", "NVGoggles", "FirstAidKit", "ToolKit" }; //Arma items that will not get seized from player inventories
  seize_uniform[] = {
		"U_Rangemaster",
		"U_O_CombatUniform_ocamo",
		"U_B_SpecopsUniform_sgg",
		"U_O_CombatUniform_oucamo",
		"U_O_SpecopsUniform_ocamo",
		"U_O_SpecopsUniform_blk",
		"U_O_OfficerUniform_ocamo",
		"U_I_CombatUniform_tshirt",
		"U_I_CombatUniform_shortsleeve",
		"U_I_OfficerUniform",
		"U_KerryBody",
		"U_IG_Guerilla1_1",
		"U_BG_leader",
		"U_OG_Guerilla1_1",
		"U_OG_leader",
		"U_B_CTRG_3",
		"U_B_CTRG_Soldier_urb_1_F",
		"U_B_CTRG_Soldier_urb_1_F",
		"U_B_CTRG_Soldier_F",
		"U_B_CTRG_Soldier_3_F",
		"U_B_CTRG_Soldier_2_F",
		"U_I_G_Story_Protagonist_F",
		"U_I_G_resistanceLeader_F",
		"U_O_T_Officer_F",
		"U_I_C_Soldier_Para_1_F",
		"U_I_C_Soldier_Para_2_F",
		"U_I_C_Soldier_Para_3_F",
		"U_I_C_Soldier_Para_4_F",
		"U_B_GhillieSuit",
		"U_O_GhillieSuit",
		"U_I_GhillieSuit",
		"U_B_T_Sniper_F",
		"U_O_T_Sniper_F",
		"U_B_FullGhillie_lsh",
		"U_B_FullGhillie_sard",
		"U_B_FullGhillie_ard",
		"U_O_FullGhillie_lsh",
		"U_O_FullGhillie_sard",
		"U_O_FullGhillie_ard",
		"U_I_FullGhillie_lsh",
		"U_I_FullGhillie_sard",
		"U_B_T_FullGhillie_tna_F",
		"U_O_T_FullGhillie_tna_F",
		"U_I_FullGhillie_ard"
	}; //Any specific uniforms you want to be seized from players
  seize_vest[] = {
		"V_TacVest_blk_POLICE",
		"V_Rangemaster_belt",
		"V_BandollierB_khk",
		"V_BandollierB_cbr",
		"V_BandollierB_oli",
		"V_PlateCarrier_Kerry",
		"V_PlateCarrier1_rgr",
		"V_PlateCarrier2_rgr",
		"V_PlateCarrierIA1_dgtl",
		"V_PlateCarrierIA2_dgtl",
		"V_PlateCarrierL_CTRG",
		"V_PlateCarrierH_CTRG",
		"V_PlateCarrierSpec_rgr",
		"V_PlateCarrierGL_rgr",
		"V_Chestrig_khk",
		"V_Chestrig_rgr",
		"V_Chestrig_oli",
		"V_TacVest_khk",
		"V_TacVest_brn",
		"V_TacVest_camo",
		"V_HarnessOGL_gry",
		"V_TacVestCamo_khk",
		"V_PlateCarrier2_blk",
		"V_PlateCarrier1_blk"
	}; //Any specific vests you want to be seized from players
  seize_headgear[] = {
		"H_Cap_police",
		"G_Diving",
		"H_Booniehat_mcamo",
		"H_Beret_blk_POLICE",
		"H_HelmetB_plain_mcamo",
		"H_Booniehat_mcamo",
		"H_Beret_02",
		"H_Beret_Colonel",
		"H_Beret_red",
		"H_Beret_blk",
		"H_PilotHelmetFighter_B"
	}; //Any hats or helmets you want seized from players
  seize_minimum_rank = 1; //Required minimum CopLevel to be able to seize items from players
  restrictItems_min_rank = 3; // Nivel minimo para usar o alguns itens virtuais da cop (alicate, chave mestra e tapete de espinhos)
  patente_min_perdao_wanted = 4; // Nivel minimo para dar perdao na lista de procurado da policia [4 = Sargento]

	/* Samu Extra Func Config -> Casperento */
	seize_med_weapons[] = {
		"hgun_Pistol_heavy_02_F",
		"hgun_ACPC2_F",
		"hgun_Pistol_heavy_01_MRD_F",
		"hgun_Rook40_F",
		"arifle_SDAR_F",
		"arifle_TRG20_F",
		"arifle_TRG21_F",
		"arifle_Mk20_F",
		"arifle_CTAR_ghex_F",
		"arifle_AKS_F",
		"srifle_DMR_07_hex_F",
		"arifle_MX_pointer_F",
		"arifle_MXC_F",
		"arifle_MXM_F",
		"arifle_MX_SW_pointer_F",
		"arifle_AK12_F",
		"srifle_EBR_F",
		"srifle_DMR_03_F",
		"srifle_DMR_06_olive_F",
		"LMG_Mk200_F",
		"LMG_Zafir_F",
		"srifle_DMR_02_F"
	};
	seize_med_magazines[] = {
		"6Rnd_45ACP_Cylinder",
		"9Rnd_45ACP_Mag",
		"11Rnd_45ACP_Mag",
		"16Rnd_9x21_Mag",
		"30Rnd_556x45_Stanag_Tracer_Red",
		"20Rnd_556x45_UW_mag", "",
		"30Rnd_545x39_Mag_Tracer_F",
		"20Rnd_650x39_Cased_Mag_F",
		"30Rnd_65x39_caseless_mag_Tracer",
		"100Rnd_65x39_caseless_mag_Tracer",
		"30Rnd_762x39_Mag_Tracer_F",
		"30Rnd_580x42_Mag_Tracer_F",
		"20Rnd_762x51_Mag",
		"200Rnd_65x39_cased_Box_Tracer",
		"150Rnd_762x54_Box_Tracer",
		"10Rnd_338_Mag"
	};
	seize_med_acessorios[] = {
		"optic_Aco",
		"optic_Holosight",
		"optic_Arco",
		"optic_Hamr",
		"optic_ERCO_snd_F",
		"optic_MRCO",
		"optic_DMS",
		"optic_AMS",
		"optic_AMS_khk",
		"optic_AMS_snd",
		"bipod_01_F_blk"
	};
  medico_imortal = true; // True: medico nao morre, False: medico morre -- MAS MORRERA DE FOME OU DE SEDE DE TODO JEITO!!!
  multa_autom_samu = 5000; // Valor da multa automatica enviada para o player que fugir do samu
  samu_bote = "C_Rubberboat"; // Classname do bote que sera spawnado para ser o bote salva-vidas
  heli_samu_bote[] = { // Helicopteros capazes de dropar o bote salva-vidas
    "B_Heli_Light_01_F",
    "O_Heli_Light_02_unarmed_F",
    "I_Heli_light_03_unarmed_F"
  };
  heli_samu_bote_timer = 600; // Tempo em seg. para dropar um novo bote [Padrão: 10min = 600seg]
  deadList_raioMultiDead = 100; // Raio de alcance, em metros, da circunferencia que sera marcada na area que contiver mais de 1 morto proximo ao outro (ambos serao removidos da lista de mortos para que outros medicos nao escolham os mesmos pacientes)

  /* Script de assaltos -> Casperento */
  premio_assalto_posto = 150000; // preco granho ao assaltar um posto (PREÇO FIXO)
  minCopOn_assalto_posto = 2; // Numero de cops minimo para assaltar um posto
  tempoVoltarNpc_assalto_posto = 300; // Tempo em seg. para voltar as ações normais do npc do posto, para assaltar novamente (PADRAO: 300seg = 5min)

  premio_assalto_banco = 300000; // preco granho ao assaltar uma AGENCIA (PREÇO FIXO)
  minCopOn_assalto_banco = 3; // Numero de cops minimo para assaltar uma AGENCIA
  tempoVoltarNpc_assalto_banco = 2400; // Tempo em seg. para poder assaltar determinada AGENCIA novamente (PADRAO: 300seg = 5min)

  /* Menu Prefeitura -> Casperento */
  menu_prefeitura_on = true; // Liga/Desliga menu da prefeitura
  menu_prefeitura_licenses[] = { // Nome das licencas (disponiveis no CfgLicenses) que devem aparecem no menu de compra da Prefeitura
    "driver",
    "boat",
    "pilot",
    "trucking"/*,
    "home"*/
  };

  /* Vehicle System Configurations */
  chopShop_vehicles[] = { "Car", "Air" }; //Vehicles that can be chopped. (Can add: "Ship" and possibly more -> look at the BI wiki...)
  vehicle_infiniteRepair[] = {true, true, true, false}; //Set to true for unlimited repairs with 1 toolkit. False will remove toolkit upon use. civilian, west, independent, east
  vehicleShop_rentalOnly[] = {}; //Vehicles that can only be rented and not purchased. (Last only for the session)

  /* Config Forcar entrada em veiculos DLC -> Casperento */
  // Lista dos veiculos de dlc que podem ser usados sem ter as devidas DLC's
  dlc_vehicles_list[] = {
    "C_Offroad_02_unarmed_F",
    "B_T_LSV_01_armed_F",
    "B_T_LSV_01_unarmed_F",
    "O_T_LSV_02_armed_F",
    "O_T_LSV_02_unarmed_F",
    "B_T_UAV_03_F",
    "C_Plane_Civil_01_racing_F",
    "C_Plane_Civil_01_F",
    "O_T_UAV_04_CAS_F",
    "B_T_VTOL_01_armed_F",
    "O_T_VTOL_02_infantry_F",
    "I_C_Boat_Transport_02_F",
    "I_MRAP_03_F",
    "C_Scoooter_Transport_01_F",
    "C_Boat_Transport_02_F",
    "C_Kart_01_Blu_F",
    "C_Kart_01_Red_F",
    "C_Kart_01_Fuel_F",
    "C_Kart_01_Vrana_F",
    "B_Heli_Transport_03_F",
    "B_Heli_Transport_03_unarmed_F",
    "O_Heli_Transport_04_F",
    "O_Heli_Transport_04_ammo_F",
    "O_Heli_Transport_04_bench_F",
    "O_Heli_Transport_04_box_F",
    "O_Heli_Transport_04_covered_F",
    "O_Heli_Transport_04_fuel_F",
    "O_Heli_Transport_04_medevac_F",
    "O_Heli_Transport_04_repair_F",
    "I_Heli_Transport_02_F",
    "B_T_VTOL_01_vehicle_F",
    "B_T_VTOL_01_infantry_F",
    "O_LSV_02_unarmed_F",
    "C_Van_02_medevac_F",
    "C_Van_02_vehicle_F",
    "C_Van_02_service_F",
    "C_Van_02_transport_F"
  };

  /* Porcentagens de desconto de todas as lojas */
  purchase_multiplier_CIVILIAN = 1; //Civilian Vehicle Buy Price = Config_Vehicle price * multiplier
  purchase_multiplier_COP      = 1; //Cop Vehicle Buy Price = Config_Vehicle price * multiplier
  purchase_multiplier_MEDIC    = 1; //Medic Vehicle Buy Price = Config_Vehicle price * multiplier
  purchase_multiplier_OPFOR    = 1; // -- NOT IN USE -- Simply left in for east support.

  purchase_multiplier_umpLic = .85;
  purchase_multiplier_uiLic = .75;
  purchase_multiplier_typeLic = .5;
  purchase_multiplier_typeLis = .4;

  /* Porcentagens de desconto dos alugueis de veiculos */
  vehicle_rental_multiplier_CIVILIAN = .5; //Civilian Vehicle Rental Price = Config_Vehicle price * multiplier
  vehicle_rental_multiplier_COP      = .5; //Cop Vehicle Rental Price = Config_Vehicle price * multiplier
  vehicle_rental_multiplier_MEDIC    = .5; //Medic Vehicle Rental Price = Config_Vehicle price * multiplier
  vehicle_rental_multiplier_OPFOR    = .5; // -- NOT IN USE -- Simply left in for east support.

  vehicle_rental_multiplier_umpLic = .35;
  vehicle_rental_multiplier_uiLic = .34;
  vehicle_rental_multiplier_typeLic = .33;
  vehicle_rental_multiplier_typeLis = .32;

  /* Porcentagens de desconto de vendas */
  vehicle_sell_multiplier_CIVILIAN = .4; //Civilian Vehicle Garage Sell Price = Vehicle Buy Price * multiplier
  vehicle_sell_multiplier_COP      = .4; //Cop Vehicle Garage Sell Price = Vehicle Buy Price * multiplier
  vehicle_sell_multiplier_MEDIC    = .4; //Medic Vehicle Garage Sell Price = Vehicle Buy Price * multiplier
  vehicle_sell_multiplier_OPFOR    = .4; // -- NOT IN USE -- Simply left in for east support.

  /* Porcentagens de desconto dos seguros de veiculos */
  vehicle_insurance_multiplier_CIVILIAN = .3; //Civilian Vehicle Insurance Price = Vehicle Buy Price * multiplier
  vehicle_insurance_multiplier_COP      = .3; //Cop Vehicle Insurance Price = Vehicle Buy Price * multiplier
  vehicle_insurance_multiplier_MEDIC    = .3; //Medic Vehicle Insurance Price = Vehicle Buy Price * multiplier
  vehicle_insurance_multiplier_OPFOR    = .3; // -- NOT IN USE -- Simply left in for east support.

  vehicle_insurance_multiplier_umpLic = .25;
  vehicle_insurance_multiplier_uiLic = .20;
  vehicle_insurance_multiplier_typeLic = .15;
  vehicle_insurance_multiplier_typeLis = .10;

  /* Desmanche */
  vehicle_chopShop_multiplier = .3; //Chop Shop price for vehicles. TO AVOID EXPLOITS NEVER SET HIGHER THAN A PURCHASE/RENTAL multipler!   Payout = Config_vehicle Price * multiplier

  /* Retirar da garagem */
  vehicle_retrieval_multiplier = .1; //Pull from garage cost --> Cost takes the playersides Buy Price * multiplier
  vehicle_retrieval_multiplier_COP = .1;
  vehicle_retrieval_multiplier_MED = .1;

  vehicle_retrieval_multiplier_umpLic = .05;
  vehicle_retrieval_multiplier_uiLic = .05;
  vehicle_retrieval_multiplier_typeLic = .05;
  vehicle_retrieval_multiplier_typeLis = .05;

  /* Apreender veículo COP/SAMU */
  vehicle_cop_impound_price = 10000; // quantia que o policial ganha ao apreender um veiculo
  vehicle_med_impound_price = 5000; // quantia que o medico ganha ao apreender um veiculo

  disableCommanderView = true; //false - Group leaders can access the commander view. true [default] - Group leaders cannot access the commander view.
                              //Commander/tactical view is accessed via pressing . [NUM] by default. It raises the camera significantly higher and steeper above the player in order to give a boarder tactical view of the surrounding area.

	/* Wanted System Settings */
  /* crimes[] = {String, Bounty, Code} */
  crimes[] = {
    {"STR_Crime_187V","2000","187V"},
    {"STR_Crime_187","10000","187"},
	{"STR_Crime_175","15000","175"},
    {"STR_Crime_901","1000000","901"},
    {"STR_Crime_215","30000","215"},
    {"STR_Crime_213","50000","213"},
    {"STR_Crime_211","80000","211"},
    {"STR_Crime_207","100000","207"},
    {"STR_Crime_207A","50000","207A"},
    {"STR_Crime_390","10000","390"},
    {"STR_Crime_487","200000","487"},
    {"STR_Crime_488","20000","488"},
    {"STR_Crime_480","5000","480"},
    {"STR_Crime_481","15000","481"},
    {"STR_Crime_482","80000","482"},
    {"STR_Crime_483","200000","483"},
    {"STR_Crime_459","14000","459"},
    {"STR_Crime_666","10000","666"},
    {"STR_Crime_667","90000","667"},
    {"STR_Crime_668","3000","668"},
    {"STR_Crime_1000","150000","1000"},
    {"STR_Crime_1","5000","1"},
    {"STR_Crime_2","20000","2"},
    {"STR_Crime_3","10000","3"},
    {"STR_Crime_5","20000","5"},
    {"STR_Crime_6","1000","6"},
    {"STR_Crime_7","5000","7"},
    {"STR_Crime_8","40000","8"},
    {"STR_Crime_9","45000","9"},
    {"STR_Crime_10","65000","10"},
    {"STR_Crime_11","80000","11"},
    {"STR_Crime_12","16000","12"},
    {"STR_Crime_13","15000","13"},
    {"STR_Crime_14","10000","14"},
    {"STR_Crime_15","60000","15"},
    {"STR_Crime_16","15000","16"},
    {"STR_Crime_17","10000","17"},
    {"STR_Crime_18","40000","18"},
    {"STR_Crime_19","20000","19"},
    {"STR_Crime_20","5000","20"},
    {"STR_Crime_21","20000","21"},
    {"STR_Crime_22","50000","22"},
    {"STR_Crime_23","100000","23"},
    {"STR_Crime_24","10000","24"},
    {"STR_Crime_25","20000","25"},
    {"STR_Crime_26","8000","26"},
    {"STR_Crime_27","5000","27"},
    {"STR_Crime_28","10000","28"}
  };
};

// Quer comprar este sistema ? Me envie um e-mail! -> devcjax@gmail.com
class cxp_maca_config {
	/* Configure de acordo com seu servidor */
	cxp_maca_gMd = "altislife"; // Modos de jogo compativeis: "altislife" e "coop" ("coop" deve ser utilizado para os modos de jogo que nao sao o Altis Life)
	
	/* Cores disponiveis para maca:
		Vermelha - "Land_Stretcher_01_F"
		Verde    - "Land_Stretcher_01_olive_F"
		Areia    - "Land_Stretcher_01_sand_F"
	*/
	cxp_maca_name = "Land_Stretcher_01_F"; // Cole o classname da cor da maca que voce quer aqui                                                     [PADRAO: "Land_Stretcher_01_F"]
	cxp_veh_maca[] = {"C_Van_02_medevac_F"}; // Veiculos que podem 'dar' maca para o medico                                                          [PADRAO: "C_Van_02_medevac_F"]
	cxp_maca_nb = 2; // Numero de macas disponiveis para cada medico (em qualquer veiculo que ele tentar tirar)                                      [PADRAO: 2 macas]
	cxp_maca_timer = 3; // Delay (em segundos) para guardar a maca                                                                             		 [PADRAO: 3 seg]
	cxp_maca_retSide[] = {"med","cop"}; // Times que podem usar a acao 'Guardar Maca' ("cop"=west/ "med"=independent /"civ"=civilian/ "red"=east)    [PADRAO: "med","cop"]
	cxp_maca_lockIn = true; // True: nao deixa o paciente sair do veiculo que ele foi colocado pelo medico ... False: deixa o paciente sair..        [PADRAO: 'true'] -- recomendado deixar 'true' no altislife
	
	/* Exclusivo COOP */
	cxp_maca_condition = "alive player"; // Condicoes para que as opcoes do sistema aparecam para o jogador (Ex: "(playerSide isEqualTo independent)" -> restringe o uso das acoes para jogadores do time VERDE) !!!-DEIXE SEMPRE 'alive player' COMO BASE-!!!
	cxp_maca_IAComp = false; // True: sistema funcionara com bots e players ... False: sistema funcionara apenas com players
	
	/* Mensagens do sistema */
	cxp_maca_msg_inVeh = "Voce nao pode entrar num veiculo enquanto estiver segurando uma maca!";
	cxp_maca_msg_nullTg = "Objeto invalido para pegar maca!";
	cxp_maca_msg_pegBlk = "Voce nao pode pegar outra maca enquanto estiver segurando outra coisa!";
	cxp_maca_msg_pegLimt = "Voce ja retirou todas as macas que consegues carregar!";
	cxp_maca_msg_btnGd = "Guardar Maca";
	cxp_maca_msg_btnPg = "<t color='#00ff38'>Pegar Maca</t>";
	cxp_maca_msg_btnCg = "<t color='#00ff38'>Carregar Maca</t>";
	cxp_maca_msg_btnSt = "<t color='#00ff38'>Soltar Maca</t>";
	cxp_maca_msg_btnCv = "<t color='#00ff38'>Colocar Maca No Veiculo</t>";
	cxp_maca_msg_btnCm = "<t color='#00ff38'>Colocar na Maca</t>";
	cxp_maca_msg_retBots = "<t color='#ff0000'>Retirar Bots do veiculo</t>";
	cxp_maca_msg_sysCt1 = "Preparando a maca para ser guardada...";
	cxp_maca_msg_sysCt2 = "Processo interrompido. Largando maca no chao...";
	cxp_maca_msg_sysCt3 = "Maca guardada com sucesso!";
	cxp_maca_msg_rmBlk = "Voce nao pode remover a maca enquanto estiver carregando um paciente!";
	cxp_maca_msg_rmAdv = "Segure a barra de espaco/scroll para completar a acao !!!";
	cxp_maca_msg_invdTg = "Alvo invalido!";
	cxp_maca_msg_mcStrd = "Maca guardada com sucesso!";
	cxp_maca_msg_actBlk = "Voce nao pode completar esta acao no momento...";
	cxp_maca_msg_vehFull = "Nao é possivel carregar mais pacientes neste veiculo!";
};