class jail_time
{
 idd = 26500;
 name = "jail_time";
 movingEnabled = false;
 enableSimulation = true;
 class controlsBackground {
 class Cxp_RscTitleBackground:Cxp_RscText {
 colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
	 idc = -1;
	 x = 0.3;
	 y = 0.2;
	 w = 0.47;
	 h = (1 / 25);
 };
 
 class MainBackground:Cxp_RscText {
	 colorBackground[] = {0, 0, 0, 0.7};
	 idc = -1;
	 x = 0.3;
	 y = 0.2 + (11 / 250);
	 w = 0.47;
	 h = 0.3 - (22 / 250);
	};
 };
 
 class controls 
 {
 class Title: Cxp_RscTitle {
	 colorBackground[] = {0, 0, 0, 0};
	 idc = 2651;
	 text = "Mandar para a cadeia";
	 x = 0.3;
	 y = 0.2;
	 w = 0.6;
	 h = (1 / 25);
 };
 
 class InfoMsg: Cxp_RscText
 {
	 idc = 2601;
	 text = "Tempo em minutos (P. 15min):";
	 x = 0.3;
	 y = 0.163 + (11 / 250);
	 w = 0.45; 
	 h = 0.12;
 };
 
 class Textedit: Cxp_RscEdit 
 {
	 idc = 1400;
	 text = "15";
	 sizeEx = 0.030;
	 x = 0.40; 
	 y = 0.30;
	 w = 0.25; 
	 h = 0.03;
 };
 
 class payTicket: Cxp_RscButtonMenu 
 {
	 idc = 2402;
	 text = "Ok";
	 colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
	 onButtonClick="[] spawn cxp_fnc_arrestDialogArrest;";
	 x = 0.45;
	 y = 0.35;
	 w = (6.25 / 40);
	 h = (1 / 25);
 };
 
 class CloseButtonKey : Cxp_RscButtonMenu 
 {
	 idc = 2400;
	 text = "$STR_Global_Close";
	 onButtonClick = "closeDialog 0;";
	 x = 0.45;
	 y = 0.40;
	 w = (6.25 / 40);
	 h = (1 / 25);
		};
	};
};