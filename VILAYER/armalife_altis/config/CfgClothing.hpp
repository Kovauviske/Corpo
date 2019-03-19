/*
*    ARRAY FORMAT:
*        0: STRING (Classname) s
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
           	{ "U_I_G_Story_Protagonist_F", "Trasito", 5000, "call cxp_coplevel >= 1" }, //Transito
            { "U_Rangemaster", "Uniforme Recruta", 6000, "call cxp_coplevel == 2" }, //Policia Militar - Recruta
            { "U_BG_Guerrilla_6_1", "Uniforme Aguia", 15000, "call cxp_coplevel >= 3" }, //Policia Militar - Recruta
		      	{ "U_I_CombatUniform_shortsleeve", "Uniforme PM", 5000 "call cxp_coplevel == 3" }, //Policia Militar - Soldado
		      	{ "U_I_CombatUniform_shortsleeve", "Uniforme PM", 4500, "call cxp_coplevel == 4" }, //Policia Militar - Cabo
			      { "U_I_CombatUniform_shortsleeve", "Uniforme PM", 4000, "call cxp_coplevel == 6" }, //Policia Militar - 3ª Sargento
		      	{ "U_I_CombatUniform_shortsleeve", "Uniforme PM", 3500, "call cxp_coplevel == 7" }, //Policia Militar - 2ª Sargento
			      { "U_I_CombatUniform_shortsleeve", "Uniforme PM", 3000, "call cxp_coplevel == 8" }, //Policia Militar - 1ª Sargento
			{ "U_I_CombatUniform_shortsleeve", "Uniforme PM", 2500, "call cxp_coplevel == 9" }, //Policia Militar - SubTenente
			{ "U_I_CombatUniform_shortsleeve", "Uniforme PM", 2000, "call cxp_coplevel == 10" }, //Policia Militar - Aspirante
			{ "U_I_CombatUniform_shortsleeve", "Uniforme PM", 1500, "call cxp_coplevel == 11" }, //Policia Militar - Segundo Tenente
			{ "U_I_CombatUniform_shortsleeve", "Uniforme PM", 1000, "call cxp_coplevel == 12" }, //Policia Militar - Primeiro Tenente
			{ "U_I_CombatUniform_shortsleeve", "Uniforme PM", 900, "call cxp_coplevel == 32" }, //Policia Militar - Capitão
			{ "U_I_CombatUniform_shortsleeve", "Uniforme PM", 700, "call cxp_coplevel == 33" }, //Policia Militar - Major
			{ "U_I_CombatUniform_shortsleeve", "Uniforme PM", 800, "call cxp_coplevel == 34" }, //Policia Militar - Tenente Coronel
			{ "U_I_CombatUniform_shortsleeve", "Uniforme PM", 500, "call cxp_coplevel == 35" }, //Policia Militar - Coronel
            { "U_Rangemaster", "Uniforme Recruta", 6000, "call cxp_coplevel == 12" }, //Policia Militar - Divisão ROCAM  - Recruta
		    { "I_Soldier_AAA_F", "Uniforme PM-ROCAM", 5000, "call cxp_coplevel == 13" }, //Policia Militar - Divisão ROCAM  - Soldado
		    { "I_Soldier_AAA_F", "Uniforme PM-ROCAM", 4500, "call cxp_coplevel == 14" }, //Policia Militar - Divisão ROCAM - Cabo
		    { "I_Soldier_AAA_F", "Uniforme PM-ROCAM", 3000, "call cxp_coplevel == 17" }, //Policia Militar - Divisão ROCAM - 3ª Sargento
		    { "I_Soldier_AAA_F", "Uniforme PM-ROCAM", 4000, "call cxp_coplevel == 15" }, //Policia Militar - Divisão ROCAM - 2ª Sargento
		    { "I_Soldier_AAA_F", "Uniforme PM-ROCAM", 3500, "call cxp_coplevel == 16" }, //Policia Militar - Divisão ROCAM - 1ª Sargento
		    { "I_Soldier_AAA_F", "Uniforme PM-ROCAM", 3000, "call cxp_coplevel == 17" }, //Policia Militar - Divisão ROCAM - SubTenente
		    { "I_Soldier_AAA_F", "Uniforme PM-ROCAM", 2500, "call cxp_coplevel == 18" }, //Policia Militar - Divisão ROCAM - Aspirante
		    { "I_Soldier_AAA_F", "Uniforme PM-ROCAM", 2000, "call cxp_coplevel == 19" }, //Policia Militar - Divisão ROCAM - Segundo Tenente
		    { "I_Soldier_AAA_F", "Uniforme PM-ROCAM", 1500, "call cxp_coplevel == 20" }, //Policia Militar - Divisão ROCAM - Primeiro Tenente
		    { "I_Soldier_AAA_F", "Uniforme PM-ROCAM", 1000, "call cxp_coplevel == 32" }, //Policia Militar - Divisão ROCAM - Capitão
		    { "I_Soldier_AAA_F", "Uniforme PM-ROCAM", 900, "call cxp_coplevel == 33" }, //Policia Militar - Divisão ROCAM - Major
		    { "I_Soldier_AAA_F", "Uniforme PM-ROCAM", 800, "call cxp_coplevel == 34" }, //Policia Militar - Divisão ROCAM - Tenente Coronel
		    { "I_Soldier_AAA_F", "Uniforme PM-ROCAM", 500, "call cxp_coplevel == 35" }, //Policia Militar - Divisão ROCAM - Coronel
            { "U_Rangemaster", "Uniforme Recruta", 6000, "call cxp_coplevel == 22" }, //Policia Militar - Divisão GATE  - Recruta
            { "U_I_CombatUniform", "Uniforme PM-GATE", 5000, "call cxp_coplevel == 23" }, //Policia Militar - Divisão GATE  - Soldado
            { "U_I_CombatUniform", "Uniforme PM-GATE", 4500, "call cxp_coplevel == 24" }, //Policia Militar - Divisão GATE - Cabo
            { "U_I_CombatUniform", "Uniforme PM-GATE", 4000, "call cxp_coplevel == 25" }, //Policia Militar - Divisão GATE - 3ª Sargento
            { "U_I_CombatUniform", "Uniforme PM-GATE", 3500, "call cxp_coplevel == 26" }, //Policia Militar - Divisão GATE - 2ª Sargento
            { "U_I_CombatUniform", "Uniforme PM-GATE", 3000, "call cxp_coplevel == 27" }, //Policia Militar - Divisão GATE - 1ª Sargento
            { "U_I_CombatUniform", "Uniforme PM-GATE", 2500, "call cxp_coplevel == 28" }, //Policia Militar - Divisão GATE - SubTenente
            { "U_I_CombatUniform", "Uniforme PM-GATE", 2000, "call cxp_coplevel == 29" }, //Policia Militar - Divisão GATE - Aspirante
            { "U_I_CombatUniform", "Uniforme PM-GATE", 1500, "call cxp_coplevel == 30" }, //Policia Militar - Divisão GATE - Segundo Tenente
            { "U_I_CombatUniform", "Uniforme PM-GATE", 1000, "call cxp_coplevel == 31" }, //Policia Militar - Divisão GATE - Primeiro Tenente
            { "U_I_CombatUniform", "Uniforme PM-GATE", 900, "call cxp_coplevel == 32" }, //Policia Militar - Divisão GATE - Capitão
            { "U_I_CombatUniform", "Uniforme PM-GATE", 800, "call cxp_coplevel == 33" }, //Policia Militar - Divisão GATE - Major
            { "U_I_CombatUniform", "Uniforme PM-GATE", 700, "call cxp_coplevel == 34" }, //Policia Militar - Divisão GATE - Tenente Coronel
            { "U_I_CombatUniform", "Uniforme PM-GATE", 500, "call cxp_coplevel == 35" }, //Policia Militar - Divisão GATE - Coronel
            { "U_Rangemaster", "Uniforme Recruta", 6000, "call cxp_coplevel >= 32" } //Policia Militar - Recruta
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" },
            { "H_Cap_White_IDAP_F", "Chapeu - CT", 5000, "call cxp_coplevel == 1" }, //CT
            { "H_MilCap_gry", "Chapeu e Fone - CT", 7000, "call cxp_coplevel == 1" }, //CT
            { "H_Cap_police", "Chapeu - Recruta", 5000, "call cxp_coplevel == 2" }, //Recruta
            { "H_Cap_police", "Chapeu - Recruta", 5000, "call cxp_coplevel == 12" }, //Recruta
            { "H_Cap_police", "Chapeu - Recruta", 5000, "call cxp_coplevel == 22" }, //Recruta
            { "H_Beret_blk", "Boina Sd e Cb", 5000, "call cxp_coplevel == 3" }, //Policia Militar - Soldado
            { "H_Beret_blk", "Boina Sd e Cb", 5000, "call cxp_coplevel == 13" }, //Policia Militar - Divisão ROCAM - Soldado
            { "H_Beret_blk", "Boina Sd e Cb", 5000, "call cxp_coplevel == 23" }, //Policia Militar - Divisão GATE - Soldado
            { "H_Beret_blk", "Boina Sd e Cb", 4500, "call cxp_coplevel == 4" }, //Policia Militar - Cabo
            { "H_Beret_blk", "Boina Sd e Cb", 4500, "call cxp_coplevel == 14" }, //Policia Militar - Divisão ROCAM - Cabo
            { "H_Beret_blk", "Boina Sd e Cb", 4500, "call cxp_coplevel == 15" }, //Policia Militar - Divisão GATE  - Cabo
            { "H_Beret_02", "Boina Sgt e Ten", 4000, "call cxp_coplevel == 5" }, //Policia Militar - 3º Sargento
            { "H_Beret_02", "Boina Sgt e Ten", 3500, "call cxp_coplevel == 6" }, //Policia Militar - 2º Sargento
            { "H_Beret_02", "Boina Sgt e Ten", 3000, "call cxp_coplevel == 7" }, //Policia Militar - 1º Sargento
            { "H_Beret_02", "Boina Sgt e Ten", 2500, "call cxp_coplevel == 8" }, //Policia Militar - SubTenente
            { "H_Beret_02", "Boina Sgt e Ten", 2000, "call cxp_coplevel == 9" }, //Policia Militar - Aspirante
            { "H_Beret_02", "Boina Sgt e Ten", 1500, "call cxp_coplevel == 10" }, //Policia Militar - Segundo Tenente
            { "H_Beret_02", "Boina Sgt e Ten", 1000, "call cxp_coplevel == 11" }, //Policia Militar - Primeiro Tenente
            { "H_Beret_02", "Boina Sgt e Ten", 4000, "call cxp_coplevel == 15" }, //Policia Militar - Divisão ROCAM - 3ª Sargento
            { "H_Beret_02", "Boina Sgt e Ten", 3500, "call cxp_coplevel == 16" }, //Policia Militar - Divisão ROCAM - 2ª Sargento
            { "H_Beret_02", "Boina Sgt e Ten", 3000, "call cxp_coplevel == 17" }, //Policia Militar - Divisão ROCAM - 1ª Sargento
            { "H_Beret_02", "Boina Sgt e Ten", 2500, "call cxp_coplevel == 18" }, //Policia Militar - Divisão ROCAM - SubTenente
            { "H_Beret_02", "Boina Sgt e Ten", 2000, "call cxp_coplevel == 19" }, //Policia Militar - Divisão ROCAM - Aspirante
            { "H_Beret_02", "Boina Sgt e Ten", 1500, "call cxp_coplevel == 20" }, //Policia Militar - Divisão ROCAM - Segundo Tenente
            { "H_Beret_02", "Boina Sgt e Ten", 1000, "call cxp_coplevel == 21" }, //Policia Militar - Divisão ROCAM - Primeiro Tenente
            { "H_Beret_02", "Boina Sgt e Ten", 4000, "call cxp_coplevel == 25" }, //Policia Militar - Divisão GATE - 3ª Sargento
            { "H_Beret_02", "Boina Sgt e Ten", 3500, "call cxp_coplevel == 26" }, //Policia Militar - Divisão GATE - 2ª Sargento
            { "H_Beret_02", "Boina Sgt e Ten", 3000, "call cxp_coplevel == 27" }, //Policia Militar - Divisão GATE - 1ª Sargento
            { "H_Beret_02", "Boina Sgt e Ten", 2500, "call cxp_coplevel == 28" }, //Policia Militar - Divisão GATE - SubTenente
            { "H_Beret_02", "Boina Sgt e Ten", 2000, "call cxp_coplevel == 29" }, //Policia Militar - Divisão GATE - Aspirante
            { "H_Beret_02", "Boina Sgt e Ten", 1500, "call cxp_coplevel == 30" }, //Policia Militar - Divisão GATE - Segundo Tenente
            { "H_Beret_02", "Boina Sgt e Ten", 1000, "call cxp_coplevel == 31" }, //Policia Militar - Divisão GATE - Primeiro Tenente
            { "H_Beret_02", "Boina Sgt e Ten", 500, "call cxp_coplevel == 32" }, //Policia Militar - COMANDO - CAPITÃO
            { "H_Beret_02", "Boina Sgt e Ten", 200, "call cxp_coplevel == 33" }, //Policia Militar - COMANDO - MAJOR
            { "H_Beret_02", "Boina Sgt e Ten", 100, "call cxp_coplevel == 34" }, //Policia Militar - COMANDO - Tenente Coronel
            { "H_Beret_02", "Boina Sgt e Ten", 50, "call cxp_coplevel == 35" }, //Policia Militar - COMANDO - CORONEL
            { "H_Beret_Colonel", "Boina Sgt e Ten", 500, "call cxp_coplevel == 32" }, //Policia Militar - COMANDO - CAPITÃO
            { "H_Beret_Colonel", "Boina Sgt e Ten", 200, "call cxp_coplevel == 33" }, //Policia Militar - COMANDO - MAJOR
            { "H_Beret_Colonel", "Boina Sgt e Ten", 100, "call cxp_coplevel == 34" }, //Policia Militar - COMANDO - Tenente Coronel
            { "H_Beret_Colonel", "Boina Sgt e Ten", 50, "call cxp_coplevel == 35" }, //Policia Militar - COMANDO - CORONEL
            { "H_CrewHelmetHeli_B", "Capacete - Rocam", 10000, "call cxp_coplevel == 13" }, //Policia Militar - Divisão ROCAM - Soldado
            { "H_CrewHelmetHeli_B", "Capacete - Rocam", 9000, "call cxp_coplevel == 14" }, //Policia Militar - Divisão ROCAM - Cabo
            { "H_CrewHelmetHeli_B", "Capacete - Rocam", 8000, "call cxp_coplevel == 15" }, //Policia Militar - Divisão ROCAM - 3ª Sargento
            { "H_CrewHelmetHeli_B", "Capacete - Rocam", 7000, "call cxp_coplevel == 16" }, //Policia Militar - Divisão ROCAM - 2ª Sargento
            { "H_CrewHelmetHeli_B", "Capacete - Rocam", 6000, "call cxp_coplevel == 17" }, //Policia Militar - Divisão ROCAM - 1ª Sargento
            { "H_CrewHelmetHeli_B", "Capacete - Rocam", 5000, "call cxp_coplevel == 18" }, //Policia Militar - Divisão ROCAM - SubTenente
            { "H_CrewHelmetHeli_B", "Capacete - Rocam", 4000, "call cxp_coplevel == 19" }, //Policia Militar - Divisão ROCAM - Aspirante
            { "H_CrewHelmetHeli_B", "Capacete - Rocam", 3000, "call cxp_coplevel == 20" }, //Policia Militar - Divisão ROCAM - 2ª Tenente
            { "H_CrewHelmetHeli_B", "Capacete - Rocam", 2000, "call cxp_coplevel == 21" }, //Policia Militar - Divisão ROCAM - 1ª Tenente
            { "H_PASGT_basic_black_F", "Capacete - Rocam", 10000, "call cxp_coplevel == 23" }, //Policia Militar - Divisão GATE - Soldado
            { "H_PASGT_basic_black_F", "Capacete - Rocam", 9000, "call cxp_coplevel == 24" }, //Policia Militar - Divisão GATE - Cabo
            { "H_PASGT_basic_black_F", "Capacete - Rocam", 8000, "call cxp_coplevel == 25" }, //Policia Militar - Divisão GATE - 3ª Sargento
            { "H_PASGT_basic_black_F", "Capacete - Rocam", 7000, "call cxp_coplevel == 26" }, //Policia Militar - Divisão GATE - 2ª Sargento
            { "H_PASGT_basic_black_F", "Capacete - Rocam", 6000, "call cxp_coplevel == 27" }, //Policia Militar - Divisão GATE - 1ª Sargento
            { "H_PASGT_basic_black_F", "Capacete - Rocam", 5000, "call cxp_coplevel == 28" }, //Policia Militar - Divisão GATE - SubTenente
            { "H_PASGT_basic_black_F", "Capacete - Rocam", 4000, "call cxp_coplevel == 29" }, //Policia Militar - Divisão GATE - Aspirante
            { "H_PASGT_basic_black_F", "Capacete - Rocam", 3000, "call cxp_coplevel == 30" }, //Policia Militar - Divisão GATE - 2ª Tenente
            { "H_PASGT_basic_black_F", "Capacete - Rocam", 2000, "call cxp_coplevel == 31" } //Policia Militar - Divisão GATE - 1ª Tenente
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" },
			{ "NONE", $STR_C_Remove_goggles, 0, "" },
			{ "G_Spectacles_Tinted", "Oculos", 5000 "call cxp_coplevel == 3" }, //Policia Militar - Soldado
			{ "G_Spectacles_Tinted", "Oculos", 4500, "call cxp_coplevel == 4" }, //Policia Militar - Cabo
			{ "G_Spectacles_Tinted", "Oculos", 4000, "call cxp_coplevel == 6" }, //Policia Militar - 3ª Sargento
			{ "G_Spectacles_Tinted", "Oculos", 3500, "call cxp_coplevel == 7" }, //Policia Militar - 2ª Sargento
			{ "G_Spectacles_Tinted", "Oculos", 3000, "call cxp_coplevel == 8" }, //Policia Militar - 1ª Sargento
			{ "G_Spectacles_Tinted", "Oculos", 2500, "call cxp_coplevel == 9" }, //Policia Militar - SubTenente
			{ "G_Spectacles_Tinted", "Oculos", 2000, "call cxp_coplevel == 10" }, //Policia Militar - Aspirante
			{ "G_Spectacles_Tinted", "Oculos", 1500, "call cxp_coplevel == 11" }, //Policia Militar - Segundo Tenente
			{ "G_Spectacles_Tinted", "Oculos", 1000, "call cxp_coplevel == 12" }, //Policia Militar - Primeiro Tenente
			{ "G_Spectacles_Tinted", "Oculos", 900, "call cxp_coplevel == 32" }, //Policia Militar - Capitão
			{ "G_Spectacles_Tinted", "Oculos", 700, "call cxp_coplevel == 33" }, //Policia Militar - Major
			{ "G_Spectacles_Tinted", "Oculos", 800, "call cxp_coplevel == 34" }, //Policia Militar - Tenente Coronel
			{ "G_Spectacles_Tinted", "Oculos", 500, "call cxp_coplevel == 35" }, //Policia Militar - Coronel
		    { "G_Spectacles_Tinted", "Oculos", 5000, "call cxp_coplevel == 13" }, //Policia Militar - Divisão ROCAM  - Soldado
		    { "G_Spectacles_Tinted", "Oculos", 4500, "call cxp_coplevel == 14" }, //Policia Militar - Divisão ROCAM - Cabo
		    { "G_Spectacles_Tinted", "Oculos", 3000, "call cxp_coplevel == 17" }, //Policia Militar - Divisão ROCAM - 3ª Sargento
		    { "G_Spectacles_Tinted", "Oculos", 4000, "call cxp_coplevel == 15" }, //Policia Militar - Divisão ROCAM - 2ª Sargento
		    { "G_Spectacles_Tinted", "Oculos", 3500, "call cxp_coplevel == 16" }, //Policia Militar - Divisão ROCAM - 1ª Sargento
		    { "G_Spectacles_Tinted", "Oculos", 3000, "call cxp_coplevel == 17" }, //Policia Militar - Divisão ROCAM - SubTenente
		    { "G_Spectacles_Tinted", "Oculos", 2500, "call cxp_coplevel == 18" }, //Policia Militar - Divisão ROCAM - Aspirante
		    { "G_Spectacles_Tinted", "Oculos", 2000, "call cxp_coplevel == 19" }, //Policia Militar - Divisão ROCAM - Segundo Tenente
		    { "G_Spectacles_Tinted", "Oculos", 1500, "call cxp_coplevel == 20" }, //Policia Militar - Divisão ROCAM - Primeiro Tenente
		    { "G_Spectacles_Tinted", "Oculos", 1000, "call cxp_coplevel == 32" }, //Policia Militar - Divisão ROCAM - Capitão
		    { "G_Spectacles_Tinted", "Oculos", 900, "call cxp_coplevel == 33" }, //Policia Militar - Divisão ROCAM - Major
		    { "G_Spectacles_Tinted", "Oculos", 800, "call cxp_coplevel == 34" }, //Policia Militar - Divisão ROCAM - Tenente Coronel
		    { "G_Spectacles_Tinted", "Oculos", 500, "call cxp_coplevel == 35" }, //Policia Militar - Divisão ROCAM - Coronel
            { "G_Spectacles_Tinted", "Oculos", 5000, "call cxp_coplevel == 23" }, //Policia Militar - Divisão GATE  - Soldado
            { "G_Spectacles_Tinted", "Oculos", 4500, "call cxp_coplevel == 24" }, //Policia Militar - Divisão GATE - Cabo
            { "G_Spectacles_Tinted", "Oculos", 4000, "call cxp_coplevel == 25" }, //Policia Militar - Divisão GATE - 3ª Sargento
            { "G_Spectacles_Tinted", "Oculos", 3500, "call cxp_coplevel == 26" }, //Policia Militar - Divisão GATE - 2ª Sargento
            { "G_Spectacles_Tinted", "Oculos", 3000, "call cxp_coplevel == 27" }, //Policia Militar - Divisão GATE - 1ª Sargento
            { "G_Spectacles_Tinted", "Oculos", 2500, "call cxp_coplevel == 28" }, //Policia Militar - Divisão GATE - SubTenente
            { "G_Spectacles_Tinted", "Oculos", 2000, "call cxp_coplevel == 29" }, //Policia Militar - Divisão GATE - Aspirante
            { "G_Spectacles_Tinted", "Oculos", 1500, "call cxp_coplevel == 30" }, //Policia Militar - Divisão GATE - Segundo Tenente
            { "G_Spectacles_Tinted", "Oculos", 1000, "call cxp_coplevel == 31" }, //Policia Militar - Divisão GATE - Primeiro Tenente
            { "G_Spectacles_Tinted", "Oculos", 900, "call cxp_coplevel == 32" }, //Policia Militar - Divisão GATE - Capitão
            { "G_Spectacles_Tinted", "Oculos", 800, "call cxp_coplevel == 33" }, //Policia Militar - Divisão GATE - Major
            { "G_Spectacles_Tinted", "Oculos", 700, "call cxp_coplevel == 34" }, //Policia Militar - Divisão GATE - Tenente Coronel
            { "G_Spectacles_Tinted", "Oculos", 500, "call cxp_coplevel == 35" }, //Policia Militar - Divisão GATE - Coronel
			{ "G_Goggles_VR", "Oculos RV", 5000 "call cxp_coplevel == 3" }, //Policia Militar - Soldado
			{ "G_Goggles_VR", "Oculos RV", 4500, "call cxp_coplevel == 4" }, //Policia Militar - Cabo
			{ "G_Goggles_VR", "Oculos RV", 4000, "call cxp_coplevel == 6" }, //Policia Militar - 3ª Sargento
			{ "G_Goggles_VR", "Oculos RV", 3500, "call cxp_coplevel == 7" }, //Policia Militar - 2ª Sargento
			{ "G_Goggles_VR", "Oculos RV", 3000, "call cxp_coplevel == 8" }, //Policia Militar - 1ª Sargento
			{ "G_Goggles_VR", "Oculos RV", 2500, "call cxp_coplevel == 9" }, //Policia Militar - SubTenente
			{ "G_Goggles_VR", "Oculos RV", 2000, "call cxp_coplevel == 10" }, //Policia Militar - Aspirante
			{ "G_Goggles_VR", "Oculos RV", 1500, "call cxp_coplevel == 11" }, //Policia Militar - Segundo Tenente
			{ "G_Goggles_VR", "Oculos RV", 1000, "call cxp_coplevel == 12" }, //Policia Militar - Primeiro Tenente
			{ "G_Goggles_VR", "Oculos RV", 900, "call cxp_coplevel == 32" }, //Policia Militar - Capitão
			{ "G_Goggles_VR", "Oculos RV", 700, "call cxp_coplevel == 33" }, //Policia Militar - Major
			{ "G_Goggles_VR", "Oculos RV", 800, "call cxp_coplevel == 34" }, //Policia Militar - Tenente Coronel
			{ "G_Goggles_VR", "Oculos RV", 500, "call cxp_coplevel == 35" }, //Policia Militar - Coronel
		    { "G_Goggles_VR", "Oculos de Sol", 5000, "call cxp_coplevel == 13" }, //Policia Militar - Divisão ROCAM  - Soldado
		    { "G_Goggles_VR", "Oculos de Sol", 4500, "call cxp_coplevel == 14" }, //Policia Militar - Divisão ROCAM - Cabo
		    { "G_Goggles_VR", "Oculos de Sol", 3000, "call cxp_coplevel == 17" }, //Policia Militar - Divisão ROCAM - 3ª Sargento
		    { "G_Goggles_VR", "Oculos de Sol", 4000, "call cxp_coplevel == 15" }, //Policia Militar - Divisão ROCAM - 2ª Sargento
		    { "G_Goggles_VR", "Oculos de Sol", 3500, "call cxp_coplevel == 16" }, //Policia Militar - Divisão ROCAM - 1ª Sargento
		    { "G_Goggles_VR", "Oculos de Sol", 3000, "call cxp_coplevel == 17" }, //Policia Militar - Divisão ROCAM - SubTenente
		    { "G_Goggles_VR", "Oculos de Sol", 2500, "call cxp_coplevel == 18" }, //Policia Militar - Divisão ROCAM - Aspirante
		    { "G_Goggles_VR", "Oculos de Sol", 2000, "call cxp_coplevel == 19" }, //Policia Militar - Divisão ROCAM - Segundo Tenente
		    { "G_Goggles_VR", "Oculos de Sol", 1500, "call cxp_coplevel == 20" }, //Policia Militar - Divisão ROCAM - Primeiro Tenente
		    { "G_Goggles_VR", "Oculos de Sol", 1000, "call cxp_coplevel == 32" }, //Policia Militar - Divisão ROCAM - Capitão
		    { "G_Goggles_VR", "Oculos de Sol", 900, "call cxp_coplevel == 33" }, //Policia Militar - Divisão ROCAM - Major
		    { "G_Goggles_VR", "Oculos de Sol", 800, "call cxp_coplevel == 34" }, //Policia Militar - Divisão ROCAM - Tenente Coronel
		    { "G_Goggles_VR", "Oculos de Sol", 500, "call cxp_coplevel == 35" }, //Policia Militar - Divisão ROCAM - Coronel
            { "G_Goggles_VR", "Oculos de Sol", 5000, "call cxp_coplevel == 23" }, //Policia Militar - Divisão GATE  - Soldado
            { "G_Goggles_VR", "Oculos de Sol", 4500, "call cxp_coplevel == 24" }, //Policia Militar - Divisão GATE - Cabo
            { "G_Goggles_VR", "Oculos de Sol", 4000, "call cxp_coplevel == 25" }, //Policia Militar - Divisão GATE - 3ª Sargento
            { "G_Goggles_VR", "Oculos de Sol", 3500, "call cxp_coplevel == 26" }, //Policia Militar - Divisão GATE - 2ª Sargento
            { "G_Goggles_VR", "Oculos de Sol", 3000, "call cxp_coplevel == 27" }, //Policia Militar - Divisão GATE - 1ª Sargento
            { "G_Goggles_VR", "Oculos de Sol", 2500, "call cxp_coplevel == 28" }, //Policia Militar - Divisão GATE - SubTenente
            { "G_Goggles_VR", "Oculos de Sol", 2000, "call cxp_coplevel == 29" }, //Policia Militar - Divisão GATE - Aspirante
            { "G_Goggles_VR", "Oculos de Sol", 1500, "call cxp_coplevel == 30" }, //Policia Militar - Divisão GATE - Segundo Tenente
            { "G_Goggles_VR", "Oculos de Sol", 1000, "call cxp_coplevel == 31" }, //Policia Militar - Divisão GATE - Primeiro Tenente
            { "G_Goggles_VR", "Oculos de Sol", 900, "call cxp_coplevel == 32" }, //Policia Militar - Divisão GATE - Capitão
            { "G_Goggles_VR", "Oculos de Sol", 800, "call cxp_coplevel == 33" }, //Policia Militar - Divisão GATE - Major
            { "G_Goggles_VR", "Oculos de Sol", 700, "call cxp_coplevel == 34" }, //Policia Militar - Divisão GATE - Tenente Coronel
            { "G_Goggles_VR", "Oculos de Sol", 500, "call cxp_coplevel == 35" }, //Policia Militar - Divisão GATE - Coronel
			{ "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 5000 "call cxp_coplevel == 3" }, //Policia Militar - Soldado
			{ "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 4500, "call cxp_coplevel == 4" }, //Policia Militar - Cabo
			{ "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 4000, "call cxp_coplevel == 6" }, //Policia Militar - 3ª Sargento
			{ "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 3500, "call cxp_coplevel == 7" }, //Policia Militar - 2ª Sargento
			{ "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 3000, "call cxp_coplevel == 8" }, //Policia Militar - 1ª Sargento
			{ "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 2500, "call cxp_coplevel == 9" }, //Policia Militar - SubTenente
			{ "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 2000, "call cxp_coplevel == 10" }, //Policia Militar - Aspirante
			{ "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 1500, "call cxp_coplevel == 11" }, //Policia Militar - Segundo Tenente
			{ "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 1000, "call cxp_coplevel == 12" }, //Policia Militar - Primeiro Tenente
			{ "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 900, "call cxp_coplevel == 32" }, //Policia Militar - Capitão
			{ "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 700, "call cxp_coplevel == 33" }, //Policia Militar - Major
			{ "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 800, "call cxp_coplevel == 34" }, //Policia Militar - Tenente Coronel
			{ "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 500, "call cxp_coplevel == 35" }, //Policia Militar - Coronel
		    { "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 5000, "call cxp_coplevel == 13" }, //Policia Militar - Divisão ROCAM  - Soldado
		    { "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 4500, "call cxp_coplevel == 14" }, //Policia Militar - Divisão ROCAM - Cabo
		    { "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 3000, "call cxp_coplevel == 17" }, //Policia Militar - Divisão ROCAM - 3ª Sargento
		    { "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 4000, "call cxp_coplevel == 15" }, //Policia Militar - Divisão ROCAM - 2ª Sargento
		    { "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 3500, "call cxp_coplevel == 16" }, //Policia Militar - Divisão ROCAM - 1ª Sargento
		    { "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 3000, "call cxp_coplevel == 17" }, //Policia Militar - Divisão ROCAM - SubTenente
		    { "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 2500, "call cxp_coplevel == 18" }, //Policia Militar - Divisão ROCAM - Aspirante
		    { "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 2000, "call cxp_coplevel == 19" }, //Policia Militar - Divisão ROCAM - Segundo Tenente
		    { "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 1500, "call cxp_coplevel == 20" }, //Policia Militar - Divisão ROCAM - Primeiro Tenente
		    { "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 1000, "call cxp_coplevel == 32" }, //Policia Militar - Divisão ROCAM - Capitão
		    { "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 900, "call cxp_coplevel == 33" }, //Policia Militar - Divisão ROCAM - Major
		    { "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 800, "call cxp_coplevel == 34" }, //Policia Militar - Divisão ROCAM - Tenente Coronel
		    { "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 500, "call cxp_coplevel == 35" }, //Policia Militar - Divisão ROCAM - Coronel
            { "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 5000, "call cxp_coplevel == 23" }, //Policia Militar - Divisão GATE  - Soldado
            { "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 4500, "call cxp_coplevel == 24" }, //Policia Militar - Divisão GATE - Cabo
            { "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 4000, "call cxp_coplevel == 25" }, //Policia Militar - Divisão GATE - 3ª Sargento
            { "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 3500, "call cxp_coplevel == 26" }, //Policia Militar - Divisão GATE - 2ª Sargento
            { "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 3000, "call cxp_coplevel == 27" }, //Policia Militar - Divisão GATE - 1ª Sargento
            { "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 2500, "call cxp_coplevel == 28" }, //Policia Militar - Divisão GATE - SubTenente
            { "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 2000, "call cxp_coplevel == 29" }, //Policia Militar - Divisão GATE - Aspirante
            { "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 1500, "call cxp_coplevel == 30" }, //Policia Militar - Divisão GATE - Segundo Tenente
            { "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 1000, "call cxp_coplevel == 31" }, //Policia Militar - Divisão GATE - Primeiro Tenente
            { "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 900, "call cxp_coplevel == 32" }, //Policia Militar - Divisão GATE - Capitão
            { "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 800, "call cxp_coplevel == 33" }, //Policia Militar - Divisão GATE - Major
            { "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 700, "call cxp_coplevel == 34" }, //Policia Militar - Divisão GATE - Tenente Coronel
            { "G_WirelessEarpiece_F", "Fone de Ouvido (Sem Fio)", 500, "call cxp_coplevel == 35" }, //Policia Militar - Divisão GATE - Coronel
			{ "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 5000 "call cxp_coplevel == 3" }, //Policia Militar - Soldado
			{ "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 4500, "call cxp_coplevel == 4" }, //Policia Militar - Cabo
			{ "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 4000, "call cxp_coplevel == 6" }, //Policia Militar - 3ª Sargento
			{ "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 3500, "call cxp_coplevel == 7" }, //Policia Militar - 2ª Sargento
			{ "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 3000, "call cxp_coplevel == 8" }, //Policia Militar - 1ª Sargento
			{ "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 2500, "call cxp_coplevel == 9" }, //Policia Militar - SubTenente
			{ "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 2000, "call cxp_coplevel == 10" }, //Policia Militar - Aspirante
			{ "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 1500, "call cxp_coplevel == 11" }, //Policia Militar - Segundo Tenente
			{ "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 1000, "call cxp_coplevel == 12" }, //Policia Militar - Primeiro Tenente
			{ "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 900, "call cxp_coplevel == 32" }, //Policia Militar - Capitão
			{ "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 700, "call cxp_coplevel == 33" }, //Policia Militar - Major
			{ "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 800, "call cxp_coplevel == 34" }, //Policia Militar - Tenente Coronel
			{ "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 500, "call cxp_coplevel == 35" }, //Policia Militar - Coronel
		    { "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 5000, "call cxp_coplevel == 13" }, //Policia Militar - Divisão ROCAM  - Soldado
		    { "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 4500, "call cxp_coplevel == 14" }, //Policia Militar - Divisão ROCAM - Cabo
		    { "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 3000, "call cxp_coplevel == 17" }, //Policia Militar - Divisão ROCAM - 3ª Sargento
		    { "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 4000, "call cxp_coplevel == 15" }, //Policia Militar - Divisão ROCAM - 2ª Sargento
		    { "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 3500, "call cxp_coplevel == 16" }, //Policia Militar - Divisão ROCAM - 1ª Sargento
		    { "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 3000, "call cxp_coplevel == 17" }, //Policia Militar - Divisão ROCAM - SubTenente
		    { "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 2500, "call cxp_coplevel == 18" }, //Policia Militar - Divisão ROCAM - Aspirante
		    { "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 2000, "call cxp_coplevel == 19" }, //Policia Militar - Divisão ROCAM - Segundo Tenente
		    { "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 1500, "call cxp_coplevel == 20" }, //Policia Militar - Divisão ROCAM - Primeiro Tenente
		    { "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 1000, "call cxp_coplevel == 32" }, //Policia Militar - Divisão ROCAM - Capitão
		    { "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 900, "call cxp_coplevel == 33" }, //Policia Militar - Divisão ROCAM - Major
		    { "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 800, "call cxp_coplevel == 34" }, //Policia Militar - Divisão ROCAM - Tenente Coronel
		    { "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 500, "call cxp_coplevel == 35" }, //Policia Militar - Divisão ROCAM - Coronel
            { "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 5000, "call cxp_coplevel == 23" }, //Policia Militar - Divisão GATE  - Soldado
            { "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 4500, "call cxp_coplevel == 24" }, //Policia Militar - Divisão GATE - Cabo
            { "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 4000, "call cxp_coplevel == 25" }, //Policia Militar - Divisão GATE - 3ª Sargento
            { "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 3500, "call cxp_coplevel == 26" }, //Policia Militar - Divisão GATE - 2ª Sargento
            { "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 3000, "call cxp_coplevel == 27" }, //Policia Militar - Divisão GATE - 1ª Sargento
            { "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 2500, "call cxp_coplevel == 28" }, //Policia Militar - Divisão GATE - SubTenente
            { "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 2000, "call cxp_coplevel == 29" }, //Policia Militar - Divisão GATE - Aspirante
            { "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 1500, "call cxp_coplevel == 30" }, //Policia Militar - Divisão GATE - Segundo Tenente
            { "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 1000, "call cxp_coplevel == 31" }, //Policia Militar - Divisão GATE - Primeiro Tenente
            { "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 900, "call cxp_coplevel == 32" }, //Policia Militar - Divisão GATE - Capitão
            { "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 800, "call cxp_coplevel == 33" }, //Policia Militar - Divisão GATE - Major
            { "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 700, "call cxp_coplevel == 34" }, //Policia Militar - Divisão GATE - Tenente Coronel
            { "G_Balaclava_TI__G_blk_F", "Balaclava Camuflada (Oculos)", 500, "call cxp_coplevel == 35" }, //Policia Militar - Divisão GATE - Coronel
		    { "Balaclava_TI_blk_F", "Balaclava Camuflada", 5000 "call cxp_coplevel == 3" }, //Policia Militar - Soldado
			{ "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 4500, "call cxp_coplevel == 4" }, //Policia Militar - Cabo
			{ "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 4000, "call cxp_coplevel == 6" }, //Policia Militar - 3ª Sargento
			{ "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 3500, "call cxp_coplevel == 7" }, //Policia Militar - 2ª Sargento
			{ "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 3000, "call cxp_coplevel == 8" }, //Policia Militar - 1ª Sargento
			{ "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 2500, "call cxp_coplevel == 9" }, //Policia Militar - SubTenente
			{ "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 2000, "call cxp_coplevel == 10" }, //Policia Militar - Aspirante
			{ "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 1500, "call cxp_coplevel == 11" }, //Policia Militar - Segundo Tenente
			{ "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 1000, "call cxp_coplevel == 12" }, //Policia Militar - Primeiro Tenente
			{ "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 900, "call cxp_coplevel == 32" }, //Policia Militar - Capitão
			{ "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 700, "call cxp_coplevel == 33" }, //Policia Militar - Major
			{ "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 800, "call cxp_coplevel == 34" }, //Policia Militar - Tenente Coronel
			{ "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 500, "call cxp_coplevel == 35" }, //Policia Militar - Coronel
		    { "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 5000, "call cxp_coplevel == 13" }, //Policia Militar - Divisão ROCAM  - Soldado
		    { "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 4500, "call cxp_coplevel == 14" }, //Policia Militar - Divisão ROCAM - Cabo
		    { "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 3000, "call cxp_coplevel == 17" }, //Policia Militar - Divisão ROCAM - 3ª Sargento
		    { "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 4000, "call cxp_coplevel == 15" }, //Policia Militar - Divisão ROCAM - 2ª Sargento
		    { "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 3500, "call cxp_coplevel == 16" }, //Policia Militar - Divisão ROCAM - 1ª Sargento
		    { "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 3000, "call cxp_coplevel == 17" }, //Policia Militar - Divisão ROCAM - SubTenente
		    { "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 2500, "call cxp_coplevel == 18" }, //Policia Militar - Divisão ROCAM - Aspirante
		    { "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 2000, "call cxp_coplevel == 19" }, //Policia Militar - Divisão ROCAM - Segundo Tenente
		    { "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 1500, "call cxp_coplevel == 20" }, //Policia Militar - Divisão ROCAM - Primeiro Tenente
		    { "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 1000, "call cxp_coplevel == 32" }, //Policia Militar - Divisão ROCAM - Capitão
		    { "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 900, "call cxp_coplevel == 33" }, //Policia Militar - Divisão ROCAM - Major
		    { "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 800, "call cxp_coplevel == 34" }, //Policia Militar - Divisão ROCAM - Tenente Coronel
		    { "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 500, "call cxp_coplevel == 35" }, //Policia Militar - Divisão ROCAM - Coronel
            { "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 5000, "call cxp_coplevel == 23" }, //Policia Militar - Divisão GATE  - Soldado
            { "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 4500, "call cxp_coplevel == 24" }, //Policia Militar - Divisão GATE - Cabo
            { "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 4000, "call cxp_coplevel == 25" }, //Policia Militar - Divisão GATE - 3ª Sargento
            { "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 3500, "call cxp_coplevel == 26" }, //Policia Militar - Divisão GATE - 2ª Sargento
            { "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 3000, "call cxp_coplevel == 27" }, //Policia Militar - Divisão GATE - 1ª Sargento
            { "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 2500, "call cxp_coplevel == 28" }, //Policia Militar - Divisão GATE - SubTenente
            { "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 2000, "call cxp_coplevel == 29" }, //Policia Militar - Divisão GATE - Aspirante
            { "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 1500, "call cxp_coplevel == 30" }, //Policia Militar - Divisão GATE - Segundo Tenente
            { "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 1000, "call cxp_coplevel == 31" }, //Policia Militar - Divisão GATE - Primeiro Tenente
            { "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 900, "call cxp_coplevel == 32" }, //Policia Militar - Divisão GATE - Capitão
            { "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 800, "call cxp_coplevel == 33" }, //Policia Militar - Divisão GATE - Major
            { "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 700, "call cxp_coplevel == 34" }, //Policia Militar - Divisão GATE - Tenente Coronel
            { "G_Balaclava_TI_blk_F", "Balaclava Camuflada", 500, "call cxp_coplevel == 35" }, //Policia Militar - Divisão GATE - Coronel
			{ "G_Balaclava_blk", "Balaclava", 5000 "call cxp_coplevel == 3" }, //Policia Militar - Soldado
			{ "G_Balaclava_blk", "Balaclava", 4500, "call cxp_coplevel == 4" }, //Policia Militar - Cabo
			{ "G_Balaclava_blk", "Balaclava", 4000, "call cxp_coplevel == 6" }, //Policia Militar - 3ª Sargento
			{ "G_Balaclava_blk", "Balaclava", 3500, "call cxp_coplevel == 7" }, //Policia Militar - 2ª Sargento
			{ "G_Balaclava_blk", "Balaclava", 3000, "call cxp_coplevel == 8" }, //Policia Militar - 1ª Sargento
			{ "G_Balaclava_blk", "Balaclava", 2500, "call cxp_coplevel == 9" }, //Policia Militar - SubTenente
			{ "G_Balaclava_blk", "Balaclava", 2000, "call cxp_coplevel == 10" }, //Policia Militar - Aspirante
			{ "G_Balaclava_blk", "Balaclava", 1500, "call cxp_coplevel == 11" }, //Policia Militar - Segundo Tenente
			{ "G_Balaclava_blk", "Balaclava", 1000, "call cxp_coplevel == 12" }, //Policia Militar - Primeiro Tenente
			{ "G_Balaclava_blk", "Balaclava", 900, "call cxp_coplevel == 32" }, //Policia Militar - Capitão
			{ "G_Balaclava_blk", "Balaclava", 700, "call cxp_coplevel == 33" }, //Policia Militar - Major
			{ "G_Balaclava_blk", "Balaclava", 800, "call cxp_coplevel == 34" }, //Policia Militar - Tenente Coronel
			{ "G_Balaclava_blk", "Balaclava", 500, "call cxp_coplevel == 35" }, //Policia Militar - Coronel
		    { "G_Balaclava_blk", "Balaclava", 5000, "call cxp_coplevel == 13" }, //Policia Militar - Divisão ROCAM  - Soldado
		    { "G_Balaclava_blk", "Balaclava", 4500, "call cxp_coplevel == 14" }, //Policia Militar - Divisão ROCAM - Cabo
		    { "G_Balaclava_blk", "Balaclava", 3000, "call cxp_coplevel == 17" }, //Policia Militar - Divisão ROCAM - 3ª Sargento
		    { "G_Balaclava_blk", "Balaclava", 4000, "call cxp_coplevel == 15" }, //Policia Militar - Divisão ROCAM - 2ª Sargento
		    { "G_Balaclava_blk", "Balaclava", 3500, "call cxp_coplevel == 16" }, //Policia Militar - Divisão ROCAM - 1ª Sargento
		    { "G_Balaclava_blk", "Balaclava", 3000, "call cxp_coplevel == 17" }, //Policia Militar - Divisão ROCAM - SubTenente
		    { "G_Balaclava_blk", "Balaclava", 2500, "call cxp_coplevel == 18" }, //Policia Militar - Divisão ROCAM - Aspirante
		    { "G_Balaclava_blk", "Balaclava", 2000, "call cxp_coplevel == 19" }, //Policia Militar - Divisão ROCAM - Segundo Tenente
		    { "G_Balaclava_blk", "Balaclava", 1500, "call cxp_coplevel == 20" }, //Policia Militar - Divisão ROCAM - Primeiro Tenente
		    { "G_Balaclava_blk", "Balaclava", 1000, "call cxp_coplevel == 32" }, //Policia Militar - Divisão ROCAM - Capitão
		    { "G_Balaclava_blk", "Balaclava", 900, "call cxp_coplevel == 33" }, //Policia Militar - Divisão ROCAM - Major
		    { "G_Balaclava_blk", "Balaclava", 800, "call cxp_coplevel == 34" }, //Policia Militar - Divisão ROCAM - Tenente Coronel
		    { "G_Balaclava_blk", "Balaclava", 500, "call cxp_coplevel == 35" }, //Policia Militar - Divisão ROCAM - Coronel
            { "G_Balaclava_blk", "Balaclava", 5000, "call cxp_coplevel == 23" }, //Policia Militar - Divisão GATE  - Soldado
            { "G_Balaclava_blk", "Balaclava", 4500, "call cxp_coplevel == 24" }, //Policia Militar - Divisão GATE - Cabo
            { "G_Balaclava_blk", "Balaclava", 4000, "call cxp_coplevel == 25" }, //Policia Militar - Divisão GATE - 3ª Sargento
            { "G_Balaclava_blk", "Balaclava", 3500, "call cxp_coplevel == 26" }, //Policia Militar - Divisão GATE - 2ª Sargento
            { "G_Balaclava_blk", "Balaclava", 3000, "call cxp_coplevel == 27" }, //Policia Militar - Divisão GATE - 1ª Sargento
            { "G_Balaclava_blk", "Balaclava", 2500, "call cxp_coplevel == 28" }, //Policia Militar - Divisão GATE - SubTenente
            { "G_Balaclava_blk", "Balaclava", 2000, "call cxp_coplevel == 29" }, //Policia Militar - Divisão GATE - Aspirante
            { "G_Balaclava_blk", "Balaclava", 1500, "call cxp_coplevel == 30" }, //Policia Militar - Divisão GATE - Segundo Tenente
            { "G_Balaclava_blk", "Balaclava", 1000, "call cxp_coplevel == 31" }, //Policia Militar - Divisão GATE - Primeiro Tenente
            { "G_Balaclava_blk", "Balaclava", 900, "call cxp_coplevel == 32" }, //Policia Militar - Divisão GATE - Capitão
            { "G_Balaclava_blk", "Balaclava", 800, "call cxp_coplevel == 33" }, //Policia Militar - Divisão GATE - Major
            { "G_Balaclava_blk", "Balaclava", 700, "call cxp_coplevel == 34" }, //Policia Militar - Divisão GATE - Tenente Coronel
            { "G_Balaclava_blk", "Balaclava", 500, "call cxp_coplevel == 35" } //Policia Militar - Divisão GATE - Coronel
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" },
            { "G_Aviator", "Oculos CT", 5000, "call cxp_coplevel == 1" }, //CT
            { "G_Aviator", "Oculos Recruta", 5000, "call cxp_coplevel == 1" }, //CT
            { "V_LegStrapBag_black_F", "Bolsa de Perna", 3000, "call cxp_coplevel == 1" }, //CT
            { "V_TacVest_blk_POLICE", "Colete - Recruta", 5000, "call cxp_coplevel == 2" }, // Recruta
            { "V_PlateCarrier1_blk", "Colete Padrão", 75, "call cxp_coplevel >= 3" }
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" },
            { "B_ViperHarness_blk_F", "", 15000,"" } // MOCHILAO
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
            { "U_Competitor", "Uniforme Recruta", 5000, "call cxp_mediclevel >= 1" },
            { "U_l_CombatUniform", "Uniforme Resgate", 10000, "call cxp_mediclevel >= 1" },
            { "U_B_HeliPilotCoveralls", "Uniforme Piloto", 20000, "call cxp_mediclevel >= 3" },
            { "U_O_CombatUniform_ocamo", "Uniforme Incendio", 50000, "call cxp_mediclevel >= 5" }
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
            { "U_I_C_Soldier_Para_4_F", "", 19000, "" }
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
            { "U_I_C_Soldier_Para_4_F", "", 19000, "" }
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
