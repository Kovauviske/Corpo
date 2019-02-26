/*
*    FORMAT:
*        STRING (Conditions) - Must return boolean :
*            String can contain any amount of conditions, aslong as the entire
*            string returns a boolean. This allows you to check any levels, conditionss etc,
*            in any combination. For example:
*                "call cxp_coplevel && conditions_civ_someconditions"
*            This will also let you call any other function.
*/
class VirtualShops {

    class tabacaria {
        name = "STR_Shops_Tabacaria";
        side = "civ";
        conditions = "";
        items[] = { "cigarro", "marijuana" };
    };

    class bardoze {
        name = "STR_MAR_BarDoZe";
        side = "civ";
        conditions = "";
        items[] = { "pinga", "latacerveja", "cigarro" };
    };

    class mobiliaria {
        name = "STR_Shops_Mob";
        side = "civ";
        conditions = "";
        items[] = { "storagesmall", "storagebig" };
    };

    class acamp {
        name = "STR_Shops_Acp";
        side = "civ";
        conditions = "";
        items[] = { "barracaP", "barracaG" };
    };

    class acg {
        name = "STR_Shops_Acg";
        side = "civ";
        conditions = "";
        items[] = { "rabbit_raw", "hen_raw", "rooster_raw", "sheep_raw", "goat_raw", "salema_raw", "ornate_raw", "mackerel_raw", "tuna_raw", "mullet_raw", "catshark_raw" };
    };

	class c_madeira {
        name = "STR_Shops_CMadeira";
        side = "civ";
        conditions = "";
        items[] = { "plank" };
	};

    class bmarket {
        name = "STR_Shops_MarketBounty";
        side = "civ";
        conditions = "license_civ_bHunterLic";
        items[] = { "zipties_legal", "kzipties_legal", "adrenalineShot", "lockpick_cop" };
    };

    class market {
        name = "STR_Shops_Market";
        side = "civ";
        conditions = "";
        items[] = { "apple", "peach", "cenoura", "abacaxi", "batata", "tbacon", "waterBottle", "redgull", "pickaxe", "woodaxe", "enxada", "toolkit", "fuelFull" };
    };

    class med_market {
        name = "STR_Shops_Market";
        side = "med";
        conditions = "";
        items[] = { "waterBottle", "rabbit", "apple", "peach", "cenoura", "batata", "redgull", "tbacon", "toolkit", "fuelFull", "defibrillator", "camisinha", "adrenalineShot", "marijuana_med" };
    };

    class rebel_B {
        name = "STR_Shops_Rebel";
        side = "civ";
        conditions = "license_civ_rebellic";
        items[] = { "fitaadesiva", "waterBottle", "rabbit", "apple", "peach", "cenoura", "batata", "redgull", "tbacon", "lockpick", "pickaxe", "woodaxe", "enxada", "toolkit", "fuelFull", "boltcutter", "blastingcharge", "zipties", "kzipties", /*"scalpel",*/ "blindfold", "camisinha" };
    };

    class gang {
        name = "STR_Shops_Gang";
        side = "civ";
        conditions = "";
        items[] = { "waterBottle", "rabbit", "apple", "peach", "redgull", "tbacon", "lockpick", "pickaxe", "toolkit", "fuelFull", "boltcutter", "blastingcharge" };
    };

    class wongs {
        name = "STR_Shops_Wongs";
        side = "civ";
        conditions = "";
        items[] = { "turtle_soup" , "turtle_raw"};
    };

    class chocolatS {
        name = "STR_Shops_Chocolat";
        side = "civ";
        conditions = "";
        items[] = { "chocolat_processed", "chocolatbarWW", "cestaCS", "chocolatBB" };
    };

    class coffee {
        name = "STR_Shops_Coffee";
        side = "civ";
        conditions = "";
        items[] = { "coffee", "donuts" };
    };

    class f_station_coffee {
        name = "STR_Shop_Station_Coffee";
        side = "";
        conditions = "";
        items[] = { "coffee", "donuts", "redgull", "toolkit", "fuelFull" };
    };

    class drugdealer {
        name = "STR_Shops_DrugDealer";
        side = "civ";
        conditions = "";
        items[] = { "heroinp", "methp" , "cocap" };
    };
	
    class oil {
        name = "STR_Shops_Oil";
        side = "civ";
        conditions = "";
        items[] = { "oil_processed", "pickaxe", "fuelFull" };
    };

    class glass {
        name = "STR_Shops_Glass";
        side = "civ";
        conditions = "";
        items[] = { "glass" };
    };

    class iron  {
        name = "STR_Shops_Minerals";
        side = "civ";
        conditions = "";
        items[] = { "iron_refined", "copper_refined" };
    };

    class diamond {
        name = "STR_Shops_Diamond";
        side = "civ";
        conditions = "";
        items[] = { "diamond_cut" };
    };

    class salt {
        name = "STR_Shops_Salt";
        side = "civ";
        conditions = "";
        items[] = { "salt_refined" };
    };

    class cement {
        name = "STR_Shops_Cement";
        side = "civ";
        conditions = "";
        items[] = { "cement" };
    };

    class gold {
        name = "STR_Shops_Gold";
        side = "civ";
        conditions = "";
        items[] = { "goldbar" };
    };

