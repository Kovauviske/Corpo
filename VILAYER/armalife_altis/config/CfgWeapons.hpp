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
            { "hgun_ACPC2_F", "", 11500, -1, "" }

        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 125, -1, "" },
            { "6Rnd_45ACP_Cylinder", "", 150, -1, "" },
            { "9Rnd_45ACP_Mag", "", 200, -1, "" },
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
            { "arifle_SPAR_02_blk_F", "Arma de Borracha", 1300000, -1, "" }
		};
		mags[] = {
		      	{ "150Rnd_556x45_Drum_Mag_Tracer_F", "Bala de Borracha", 200, -1, "" }
		};
		accs[] = {};
	};

    class rebel_B {
        name = "Mohammed's Jihadi Shop";
        side = "civ";
        conditions = "license_civ_rebellic";
        items[] = {
            { "Binocular", "", 750, -1, "" },
            { "ItemGPS", "", 500, -1, "" },
            { "ItemMap", "", 250, -1, "" },
            { "ItemCompass", "", 250, -1, "" },
            { "ItemWatch", "", 250, -1, "" },
            { "FirstAidKit", "", 750, -1, "" },
            { "Chemlight_red", "", 1500, -1, "" },
            { "arifle_TRG20_F", "", 25000, -1, "" },
            { "hgun_PDW2000_F", "", 50000, -1, "" }, //PDW 2000
            { "hgun_P07_khk_F", "", 75000, -1, "" }, //Apex DLC
            { "hgun_Pistol_heavy_01_F", "", 35000, -1, "" },
            { "SMG_01_F", "", 90000, -1, "" }, // Vermin
            { "SMG_02_F", "", 100000, -1, "" }, // Sting 9 mm
            { "SMG_05_F", "", 150000, -1, "" }, // Roque 9mm
          	{ "arifle_SDAR_F", "", 200000, -1, "" }, //Sdar Normal
            { "arifle_TRG21_F", "", 250000, -1, "" }, //TRG Normal
            { "SMG_03_black", "", 275000, -1, "" }, //Apex DLC Sniper
            { "arifle_CTAR_blk_F", "", 300000, -1, "" }, //Apex DLC Sniper
            { "arifle_CTARS_blk_F", "", 950000, -1, "" }, //CAR-95-1 5,8MM Preta
            { "arifle_SPAR_01_blk_F", "", 650000, -1, "" }, //SPAR-16 5,56MM Preta
            { "arifle_SPAR_01_GL_blk_F", "", 700000, -1, "" }, //SPAR-16 5,56MM COM GL Preta
            { "arifle_SPAR_02_blk_F", "", 900000, -1, "" }, //SPAR-16S 5,56MM Preta
            { "arifle_Katiba_C_F", "", 350000, -1, "" }, //Katiba Normal
            { "arifle_MXC_Black_F", "", 500000, -1, "" } //MXC 6,5MM Preta
  };
        mags[] = {
            { "30Rnd_556x45_Stanag", "", 3000, -1, "" },
            { "30Rnd_762x39_Mag_F", "", 3000, -1, "" }, //Apex DLC
            { "30Rnd_545x39_Mag_F", "", 3000, -1, "" }, //Apex DLC
            { "30Rnd_65x39_caseless_Red", "", -1, 1400, "" },
            { "10Rnd_762x54_Mag", "", 5000, -1, "" },
            { "20Rnd_556x45_UW_mag", "", 600, -1, "" },
            { "30Rnd_556x45_Stanag_Tracer_Red", "", 1300, -1, "" },
            { "UGL_FlareRed_F", "", 1000, -1, "" },
            { "30Rnd_9x21_Green_Mag", "", 10000, -1, "" },
            { "30Rnd_65x39_caseless_green_mag_Tracer", "", 2000, -1, "" }, //Apex DLC
            { "16Rnd_9x21_green_Mag", "", 1000, -1, "" },
            { "11Rnd_45ACP_Mag", "", 1000, -1, "" },
            { "9Rnd_45ACP_Mag", "", 1000, -1, "" },
            { "30Rnd_45ACP_Mag_SMG_01_tracer_Red", "", 1000, -1, "" },
            { "30Rnd_9x21_Mag_SMG_02_Tracer_Red", "", 2000, -1, "" },
            { "150Rnd_556x45_Drum_Mag_Tracer_F", "", 20000, -1, "" },
            { "30Rnd_556x45_Stanag_Tracer_Red", "", 2000, -1, "" },
            { "50Rnd_570x28_SMG_03", "", 15000, -1, "" },
            { "100Rnd_580x42_Mag_Tracer_F", "", 20000, -1, "" },
            { "30Rnd_580x42_Mag_Tracer_F", "", 7500, -1, "" },
            { "200Rnd_556x45_Box_Tracer_F", "", 25000, -1, "" },
            { "30Rnd_65x39_caseless_mag_Tracer", "", 8500, -1, "" },
            { "200Rnd_556x45_Box_Red_F", "", 2500, -1, "" },
            { "30Rnd_580x42_Mag_F", "", 60, -1, "" } //Apex DLC
        };
        accs[] = {
            { "optic_MRD", "", 2750, -1, "" },
            { "acc_flashlight_pistol", "", 250, -1, "" },//Pistol Flashlight
            { "acc_flashlight", "", 750, -1, "" },
            { "optic_Holosight", "", 1200, -1, "" },
            { "optic_ERCO_blk_F", "", 1200, -1, "" },
            { "optic_Arco", "", 2500, -1, "" },
            { "optic_MRCO", "", 10000, -1, "" },
            { "optic_DMS", "", 15000, -1, "" },
            { "optic_MRCO", "", 15000, -1, "" },
            { "optic_Hamr", "", 15000, -1, "" },
            { "acc_pointer_IR", "", 20000, -1, "" }
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
            { "arifle_SDAR_F", "", 20000, -1, "" },
            { "hgun_PDW2000_F", "", 9500, -1, "" }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 125, -1, "" },
            { "6Rnd_45ACP_Cylinder", "", 75, -1, "" },
            { "9Rnd_45ACP_Mag", "", 200, -1, "" },
            { "9Rnd_45ACP_Mag", "", 200, -1, "" },
            { "30Rnd_556x45_Stanag_Tracer_Red", "", 200, -1, "" }
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
            { "Chemlight_red", "", 300, -1, "" },
            { "Chemlight_yellow", "", 300, -1, "" },
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
            { "Chemlight_red", "", 1500, -1, "" },
            { "Chemlight_yellow", "", 1500, -1, "" },
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
            { "Binocular", "", 2000, -1, "call cxp_coplevel >= 1" },
            { "ItemGPS", "", 500, -1, "" },
            { "ItemMap", "", 250, -1, "" },
            { "ItemCompass", "", 250, -1, "" },
            { "ItemWatch", "", 250, -1, "" },
            { "FirstAidKit", "", 5000, -1, "call cxp_coplevel >= 1" },
            { "Chemlight_yellow", "", 1500, -1, "" },
            { "HandGrenade_Stone", $STR_W_items_Flashbang, 25000, -1, "call cxp_coplevel >= 1" },
            { "hgun_P07_snds_F", $STR_W_items_StunPistol, 5000, -1, "call cxp_coplevel >= 1" },
            { "hgun_PDW2000_F", "", 5000, -1, "call cxp_coplevel >= 1" }, //PDW 2000
            { "hgun_P07_khk_F", "", 7500, -1, "call cxp_coplevel >= 1" }, //Apex DLC
            { "hgun_Pistol_heavy_01_F", "", 1000, -1, "call cxp_coplevel >= 1" },
            { "SMG_01_F", "", 30000, -1, "call cxp_coplevel >= 1" }, // Vermin
            { "SMG_02_F", "", 30000, -1, "call cxp_coplevel >= 1" }, // Sting 9 mm
            { "SMG_05_F", "", 30000, -1, "call cxp_coplevel >= 1" }, // Roque 9mm
          	{ "arifle_SDAR_F", "", 70000, -1, "call cxp_coplevel >= 1" }, //Sdar Normal
            { "arifle_TRG21_F", "", 50000, -1, "call cxp_coplevel >= 1" }, //TRG Normal
            { "arifle_TRG21_GL_F", "", 50000, -1, "call cxp_coplevel >= 1" }, //TRG com GL
            { "SMG_03_camo", "", 50000, -1, "call cxp_coplevel >= 1" }, //ADR-97  5,7 mm CAMUFLADA
            { "SMG_03_black", "", 50000, -1, "call cxp_coplevel >= 1" }, //ADR-97  5,7 mm PRETA
            { "SMG_03C_TR_hex", "", 50000, -1, "call cxp_coplevel >= 1" }, //ADR-97C TR 5,7 mm
            { "SMG_03_black", "", 50000, -1, "call cxp_coplevel >= 1" }, //Apex DLC Sniper
            { "arifle_CTAR_blk_F", "", 100000, -1, "call cxp_coplevel >= 1" }, //Apex DLC Sniper
            { "arifle_CTARS_blk_F", "", 950000, -1, "call cxp_coplevel >= 1" }, //CAR-95-1 5,8MM Preta
            { "arifle_SPAR_01_blk_F", "", 650000, -1, "call cxp_coplevel >= 1" }, //SPAR-16 5,56MM Preta
            { "arifle_SPAR_01_GL_blk_F", "", 700000, -1, "call cxp_coplevel >= 1" }, //SPAR-16 5,56MM COM GL Preta
            { "arifle_SPAR_02_blk_F", "", 900000, -1, "call cxp_coplevel >= 1" }, //SPAR-16S 5,56MM Preta
            { "arifle_Katiba_C_F", "", 350000, -1, "call cxp_coplevel >= 1" }, //Katiba Normal
            { "arifle_MXC_Black_F", "", 500000, -1, "call cxp_coplevel >= 1" } //MXC 6,5MM Preta

        };
        mags[] = {
            { "16Rnd_9x21_green_Mag", "", 1000, -1, "call cxp_coplevel >= 1" },
            { "11Rnd_45ACP_Mag", "", 1000, -1, "call cxp_coplevel >= 1" },
            { "30Rnd_556x45_Stanag_Tracer_Green", "", 130, -1, "call cxp_coplevel >= 1" },
            { "UGL_FlareGreen_F", "", 1000, -1, "call cxp_coplevel >= 1" },
            { "30Rnd_9x21_Green_Mag", "", 1000, -1, "call cxp_coplevel >= 1" },
            { "30Rnd_65x39_caseless_green_mag_Tracer", "", 2000, -1, "call cxp_coplevel >= 1" }, //Apex DLC
            { "16Rnd_9x21_green_Mag", "", 1000, -1, "call cxp_coplevel >= 1" },
            { "11Rnd_45ACP_Mag", "", 1000, -1, "call cxp_coplevel >= 1" },
            { "9Rnd_45ACP_Mag", "", 1000, -1, "call cxp_coplevel >= 1" },
            { "30Rnd_45ACP_Mag_SMG_01_tracer_green", "", 1000, -1, "call cxp_coplevel >= 1" },
            { "30Rnd_9x21_Mag_SMG_02_Tracer_Green", "", 2000, -1, "call cxp_coplevel >= 1" },
            { "150Rnd_556x45_Drum_Mag_Tracer_F", "", 17500, -1, "call cxp_coplevel >= 1" },
            { "30Rnd_556x45_Stanag_Tracer_Green", "", 4000, -1, "call cxp_coplevel >= 1" },
            { "100Rnd_580x42_Mag_Tracer_F", "", 20000, -1, "call cxp_coplevel >= 1" },
            { "50Rnd_570x28_SMG_03", "", 15000, -1, "call cxp_coplevel >= 1" },
            { "30Rnd_580x42_Mag_Tracer_F", "", 5000, -1, "call cxp_coplevel >= 1" },
            { "200Rnd_556x45_Box_Tracer_F", "", 20000, -1, "call cxp_coplevel >= 1" },
            { "30Rnd_65x39_caseless_mag_Tracer", "", 8000, -1, "call cxp_coplevel >= 1" }
        };
        accs[] = {
            { "muzzle_snds_L", "", 5000, -1, "call cxp_coplevel >= 1" },
            { "optic_MRD", "", 2750, -1, "call cxp_coplevel >= 1" },
            { "acc_flashlight_pistol", "", 1500, -1, "call cxp_coplevel >= 1" },//Pistol Flashlight
            { "acc_flashlight", "", 5000, -1, "call cxp_coplevel >= 1" },
            { "optic_Holosight", "", 1200, -1, "call cxp_coplevel >= 1" },
            { "optic_Arco", "", 2500, -1, "call cxp_coplevel >= 1" },
            { "muzzle_snds_58_blk_F", "", 20000, -1, "call cxp_coplevel >= 1" },
            { "optic_MRCO", "", 10000, -1, "call cxp_coplevel >= 1" },
            { "optic_DMS", "", 15000, -1, "call cxp_coplevel >= 1" },
            { "optic_ERCO_blk_F", "", 1200, -1, "" },
            { "acc_pointer_IR", "", 20000, -1, "call cxp_coplevel >= 1" },
            { "muzzle_snds_M", "", 100000, -1, "call cxp_coplevel >= 1" },
            { "muzzle_snds_H", "", 100000, -1, "call cxp_coplevel >= 1" }
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
            { "Chemlight_blue", "", 1500, -1, "" },
            { "FirstAidKit", "", 1500, -1, "" }
        };
        mags[] = {};
        accs[] = {};
    };
};
