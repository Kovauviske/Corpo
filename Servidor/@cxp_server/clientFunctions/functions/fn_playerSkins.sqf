#include "\cxp_server\script_macros.hpp"
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
      if (uniform player isEqualTo "U_C_WorkerCoveralls") then {
        if (cxp_is_arrested) then {
          player setObjectTextureGlobal [0, "textures\civ\cloth\presidiario.jpg"];
        };
      };
    };

    case west: {
      // roupas cop
	    if (uniform player isEqualTo "U_I_CombatUniform") then {
        if (FETCH_CONST(cxp_coplevel) >= 1 && FETCH_CONST(cxp_coplevel) < 13) then {
          player setObjectTextureGlobal [0, "textures\cop\cloth\c_pm.jpg"];
        } else {
          player setObjectTextureGlobal [0, "textures\cop\cloth\c_cop.jpg"];
        };
      };
      // outros itens
      if (backpack player in ["B_Carryall_oli","B_Bergen_dgtl_F"] && (FETCH_CONST(cxp_coplevel) >= 1)) then {
        backpackContainer player setObjectTextureGlobal [0,""];
      };
    };

    case independent: {
      // roupas resgate
      if (uniform player isEqualTo "U_B_Wetsuit" && (FETCH_CONST(cxp_mediclevel) >= 1)) then {
        player setObjectTextureGlobal [0, "textures\resgate\cloth\diver.jpg"];
      };
      if (uniform player isEqualTo "U_I_HeliPilotCoveralls" && (FETCH_CONST(cxp_mediclevel) >= 1)) then {
        player setObjectTextureGlobal [0, "textures\resgate\cloth\pilot.jpg"];
      };
      if (uniform player isEqualTo "U_I_pilotCoveralls" && (FETCH_CONST(cxp_mediclevel) >= 8)) then {
        player setObjectTextureGlobal [0, "textures\resgate\cloth\pilotC.jpg"];
      };
      // outros itens
      if (backpack player isEqualTo "B_Bergen_dgtl_F" && (FETCH_CONST(cxp_mediclevel) >= 1)) then {
        backpackContainer player setObjectTextureGlobal [0,""];
      };
    };
};