    class uraniumShop {
        name = "STR_Shops_Uranium";
        side = "civ";
        conditions = "";
        items[] = { "uranium_refined" };
    };

    class cop {
        name = "STR_Shops_Cop";
        side = "cop";
        conditions = "";
        items[] = { "donuts", "coffee", "spikeStrip", "waterBottle", "rabbit", "apple", "redgull", "toolkit", "fuelFull", "defusekit", "bafom", "boltcutter_cop", "lockpick_cop", "adrenalineShot" };
    };
};
//Virtual Items
/*
*	FACTOR VARI. => 0: Nada(n aparece no mercado) ; 1: Farm Ilegal; 2: Farm Legal; 3: Especiaria |
*    CLASS:
*        variable = Variable Name
*        displayName = Item Name
*        cooked = Name of the item cooked (for items that can be cooked in a campFire)
*        weight = Item Weight
*        buyPrice = Item Buy Price
*        sellPrice = Item Sell Price
*        illegal = Illegal Item
*        edible = Item Edible (-1 = Disabled)
*        icon = Item Icon
*        processedItem = Processed Item
*/
class VirtualItems {
    //Misc
    class pickaxe {
        variable = "pickaxe";
        displayName = "STR_Item_Pickaxe";
        weight = 2;
        buyPrice = 900;
        sellPrice = 350;
        varPrice = 1;
        maxPrice = 350;
        minPrice = 350;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "icons\ico_pickaxe.paa";
    };

	class woodaxe {
		variable = "woodaxe";
		displayName = "STR_Item_woodaxe";
		weight = 2;
		buyPrice = 800;
		sellPrice = 300;
        varPrice = 1;
        maxPrice = 300;
        minPrice = 300;
        factor = 0;
		illegal = false;
		edible = -1;
		icon = "icons\woodaxe.paa";
	};

	class enxada {
		variable = "enxada";
		displayName = "STR_Item_enxada";
		weight = 2;
		buyPrice = 750;
		sellPrice = 250;
        varPrice = 1;
        maxPrice = 250;
        minPrice = 250;
        factor = 0;
		illegal = false;
		edible = -1;
		icon = "icons\enxada.paa";
	};

    class cenoura {
        variable = "cenoura";
        displayName = "STR_Item_cenoura";
        weight = 1;
        buyPrice = 155;
        sellPrice = 105;
        varPrice = 1;
        maxPrice = 150;
        minPrice = 105;
        factor = 3;
        illegal = false;
        edible = 15;
        icon = "icons\ico_cenoura.paa";
    };

    class batata {
        variable = "batata";
        displayName = "STR_Item_batata";
        weight = 1;
        buyPrice = 150;
        sellPrice = 110;
        varPrice = 1;
        maxPrice = 140;
        minPrice = 110;
        factor = 3;
        illegal = false;
        edible = 20;
        icon = "icons\ico_batata.paa";
    };

    class defibrillator {
        variable = "defibrillator";
        displayName = "STR_Item_Defibrillator";
        weight = 4;
        buyPrice = 500;
        sellPrice = 100;
        varPrice = 1;
        maxPrice = 100;
        minPrice = 100;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "icons\ico_defibrillator.paa";
    };

    class toolkit {
        variable = "toolkit";
        displayName = "STR_Item_Toolkit";
        weight = 4;
        buyPrice = 350;
        sellPrice = 70;
        varPrice = 1;
        maxPrice = 70;
        minPrice = 70;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "\a3\weapons_f\items\data\UI\gear_toolkit_ca.paa";
    };

    class fuelEmpty {
        variable = "fuelEmpty";
        displayName = "STR_Item_FuelE";
        weight = 2;
        buyPrice = -1;
        sellPrice = 30;
        varPrice = 1;
        maxPrice = 30;
        minPrice = 30;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "icons\ico_fuelEmpty.paa";
    };

    class fuelFull {
        variable = "fuelFull";
        displayName = "STR_Item_FuelF";
        weight = 5;
        buyPrice = 800;
        sellPrice = 480;
        varPrice = 1;
        maxPrice = 480;
        minPrice = 480;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "icons\ico_fuel.paa";
    };

    class spikeStrip {
        variable = "spikeStrip";
        displayName = "STR_Item_SpikeStrip";
        weight = 15;
        buyPrice = 2500;
        sellPrice = 1000;
        varPrice = 1;
        maxPrice = 1000;
        minPrice = 1000;
        factor = 0;
        illegal = true;
        edible = -1;
        icon = "icons\ico_spikeStrip.paa";
    };

    class lockpick {
        variable = "lockpick";
        displayName = "STR_Item_Lockpick";
        weight = 1;
        buyPrice = 5000;
        sellPrice = 500;
        varPrice = 1;
        maxPrice = 500;
        minPrice = 500;
        factor = 0;
        illegal = true;
        edible = -1;
        icon = "icons\ico_lockpick.paa";
    };

    class goldbar {
        variable = "goldBar";
        displayName = "STR_Item_GoldBar";
        weight = 12;
        buyPrice = -1;
        sellPrice = 95000;
        varPrice = 1;
        maxPrice = 95000;
        minPrice = 95000;
        factor = 0;
        illegal = true;
        edible = -1;
        icon = "icons\ico_goldBar.paa";
    };

