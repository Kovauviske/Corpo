/* Author: Casperento */
class cxp_map_filter
{
	name = "cxp_map_filter";
	idd = 88000;
	movingEnable = false;
	enableSimulation = true;
	duration = 9999;
	onLoad = "[] spawn cxp_fnc_initMapFilter;";
	
	class ControlsBackground
	{
		class CXP_MPFL_Titulo
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.81875;
			y = safeZoneY + safeZoneH * 0.27333334;
			w = safeZoneW * 0.1875;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "CXP MAP FILTER";
			colorBackground[] = {1,0,0,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			moving = false;
			
		};
		class CXP_MAP_FILTER_BG
		{
			type = 0;
			idc = 880009;
			x = safeZoneX + safeZoneW * 0.81875;
			y = safeZoneY + safeZoneH * 0.32222223;
			w = safeZoneW * 0.1875;
			h = safeZoneH * 0.40333334;
			style = 0;
			text = "";
			colorBackground[] = {0,0,0,0.8};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			moving = false;
			
		};
		class CXP_MPFL_TitTipo
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.81875;
			y = safeZoneY + safeZoneH * 0.32222223;
			w = safeZoneW * 0.1875;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "Categoria";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			moving = false;
			
		};
		class CXP_MPFL_TitSubTipo
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.81875;
			y = safeZoneY + safeZoneH * 0.42;
			w = safeZoneW * 0.1875;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "Subcategoria";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			moving = false;
			
		};
		class CXP_MPFL_TitMark
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.81875;
			y = safeZoneY + safeZoneH * 0.51777778;
			w = safeZoneW * 0.1875;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "Marcador";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			moving = false;
			
		};
	};
	class Controls
	{
		class CXP_MPFL_BtnLocalizar
		{
			type = 1;
			idc = 88001;
			x = safeZoneX + safeZoneW * 0.91875;
			y = safeZoneY + safeZoneH * 0.64;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "Localizar";
			onButtonClick = "[] call cxp_fnc_localizarMarcador;";
			borderSize = 0;
			colorBackground[] = {1,0,0,1};
			colorBackgroundActive[] = {1,0,0,1};
			colorBackgroundDisabled[] = {0,0,0,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
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
			shadow = 0;
			
		};
		class CXP_MPFL_BtnReset
		{
			type = 1;
			idc = 88002;
			x = safeZoneX + safeZoneW * 0.84375;
			y = safeZoneY + safeZoneH * 0.64;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "Resetar";
			onButtonClick = "[] spawn cxp_fnc_resetarCbList;";
			borderSize = 0;
			colorBackground[] = {1,0,0,1};
			colorBackgroundActive[] = {1,0,0,1};
			colorBackgroundDisabled[] = {0,0,0,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
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
			shadow = 0;
			
		};
		class CXP_MPFL_CbBoxMark
		{
			type = 4;
			idc = 88003;
			x = safeZoneX + safeZoneW * 0.84375;
			y = safeZoneY + safeZoneH * 0.56666667;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.03111112;
			style = 16;
			arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_ca.paa";
			arrowFull = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_active_ca.paa";
			colorBackground[] = {0,0,0,1};
			colorDisabled[] = {0,0,0,1};
			colorSelect[] = {1,1,1,1};
			colorSelectBackground[] = {0,0,0,1};
			colorText[] = {0.902,0.902,0.302,1};
			font = "RobotoCondensed";
			maxHistoryDelay = 0;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1.0};
			soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1.0};
			soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1.0};
			wholeHeight = 0.3;
			class ComboScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
		};
		class CXP_MPFL_CbBoxSubTipo
		{
			type = 4;
			idc = 88004;
			x = safeZoneX + safeZoneW * 0.84375;
			y = safeZoneY + safeZoneH * 0.46888889;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.03111112;
			style = 16;
			arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_ca.paa";
			arrowFull = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_active_ca.paa";
			colorBackground[] = {0,0,0,1};
			colorDisabled[] = {0,0,0,1};
			colorSelect[] = {1,1,1,1};
			colorSelectBackground[] = {0,0,0,1};
			colorText[] = {0.902,0.902,0.302,1};
			font = "RobotoCondensed";
			maxHistoryDelay = 0;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1.0};
			soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1.0};
			soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1.0};
			wholeHeight = 0.3;
			class ComboScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			onLBSelChanged = "[""scat"",88004] spawn cxp_fnc_changeCbList";
		};
		class CXP_MPFL_CbBoxTipo
		{
			type = 4;
			idc = 88005;
			x = safeZoneX + safeZoneW * 0.84375;
			y = safeZoneY + safeZoneH * 0.37111112;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.03111112;
			style = 16;
			arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_ca.paa";
			arrowFull = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_active_ca.paa";
			colorBackground[] = {0,0,0,1};
			colorDisabled[] = {0,0,0,1};
			colorSelect[] = {1,1,1,1};
			colorSelectBackground[] = {0,0,0,1};
			colorText[] = {0.902,0.902,0.302,1};
			font = "RobotoCondensed";
			maxHistoryDelay = 0;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1.0};
			soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1.0};
			soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1.0};
			wholeHeight = 0.3;
			class ComboScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			onLBSelChanged = "[""cat"",88005] spawn cxp_fnc_changeCbList";
		};
		
	};
	
};
