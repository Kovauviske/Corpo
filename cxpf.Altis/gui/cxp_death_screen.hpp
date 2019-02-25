class cxp_death_screen {
    idd = 7300;
    name = "cxp_death_screen";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {};

    class Controls {
        class Cxp_RscText_title: Cxp_RscText {
        	idc = 7399;
        	text = ""; //--- ToDo: Localize;
        	x = 0.19375 * safezoneW + safezoneX;
        	y = 0.038 * safezoneH + safezoneY;
        	w = 0.6125 * safezoneW;
        	h = 0.056 * safezoneH;
        	sizeEx = 0.081;
        };

        class Cxp_RscText_status: Cxp_RscText {
        	idc = 7310;
        	text = ""; //--- ToDo: Localize;
        	x = 0.255 * safezoneW + safezoneX;
        	y = 0.094 * safezoneH + safezoneY;
        	w = 0.48125 * safezoneW;
        	h = 0.056 * safezoneH;
        	sizeEx = 0.072;
        };

        class Cxp_RscText_contador: Cxp_RscText {
        	idc = 7301;
        	text = ""; //--- ToDo: Localize;
        	x = 0.3075 * safezoneW + safezoneX;
        	y = 0.766 * safezoneH + safezoneY;
        	w = 0.35875 * safezoneW;
        	h = 0.07 * safezoneH;
        	sizeEx = 0.050;
        };

        class Cxp_RespawnBtn: Cxp_RscButtonMenu {
            idc = 7302;
            x = 0.36 * safezoneW + safezoneX;
          	y = 0.85 * safezoneH + safezoneY;
          	w = 0.27125 * safezoneW;
          	h = 0.056 * safezoneH;
            text = "RENASCER";
            sizeEx = 1.8;
            onButtonClick = "closeDialog 0; cxp_respawned = true; [] call cxp_fnc_spawnMenu;";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.7};
            class Attributes {align = "center";};
        };

        class Cxp_RespawnInstBtn: Cxp_RscButtonMenu {
            idc = 7312;
            x = 0.00125001 * safezoneW + safezoneX;
            y = 0.318 * safezoneH + safezoneY;
            w = 0.150937 * safezoneW;
            h = 0.056 * safezoneH;
            text = "REVIVER-SE";
			show = false;
            sizeEx = 1.8;
            onButtonClick = "[] call cxp_fnc_reviveInst;";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.7};
            class Attributes {align = "right";};
        };

    };
};