    class blastingcharge {
        variable = "blastingCharge";
        displayName = "STR_Item_BCharge";
        weight = 15;
        buyPrice = 35000;
        sellPrice = 10000;
        varPrice = 1;
        maxPrice = 10000;
        minPrice = 10000;
        factor = 0;
        illegal = true;
        edible = -1;
        icon = "icons\ico_blastingCharge.paa";
    };

    class boltcutter {
        variable = "boltCutter";
        displayName = "STR_Item_BCutter";
        weight = 5;
        buyPrice = 8000;
        sellPrice = 1000;
        varPrice = 1;
        maxPrice = 1000;
        minPrice = 1000;
        factor = 0;
        illegal = true;
        edible = -1;
        icon = "icons\ico_boltCutter.paa";
    };

    class defusekit {
        variable = "defuseKit";
        displayName = "STR_Item_DefuseKit";
        weight = 2;
        buyPrice = 2000;
        sellPrice = 650;
        varPrice = 1;
        maxPrice = 650;
        minPrice = 650;
        factor = 0;
        illegal = true;
        edible = -1;
        icon = "icons\ico_defuseKit.paa";
    };

    class storagesmall {
        variable = "storageSmall";
        displayName = "STR_Item_StorageBS";
        weight = 5;
        buyPrice = 75000;
        sellPrice = -1;
        varPrice = 1;
        maxPrice = -1;
        minPrice = -1;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "icons\ico_storageSmall.paa";
    };

    class storagebig {
        variable = "storageBig";
        displayName = "STR_Item_StorageBL";
        weight = 10;
        buyPrice = 150000;
        sellPrice = -1;
        varPrice = 1;
        maxPrice = -1;
        minPrice = -1;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "icons\ico_storageBig.paa";
    };

    //Chocolate
    class chocolat_unprocessed {
        variable = "chocolatUnprocessed";
        displayName = "STR_Item_chocolatU";
        weight = 5;
        buyPrice = -1;
        sellPrice = -1;
        varPrice = -1;
        maxPrice = -1;
        minPrice = -1;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "icons\ico_chocolatUnprocessed.paa";
    };

    class chocolat_processed {
        variable = "chocolatProcessed";
        displayName = "STR_Item_chocolatP";
        weight = 3;
        buyPrice = 3000;
        sellPrice = 2300;
        varPrice = 1;
        maxPrice = 2800;
        minPrice = 2300;
        factor = 2;
        illegal = false;
        edible = 50;
        icon = "icons\ico_chocolatProcessed.paa";
    };

    //Mined Items
    class oil_unprocessed {
        variable = "oilUnprocessed";
        displayName = "STR_Item_OilU";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        varPrice = -1;
        maxPrice = -1;
        minPrice = -1;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "icons\ico_oilUnprocessed.paa";
    };

    class oil_processed {
        variable = "oilProcessed";
        displayName = "STR_Item_OilP";
        weight = 4;
        buyPrice = -1;
        sellPrice = 4500;
        varPrice = 1;
        maxPrice = 5500;
        minPrice = 4500;
        factor = 2;
        illegal = false;
        edible = -1;
        icon = "icons\ico_oilProcessed.paa";
    };

    class copper_unrefined {
        variable = "copperUnrefined";
        displayName = "STR_Item_CopperOre";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        varPrice = -1;
        maxPrice = -1;
        minPrice = -1;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "icons\ico_copperOre.paa";
    };

    class copper_refined {
        variable = "copperRefined";
        displayName = "STR_Item_CopperIngot";
        weight = 4;
        buyPrice = -1;
        sellPrice = 2500;
        varPrice = 1;
        maxPrice = 3800;
        minPrice = 2500;
        factor = 2;
        illegal = false;
        edible = -1;
        icon = "icons\ico_copper.paa";
    };

    class iron_unrefined {
        variable = "ironUnrefined";
        displayName = "STR_Item_IronOre";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        varPrice = -1;
        maxPrice = -1;
        minPrice = -1;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "icons\ico_ironOre.paa";
    };

    class iron_refined {
        variable = "ironRefined";
        displayName = "STR_Item_IronIngot";
        weight = 4;
        buyPrice = -1;
        sellPrice = 2600;
        varPrice = 1;
        maxPrice = 3600;
        minPrice = 2600;
        factor = 2;
        illegal = false;
        edible = -1;
        icon = "icons\ico_iron.paa";
    };

    class salt_unrefined {
        variable = "saltUnrefined";
        displayName = "STR_Item_Salt";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        varPrice = -1;
        maxPrice = -1;
        minPrice = -1;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "icons\ico_saltUnprocessed.paa";
    };

    class salt_refined {
        variable = "saltRefined";
        displayName = "STR_Item_SaltR";
        weight = 4;
        buyPrice = -1;
        sellPrice = 3000;
        varPrice = 1;
        maxPrice = 4000;
        minPrice = 3000;
        factor = 2;
        illegal = false;
        edible = -1;
        icon = "icons\ico_saltProcessed.paa";
    };

    class sand {
        variable = "sand";
        displayName = "STR_Item_Sand";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        varPrice = -1;
        maxPrice = -1;
        minPrice = -1;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "icons\ico_sand.paa";
    };

