class Cxp_Cop_Placeables {
	idd = 20000;
    name= "cxp_cop_placeables";
    movingEnable = false;
    enableSimulation = true;
    onLoad = "";

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
		class Title : Cxp_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Objetos Disponíveis";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};

		class PlaceablesList : Cxp_RscListBox {
			idc = 20001;
			text = "";
			sizeEx = 0.035;
			x = 0.12;
			y = 0.26;
			w = 0.56;
			h = 0.370;
		};

		class CloseButtonKey : Cxp_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class RemoveAll : cxp_RscButtonMenu {
			idc = -1;
			text = "Remover";
			onButtonClick = "[] call cxp_fnc_placeablesRemoveAll";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class Place : Cxp_RscButtonMenu {
			idc = -1;
			text = "Colocar";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn cxp_fnc_placeablePlace;";
			x = 0.32;
			y = 0.69;
			w = (6.25 / 40);
			h = (1 / 25);
		};
    };
};