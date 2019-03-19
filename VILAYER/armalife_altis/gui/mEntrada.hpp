//Author - Casperento
class cxp_menu_entrada {
	idd = 66669;
	name = "cxp_menu_entrada";
    movingEnable = 0;
    enableSimulation = 1;

	class controls {
		class CXP_RscText_1000: Cxp_RscText
		{
			idc = -1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.704 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
		};
		class CXP_RscButtonMenu_2400: Cxp_RscButtonMenu
		{
			idc = 4691;
			text = ""; //BOTAO DISCORDAR
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class CXP_RscButtonMenu_2401: Cxp_RscButtonMenu
		{
			idc = 4692;
			text = ""; //BOTAO CONCORDAR
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class CXP_RscFrame_1800: Cxp_RscFrame
		{
			idc = -1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.704 * safezoneH;
			colorText[] = {1,-1,-1,1};
		};
		class CXP_RscText_1001: Cxp_RscText
		{
			idc = -1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,-1,-1,1};
		};
		class CXP_RscText_1002: Cxp_RscText
		{
			idc = -1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,-1,-1,1};
		};
		class CXP_RscText_1003: Cxp_RscText
		{
			idc = 4694;
			text = ""; //SUBTITULO
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.345469 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class CXP_RscStructuredText_1100: Cxp_RscStructuredText
		{
			idc = 4693;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.528 * safezoneH;
		};
		class CXP_RscButton_1600: Cxp_RscButtonMenu
		{
			idc = 4695;
			text = "X";//BOTAO FECHAR
			x = 0.690781 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Fechar...";
		};
		class CXP_RscText_1004: Cxp_RscText
		{
			idc = 4696;
			text = ""; //TITULO
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