    class glass {
        variable = "glass";
        displayName = "STR_Item_Glass";
        weight = 4;
        buyPrice = -1;
        sellPrice = 2700;
        varPrice = 1;
        maxPrice = 3800;
        minPrice = 2700;
        factor = 2;
        illegal = false;
        edible = -1;
        icon = "icons\ico_glass.paa";
    };

    class diamond_uncut {
        variable = "diamondUncut";
        displayName = "STR_Item_DiamondU";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        varPrice = -1;
        maxPrice = -1;
        minPrice = -1;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "icons\ico_diamondUncut.paa";
    };

    class diamond_cut {
        variable = "diamondCut";
        displayName = "STR_Item_DiamondC";
        weight = 4;
        buyPrice = -1;
        sellPrice = 4800;
        varPrice = 1;
        maxPrice = 6500;
        minPrice = 4800;
        factor = 2;
        illegal = false;
        edible = -1;
        icon = "icons\ico_diamondCut.paa";
    };

    class rock {
        variable = "rock";
        displayName = "STR_Item_Rock";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        varPrice = -1;
        maxPrice = -1;
        minPrice = -1;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "icons\ico_rock.paa";
    };

    class cement {
        variable = "cement";
        displayName = "STR_Item_CementBag";
        weight = 4;
        buyPrice = -1;
        sellPrice = 2500;
        varPrice = 1;
        maxPrice = 3200;
        minPrice = 2500;
        factor = 2;
        illegal = false;
        edible = -1;
        icon = "icons\ico_cement.paa";
    };

	class wood {
        variable = "wood";
        displayName = "STR_Item_Wood";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        varPrice = -1;
        maxPrice = -1;
        minPrice = -1;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "icons\wood.paa";
	};

	class plank {
		variable = "plank";
		displayName = "STR_Item_Plank";
		weight = 4;
		buyPrice = 3800;
		sellPrice = 2400;
        varPrice = 1;
        maxPrice = 3600;
        minPrice = 2400;
        factor = 2;
		illegal = false;
		edible = -1;
		icon = "icons\plank.paa";
	};

	class cana {
		variable = "cana";
		displayName = "STR_Item_cana";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        varPrice = -1;
        maxPrice = -1;
        minPrice = -1;
        factor = 0;
		illegal = false;
		edible = -1;
		icon = "icons\cana.paa";
	};

	class canad {
		variable = "canad";
		displayName = "STR_Item_canad";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        varPrice = -1;
        maxPrice = -1;
        minPrice = -1;
        factor = 0;
		illegal = false;
		edible = -1;
		icon = "icons\canad.paa";
	};

	class cevada {
		variable = "cevada";
		displayName = "STR_Item_Cevada";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        varPrice = -1;
        maxPrice = -1;
        minPrice = -1;
        factor = 0;
		illegal = false;
		edible = -1;
		icon = "icons\cevada.paa";
	};

	class cevadad {
		variable = "cevadad";
		displayName = "STR_Item_Cevadad";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        varPrice = -1;
        maxPrice = -1;
        minPrice = -1;
        factor = 0;
		illegal = false;
		edible = -1;
		icon = "icons\cevadad.paa";
	};

    //Drugs
    class heroin_unprocessed {
        variable = "heroinUnprocessed";
        displayName = "STR_Item_HeroinU";
        weight = 7;
        buyPrice = -1;
        sellPrice = -1;
        varPrice = -1;
        maxPrice = -1;
        minPrice = -1;
        factor = 0;
        illegal = true;
        edible = -1;
        icon = "icons\ico_heroinUnprocessed.paa";
        processedItem = "heroinp";
    };

    class heroinp {
        variable = "heroinProcessed";
        displayName = "STR_Item_HeroinP";
        weight = 5;
        buyPrice = 12000;
        sellPrice = 8000;
        varPrice = 1;
        maxPrice = 11000;
        minPrice = 8000;
        factor = 1;
        illegal = true;
        edible = -1;
        icon = "icons\ico_heroinProcessed.paa";
    };

    class cannabis {
        variable = "cannabis";
        displayName = "STR_Item_Cannabis";
        weight = 5;
        buyPrice = -1;
        sellPrice = -1;
        varPrice = -1;
        maxPrice = -1;
        minPrice = -1;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "icons\ico_cannabis.paa";
        processedItem = "marijuana";
    };

    class marijuana {
        variable = "marijuana";
        displayName = "STR_Item_Marijuana";
        weight = 3;
        buyPrice = 8000;
        sellPrice = 4000;
        varPrice = 1;
        maxPrice = 6000;
        minPrice = 3200;
        factor = 2;
        illegal = false;
        edible = -1;
        icon = "icons\ico_marijuana.paa";
    };
	
	class marijuana_med {
        variable = "marijuana_med";
        displayName = "STR_Item_Marijuana_med";
        weight = 3;
        buyPrice = 3000;
        sellPrice = 2000;
        varPrice = 1;
        maxPrice = 2000;
        minPrice = 2000;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "icons\ico_marijuana.paa";
	};

    class cocaine_unprocessed {
        variable = "cocaineUnprocessed";
        displayName = "STR_Item_CocaineU";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        varPrice = -1;
        maxPrice = -1;
        minPrice = -1;
        factor = 0;
        illegal = true;
        edible = -1;
        icon = "icons\ico_cocaineUnprocessed.paa";
        processedItem = "cocap";
    };

