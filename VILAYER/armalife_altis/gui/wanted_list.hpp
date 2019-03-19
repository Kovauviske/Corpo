class cxp_wanted_menu {
    idd = 2400;
    name= "cxp_wanted_menu";
    movingEnable = false;
    enableSimulation = true;

    class controlsBackground {
        class Cxp_RscTitleBackground: Cxp_RscText {
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.1;
            y = 0.2;
            w = 0.6;
            h = (1 / 25);
        };

        class MainBackground: Cxp_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.1;
            y = 0.2 + (11 / 250);
            w = 0.6;
            h = 0.6 - (22 / 250);
        };
    };

    class controls {
        class Title: Cxp_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = -1;
            text = "$STR_Wanted_Title";
            x = 0.1;
            y = 0.2;
            w = 0.6;
            h = (1 / 25);
        };

        class WantedConnection: Title {
            idc = 2404;
            style = 1;
            text = "";
        };

        class WantedList: Cxp_RscListBox {
            idc = 2401;
            text = "";
            sizeEx = 0.035;
            onLBSelChanged = "[""wanted""] spawn cxp_fnc_wantedGrab";
            x = 0.12;
            y = 0.28;
            w = 0.2;
            h = 0.3;
        };

        class PlayerList: Cxp_RscListBox {
            idc = 2406;
            text = "";
            sizeEx = 0.035;
            onLBSelChanged = "";
            x = 0.34;
            y = 0.28;
            w = 0.2;
            h = 0.3;
        };

        class WantedDetails: Cxp_RscListBox {
            idc = 2402;
            text = "";
            sizeEx = 0.035;
            colorBackground[] = {0, 0, 0, 0};
            x = 0.12;
            y = 0.62;
            w = 0.48;
            h = 0.12;
        };

        class BountyPrice: Cxp_RscText {
            idc = 2403;
            text = "";
            x = 0.12;
            y = 0.30;
            w = 0.6;
            h = 0.6;
        };

        class WantedAddL: Cxp_RscCombo    {
            idc = 2407;
            x = 0.542;
            y = 0.28;
            w = (8 / 52);
            h = 0.03;
        };

        class CloseButtonKey: Cxp_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.8 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class PardonButtonKey: Cxp_RscButtonMenu {
            idc = 2405;
            text = "$STR_Wanted_Pardon";
            onButtonClick = "[] call cxp_fnc_pardon; closeDialog 0;";
            x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.8 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class ButtonWantedAdd: Cxp_RscButtonMenu {
            idc = 9800;
            //shortcuts[] = {0x00050000 + 2};
            text = "$STR_Wanted_Add";
            onButtonClick = "[] call cxp_fnc_wantedAddP;";
            x = 0.1 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.8 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class wantedText: Cxp_RscText {
            idc = 1000;
            text = "$STR_Wanted_People";
            x = 0.12;
            y = 0.11;
            w = 0.2;
            h = 0.3;
        };

        class citizensText: Cxp_RscText {
            idc = 1001;
            text = "$STR_Wanted_Citizens";
            x = 0.34;
            y = 0.11;
            w = 0.2;
            h = 0.3;
        };

        class crimesText: Cxp_RscText {
            idc = 1002;
            text = "$STR_Wanted_Crimes";
            x = 0.542;
            y = 0.245;
            w = (8 / 52);
            h = 0.03;
        };
    };
};