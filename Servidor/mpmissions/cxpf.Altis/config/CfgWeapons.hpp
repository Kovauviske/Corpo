/*
*    FORMAT:
*        STRING (Conditions) - Must return boolean :
*            String can contain any amount of conditions, aslong as the entire
*            string returns a boolean. This allows you to check any levels, licenses etc,
*            in any combination. For example:
*                "call cxp_coplevel && license_civ_someLicense"
*            This will also let you call any other function.
*
*
*    ARRAY FORMAT:
*        0: STRING (Classname): Item Classname
*        1: STRING (Nickname): Nickname that will appear purely in the shop dialog
*        2: SCALAR (Buy price)
*        3: SCALAR (Sell price): To disable selling, this should be -1
*        4: STRING (Conditions): Same as above conditions string
*
*    Weapon classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Weapons
*    Item classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Items
*
*/
class WeaponShops {
    //Armory Shops
    class gun {
        name = "Loja de Armas Civil";
        side = "civ";
        conditions = "license_civ_gun";
        items[] = {
            { "hgun_Rook40_F", "", 6500, -1, "" },
            { "hgun_Pistol_01_F", "", 7000, -1, "" }, //Apex DLC
            { "hgun_Pistol_heavy_02_F", "", 9850, -1, "" },
            { "hgun_ACPC2_F", "", 11500, -1, "" },
            { "SMG_05_F", "", 18000, -1, "" }, //Apex DLC
            { "hgun_PDW2000_F", "", 20000, -1, "" }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 125, -1, "" },
            { "6Rnd_45ACP_Cylinder", "", 150, -1, "" },
            { "9Rnd_45ACP_Mag", "", 200, -1, "" },
            { "30Rnd_9x21_Mag", "", 250, -1, "" },
            { "30Rnd_9x21_Mag_SMG_02", "", 300, -1, "" }, //Apex DLC
            { "10Rnd_9x21_Mag", "", 250, -1, "" } //Apex DLC
        };
        accs[] = {
            { "acc_flashlight_pistol", "", 1000, -1, "" },//Pistol Flashlight
            { "optic_ACO_grn_smg", "", 2500, -1, "" }
        };
    };

	class wep_Bont : gun {
		title = "Loja de Armas Bounty Hunter";
		conditions = "license_civ_bHunterLic";
    	items[] = {
			{ "Binocular", "", 1500, -1, "" },
            { "ItemGPS", "", 300, -1, "" },
            { "ItemMap", "", 50, -1, "" },
            { "ItemCompass", "", 50, -1, "" },
            { "ItemWatch", "", 50, -1, "" },
            { "FirstAidKit", "", 150, -1, "" },
            { "NVGoggles", "", 2000, -1, "" },
      		{ "Rangefinder", "", 15000, -1, "" },
            { "arifle_SPAR_02_blk_F", "Arma de Borracha", 18000, -1, "" }
		};
		mags[] = {
			{ "150Rnd_556x45_Drum_Mag_Tracer_F", "Bala de Borracha", 200, -1, "" } //spar 16 5,6 mag
		};
		accs[] = {};
	};

    class rebel_B {
        name = "Mohammed's Jihadi Shop";
        side = "civ";
        conditions = "license_civ_rebellic";
        items[] = {
            { "arifle_TRG20_F", "", 25000, -1, "" },
            { "arifle_Katiba_F", "", 30000, -1, "" },
            { "srifle_DMR_01_F", "", 50000, -1, "" },
            { "arifle_SDAR_F", "", 20000, -1, "" },
            { "arifle_AK12_F", "", 22000, -1, "" }, //Apex DLC
            { "arifle_AKS_F", "", 22000, -1, "" }, //Apex DLC
            { "arifle_AKM_F", "", 22000, -1, "" }, //Apex DLC
            { "arifle_ARX_blk_F", "", 22000, -1, "" }, //Apex DLC
            { "arifle_SPAR_01_blk_F", "", 33000, -1, "" }, //Apex DLC
            { "arifle_CTAR_blk_F", "", 30000, -1, "" } //Apex DLC
        };
        mags[] = {
            { "30Rnd_556x45_Stanag", "", 300, -1, "" },
            { "30Rnd_762x39_Mag_F", "", 300, -1, "" }, //Apex DLC
            { "30Rnd_545x39_Mag_F", "", 300, -1, "" }, //Apex DLC
            { "30Rnd_65x39_caseless_green", "", -1, 140, "" },
            { "10Rnd_762x54_Mag", "", 500, -1, "" },
            { "20Rnd_556x45_UW_mag", "", 60, -1, "" },
            { "30Rnd_580x42_Mag_F", "", 60, -1, "" } //Apex DLC
        };
        accs[] = {
            { "optic_ACO_grn", "", 3500, -1, "" },
            { "optic_Holosight", "", 3600, -1, "" },
            { "optic_Hamr", "", 7500, -1, "" },
            { "acc_flashlight", "", 1000, -1, "" }
        };
    };

	class blackMWeapons : rebel_B {
		title = "Mercado Negro de Armas";
        conditions = "";
	};

    class gang {
        name = "Loja do Esconderijo de Gangue";
        side = "civ";
        conditions = "";
        items[] = {
            { "hgun_Rook40_F", "", 1500, -1, "" },
            { "hgun_Pistol_heavy_02_F", "", 2500, -1, "" },
            { "hgun_ACPC2_F", "", 4500, -1, "" },
            { "hgun_PDW2000_F", "", 9500, -1, "" }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 125, -1, "" },
            { "6Rnd_45ACP_Cylinder", "", 75, -1, "" },
            { "9Rnd_45ACP_Mag", "", 200, -1, "" },
            { "30Rnd_9x21_Mag", "", 250, -1, "" }
        };
        accs[] = {
            { "acc_flashlight_pistol", "", 500, -1, "" },//Pistol Flashlight
            { "optic_ACO_grn_smg", "", 950, -1, "" }
        };
    };

    //Basic Shops
    class genstore {
        name = "Loja Geral";
        side = "civ";
        conditions = "";
        items[] = {
            { "Binocular", "", 150, -1, "" },
            { "ItemGPS", "", 100, -1, "" },
            { "ItemMap", "", 50, -1, "" },
            { "ItemCompass", "", 50, -1, "" },
            { "ItemWatch", "", 50, -1, "" },
            { "FirstAidKit", "", 150, -1, "" },
            { "NVGoggles", "", 2000, -1, "" },
            { "Chemlight_red", "", 300, -1, "" },
            { "Chemlight_yellow", "", 300, -1, "" },
            { "Chemlight_green", "", 300, -1, "" },
            { "Chemlight_blue", "", 300, -1, "" }
        };
        mags[] = {};
        accs[] = {};
    };

	class geneReb : genstore {
		title = "Loja Geral Rebelde";
        conditions = "license_civ_rebellic";
	};

    class f_station_store {
        name = "Loja Geral de Posto";
        side = "";
        conditions = "";
        items[] = {
            { "Binocular", "", 750, -1, "" },
            { "ItemGPS", "", 500, -1, "" },
            { "ItemMap", "", 250, -1, "" },
            { "ItemCompass", "", 250, -1, "" },
            { "ItemWatch", "", 250, -1, "" },
            { "FirstAidKit", "", 750, -1, "" },
            { "NVGoggles", "", 10000, -1, "" },
            { "Chemlight_red", "", 1500, -1, "" },
            { "Chemlight_yellow", "", 1500, -1, "" },
            { "Chemlight_green", "", 1500, -1, "" },
            { "Chemlight_blue", "", 1500, -1, "" }
        };
        mags[] = {};
        accs[] = {};
    };

    //Cop Shops
    class cop_guns {
        name = "Loja de Armas da Policia";
        side = "cop";
        conditions = "";
        items[] = {
            { "Binocular", "", 150, -1, "" },
            { "ItemGPS", "", 100, -1, "" },
            { "FirstAidKit", "", 150, -1, "" },
            { "NVGoggles", "", 2000, -1, "" },
            { "HandGrenade_Stone", $STR_W_items_Flashbang, 850, -1, "" },
            { "hgun_P07_snds_F", $STR_W_items_StunPistol, 1000, -1, "" },
            { "hgun_PDW2000_F", "", 5000, -1, "" }, //Apex DLC
			{ "SMG_02_F", "", 7500', -1, "" },
            { "SMG_01_F", "", 10000', -1, "" },
            { "hgun_P07_khk_F", "", 7500, -1, "" }, //Apex DLC
            { "hgun_Pistol_heavy_01_F", "", 9500, -1, "call cxp_coplevel >= 1" },
            { "SMG_02_ACO_F", "", 30000, -1, "call cxp_coplevel >= 2" },
            { "arifle_MX_F", "", 35000, -1, "call cxp_coplevel >= 2" },
            { "hgun_ACPC2_F", "", 17500, -1, "call cxp_coplevel >= 3" },
            { "arifle_MXC_F", "", 30000, -1, "call cxp_coplevel >= 3" },
            { "srifle_DMR_07_blk_F", "", 32000, -1, "call cxp_coplevel >= 3" } //Apex DLC Sniper
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 125, -1, "" },
            { "20Rnd_556x45_UW_mag", $STR_W_mags_TaserRifle, 125, -1, "" },
            { "11Rnd_45ACP_Mag", "", 130, -1, "call cxp_coplevel >= 1" },
            { "30Rnd_65x39_caseless_mag", "", 130, -1, "call cxp_coplevel >= 2" },
            { "30Rnd_9x21_Mag", "", 250, -1, "call cxp_coplevel >= 2" },
            { "9Rnd_45ACP_Mag", "", 200, -1, "call cxp_coplevel >= 3" },
            { "20Rnd_650x39_Cased_Mag_F", "", 200, -1, "call cxp_coplevel >= 3" } //Apex DLC
        };
        accs[] = {
            { "muzzle_snds_L", "", 650, -1, "" },
            { "optic_MRD", "", 2750, -1, "call cxp_coplevel >= 1" },
            { "acc_flashlight_pistol", "", 250, -1, "call cxp_coplevel >= 1" },//Pistol Flashlight
            { "acc_flashlight", "", 750, -1, "call cxp_coplevel >= 2" },
            { "optic_Holosight", "", 1200, -1, "call cxp_coplevel >= 2" },
            { "optic_Arco", "", 2500, -1, "call cxp_coplevel >= 2" },
            { "muzzle_snds_H", "", 2750, -1, "call cxp_coplevel >= 2" }
        };
    };

    //Medic Shops
    class med_basic {
        name = "Loja de Itens do Samu";
        side = "med";
        conditions = "";
        items[] = {
            { "ItemGPS", "", 100, -1, "" },
            { "Binocular", "", 150, -1, "" },
            { "FirstAidKit", "", 150, -1, "" },
            { "NVGoggles", "", 1200, -1, "" }
        };
        mags[] = {};
        accs[] = {};
    };
};