    class cocap {
        variable = "cocaineProcessed";
        displayName = "STR_Item_CocaineP";
        weight = 4;
        buyPrice = 9000;
        sellPrice = 6000;
        varPrice = 1;
        maxPrice = 8000;
        minPrice = 5800;
        factor = 1;
        illegal = true;
        edible = -1;
        icon = "icons\ico_cocaineProcessed.paa";
    };

	class methi	{
        variable = "methi";
        displayName = "STR_Item_Methi";
        weight = 9;
        buyPrice = -1;
        sellPrice = -1;
        varPrice = -1;
        maxPrice = -1;
        minPrice = -1;
        factor = 0;
        illegal = true;
        edible = -1;
        icon = "icons\methu.paa";
        processedItem = "methp";
    };

	class methp {
        variable = "methp";
        displayName = "STR_Item_Methp";
        weight = 7;
        buyPrice = 15000;
        sellPrice = 10000;
        varPrice = 1;
        maxPrice = 14500;
        minPrice = 10000;
        factor = 1;
        illegal = true;
        edible = -1;
        icon = "icons\methp.paa";
    };

    class uranium_unrefined {
        variable = "uraniumUnrefined";
        displayName = "STR_Item_UraniumOre";
        weight = 10;
        buyPrice = -1;
        sellPrice = -1;
        varPrice = -1;
        maxPrice = -1;
        minPrice = -1;
        factor = 0;
        illegal = true;
        edible = -1;
        icon = "icons\ico_uraniumUnrefined.paa";
    };

    class uranium_refined {
        variable = "uraniumRefined";
        displayName = "STR_Item_Uranium";
        weight = 8;
        buyPrice = -1;
        sellPrice = 16000;
        varPrice = 1;
        maxPrice = 18000;
        minPrice = 16000;
        factor = 1;
        illegal = true;
        edible = -1;
        icon = "icons\ico_uraniumBarel.paa";
    };

    //Drink

	class pinga {
        variable = "pinga";
        displayName = "STR_Item_pinga";
        weight = 4;
        buyPrice = 2500;
        sellPrice = 1920;
        varPrice = 1;
        maxPrice = 2300;
        minPrice = 1920;
        factor = 2;
        illegal = false;
        edible = -1;
        icon = "icons\pingabraba.paa";
	};

	class latacerveja {
        variable = "latacerveja";
        displayName = "STR_Item_LCerveja";
        weight = 4;
        buyPrice = 2900;
        sellPrice = 1900;
        varPrice = 1;
        maxPrice = 2700;
        minPrice = 1900;
        factor = 2;
        illegal = false;
        edible = -1;
        icon = "icons\skol.paa";
	};

    class redgull {
        variable = "redgull";
        displayName = "STR_Item_RedGull";
        weight = 1;
        buyPrice = 1500;
        sellPrice = 200;
        varPrice = 1;
        maxPrice = 200;
        minPrice = 200;
        factor = 0;
        illegal = false;
        edible = 75;
        icon = "icons\ico_redgull.paa";
    };

    class coffee {
        variable = "coffee";
        displayName = "STR_Item_Coffee";
        weight = 1;
        buyPrice = 50;
        sellPrice = 5;
        varPrice = 1;
        maxPrice = 5;
        minPrice = 5;
        factor = 0;
        illegal = false;
        edible = 50;
        icon = "icons\ico_coffee.paa";
    };

    class waterBottle {
        variable = "waterBottle";
        displayName = "STR_Item_WaterBottle";
        weight = 1;
        buyPrice = 60;
        sellPrice = 20;
        varPrice = 1;
        maxPrice = 20;
        minPrice = 20;
        factor = 0;
        illegal = false;
        edible = 65;
        icon = "icons\ico_waterBottle.paa";
    };

    //Food
    class apple {
        variable = "apple";
        displayName = "STR_Item_Apple";
        weight = 1;
        buyPrice = 100;
        sellPrice = 50;
        varPrice = 1;
        maxPrice = 90;
        minPrice = 50;
        factor = 3;
        illegal = false;
        edible = 10;
        icon = "icons\ico_apple.paa";
    };

    class peach {
        variable = "peach";
        displayName = "STR_Item_Peach";
        weight = 1;
        buyPrice = 120;
        sellPrice = 60;
        varPrice = 1;
        maxPrice = 100;
        minPrice = 60;
        factor = 3;
        illegal = false;
        edible = 10;
        icon = "icons\ico_peach.paa";
    };

    class abacaxi {
        variable = "abacaxi";
        displayName = "STR_Item_abacaxi";
        weight = 1;
        buyPrice = 300;
        sellPrice = 200;
        varPrice = 1;
        maxPrice = 290;
        minPrice = 200;
        factor = 3;
        illegal = false;
        edible = 25;
        icon = "icons\abacaxi.paa";
    };

    class tbacon {
        variable = "tbacon";
        displayName = "STR_Item_TBacon";
        weight = 1;
        buyPrice = 200;
        sellPrice = 50;
        varPrice = 1;
        maxPrice = 50;
        minPrice = 50;
        factor = 0;
        illegal = false;
        edible = 40;
        icon = "icons\ico_tBacon.paa";
    };

    class donuts {
        variable = "donuts";
        displayName = "STR_Item_Donuts";
        weight = 1;
        buyPrice = 120;
        sellPrice = 60;
        varPrice = 1;
        maxPrice = 60;
        minPrice = 60;
        factor = 0;
        illegal = false;
        edible = 30;
        icon = "icons\ico_donuts.paa";
    };

