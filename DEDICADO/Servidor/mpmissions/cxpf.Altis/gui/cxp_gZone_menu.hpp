/*Author:Casperento*/
class cxp_gZone_menu
{
	idd = 919497;
	movingEnable = false;
	enableSimulation = true;
	
	class ControlsBackground
	{
		class CXP_GZM_Title
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.28550513;
			y = safeZoneY + safeZoneH * 0.18619792;
			w = safeZoneW * 0.42898976;
			h = safeZoneH * 0.04296875;
			style = 2;
			text = "CXP GANG MANAGER";
			colorBackground[] = {1,0,0,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			
		};
		class CXP_GZM_MAINBG
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.28550513;
			y = safeZoneY + safeZoneH * 0.23177084;
			w = safeZoneW * 0.42898976;
			h = safeZoneH * 0.57161459;
			style = 0;
			text = "";
			colorBackground[] = {0,0,0,0.7619};
			colorText[] = {0,0,0,1};
			font = "RobotoCondensed";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			
		};
		class CXP_GZM_SubTit2
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.48023427;
			y = safeZoneY + safeZoneH * 0.31119792;
			w = safeZoneW * 0.25183017;
			h = safeZoneH * 0.05598959;
			style = 2;
			text = "Membros offline:";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			
		};
		class CXP_GZM_SubTit1
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.25183017;
			y = safeZoneY + safeZoneH * 0.30338542;
			w = safeZoneW * 0.25183017;
			h = safeZoneH * 0.05598959;
			style = 2;
			text = "Membros online:";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			
		};
		class CXP_GZM_Description
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.29355784;
			y = safeZoneY + safeZoneH * 0.24609375;
			w = safeZoneW * 0.39092241;
			h = safeZoneH * 0.09114584;
			style = 16;
			text = "Selecione algum membro da gangue para ganhar/perder permissao de sua base de gangue:";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			lineSpacing = 1;
		};
		
	};
	class Controls
	{
		class CXP_GZM_ListBoxMembOFF
		{
			type = 5;
			idc = 91001;
			x = safeZoneX + safeZoneW * 0.51537336;
			y = safeZoneY + safeZoneH * 0.36848959;
			w = safeZoneW * 0.18155198;
			h = safeZoneH * 0.35546875;
			style = 16;
			colorBackground[] = {0,0,0,1};
			colorDisabled[] = {0,0,0,1};
			colorSelect[] = {0.902,0.902,0.302,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			maxHistoryDelay = 0;
			rowHeight = 0;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
			class ListScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class CXP_GZM_ListBoxMembON
		{
			type = 5;
			idc = 91002;
			x = safeZoneX + safeZoneW * 0.2964861;
			y = safeZoneY + safeZoneH * 0.35807292;
			w = safeZoneW * 0.18155198;
			h = safeZoneH * 0.36458334;
			style = 16;
			colorBackground[] = {0,0,0,1};
			colorDisabled[] = {0,0,0,1};
			colorSelect[] = {0.902,0.902,0.302,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			maxHistoryDelay = 0;
			rowHeight = 0;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
			class ListScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class CXP_GZM_BtnDesetOFF
		{
			type = 1;
			idc = 91003;
			x = safeZoneX + safeZoneW * 0.60468522;
			y = safeZoneY + safeZoneH * 0.73567709;
			w = safeZoneW * 0.0783309;
			h = safeZoneH * 0.04166667;
			style = 0+2;
			text = "$STR_Gang_Deset_Base";
			borderSize = 0;
			colorBackground[] = {1,0,0,1};
			colorBackgroundActive[] = {0.8,0.8,0.8,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "['off',true] spawn cxp_fnc_gangSetBase";
		};
		class CXP_GZM_BtnSetOFF
		{
			type = 1;
			idc = 91004;
			x = safeZoneX + safeZoneW * 0.51830162;
			y = safeZoneY + safeZoneH * 0.73567709;
			w = safeZoneW * 0.0783309;
			h = safeZoneH * 0.04166667;
			style = 0+2;
			text = "$STR_Gang_Set_Base";
			borderSize = 0;
			colorBackground[] = {1,0,0,1};
			colorBackgroundActive[] = {0.8,0.8,0.8,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "['off'] spawn cxp_fnc_gangSetBase";
		};
		class CXP_GZM_BtnDesetON
		{
			type = 1;
			idc = 91005;
			x = safeZoneX + safeZoneW * 0.38579796;
			y = safeZoneY + safeZoneH * 0.73567709;
			w = safeZoneW * 0.0783309;
			h = safeZoneH * 0.04166667;
			style = 0+2;
			text = "$STR_Gang_Deset_Base";
			borderSize = 0;
			colorBackground[] = {1,0,0,1};
			colorBackgroundActive[] = {0.8,0.8,0.8,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "['on',true] spawn cxp_fnc_gangSetBase";
		};
		class CXP_GZM_BtnSetON
		{
			type = 1;
			idc = 91006;
			x = safeZoneX + safeZoneW * 0.29941435;
			y = safeZoneY + safeZoneH * 0.73567709;
			w = safeZoneW * 0.0783309;
			h = safeZoneH * 0.04166667;
			style = 0+2;
			text = "$STR_Gang_Set_Base";
			borderSize = 0;
			colorBackground[] = {1,0,0,1};
			colorBackgroundActive[] = {0.8,0.8,0.8,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "['on'] spawn cxp_fnc_gangSetBase";
		};
		
	};
	
};
