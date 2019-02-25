/*
*    ARRAY FORMAT:
*        0: STRING (Classname)
*        1: STRING (Display Name, leave as "" for default)
*        2: SCALAR (Price)
*        4: ARRAY (This is for limiting items to certain things)
*            0: Variable to read from
*            1: Variable Value Type (SCALAR / BOOL / EQUAL)
*            2: What to compare to (-1 = Check Disabled)
*
*   Clothing classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Equipment
*   Backpacks/remaining classnames can be found here (TIP: Search page for "pack"): https://community.bistudio.com/wiki/Arma_3_CfgVehicles_EMPTY
*
*/
class Clothing {
	// Loja de roupa civil
    class bruce {
        title = "STR_Shops_C_Bruce";
        conditions = "";
        side = "civ";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
            { "U_C_Poloshirt_stripped", "Civil 1", 150, "" },
            { "U_C_Poloshirt_redwhite", "Civil 2", 150, "" },
            { "U_C_Poloshirt_salmon", "", 150, "" },
            { "U_C_Poloshirt_blue", "", 150, "" },
            { "U_C_Poloshirt_burgundy", "", 150, "" },
            { "U_C_Poloshirt_tricolour", "", 150, "" },
            { "U_C_Commoner1_1", "", 150, "" },
            { "U_C_Poor_2", "Rag tagged clothes", 250, "" },
            { "U_IG_Guerilla2_2", "Green stripped shirt & Pants", 650, "" },
            { "U_IG_Guerilla3_1", "Brown Jacket & Pants", 735, "" },
            { "U_OrestesBody", "Surfing On Land", 1100, "" },
            { "U_IG_Guerilla2_3", "The Outback Rangler", 1200, "" },
            { "U_C_HunterBody_grn", "The Hunters Look", 1500, "" },
            { "U_NikosAgedBody", "Casual Wears", 5000, "" }
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" },
            { "H_Bandanna_camo", "Camo Bandanna", 120, "" },
            { "H_Bandanna_surfer", "Surfer Bandanna", 130, "" },
            { "H_Bandanna_khk", "Khaki Bandanna", 145, "" },
            { "H_Cap_grn", "", 150, "" },
            { "H_Cap_grn_BI", "", 150, "" },
            { "H_Cap_oli", "", 150, "" },
            { "H_Cap_red", "", 150, "" },
            { "H_Booniehat_tan", "", 425, "" }
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" },
            { "G_Shades_Black", "", 20, "" },
            { "G_Shades_Blue", "", 20, "" },
            { "G_Shades_Green", "", 20, "" },
            { "G_Shades_Red", "", 20, "" },
            { "G_Sport_Blackred", "", 25, "" },
            { "G_Sport_BlackWhite", "", 25, "" },
            { "G_Sport_Blackyellow", "", 25, "" },
            { "G_Sport_Checkered", "", 25, "" },
            { "G_Sport_Greenblack", "", 25, "" },
            { "G_Sport_Red", "", 25, "" },
            { "G_Lowprofile", "", 30, "" },
            { "G_Squares", "", 50, "" },
            { "G_Aviator", "", 100, "" },
            { "G_Combat", "", 125, "" },
            { "G_Lady_Mirror", "", 150, "" },
            { "G_Lady_Dark", "", 150, "" },
            { "G_Lady_Blue", "", 150, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" }
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" },
            { "B_OutdoorPack_blk", "", 500, "" },
            { "B_AssaultPack_khk", "", 2000, "" },
            { "B_AssaultPack_dgtl", "", 2000, "" },
            { "B_AssaultPack_rgr", "", 2000, "" },
            { "B_AssaultPack_sgg", "", 2000, "" },
            { "B_AssaultPack_blk", "", 2000, "" },
            { "B_AssaultPack_cbr", "", 2000, "" },
            { "B_AssaultPack_mcamo", "", 2000, "" },
            { "B_TacticalPack_oli", "", 2500, "" },
            { "B_Kitbag_mcamo", "", 3500, "" },
            { "B_Kitbag_sgg", "", 3500, "" },
            { "B_Kitbag_cbr", "", 3500, "" },
            { "B_FieldPack_blk", "", 5000, "" },
            { "B_FieldPack_ocamo", "", 5000, "" },
            { "B_FieldPack_oucamo", "", 5000, "" },
            { "B_Bergen_sgg", "", 6500, "" },
            { "B_Bergen_mcamo", "", 6500, "" },
            { "B_Bergen_rgr", "", 6500, "" },
            { "B_Bergen_blk", "", 6500, "" },
            { "B_Carryall_ocamo", "", 7500, "" },
            { "B_Carryall_oucamo", "", 7500, "" },
            { "B_Carryall_mcamo", "", 7500, "" },
            { "B_Carryall_oli", "", 7500, "" },
            { "B_Carryall_khk", "", 7500, "" },
            { "B_Carryall_cbr", "", 7500, "" },
            { "B_Bergen_dgtl_F", "", 15000,"" } // MOCHILAO
        };
    };