    class rabbit_raw {
        variable = "rabbitRaw";
		cooked = "rabbit";
        displayName = "STR_Item_RabbitRaw";
        weight = 2;
        buyPrice = 115;
        sellPrice = 95;
        varPrice = 1;
        maxPrice = 100;
        minPrice = 95;
        factor = 3;
        illegal = false;
        edible = -1;
        icon = "icons\ico_rabbitRaw.paa";
    };

    class rabbit {
        variable = "rabbit";
        displayName = "STR_Item_Rabbit";
        weight = 1;
        buyPrice = 150;
        sellPrice = 115;
        varPrice = 1;
        maxPrice = 140;
        minPrice = 115;
        factor = 0;
        illegal = false;
        edible = 20;
        icon = "icons\ico_rabbit.paa";
    };

    class salema_raw {
        variable = "salemaRaw";
		cooked = "salema";
        displayName = "STR_Item_SalemaRaw";
        weight = 2;
        buyPrice = 60;
        sellPrice = 45;
        varPrice = 1;
        maxPrice = 55;
        minPrice = 45;
        factor = 3;
        illegal = false;
        edible = -1;
        icon = "icons\ico_salemaRaw.paa";
    };

    class salema {
        variable = "salema";
        displayName = "STR_Item_Salema";
        weight = 1;
        buyPrice = 75;
        sellPrice = 55;
        varPrice = 1;
        maxPrice = 65;
        minPrice = 55;
        factor = 0;
        illegal = false;
        edible = 30;
        icon = "icons\ico_cookedFish.paa";
    };

    class ornate_raw {
        variable = "ornateRaw";
		cooked = "ornate";
        displayName = "STR_Item_OrnateRaw";
        weight = 2;
        buyPrice = 55;
        sellPrice = 40;
        varPrice = 1;
        maxPrice = 45;
        minPrice = 40;
        factor = 3;
        illegal = false;
        edible = -1;
        icon = "icons\ico_ornateRaw.paa";
    };

    class ornate {
        variable = "ornate";
        displayName = "STR_Item_Ornate";
        weight = 1;
        buyPrice = 175;
        sellPrice = 150;
        varPrice = 1;
        maxPrice = 165;
        minPrice = 150;
        factor = 0;
        illegal = false;
        edible = 25;
        icon = "icons\ico_cookedFish.paa";
    };

    class mackerel_raw {
        variable = "mackerelRaw";
		cooked = "mackerel";
        displayName = "STR_Item_MackerelRaw";
        weight = 4;
        buyPrice = 200;
        sellPrice = 175;
        varPrice = 1;
        maxPrice = 190;
        minPrice = 175;
        factor = 3;
        illegal = false;
        edible = -1;
        icon = "icons\ico_mackerelRaw.paa";
    };

    class mackerel {
        variable = "mackerel";
        displayName = "STR_Item_Mackerel";
        weight = 2;
        buyPrice = 250;
        sellPrice = 200;
        varPrice = 1;
        maxPrice = 240;
        minPrice = 200;
        factor = 0;
        illegal = false;
        edible = 30;
        icon = "icons\ico_cookedFish.paa";
    };

    class tuna_raw {
        variable = "tunaRaw";
		cooked = "tuna";
        displayName = "STR_Item_TunaRaw";
        weight = 6;
        buyPrice = 750;
        sellPrice = 700;
        varPrice = 1;
        maxPrice = 735;
        minPrice = 700;
        factor = 3;
        illegal = false;
        edible = -1;
        icon = "icons\ico_tunaRaw.paa";
    };

    class tuna {
        variable = "tuna";
        displayName = "STR_Item_Tuna";
        weight = 3;
        buyPrice = 1250;
        sellPrice = 1000;
        varPrice = 1;
        maxPrice = 1150;
        minPrice = 1000;
        factor = 0;
        illegal = false;
        edible = 100;
        icon = "icons\ico_cookedFish.paa";
    };

    class mullet_raw {
        variable = "mulletRaw";
		cooked = "mullet";
        displayName = "STR_Item_MulletRaw";
        weight = 4;
        buyPrice = 310;
        sellPrice = 250;
        varPrice = 1;
        maxPrice = 290;
        minPrice = 250;
        factor = 3;
        illegal = false;
        edible = -1;
        icon = "icons\ico_mulletRaw.paa";
    };

    class mullet {
        variable = "mullet";
        displayName = "STR_Item_Mullet";
        weight = 2;
        buyPrice = 600;
        sellPrice = 400;
        varPrice = 1;
        maxPrice = 540;
        minPrice = 400;
        factor = 0;
        illegal = false;
        edible = 80;
        icon = "icons\ico_cookedFish.paa";
    };

    class catshark_raw {
        variable = "catsharkRaw";
		cooked = "catshark";
        displayName = "STR_Item_CatSharkRaw";
        weight = 6;
        buyPrice = 380;
        sellPrice = 300;
        varPrice = 1;
        maxPrice = 360;
        minPrice = 300;
        factor = 3;
        illegal = false;
        edible = -1;
        icon = "icons\ico_catsharkRaw.paa";
    };

