class AH_vbuy
{
	idd = 15100;
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground {};

	class controls {
		class RscText_1000: Cxp_RscText
		{
			idc = -1;
			x = 0.263205 * safezoneW + safezoneX;
			y = 0.235956 * safezoneH + safezoneY;
			w = 0.47359 * safezoneW;
			h = 0.528089 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1001: Cxp_RscText
		{
			idc = -1;
			text = "FOR SALE"; //--- ToDo: Localize;
			x = 0.269276 * safezoneW + safezoneX;
			y = 0.246958 * safezoneH + safezoneY;
			w = 0.163935 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class RscListbox_1500: Cxp_RscListbox
		{
			idc = 15101;
			x = 0.269276 * safezoneW + safezoneX;
			y = 0.279963 * safezoneH + safezoneY;
			w = 0.461447 * safezoneW;
			h = 0.440074 * safezoneH;
			sizeEx = 0.04;
			onLBSelChanged = "_this spawn cxp_fnc_vAHselect";
		};
		class RscButtonMenu_2400: Cxp_RscButtonMenu
		{
			idc = -1;
			text = "BUY"; //--- ToDo: Localize;
			onButtonClick = "[] spawn cxp_fnc_vAHbuy;";
			x = 0.399 * safezoneW + safezoneX;
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.0220037 * safezoneH;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.24,0.58,0,1};
		};
		class RscButtonMenu_2401: Cxp_RscButtonMenu
		{
			idc = -1;
			text = "CLOSE"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;";
			x = 0.269276 * safezoneW + safezoneX;
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class RscButtonMenu_2402: Cxp_RscButtonMenu
		{
			idc = -1;
			text = "MY ITEMS"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;[] spawn cxp_fnc_vAHloadInventory;";
			x = 0.334 * safezoneW + safezoneX;
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class textEdit : Cxp_RscEdit {
			idc = 15102;
			text = "";
			x = 0.594 * safezoneW + safezoneX;
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class RscButtonMenu_2404: Cxp_RscButtonMenu
		{
			idc = -1;
			text = "SEARCH"; //--- ToDo: Localize;
			onButtonClick = "_search = ctrlText 15102;closeDialog 0;[_search] spawn cxp_fnc_vAHload;";
			x = 0.669 * safezoneW + safezoneX;
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
	};
};