	// Loja de roupa da COP
    class cop {
        title = "STR_Shops_C_Police";
        conditions = "";
        side = "cop";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
            { "U_B_Wetsuit", "Mergulhador", 200, "call cxp_coplevel >= 1" },
            { "U_I_CombatUniform", "COP", 400, "call cxp_coplevel >= 1" }
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" },
            { "H_Cap_police", "", 30, "call cxp_coplevel >= 1" },
            { "H_Beret_gen_F", "", 40, "call cxp_coplevel >= 1" },
            { "H_Beret_blk_POLICE", "", 50, "call cxp_coplevel >= 1" },
            { "H_HelmetB_plain_mcamo", "", 75, "call cxp_coplevel >= 1" },
            { "H_Booniehat_mcamo", "", 120, "call cxp_coplevel >= 1" },
            { "H_Beret_02", "NATO-OTAN", 120, "call cxp_coplevel >= 1" },
            { "H_Beret_Colonel", "CORONEL", 150, "call cxp_coplevel == 8" },
            { "H_Beret_Colonel", "CORONEL", 150, "call cxp_coplevel == 17" },
            { "H_Beret_red", "VERMELHA", 75, "call cxp_coplevel >= 1" },
            { "H_Beret_blk", "PRETA", 75, "call cxp_coplevel >= 1" },
            { "H_CrewHelmetHeli_B", "ANTI-GAS", 200, "call cxp_coplevel >= 1" }
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" },
            { "G_Squares", "", 10, "" },
            { "G_Shades_Blue", "", 20, "" },
            { "G_Sport_Blackred", "", 20, "" },
            { "G_Sport_Checkered", "", 20, "" },
            { "G_Sport_Blackyellow", "", 20, "" },
            { "G_Sport_BlackWhite", "", 20, "" },
            { "G_Shades_Black", "", 25, "" },
            { "G_Lowprofile", "", 30, "" },
            { "G_Combat", "", 55, "" },
            { "G_Aviator", "", 100, "" },
            { "G_Lady_Mirror", "", 150, "" },
            { "G_Lady_Dark", "", 150, "" },
            { "G_Lady_Blue", "", 150, "" },
            { "G_Diving", "", 180, "" },
            { "G_Bandanna_blk", "", 190, "" },
            { "G_Balaclava_blk", "", 200, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" },
            { "V_RebreatherB", "", 1000, "call cxp_coplevel >= 1" },
            { "V_TacVest_blk_POLICE", "", 1500, "call cxp_coplevel >= 1" },
            { "V_PlateCarrier2_blk", "", 1700, "call cxp_coplevel >= 1" },
            { "V_PlateCarrierSpec_blk", "", 1800, "call cxp_coplevel >= 1" }
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" },
            { "B_Carryall_oli", "", 3500, "" },
            { "B_Bergen_dgtl_F", "", 15000,"" } // MOCHILAO
        };
    };

