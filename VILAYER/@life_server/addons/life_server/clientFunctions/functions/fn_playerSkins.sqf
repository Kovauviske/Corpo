#include "\life_server\script_macros.hpp"
/*
    File: fn_playerSkins.sqf
    Author: Daniel Stuart

    Description:
    Sets skins for players by their side and uniform.
*/
switch (playerSide) do {
    case civilian: {
      if (uniform player isEqualTo "U_C_Poloshirt_stripped") then {
        player setObjectTextureGlobal [0, "textures\civ\cloth\roupacivil1.jpg"];
      };
      if (uniform player isEqualTo "U_C_Poloshirt_redwhite") then {
        player setObjectTextureGlobal [0, "textures\civ\cloth\roupacivil2.jpg"];
      };
      if (uniform player isEqualTo "U_C_Man_casual_5_F") then {
        player setObjectTextureGlobal [0, "textures\civ\cloth\001.jpg"];
      };
      if (uniform player isEqualTo "U_C_Man_casual_4_F") then {
        player setObjectTextureGlobal [0, "textures\civ\cloth\012.jpg"];
      };
      if (uniform player isEqualTo "U_C_Man_casual_6_F") then {
        player setObjectTextureGlobal [0, "textures\civ\cloth\003.jpg"];
      };
      if (uniform player isEqualTo "U_C_IDAP_Man_Tee_F") then {
        player setObjectTextureGlobal [0, "textures\civ\cloth\004.jpg"];
      };
      if (uniform player isEqualTo "U_C_IDAP_Man_TeeShorts_F") then {
        player setObjectTextureGlobal [0, "textures\civ\cloth\005.jpg"];
      };
      if (uniform player isEqualTo "U_C_Poor1") then {
        player setObjectTextureGlobal [0, "textures\civ\cloth\006.jpg"];
      };
      if (uniform player isEqualTo "U_C_Mechanic_01_F") then {
        player setObjectTextureGlobal [0, "textures\civ\cloth\007.jpg"];
      };
      if (uniform player isEqualTo "U_C_man_sport_1_F") then {
        player setObjectTextureGlobal [0, "textures\civ\cloth\008.jpg"];
      };
      if (uniform player isEqualTo "U_C_man_sport_2_F") then {
        player setObjectTextureGlobal [0, "textures\civ\cloth\009.jpg"];
      };
      if (uniform player isEqualTo "U_C_man_sport_3_F ") then {
        player setObjectTextureGlobal [0, "textures\civ\cloth\010.jpg"];
      };
      if (uniform player isEqualTo "U_C_IDAP_Man_Jeans_F") then {
        player setObjectTextureGlobal [0, "textures\civ\cloth\011.jpg"];
      };
      if (uniform player isEqualTo "U_C_WorkerCoveralls") then {
        if (cxp_is_arrested) then {
          player setObjectTextureGlobal [0, "textures\civ\cloth\presidiario.jpg"];
        };
      };
    };

    case west: {
      // roupas cop
      if (uniform player isEqualTo "U_Rangemaster" && (FETCH_CONST(cxp_coplevel) >= 1)) then {
        player setObjectTextureGlobal [0, "textures\cop\cloth\c_rec.jpg"];
      };
      if (uniform player isEqualTo "U_B_CombatUniform_mcam" && (FETCH_CONST(cxp_coplevel) >= 1)) then {
        player setObjectTextureGlobal [0, "textures\cop\cloth\c_pm.jpg"];
      };
      if (uniform player isEqualTo "U_I_CombatUniform_shortsleeve" && (FETCH_CONST(cxp_coplevel) >= 1)) then {
        player setObjectTextureGlobal [0, "textures\cop\cloth\c_rocam.jpg"];
      };
      if (uniform player isEqualTo "U_I_CombatUniform" && (FETCH_CONST(cxp_coplevel) >= 1)) then {
        player setObjectTextureGlobal [0, "textures\cop\cloth\c_gate.jpg"];
      };
      if (uniform player isEqualTo "U_BG_Guerrilla_6_1" && (FETCH_CONST(cxp_coplevel) >= 1)) then {
        player setObjectTextureGlobal [0, "textures\cop\cloth\c_aguia.jpg"];
      };
      if (uniform player isEqualTo "U_BG_Guerilla2_1" && (FETCH_CONST(cxp_coplevel) >= 1)) then {
        player setObjectTextureGlobal [0, "textures\cop\cloth\c_transito.jpg"];
      };
    };

    case independent: {
      // roupas resgate
      if (uniform player isEqualTo "U_Competitor" && (FETCH_CONST(cxp_mediclevel) >= 1)) then {
        player setObjectTextureGlobal [0, "textures\resgate\cloth\m_rec.jpg"];
      };
      if (uniform player isEqualTo "U_B_HeliPilotCoveralls" && (FETCH_CONST(cxp_mediclevel) >= 1)) then {
        player setObjectTextureGlobal [0, "textures\resgate\cloth\pilot.jpg"];
      };
      if (uniform player isEqualTo "U_l_CombatUniform_shortsleeve" && (FETCH_CONST(cxp_mediclevel) >= 1)) then {
        player setObjectTextureGlobal [0, "textures\resgate\cloth\pilotC.jpg"];
      };
      if (uniform player isEqualTo "U_O_CombatUniform_ocamo" && (FETCH_CONST(cxp_mediclevel) >= 1)) then {
        player setObjectTextureGlobal [0, "textures\resgate\cloth\m_incendio.jpg"];
      };
      // outros itens
      if (backpack player isEqualTo "B_Bergen_dgtl_F" && (FETCH_CONST(cxp_mediclevel) >= 1)) then {
        backpackContainer player setObjectTextureGlobal [0,""];
      };
    };
};