    class catshark {
        variable = "catshark";
        displayName = "STR_Item_CatShark";
        weight = 3;
        buyPrice = 750;
        sellPrice = 500;
        varPrice = 1;
        maxPrice = 680;
        minPrice = 500;
        factor = 0;
        illegal = false;
        edible = 100;
        icon = "icons\ico_cookedFish.paa";
    };

    class turtle_raw {
        variable = "turtleRaw";
		cooked = "turtle_soup";
        displayName = "STR_Item_TurtleRaw";
        weight = 7;
        buyPrice = 30000;
        sellPrice = 13000;
        varPrice = 1;
        maxPrice = 15000;
        minPrice = 13000;
        factor = 1;
        illegal = true;
        edible = -1;
        icon = "icons\ico_turtleRaw.paa";
    };

    class turtle_soup {
        variable = "turtleSoup";
        displayName = "STR_Item_TurtleSoup";
        weight = 2;
        buyPrice = 1000;
        sellPrice = 750;
        varPrice = 1;
        maxPrice = 890;
        minPrice = 750;
        factor = 0;
        illegal = false;
        edible = 100;
        icon = "icons\ico_turtleSoup.paa";
    };

    class hen_raw {
        variable = "henRaw";
		cooked = "hen";
        displayName = "STR_Item_HenRaw";
        weight = 1;
        buyPrice = 80;
        sellPrice = 65;
        varPrice = 1;
        maxPrice = 75;
        minPrice = 65;
        factor = 3;
        illegal = false;
        edible = -1;
        icon = "icons\ico_wholeChickenRaw.paa";
    };

    class hen {
        variable = "hen";
        displayName = "STR_Item_Hen";
        weight = 1;
        buyPrice = 115;
        sellPrice = 85;
        varPrice = 1;
        maxPrice = 100;
        minPrice = 85;
        factor = 0;
        illegal = false;
        edible = 65;
        icon = "icons\ico_wholeChicken.paa";
    };

    class rooster_raw {
        variable = "roosterRaw";
		cooked = "rooster";
        displayName = "STR_Item_RoosterRaw";
        weight = 1;
        buyPrice = 87;
        sellPrice = 65;
        varPrice = 1;
        maxPrice = 78;
        minPrice = 65;
        factor = 3;
        illegal = false;
        edible = -1;
        icon = "icons\ico_chickenDrumstickRaw.paa";
    };

    class rooster {
        variable = "rooster";
        displayName = "STR_Item_Rooster";
        weight = 1;
        buyPrice = 90;
        sellPrice = 65;
        varPrice = 1;
        maxPrice = 80;
        minPrice = 65;
        factor = 0;
        illegal = false;
        edible = 45;
        icon = "icons\ico_chickenDrumstick.paa";
    };

    class sheep_raw {
        variable = "sheepRaw";
		cooked = "sheep";
        displayName = "STR_Item_SheepRaw";
        weight = 2;
        buyPrice = 130;
        sellPrice = 95;
        varPrice = 1;
        maxPrice = 110;
        minPrice = 95;
        factor = 3;
        illegal = false;
        edible = -1;
        icon = "icons\ico_lambChopRaw.paa";
    };

    class sheep {
        variable = "sheep";
        displayName = "STR_Item_Sheep";
        weight = 2;
        buyPrice = 160;
        sellPrice = 115;
        varPrice = 1;
        maxPrice = 150;
        minPrice = 115;
        factor = 0;
        illegal = false;
        edible = 100;
        icon = "icons\ico_lambChop.paa";
    };

    class goat_raw {
        variable = "goatRaw";
		cooked = "goat";
        displayName = "STR_Item_GoatRaw";
        weight = 2;
        buyPrice = 145;
        sellPrice = 100;
        varPrice = 1;
        maxPrice = 120;
        minPrice = 100;
        factor = 3;
        illegal = false;
        edible = -1;
        icon = "icons\ico_muttonLegRaw.paa";
    };

    class goat {
        variable = "goat";
        displayName = "STR_Item_Goat";
        weight = 2;
        buyPrice = 175;
        sellPrice = 135;
        varPrice = 1;
        maxPrice = 155;
        minPrice = 135;
        factor = 0;
        illegal = false;
        edible = 100;
        icon = "icons\ico_muttonLeg.paa";
    };

	class fitaadesiva {
        variable = "fitaadesiva";
        displayName = "STR_Item_Fitaadesiva";
        weight = 8;
        buyPrice = 9000;
        sellPrice = -1;
        varPrice = 1;
        maxPrice = -1;
        minPrice = -1;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "icons\fita.paa";
	};

    class zipties {
        variable = "zipties";
        displayName = "STR_Item_ZipTies";
        weight = 3;
        buyPrice = 15000;
        sellPrice = -1;
        varPrice = 1;
        maxPrice = 15000;
        minPrice = 15000;
        factor = 0;
        illegal = true;
        edible = -1;
        icon = "icons\zipties.paa";
    };

    class kzipties {
        variable = "kzipties";
        displayName = "STR_Item_KZipTies";
        weight = 2;
        buyPrice = 20000;
        sellPrice = -1;
        varPrice = 1;
        maxPrice = 20000;
        minPrice = 20000;
        factor = 0;
        illegal = true;
        edible = -1;
        icon = "icons\kzipties.paa";
    };

