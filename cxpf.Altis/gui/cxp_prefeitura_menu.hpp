class MenuPrefeitura {
  idd = 5546;
  name= "MenuPrefeitura";
  movingEnable = false;
  enableSimulation = true;
  onLoad = "uiNamespace setVariable [""Prefeitura"", _this select 0];";
  objects[] = { };
  class controls {
    class RscTitleBackground : Cxp_RscText {
      colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
      idc = -1;
      text = "Menu da Prefeitura";
      x = 0.1;
      y = 0.2;
      w = 0.775;
      h = 0.04;
    };

    class Mainbackground : Cxp_RscText {
      colorBackground[] = {0,0,0,0.7};
      idc = -1;
      x = 0.1;
      y = 0.244;
      w = 0.775;
      h = 0.52;
    };
    class listbox: Cxp_RscListBox {
      idc = 55126;
      sizeEx = 0.035;
      x = 0.1125;
      y = 0.3;
      w = 0.3125;
      h = 0.4;
    };
    class ShowLicenseslistbox: Cxp_RscListBox {
      idc = 55131;
      sizeEx = 0.035;
      x = 0.55;
      y = 0.3;
      w = 0.3125;
      h = 0.4;
    };
    class MyLicenses : Cxp_RscText {
      idc = 55130;
      text = "Disponiveis";
      x = 0.1875;
      y = 0.24;
      w = 0.1375;
      h = 0.04;
    };
    class ShowLicenses : Cxp_RscText {
      idc = 55129;
      text = "Minhas Licencas";
      x = 0.65;
      y = 0.24;
      w = 0.1480;
      h = 0.04;
    };
    class CloseButtonKey : Cxp_RscButtonMenu {
      idc = -1;
      text = "$STR_Global_Close";
      onButtonClick = "closeDialog 0;";
      x = 0.1;
      y = 0.77;
      w = 0.15;
      h = 0.04;
    };
    class buybutton: Cxp_RscButtonMenu
    {
      idc = 55127;
      text = "$STR_Global_Buy";
      x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
      y = 0.77;
      w = (6.25 / 40);
      h = (1 / 25);
      onButtonClick = "if((lbData[55126,lbCurSel (55126)] != """")) then { [false,false,false,(lbData[55126,(lbCurSel 55126)])] call cxp_fnc_buyLicense; [] call cxp_fnc_menuPrefeituraUPDATE; } else {hint ""Voce precisa selecionar um item da lista para poder comprar..."";};";
    };
  };
};
