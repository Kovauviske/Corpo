class CfgGather {
    class Resources {
        class apple {
            amount = 5; // quantidade de item q o jogador vai pegar com o botao do windows
            zones[] = { "apple_1", "apple_2", "apple_3", "apple_4" };
            item = "";
			zoneSize = 50;
        };

        class peach {
            amount = 5;
            zones[] = { "peaches_1", "peaches_2", "peaches_3" };
            item = "";
			zoneSize = 50;
        };

        class abacaxi {
            amount = 3;
            zones[] = { "abacaxi_1", "abacaxi_2", "abacaxi_3", "abacaxi_4" };
            item = "";
			zoneSize = 50;
        };

        class batata {
            amount = 3;
            zones[] = { "batata_1", "batata_2", "batata_3", "batata_4" };
            item = "";
			zoneSize = 50;
        };

        class cenoura {
            amount = 3;
            zones[] = { "cenoura_1", "cenoura_2", "cenoura_3", "cenoura_4" };
            item = "";
			zoneSize = 50;
        };

        class heroin_unprocessed {
            amount = 3;
            zones[] = { "heroin_1" };
            item = "";
			zoneSize = 200;
        };

        class cocaine_unprocessed {
            amount = 3;
            zones[] = { "cocaine_1" };
            item = "";
			zoneSize = 200;
        };

		class methi {
			amount = 3;
			zones[] = { "meth_1" };
			item = "";
			zoneSize = 150;
		};

        class cannabis {
            amount = 3;
            zones[] = { "weed_area" };
            item = "";
			zoneSize = 100;
        };
    };

/*
This block can be set using percent,if you want players to mine only one resource ,just leave it as it is.
Example:
        class copper_unrefined
    {
            amount = 2;
        zones[] = { "copper_mine" };
        item = "pickaxe";
        mined[] = { "copper_unrefined" };
This will make players mine only copper_unrefined
Now let's go deeper
Example 2:
        class copper_unrefined
    {
            amount = 2;
        zones[] = { "copper_mine" };
        item = "pickaxe";
        mined[] = { {"copper_unrefined",0,25},{"iron_unrefined",25,95},{"diamond_uncut",95,100} };
    };
    This will give :
    25(�1)% to copper_unrefined;
    70(�1)% to iron_unrefined;
    5%(�1)% to diamond_uncut;

                                                         ! Watch Out !
 If percents are used,you MUST put more than 1 resource in the mined parameter
 mined[] = { {"copper_unrefined",0,25} }; NOT OK (But the script will work)
 mined[] = { {"copper_unrefined",0,45 },{"iron_unrefined",45} };  NOT OK (The script won't work )
 mined[] = { {"copper_unrefined",0,45},{"copper_unrefined",80,100} }; NOT OK
 mined[] = { "copper_unrefined" }; OK
 mined[] = { {"copper_unrefined",0,35} , { "iron_unrefined" ,35,100 } }; OK
*/

    class Minerals {
        class copper_unrefined {
            amount = 2;
            zones[] = { "copper_mine" };
            item = "pickaxe"; //picareta
            mined[] = {"copper_unrefined"};
			zoneSize = 30;
        };

        class iron_unrefined {
            amount = 2;
            zones[] = { "iron_mine" };
            item = "pickaxe";
            mined[] = { "iron_unrefined" };
			zoneSize = 90;
        };

        //chocolat
        class chocolat_unprocessed {
            amount = 2;
            zones[] = { "cacao_1" };
            item = "enxada";
            mined[] = { "chocolat_unprocessed" };
			zoneSize = 50;
        };

        class salt_unrefined {
            amount = 2;
            zones[] = { "salt_mine" };
            item = "pickaxe";
            mined[] = { "salt_unrefined" };
			zoneSize = 80;
        };

        class sand {
            amount = 2;
            zones[] = { "sand_mine" };
            item = "pickaxe";
            mined[] = { "sand" };
			zoneSize = 80;
        };

        class diamond_uncut {
            amount = 2;
            zones[] = { "diamond_mine" };
            item = "pickaxe";
            mined[] = { "diamond_uncut" };
			zoneSize = 80;
        };

        class rock {
            amount = 2;
            zones[] = { "rock_quarry" };
            item = "pickaxe";
            mined[] = { "rock" };
			zoneSize = 50;
        };

        class oil_unprocessed {
            amount = 2;
            zones[] = { "oil_field_1" };
            item = "pickaxe";
            mined[] = { "oil_unprocessed" };
			zoneSize = 50;
        };

		class wood {
			amount = 2;
			zones[] = { "wood_1", "wood_2" };
			item = "woodaxe"; // machado
			mined[] = { "wood" };
			zoneSize = 80;
		};

		class cevadaC {
			amount = 2;
			zones[] = { "cevada_3", "cevada_4" };
			item = "enxada";
			mined[] = { "cevada" };
			zoneSize = 50;
		};

		class canaC {
			amount = 2;
			zones[] = { "cana_1", "cana_2", "cana_3" };
			item = "enxada";
			mined[] = { "cana" };
			zoneSize = 50;
		};

        class uranium_unrefined {
            amount = 1;
            zones[] = { "uranio_farm" };
            item = "pickaxe";
            mined[] = { "uranium_unrefined" };
            zoneSize = 30;
        };
    };
};
