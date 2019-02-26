class shops_menu {
    idd = 2400;
    name= "shops_menu";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class Cxp_RscTitleBackground: Cxp_RscText {
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.1;
            y = 0.2;
            w = 0.8;
            h = (1 / 25);
        };

        class MainBackground: Cxp_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.1;
            y = 0.2 + (11 / 250);
            w = 0.8;
            h = 0.6 - (22 / 250);
        };

        class vasText: Cxp_RscText {
            idc = -1;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            text = "$STR_VS_SI";
            sizeEx = 0.04;
            x = 0.12;
            y = 0.27;
            w = 0.350;
            h = 0.04;
        };

        class vasgText: Cxp_RscText {
            idc = -1;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            text = "$STR_VS_PI";
            sizeEx = 0.04;
            x = 0.53;
            y = 0.27;
            w = 0.350;
            h = 0.04;
        };
    };

    class controls {
        class itemList: Cxp_RscListBox {
            idc = 2401;
            text = "";
            sizeEx = 0.030;
            x = 0.12;
            y = 0.31;
            w = 0.350;
            h = 0.340;
        };

		class pItemlist : Cxp_RscListBox {
			idc = 2402;
            text = "";
            sizeEx = 0.030;
			x = 0.53;
			y = 0.31;
			w = 0.35;
			h = 0.34;
		};

        class Title: Cxp_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = 2403;
            text = "";
            x = 0.1;
            y = 0.2;
            w = 0.8;
            h = (1 / 25);
        };

        class PlayersName: Title {
            idc = 601;
            style = 1;
            text = "";
        };

        class buyEdit: Cxp_RscEdit {
            idc = 2404;
            text = "1";
            sizeEx = 0.030;
            x = 0.12;
            y = 0.66;
            w = 0.35;
            h = 0.03;
        };

        class ButtonBuyWithGang: Cxp_RscButtonMenu {
            idc = 9580;
            text = "$STR_ATM_BuyWithGangButton";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            tooltip = "Comprar com o caixa da gangue...";
            onButtonClick = "if(playerSide isEqualTo civilian) then { [true] spawn cxp_fnc_virtbuy; } else { hint ""Apenas rebeldes podem usar esta acao !""};";
            x = 0.03 + (0.35 / 2) - ((6.25 / 40) / 2);
            y = 0.70;
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class ButtonBuyVirtItem: Cxp_RscButtonMenu {
            idc = -1;
            text = "$STR_VS_BuyItem";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[false] call cxp_fnc_virtbuy;";
            x = 0.21 + (0.35 / 2) - ((6.25 / 40) / 2);
            y = 0.70;
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class ButtonSellAll: Cxp_RscButtonMenu {
            idc = -1;
            text = "$STR_VS_SellAllItem";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] call cxp_fnc_virtsell";
			x = 0.53 + (0.35 / 2) - ((6.25 / 40) / 2);
			y = 0.7;
			w = (6.25 / 40);
			h = (1 / 25);
        };

        class ButtonClose: Cxp_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            x = 0.1;
            y = 0.8 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };
    };
};