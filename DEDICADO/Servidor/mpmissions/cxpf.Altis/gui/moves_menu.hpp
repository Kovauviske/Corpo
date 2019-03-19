class cxp_moves_menu {
  idd = 2900;
  name = "cxp_moves_menu";
  movingEnable = false;
  enableSimulation = true;
  onLoad = "[] spawn cxp_fnc_movesMenu;";
  class controlsBackground {
    class MovesMenu_RscTitleBackground: Cxp_RscText {
      colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
      idc = -1;
      x = 0.1;
      y = 0.2;
      w = 0.8;
      h = (1 / 25);
    };
    class MainBackground: Cxp_RscText {
      colorBackground[] = {0,0,0,0.7};
      idc = -1;
      x = 0.1;
      y = 0.2 + (11 / 250);
      w = 0.8;
      h = 0.6 - (2 / 250);
    };
  };
  class controls {
    class Title: Cxp_RscTitle {
      colorBackground[] = {0,0,0,0};
      idc = 2901;
      text = "CXP Framework - Menu de Movimentos By Scarso327";
      x = 0.1;
      y = 0.2;
      w = 0.6;
      h = (1 / 25);
    };
    class movesList: Cxp_RscListBox {
      idc = 2902;
      text = "";
      sizeEx = 0.035;
      x = 0.12;
      y = 0.26;
      w = 0.30;
      h = 0.4;
    };
    class CloseButtonKey: Cxp_RscButtonMenu {
      idc = -1;
      text = "$STR_Global_Close";
      onButtonClick = "closeDialog 0;";
      x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
      y = 0.88 - (1 / 25);
      w = (6.25 / 40);
      h = (1 / 25);
    };
    class performMove: Cxp_RscButtonMenu {
      idc = -1;
      text = "Play";
      onButtonClick = "_move = lbData[2902,lbCurSel (2902)];_move = call compile format[""%1"", _move]; player playMove _move; closeDialog 0;";
      x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
      y = 0.88 - (1 / 25);
      w = (6.25 / 40);
      h = (1 / 25);
    };
  };
};