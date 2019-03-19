/*
 File: craft.hpp
 Description: Crafting System
 Created by EdgeKiller
 Coder: EdgeKiller
*/
class cxp_craft {
	idd = 666;
	name= "cxp_craft";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn cxp_fnc_craft";
	class controlsBackground {
		class Cxp_RscTitleBackground:Cxp_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		class MainBackground:Cxp_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (22 / 250);
		};
	};
	class controls {
		class Title : Cxp_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 667;
			text = "$STR_CRAFT_Title";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		class craftListHeader : Cxp_RscText {
			idc = 668;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_PM_CraftStats";
			sizeEx = 0.04;
			x = 0.105; 
			y = 0.26;
			w = 0.275;
			h = 0.04;
		};
		//Craft list
		class craftList : cxp_RscListBox {
			idc = 669;
			sizeEx = 0.030;
			onLBSelChanged = "[] spawn cxp_fnc_craftupdate";
			x = 0.105;
			y = 0.31;
			w = 0.275; 
			h = 0.44;
		};
		//Materials list header
		class materialListHeader : Cxp_RscText {
			idc = 670;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_PM_CraftMaterials";
			sizeEx = 0.04;
			x = 0.395; 
			y = 0.26;
			w = 0.275; 
			h = 0.04;
		};
		//Materials list
		class materialList : Cxp_RscControlsGroup {
			idc = 671;
			w = 0.275;
			h = 0.44;
			x = 0.395;
			y = 0.30;
			class Controls {
				class mats : Cxp_RscStructuredText {
					idc = 672;
					sizeEx = 0.020;
					text = "";
					x = 0;
					y = 0;
					w = 0.27; h = 0.44;
				};
			};
		};
		//FILTER
		class FilterList : Cxp_RscCombo {
			idc = 673;
			colorBackground[] = {0,0,0,0.7};
			onLBSelChanged = "[] call cxp_fnc_craftupdateFilter";
			x = 0.69;
			y = 0.32;
			w = (6.25 / 30);
			h = (1 / 25);
		};
		//Craft button
		class ButtonCraft : Cxp_RscButtonMenu {
			idc = 674;
			text = "$STR_CRAFT_Button";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "if(!(cxp_is_processing && cxp_action_inUse)) then {[] spawn cxp_fnc_craftAction};";
			x = 0.69;
			y = 0.26;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class CloseButtonKey : Cxp_RscButtonMenu {
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