    class chocolatbarWW {
    	variable = "chocolatbarWW";
    	displayName = "STR_Item_chBarWW";
    	weight = 3;
    	buyPrice = 10000;
    	sellPrice = 5000;
        varPrice = 1;
        maxPrice = 5000;
        minPrice = 5000;
        factor = 0;
    	illegal = false;
    	edible = 85;
    	icon = "icons\chBarWW.paa";
    };

    class chocolatBB {
    	variable = "chocolatBB";
    	displayName = "STR_Item_chocolatBB";
    	weight = 2;
    	buyPrice = 1000;
    	sellPrice = 500;
        varPrice = 1;
        maxPrice = 500;
        minPrice = 500;
        factor = 0;
    	illegal = false;
    	edible = 75;
    	icon = "icons\chBB.paa";
    };

    class cestaCS {
    	variable = "cestaCS";
    	displayName = "STR_Item_cestaCS";
    	weight = 3;
    	buyPrice = 12000;
    	sellPrice = 6000;
        varPrice = 1;
        maxPrice = 6000;
        minPrice = 6000;
        factor = 0;
    	illegal = false;
    	edible = 90;
    	icon = "icons\cestaCAS.paa";
    };

    class blindfold {
        variable = "blindfold";
        displayName = "STR_Item_Blindfold";
        weight = 4;
        buyPrice = 15000;
        sellPrice = -1;
        varPrice = 1;
        maxPrice = -1;
        minPrice = -1;
        factor = 0;
        illegal = true;
        edible = -1;
        icon = "icons\blindfold.paa";
    };

    class bafom {
        variable = "bafom";
        displayName = "STR_Item_Bafom";
        weight = 6;
        buyPrice = 1300;
        sellPrice = -1;
        varPrice = 1;
        maxPrice = -1;
        minPrice = -1;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "icons\bafometro.paa";
    };

	class firewood {
        variable = "firewood";
        displayName = "STR_Item_firewood";
        weight = 8;
        buyPrice = -1;
        sellPrice = -1;
        varPrice = 1;
        maxPrice = -1;
        minPrice = -1;
        factor = 0;
        illegal = true;
        edible = -1;
        icon = "icons\firewood.paa";
	};

    class cigarro {
        variable = "cigarro";
        displayName = "STR_Item_CCigarro";
        weight = 10;
        buyPrice = 3200;
        sellPrice = -1;
        varPrice = 1;
        maxPrice = -1;
        minPrice = -1;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "icons\cigarro.paa";
    };

	class barracaG {
        variable = "barracaG";
        displayName = "STR_Item_BarracaG";
        weight = 20;
        buyPrice = 10000;
        sellPrice = -1;
        varPrice = 1;
        maxPrice = -1;
        minPrice = -1;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "icons\barracaG.paa";
	};

	class barracaP {
        variable = "barracaP";
        displayName = "STR_Item_BarracaP";
        weight = 10;
        buyPrice = 6000;
        sellPrice = -1;
        varPrice = 1;
        maxPrice = -1;
        minPrice = -1;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "icons\barracaP.paa";
	};

	class campFire {
        variable = "campFire";
        displayName = "STR_Item_CampFire";
        weight = 8;
        buyPrice = -1;
        sellPrice = -1;
        varPrice = 1;
        maxPrice = -1;
        minPrice = -1;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "icons\fogueira.paa";
	};

    class camisinha {
        variable = "camisinha";
        displayName = "STR_Item_Camisinha";
        weight = 3;
        buyPrice = 7000;
        sellPrice = 5000;
        varPrice = 1;
        maxPrice = 5000;
        minPrice = 5000;
        factor = 0;
        illegal = true;
        edible = -1;
        icon = "icons\camisinha.paa";
    };

    class boltcutter_cop {
        variable = "boltcutter_cop";
        displayName = "STR_Item_BCutter_cop";
        weight = 2;
        buyPrice = 8000;
        sellPrice = 1000;
        varPrice = 1;
        maxPrice = 1000;
        minPrice = 1000;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "icons\ico_boltCutter.paa";
    };

    class lockpick_cop {
        variable = "lockpick_cop";
        displayName = "STR_Item_Lockpick_cop";
        weight = 1;
        buyPrice = 5000;
        sellPrice = 500;
        varPrice = 1;
        maxPrice = 500;
        minPrice = 500;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "icons\ico_lockpick.paa";
    };

    class adrenalineShot {
        variable = "adrenalineShot";
        displayName = "STR_Item_AdrenalineShot";
        weight = 1;
        buyPrice = 5000;
        sellPrice = -1;
        varPrice = 1;
        maxPrice = 200;
        minPrice = 200;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "icons\adrenalineShot.paa";
    };

    class zipties_legal {
        variable = "zipties_legal";
        displayName = "STR_Item_ZipTiesLeg";
        weight = 3;
        buyPrice = 20000;
        sellPrice = -1;
        varPrice = 1;
        maxPrice = 20000;
        minPrice = 20000;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "icons\zipties.paa";
    };

    class kzipties_legal {
        variable = "kzipties_legal";
        displayName = "STR_Item_KZipTiesLeg";
        weight = 2;
        buyPrice = 25000;
        sellPrice = -1;
        varPrice = 1;
        maxPrice = 25000;
        minPrice = 25000;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "icons\kzipties.paa";
    };
};
