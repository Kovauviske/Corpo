waitUntil {!isNull player && player isEqualTo player};
if (player diarySubjectExists "controls") exitWith {};

player createDiarySubject ["information","Desenvolvedores"];
player createDiarySubject ["serverrules","Regras"];
player createDiarySubject ["farmss","Preços de Farms"];
player createDiarySubject ["controls","Controles"];

/*  Example
    player createDiaryRecord ["", //Container
        [
            "", //Subsection
                "
TEXT HERE<br/><br/>
                "
        ]
    ];
*/

    player createDiaryRecord ["information",
        [
            "Créditos",
                "
CXP Framework desenvolvida por Casperento<br/>
Framework baseada na oficial do AltislifeRPG por Tonic<br/>
                "
        ]
    ];

    player createDiaryRecord ["serverrules",
        [
            "Regras Gerais",
                "
NOSSAS REGRAS ESTÃO PRESENTES E EM CONSTANTE ATUALIZAÇÃO EM NOSSO SITE, BAIXE EM:<br/>
<font color='#00fff9'>Acesse o nosso site : www.supremelife.com.br/regras</font><br/><br/>
				"
        ]
    ];

// Farms
    player createDiaryRecord ["farmss",
        [
            "Farms Legais",
                "
OBS. 1: ABRA SEU INVENTÁRIO VIRTUAL NA TECLA 'Y', E ABRA A ABA 'MERCADO' PARA ACOMPANHAR OS PREÇOS DE VENDA DOS ITENS!<br/>
OBS. 2: Os itens nao processados sao 2kg mais pesados que os da lista a seguir!!!<br/>
Preços das licenças dos Farms Legais/Peso do item não processado -<br/><br/>
1. Cerveja - R$ 1.500 = Pt1. R$ 750 + Pt2. R$ 750 |-Peso (Processado):4kg-| <br/>
2. Pinga - R$ 1.500 = Pt1. R$ 750 + Pt2. R$ 750 |-Peso (Processado):4kg-| <br/>
3. Chocolate - R$ 2.000 |-Peso (Processado):4kg-| <br/>
4. Madeira - R$ 2.150 |-Peso (Processado):4kg-| <br/>
5. Cobre - R$ 2.500 |-Peso (Processado):4kg-| <br/>
6. Cimento - R$ 2.500 |-Peso (Processado):4kg-| <br/>
7. Ferro - R$ 3.500 |-Peso (Processado):4kg-| <br/>
8. Vidro/Areia - R$ 4.000 |-Peso (Processado):4kg-| <br/>
9. Sal - R$ 5.000 |-Peso (Processado):4kg-| <br/>
10. Petróleo - R$ 17.500 |-Peso (Processado):4kg-| <br/>
11. Diamante - R$ 20.000 |-Peso (Processado):4kg-| <br/>
12. Maconha - R$ 50.000 |-Peso (Processado):3kg-|<br/>
                "
        ]
    ];

    player createDiaryRecord ["farmss",
        [
            "Farms Ilegais",
                "
OBS. 1: ABRA SEU INVENTÁRIO VIRTUAL NA TECLA 'Y', E ABRA A ABA 'MERCADO' PARA ACOMPANHAR OS PREÇOS DE VENDA DOS ITENS!<br/>
OBS. 2: Os itens nao processados sao 2kg mais pesados que os da lista a seguir!!!<br/>
Preços das licenças dos Farms Ilegais/Peso do item não processado -<br/><br/>
1. Cocaina - R$ 75.000 |-Peso (Processado):4kg-|<br/>
2. Heroina - R$ 90.000 |-Peso (Processado):5kg-|<br/>
3. Metanfetamina - R$ 100.000 |-Peso (Processado):7kg-|<br/>
4. Uranio - R$ 150.000 |-Peso (Processado):8kg-|<br/>
                "
        ]
    ];