	// Loja de roupa de mergulho
    class dive {
        title = "STR_Shops_C_Diving";
        conditions = "license_civ_dive";
        side = "civ";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
            { "U_B_Wetsuit", "", 2000, "" }
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" }
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" },
            { "G_Diving", "", 500, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" },
            { "V_RebreatherB", "", 5000, "" }
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" }
        };
    };

	// Loja de roupa farm Uranio
    class uranio_cloth {
        title = "STR_Shops_C_URANIO";
        conditions = "license_civ_uraniumL";
        side = "civ";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
            { "U_C_Scientist", "Roupa Anti-Radioativa", 10000, "" }
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" },
			{ "H_PilotHelmetFighter_B", "Capacete Anti-Radioativo", 8000, "" }
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" }
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" },
            { "B_Bergen_dgtl_F", "", 15000,"" } // MOCHILAO
        };
    };

	// Loja de roupa da loja de arma
    class gun_clothing {
        title = "STR_Shops_C_Gun";
        conditions = "license_civ_gun";
        side = "civ";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" }
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" }
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" },
            { "V_Press_F", "", 20000, "" }
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" }
        };
    };

	// Loja de roupa de esconderijo de gangue
    class gang_clothing {
        title = "STR_Shops_C_Gang";
        conditions = "";
        side = "civ";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" }
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" }
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" },
            { "V_Press_F", "", 20000, "" }
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" }
        };
    };

	// Loja de roupa do RESGATE
    class med_clothing {
        title = "STR_MAR_EMS_Clothing_Shop";
        conditions = "";
        side = "med";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
            { "U_B_Wetsuit", "Mergulhador", 100, "call cxp_mediclevel >= 1" },
            { "U_I_HeliPilotCoveralls", "Resgate", 300, "call cxp_mediclevel >= 1" },
            { "U_I_pilotCoveralls", "Comandante", 500, "call cxp_mediclevel >= 8" }
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" },
            { "H_Cap_oli", "", 10, "call cxp_mediclevel >= 1" },
            { "H_PilotHelmetFighter_I", "", 60, "call cxp_mediclevel >= 1" },
            { "H_CrewHelmetHeli_B", "ANTI-GAS", 80, "call cxp_mediclevel >= 1" },
            { "H_Beret_Colonel", "", 50, "call cxp_mediclevel >= 1" }
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" },
            { "G_Shades_Blue", "", 10, "" },
            { "G_Aviator", "", 70, "" },
            { "G_Diving", "", 90, "" },
            { "G_Respirator_yellow_F", "", 50, "" },
            { "G_Respirator_blue_F", "", 50, "" },
            { "G_Respirator_white_F", "", 50, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" },
            { "V_Rangemaster_belt", "", 500, "" },
            { "V_RebreatherB", "", 1000, "" },
            { "V_LegStrapBag_black_F", "", 1050, "" },
            { "V_Safety_yellow_F", "", 1050, "" },
            { "V_Safety_orange_F", "", 1050, "" },
            { "V_DeckCrew_red_F", "", 1050, "" }
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" },
            { "B_Bergen_dgtl_F", "", 50, "" }
        };
    };

