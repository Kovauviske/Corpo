#include "player_sys.sqf"

class playerSettings {
    idd = playersys_DIALOG;
    movingEnable = 1;
    enableSimulation = 1;

    class controlsBackground {
        class cxp_RscTitleBackground: cxp_RscText {
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.1;
            y = 0.2;
            w = 0.8;
            h = (1 / 25);
        };

        class MainBackground: cxp_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.1;
            y = 0.2 + (11 / 250);
            w = 0.8;
            h = 0.6 - (22 / 250);
        };

        class Title: cxp_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = -1;
            text = "$STR_PM_Title";
            x = 0.1;
            y = 0.2;
            w = 0.8;
            h = (1 / 25);
        };

        class moneyStatusInfo: cxp_RscStructuredText {
            idc = 2015;
            sizeEx = 0.020;
            text = "";
            x = 0.105;
            y = 0.30;
            w = 0.3;
            h = 0.6;
        };

        class PlayersName: Title {
            idc = carry_weight;
            style = 1;
            text = "";
        };
    };

    class controls {
        class itemHeader: cxp_RscText {
            idc = -1;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            text = "$STR_PM_cItems";
            sizeEx = 0.04;
            x = 0.62;
            y = 0.26;
            w = 0.275;
            h = 0.04;
        };

        class licenseHeader: cxp_RscText {
            idc = -1;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            text = "$STR_PM_Licenses";
            sizeEx = 0.04;
            x = 0.336;
            y = 0.26;
            w = 0.275;
            h = 0.04;
        };

        class moneySHeader: cxp_RscText {
            idc = -1;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            text = "$STR_PM_MoneyStats";
            sizeEx = 0.04;
            x = 0.11;
            y = 0.26;
            w = 0.219;
            h = 0.04;
        };

        class itemList: cxp_RscListBox {
            idc = item_list;
            sizeEx = 0.030;
            x = 0.62;
            y = 0.30;
            w = 0.275;
            h = 0.3;
        };

        class moneyEdit: cxp_RscEdit {
            idc = 2018;
            text = "1";
            sizeEx = 0.030;
            x = 0.12;
            y = 0.42;
            w = 0.18;
            h = 0.03;
        };

        class NearPlayers: cxp_RscCombo {
            idc = 2022;
            x = 0.12;
            y = 0.46;
            w = 0.18;
            h = 0.03;
        };

        class moneyDrop: cxp_RscButtonMenu {
            idc = 2001;
            text = "$STR_Global_Give";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] call cxp_fnc_giveMoney";
            sizeEx = 0.025;
            x = 0.135;
            y = 0.50;
            w = 0.13;
            h = 0.036;
        };

        class itemEdit: cxp_RscEdit {
            idc = item_edit;
            text = "1";
            sizeEx = 0.030;
            x = 0.62;
            y = 0.61;
            w = 0.275;
            h = 0.03;

        };

        class iNearPlayers: cxp_RscCombo {
            idc = 2023;
            x = 0.62;
            y = 0.65;
            w = 0.275;
            h = 0.03;
        };

        class DropButton: cxp_RscButtonMenu {
            idc = 2002;
            text = "$STR_Global_Give";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] call cxp_fnc_giveItem;";
            x = 0.765;
            y = 0.70;
            w = (5.25 / 40);
            h = (1 / 25);
        };

        class UseButton: cxp_RscButtonMenu {
            text = "$STR_Global_Use";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] call cxp_fnc_useItem;";
            x = 0.62;
            y = 0.70;
            w = (5.25 / 40);
            h = (1 / 25);
        };

        class RemoveButton: cxp_RscButtonMenu {
            text = "$STR_Global_Remove";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] call cxp_fnc_removeItem;";
            x = 0.475;
            y = 0.70;
            w = (5.25 / 40);
            h = (1 / 25);
        };

        class ButtonClose: cxp_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            x = 0.1;
            y = 0.8 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class ButtonSettings: cxp_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Settings";
            onButtonClick = "[] call cxp_fnc_settingsMenu;";
            x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.8 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class ButtonMyGang: cxp_RscButtonMenu {
            idc = 2011;
            text = "$STR_PM_MyGang";
            onButtonClick = "if (isNil ""cxp_action_gangInUse"") then {if (isNil {(group player) getVariable ""gang_owner""}) then {createDialog ""CXP_Create_Gang_Diag"";} else {[] spawn cxp_fnc_gangMenu;};};";
            x = 0.1 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.8 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class Licenses_Menu : cxp_RscControlsGroup {
            idc = -1;
            w = 0.28;
            h = 0.38;
            x = 0.34;
            y = 0.30;

            class Controls {
                class cxp_Licenses: cxp_RscStructuredText {
                    idc = 2014;
                    sizeEx = 0.020;
                    text = "";
                    x = 0;
                    y = 0;
                    w = 0.27;
                    h = 0.65;
                };
            };
        };

        class ButtonGangList: cxp_RscButtonMenu {
            idc = 2012;
            text = "$STR_PM_WantedList";
            onButtonClick = "[] call cxp_fnc_wantedMenu";
            x = 0.1 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.8 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class ButtonKeys: cxp_RscButtonMenu {
            idc = 2013;
            text = "$STR_PM_KeyChain";
            onButtonClick = "createDialog ""CXP_key_management"";";
            x = 0.26 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.8 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class ButtonCell: cxp_RscButtonMenu {
            idc = 2014;
            text = "$STR_PM_CellPhone";
            onButtonClick = "createDialog ""CXP_cell_phone"";";
            x = 0.42 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.8 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class ButtonSyncData: cxp_RscButtonMenu {
            idc = -1;
            text = "$STR_PM_SyncData";
            onButtonClick = "[] call CXPSKT_fnc_syncData;";
            x = 0.1;
            y = 0.805;
            w = (6.25 / 40);
            h = (1 / 25);
        };

		class ButtonWantedMenuCiv : Cxp_RscButtonMenu 
		{
			idc = 3026;
            text = "$STR_PM_WantedList";
            onButtonClick = "[] call cxp_fnc_wantedMenu;";
			x = 0.42 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.805;
            w = (6.25 / 40); // 0.1563
            h = (1 / 25);
		};

		class ButtonCraft : Cxp_RscButtonMenu 
		{
			idc = 2025;
            text = "$STR_PM_Craft";
            onButtonClick = "createDialog ""cxp_craft"";";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.805;
            w = (6.25 / 40);
            h = (1 / 25);
		};

		class ButtonMarket : Cxp_RscButtonMenu 
		{
            idc = 3025;
			text = "$STR_PM_Economy";
			onButtonClick = "[] call cxp_fnc_openEconomy;";
            x = 0.1 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.805;
            w = (6.25 / 40);
            h = (1 / 25);
		};

		class ButtonPlaceables : Cxp_RscButtonMenu 
		{
			idc = 20003;
			text = "$STR_PM_Placeables";
			onButtonClick = "closeDialog 0;[] call cxp_fnc_placeablesMenu;";
            x = 0.26 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.805;
            w = (6.25 / 40);
            h = (1 / 25);
		};
    };
};