// Atalhos do teclado

    player createDiaryRecord ["controls",
        [
            "Atalhos Teclado (COP)",
                "
U (Proximo a seu veiculo): Trancar/Destrancar veiculo.<br/>
O: Abrir cancela sem sair do veiculo.<br/>
T (Proximo a um veiculo): Abrir inventario virtual do veiculo.<br/>
Y: Abrir inventario virtual do jogador.<br/>
F: Ligar sirene.<br/>
Left Shift + F: Ligar sirene.<br/>
L: Radar de velocidade (apenas para policia e P07 com silenciador).<br/>
Left Shift + O: Fones de ouvido.<br/>
Left Shift + BARRA DE ESPAÇO: Pular.<br/>
Left Shift + H: Colocar arma nas costas.<br/>
Left Ctrl + H: Retirar arma das costas.<br/>
Left Shift + L: Liga o giroflex.<br/>
Left Shift + R: Algemar jogador.<br/>
Barra De Espaço: Colocar objetos na rua.<br/>
TAB: Alerta para jogador.<br/>
Left Shift + END : Abre o menu de movimentos.<br/>
Left Ctrl + N : Abre o menu de seu GPS.<br/>
F5: Abre o menu do CXP BUG TRACKER. Reporte bugs encontrados no servidor por aqui e arrumaremos o mais breve possivel!<br/>
F8 (com mapa aberto) : Abre o menu do CXP MAP FILTER. (Obs: para fechar pressione 'ESC')<br/>
                "
        ]
    ];

    player createDiaryRecord ["controls",
        [
            "Atalhos Teclado (MED)",
                "
U (Proximo a seu veiculo): Trancar/Destrancar veiculo.<br/>
O: Abrir cancela sem sair do veiculo.<br/>
T (Proximo a um veiculo): Abrir inventario virtual do veiculo.<br/>
Y: Abrir inventario virtual do jogador.<br/>
Left Shift + F: Ligar sirene.<br/>
Left Shift + BARRA DE ESPAÇO: Pular.<br/>
Left Shift + O: Fones de ouvido.<br/>
Left Shift + L: Liga o giroflex.<br/>
Left Shift + B: Mao na cabeça.<br/>
Left Shift + END : Abre menu de movimentos.<br/>
INSERT: Avisos para o paciente (SIMILAR AO TAB DO CIV).<br/>
Page UP: Abre a lista de mortos no momento.<br/>
Left Ctrl + N : Abre o menu de seu GPS.<br/>
F5: Abre o menu do CXP BUG TRACKER. Reporte bugs encontrados no servidor por aqui e arrumaremos o mais breve possivel!<br/>
F8 (com mapa aberto) : Abre o menu do CXP MAP FILTER. (Obs: para fechar pressione 'ESC')<br/>
                "
        ]
    ];

    player createDiaryRecord ["controls",
        [
            "Atalhos Teclado (CIV)",
                "
T (Proximo a um veiculo): Abrir inventario virtual do veiculo.<br/>
Y: Abrir inventario virtual do jogador.<br/>
O (Quando o jogador estiver usando um 'Colete Explosivo'): Explodir-se.<br/>
U (Proximo a seu veiculo): Trancar/Destrancar veiculo.<br/>
Left Shift + G: Nocautear outro jogador para assalta-lo.<br/>
Left Shift + B: Mao na cabeça.<br/>
Left Shift + O: Fones de ouvido.<br/>
Left Shift + BARRA DE ESPAÇO: Pular.<br/>
Left Shift + H: Colocar arma nas costas.<br/>
Left Ctrl + H: Retirar arma das costas.<br/>
TECLA DO WINDOWS (Windows Key): Pegar itens no chao, usar picareta/enxada/machado e usar ATM's (Caixas Eletrônicos).<br/>
TAB: Alerta de Assalto.<br/>
F1: Acenar 1.<br/>
F2: Acenar 2.<br/>
F3: Acenar 3.<br/>
F4: Mexer cabeça para baixo (POSITIVO).<br/>
CTRL + T : Abrir árvore de skils.<br/>
Left Shift + END : Abre o menu de movimentos.<br/>
Left Ctrl + N : Abre o menu de seu GPS.<br/>
F5: Abre o menu do CXP BUG TRACKER. Reporte bugs encontrados no servidor por aqui e arrumaremos o mais breve possivel!<br/>
F8 (com mapa aberto) : Abre o menu do CXP MAP FILTER. (Obs: para fechar pressione 'ESC')<br/>
END: Abre menu de gerenciamento da gangue<br/>
                "
        ]
    ];