/* BOUNTY HUNTER */
    class caca_recompCl {
        title = "STR_MAR_Cloth_Bounty";
        conditions = "license_civ_bHunterLic";
        side = "civ";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
            { "U_O_CombatUniform_ocamo", "", 7900, "" },
            { "U_B_SpecopsUniform_sgg", "", 7900, "" },
            { "U_O_CombatUniform_oucamo", "", 7900, "" },
            { "U_O_SpecopsUniform_ocamo", "", 8700, "" },
            { "U_O_SpecopsUniform_blk", "", 8700, "" },
            { "U_O_T_Soldier_F", "", 8800, "" }, // teste
            { "U_O_PilotCoveralls", "", 9800, "" },
            { "U_O_OfficerUniform_ocamo", "", 9800, "" },
            { "U_I_CombatUniform_tshirt", "", 9800, "" },
            { "U_I_OfficerUniform", "", 10000, "" },
            { "U_KerryBody", "", 10000, "" },
            { "U_IG_Guerilla1_1", "", 10000, "" },
            { "U_BG_leader", "", 11500, "" },
            { "U_OG_Guerilla1_1", "", 11500, "" },
            { "U_OG_leader", "", 11500, "" },
            { "U_B_CTRG_3", "", 11500, "" },
            { "U_B_CTRG_Soldier_urb_1_F", "", 14000, "" },
            { "U_B_CTRG_Soldier_urb_1_F", "", 14000, "" },
            { "U_B_CTRG_Soldier_F", "", 14000, "" },
            { "U_B_CTRG_Soldier_3_F", "", 17000, "" },
            { "U_B_CTRG_Soldier_2_F", "", 17000, "" },
            { "U_I_G_Story_Protagonist_F", "", 17000, "" },
            { "U_O_T_Officer_F", "", 19000, "" },
            { "U_I_C_Soldier_Para_1_F", "", 19000, "" },
            { "U_I_C_Soldier_Para_2_F", "", 19000, "" },
            { "U_I_C_Soldier_Para_3_F", "", 19000, "" },
            { "U_I_C_Soldier_Para_4_F", "", 19000, "" },
            { "U_B_GhillieSuit", "", 25000, "" },
            { "U_O_GhillieSuit", "", 25000, "" },
            { "U_I_GhillieSuit", "", 25000, "" },
            { "U_B_T_Sniper_F", "", 28000, "" },
            { "U_O_T_Sniper_F", "", 28000, "" },
            { "U_B_FullGhillie_lsh", "", 50000, "" },
            { "U_B_FullGhillie_sard", "", 50000, "" },
            { "U_B_FullGhillie_ard", "", 50000, "" },
            { "U_O_FullGhillie_lsh", "", 50000, "" },
            { "U_O_FullGhillie_sard", "", 50000, "" },
            { "U_O_FullGhillie_ard", "", 50000, "" },
            { "U_I_FullGhillie_lsh", "", 50000, "" },
            { "U_I_FullGhillie_sard", "", 50000, "" },
            { "U_B_T_FullGhillie_tna_F", "", 50000, "" },
            { "U_O_T_FullGhillie_tna_F", "", 50000, "" },
            { "U_I_FullGhillie_ard", "", 50000, "" }
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" },
            { "H_Beret_gen_F", "", 40, "" },
            { "H_Beret_02", "", 120, "" },
            { "H_Beret_red", "", 75, "" },
            { "H_Beret_blk", "", 75, "" },
            { "H_Bandanna_cbr", "", 470, "" },
            { "H_Bandanna_khk", "", 470, "" },
            { "H_Bandanna_sgg", "", 470, "" },
            { "H_Bandanna_gry", "", 470, "" },
            { "H_Bandanna_surfer", "", 470, "" },
            { "H_Bandanna_camo", "", 470, "" },
            { "H_BandMask_blk", "", 470, "" },
            { "H_Cap_tan", "", 590, "" },
            { "H_Cap_oli", "", 590, "" },
            { "H_Cap_grn", "", 590, "" },
            { "H_Cap_grn_BI", "", 590, "" },
            { "H_Cap_red", "", 590, "" },
            { "H_Cap_blk", "", 590, "" },
            { "H_StrawHat", "", 690, "" },
            { "H_Hat_blue", "", 780, "" },
            { "H_Hat_tan", "", 780, "" },
            { "H_Hat_brown", "", 780, "" },
            { "H_Hat_checker", "", 780, "" },
            { "H_Hat_grey", "", 780, "" },
            { "H_Booniehat_tan", "", 860, "" },
            { "H_Booniehat_khk", "", 860, "" },
            { "H_Booniehat_oli", "", 860, "" },
            { "H_Booniehat_indp", "", 860, "" },
            { "H_Shemag_tan", "", 950, "" },
            { "H_Shemag_olive", "", 950, "" },
            { "H_ShemagOpen_khk", "", 950, "" },
            { "H_PilotHelmetHeli_B", "", 1000, "" },
            { "H_PilotHelmetHeli_I", "", 1000, "" },
            { "H_PilotHelmetHeli_O", "", 1000, "" },
            { "H_PilotHelmetFighter_I", "", 5000, "" },
            { "H_CrewHelmetHeli_B", "ANTI-GAS", 10000, "" }
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" },
            { "G_Shades_Black", "", 25, "" },
            { "G_Shades_Blue", "", 120, "" },
            { "G_Sport_Blackred", "", 120, "" },
            { "G_Sport_Checkered", "", 120, "" },
            { "G_Sport_Blackyellow", "", 120, "" },
            { "G_Sport_BlackWhite", "", 120, "" },
            { "G_Squares", "", 145, "" },
            { "G_Aviator", "", 175, "" },
            { "G_Lady_Mirror", "", 210, "" },
            { "G_Lady_Dark", "", 210, "" },
            { "G_Lady_Blue", "", 210, "" },
            { "G_Lowprofile", "", 210, "" },
            { "G_Combat", "", 290, "" },
            { "G_Bandanna_tan", "", 380, "" },
            { "G_Bandanna_beast", "", 380, "" },
            { "G_Bandanna_blk", "", 380, "" },
            { "G_Bandanna_oli", "", 380, "" },
            { "G_Bandanna_khk", "", 380, "" },
            { "G_Bandanna_shades", "", 380, "" },
            { "G_Bandanna_aviator", "", 380, "" },
            { "G_Balaclava_oli", "", 440, "" },
            { "G_Balaclava_combat", "", 440, "" },
            { "G_Balaclava_lowprofile", "", 440, "" },
            { "G_Diving", "", 500, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" },
            { "V_Rangemaster_belt", "", 4400, "" },
            { "V_BandollierB_khk", "", 5600, "" },
            { "V_BandollierB_cbr", "", 5600, "" },
            { "V_BandollierB_oli", "", 5600, "" },
            { "V_PlateCarrier_Kerry", "", 6650, "" },
            { "V_PlateCarrier2_rgr", "", 6650, "" },
            { "V_PlateCarrierIA1_dgtl", "", 6650, "" },
            { "V_PlateCarrierIA2_dgtl", "", 6650, "" },
            { "V_PlateCarrierL_CTRG", "", 6650, "" },
            { "V_PlateCarrierH_CTRG", "", 6650, "" },
            { "V_PlateCarrierSpec_rgr", "", 6650, "" },
            { "V_PlateCarrierGL_rgr", "", 6650, "" },
            { "V_Chestrig_khk", "", 7700, "" },
            { "V_Chestrig_rgr", "", 7700, "" },
            { "V_Chestrig_oli", "", 7700, "" },
            { "V_TacVest_khk", "", 8500, "" },
            { "V_TacVest_brn", "", 8500, "" },
            { "V_TacVest_camo", "", 8500, "" },
            { "V_HarnessOGL_gry", "Explosivo", 1000000, "" }
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" },
            { "B_AssaultPack_cbr", "", 1800, "" },
            { "B_AssaultPack_sgg", "", 1800, "" },
            { "B_AssaultPack_rgr", "", 1800, "" },
            { "B_AssaultPack_dgtl", "", 1800, "" },
            { "B_AssaultPack_mcamo", "", 1800, "" },
            { "B_AssaultPack_ocamo", "", 1800, "" },
            { "B_Kitbag_mcamo", "", 3150, "" },
            { "B_FieldPack_cbr", "", 4500, "" },
            { "B_FieldPack_khk", "", 4500, "" },
            { "B_FieldPack_ocamo", "", 4500, "" },
            { "B_FieldPack_oucamo", "", 4500, "" },
            { "B_Bergen_sgg", "", 5850, "" },
            { "B_Bergen_rgr", "", 5850, "" },
            { "B_Bergen_mcamo", "", 5850, "" },
            { "B_Carryall_cbr", "", 6750, "" },
            { "B_Carryall_khk", "", 6750, "" },
            { "B_Carryall_oli", "", 6750, "" },
            { "B_Carryall_mcamo", "", 6750, "" },
            { "B_Carryall_oucamo", "", 6750, "" },
            { "B_Carryall_ocamo", "", 6750, "" },
            { "B_Bergen_dgtl_F", "", 13500, "" } // MOCHILAO
        };
    };

/* REBELDE */
    class reb_CB {
        title = "STR_Shops_C_Rebel";
        conditions = "license_civ_rebellic";
        side = "civ";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
            { "U_O_CombatUniform_ocamo", "", 7900, "" },
            { "U_B_SpecopsUniform_sgg", "", 7900, "" },
            { "U_O_CombatUniform_oucamo", "", 7900, "" },
            { "U_O_SpecopsUniform_ocamo", "", 8700, "" },
            { "U_O_SpecopsUniform_blk", "", 8700, "" },
            { "U_O_T_Soldier_F", "", 8800, "" }, // teste
            { "U_O_PilotCoveralls", "", 9800, "" },
            { "U_O_OfficerUniform_ocamo", "", 9800, "" },
            { "U_I_CombatUniform_tshirt", "", 9800, "" },
            { "U_I_OfficerUniform", "", 10000, "" },
            { "U_KerryBody", "", 10000, "" },
            { "U_IG_Guerilla1_1", "", 10000, "" },
            { "U_BG_leader", "", 11500, "" },
            { "U_OG_Guerilla1_1", "", 11500, "" },
            { "U_OG_leader", "", 11500, "" },
            { "U_B_CTRG_3", "", 11500, "" },
            { "U_B_CTRG_Soldier_urb_1_F", "", 14000, "" },
            { "U_B_CTRG_Soldier_urb_1_F", "", 14000, "" },
            { "U_B_CTRG_Soldier_F", "", 14000, "" },
            { "U_B_CTRG_Soldier_3_F", "", 17000, "" },
            { "U_B_CTRG_Soldier_2_F", "", 17000, "" },
            { "U_I_G_Story_Protagonist_F", "", 17000, "" },
            { "U_O_T_Officer_F", "", 19000, "" },
            { "U_I_C_Soldier_Para_1_F", "", 19000, "" },
            { "U_I_C_Soldier_Para_2_F", "", 19000, "" },
            { "U_I_C_Soldier_Para_3_F", "", 19000, "" },
            { "U_I_C_Soldier_Para_4_F", "", 19000, "" },
            { "U_B_GhillieSuit", "", 25000, "" },
            { "U_O_GhillieSuit", "", 25000, "" },
            { "U_I_GhillieSuit", "", 25000, "" },
            { "U_B_T_Sniper_F", "", 28000, "" },
            { "U_O_T_Sniper_F", "", 28000, "" },
            { "U_B_FullGhillie_lsh", "", 50000, "" },
            { "U_B_FullGhillie_sard", "", 50000, "" },
            { "U_B_FullGhillie_ard", "", 50000, "" },
            { "U_O_FullGhillie_lsh", "", 50000, "" },
            { "U_O_FullGhillie_sard", "", 50000, "" },
            { "U_O_FullGhillie_ard", "", 50000, "" },
            { "U_I_FullGhillie_lsh", "", 50000, "" },
            { "U_I_FullGhillie_sard", "", 50000, "" },
            { "U_B_T_FullGhillie_tna_F", "", 50000, "" },
            { "U_O_T_FullGhillie_tna_F", "", 50000, "" },
            { "U_I_FullGhillie_ard", "", 50000, "" }
        };
        headgear[] =
        {
            { "NONE", $STR_C_Remove_headgear, 0, "" },
            { "H_Beret_gen_F", "", 40, "" },
            { "H_Beret_02", "", 120, "" },
            { "H_Beret_red", "", 75, "" },
            { "H_Beret_blk", "", 75, "" },
            { "H_Bandanna_cbr", "", 470, "" },
            { "H_Bandanna_khk", "", 470, "" },
            { "H_Bandanna_sgg", "", 470, "" },
            { "H_Bandanna_gry", "", 470, "" },
            { "H_Bandanna_surfer", "", 470, "" },
            { "H_Bandanna_camo", "", 470, "" },
            { "H_BandMask_blk", "", 470, "" },
            { "H_Cap_tan", "", 590, "" },
            { "H_Cap_oli", "", 590, "" },
            { "H_Cap_grn", "", 590, "" },
            { "H_Cap_grn_BI", "", 590, "" },
            { "H_Cap_red", "", 590, "" },
            { "H_Cap_blk", "", 590, "" },
            { "H_StrawHat", "", 690, "" },
            { "H_Hat_blue", "", 780, "" },
            { "H_Hat_tan", "", 780, "" },
            { "H_Hat_brown", "", 780, "" },
            { "H_Hat_checker", "", 780, "" },
            { "H_Hat_grey", "", 780, "" },
            { "H_Booniehat_tan", "", 860, "" },
            { "H_Booniehat_khk", "", 860, "" },
            { "H_Booniehat_oli", "", 860, "" },
            { "H_Booniehat_indp", "", 860, "" },
            { "H_Shemag_tan", "", 950, "" },
            { "H_Shemag_olive", "", 950, "" },
            { "H_ShemagOpen_khk", "", 950, "" },
            { "H_PilotHelmetHeli_B", "", 1000, "" },
            { "H_PilotHelmetHeli_I", "", 1000, "" },
            { "H_PilotHelmetHeli_O", "", 1000, "" },
            { "H_PilotHelmetFighter_I", "", 5000, "" },
            { "H_CrewHelmetHeli_B", "ANTI-GAS", 10000, "" }
        };
        goggles[] =
        {
            { "NONE", $STR_C_Remove_goggles, 0, "" },
            { "G_Shades_Black", "", 25, "" },
            { "G_Shades_Blue", "", 120, "" },
            { "G_Sport_Blackred", "", 120, "" },
            { "G_Sport_Checkered", "", 120, "" },
            { "G_Sport_Blackyellow", "", 120, "" },
            { "G_Sport_BlackWhite", "", 120, "" },
            { "G_Squares", "", 145, "" },
            { "G_Aviator", "", 175, "" },
            { "G_Lady_Mirror", "", 210, "" },
            { "G_Lady_Dark", "", 210, "" },
            { "G_Lady_Blue", "", 210, "" },
            { "G_Lowprofile", "", 210, "" },
            { "G_Combat", "", 290, "" },
            { "G_Bandanna_tan", "", 380, "" },
            { "G_Bandanna_beast", "", 380, "" },
            { "G_Bandanna_blk", "", 380, "" },
            { "G_Bandanna_oli", "", 380, "" },
            { "G_Bandanna_khk", "", 380, "" },
            { "G_Bandanna_shades", "", 380, "" },
            { "G_Bandanna_aviator", "", 380, "" },
            { "G_Balaclava_oli", "", 440, "" },
            { "G_Balaclava_combat", "", 440, "" },
            { "G_Balaclava_lowprofile", "", 440, "" },
            { "G_Diving", "", 500, "" }
        };
        vests[] =
        {
            { "NONE", $STR_C_Remove_vests, 0, "" },
            { "V_Rangemaster_belt", "", 4400, "" },
            { "V_BandollierB_khk", "", 5600, "" },
            { "V_BandollierB_cbr", "", 5600, "" },
            { "V_BandollierB_oli", "", 5600, "" },
            { "V_PlateCarrier_Kerry", "", 6650, "" },
            { "V_PlateCarrier2_rgr", "", 6650, "" },
            { "V_PlateCarrierIA1_dgtl", "", 6650, "" },
            { "V_PlateCarrierIA2_dgtl", "", 6650, "" },
            { "V_PlateCarrierL_CTRG", "", 6650, "" },
            { "V_PlateCarrierH_CTRG", "", 6650, "" },
            { "V_PlateCarrierSpec_rgr", "", 6650, "" },
            { "V_PlateCarrierGL_rgr", "", 6650, "" },
            { "V_Chestrig_khk", "", 7700, "" },
            { "V_Chestrig_rgr", "", 7700, "" },
            { "V_Chestrig_oli", "", 7700, "" },
            { "V_TacVest_khk", "", 8500, "" },
            { "V_TacVest_brn", "", 8500, "" },
            { "V_TacVest_camo", "", 8500, "" },
            { "V_HarnessOGL_gry", "Explosivo", 1000000, "" }
        };
        backpacks[] =
        {
            { "NONE", $STR_C_Remove_backpacks, 0, "" },
            { "B_AssaultPack_cbr", "", 1800, "" },
            { "B_AssaultPack_sgg", "", 1800, "" },
            { "B_AssaultPack_rgr", "", 1800, "" },
            { "B_AssaultPack_dgtl", "", 1800, "" },
            { "B_AssaultPack_mcamo", "", 1800, "" },
            { "B_AssaultPack_ocamo", "", 1800, "" },
            { "B_Kitbag_mcamo", "", 3150, "" },
            { "B_FieldPack_cbr", "", 4500, "" },
            { "B_FieldPack_khk", "", 4500, "" },
            { "B_FieldPack_ocamo", "", 4500, "" },
            { "B_FieldPack_oucamo", "", 4500, "" },
            { "B_Bergen_sgg", "", 5850, "" },
            { "B_Bergen_rgr", "", 5850, "" },
            { "B_Bergen_mcamo", "", 5850, "" },
            { "B_Carryall_cbr", "", 6750, "" },
            { "B_Carryall_khk", "", 6750, "" },
            { "B_Carryall_oli", "", 6750, "" },
            { "B_Carryall_mcamo", "", 6750, "" },
            { "B_Carryall_oucamo", "", 6750, "" },
            { "B_Carryall_ocamo", "", 6750, "" },
            { "B_Bergen_dgtl_F", "", 13500, "" } // MOCHILAO
        };
    };

/* REBELDE - FIM */

	// Loja de Roupa de Kart
    class kart {
        title = "STR_Shops_C_Kart";
        conditions = "";
        side = "civ";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
            { "U_C_Driver_1_black", "", 1500, "" },
            { "U_C_Driver_1_blue", "", 1500, "" },
            { "U_C_Driver_1_red", "", 1500, "" },
            { "U_C_Driver_1_orange", "", 1500, "" },
            { "U_C_Driver_1_green", "", 1500, "" },
            { "U_C_Driver_1_white", "", 1500, "" },
            { "U_C_Driver_1_yellow", "", 1500, "" },
            { "U_C_Driver_2", "", 3500, "" },
            { "U_C_Driver_1", "", 3600, "" },
            { "U_C_Driver_3", "", 3700, "" },
            { "U_C_Driver_4", "", 3700, "" }
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" },
            { "H_RacingHelmet_1_black_F", "", 1000, "" },
            { "H_RacingHelmet_1_red_F", "", 1000, "" },
            { "H_RacingHelmet_1_white_F", "", 1000, "" },
            { "H_RacingHelmet_1_blue_F", "", 1000, "" },
            { "H_RacingHelmet_1_yellow_F", "", 1000, "" },
            { "H_RacingHelmet_1_green_F", "", 1000, "" },
            { "H_RacingHelmet_1_F", "", 2500, "" },
            { "H_RacingHelmet_2_F", "", 2500, "" },
            { "H_RacingHelmet_3_F", "", 2500, "" },
            { "H_RacingHelmet_4_F", "", 2500, "" }
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" }
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" }
        };
    };
};