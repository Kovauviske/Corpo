/*Author:Casperento*/
class cxp_spawn_selection
{
	name = "cxp_spawn_selection";
    idd = 38500;
    movingEnable = 0;
    enableSimulation = 1;

	class ControlsBackground
	{
		class CXP_MM_TiT
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.041875;
			y = safeZoneY + safeZoneH * 0.12444445;
			w = safeZoneW * 0.271875;
			h = safeZoneH * 0.02777778;
			style = 2;
			text = "CXP SPAWN MENU";
			colorBackground[] = {1,0,0,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			
		};
		class CXP_MM_BG
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.041875;
			y = safeZoneY + safeZoneH * 0.16333334;
			w = safeZoneW * 0.271875;
			h = safeZoneH * 0.68;
			style = 0;
			text = "";
			colorBackground[] = {0,0,0,0.65};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			
		};
		class CXP_MM_SUBTIT
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.0175;
			y = safeZoneY + safeZoneH * 0.16888889;
			w = safeZoneW * 0.3275;
			h = safeZoneH * 0.05444445;
			style = 2;
			text = "Selecione um local para nascer:";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.25)";
			
		};
		class CXP_MM_MAPLOAD : Cxp_RscMapControl 
		{
			idc = 38502;
			x = safeZoneX + safeZoneW * 0.048125;
			y = safeZoneY + safeZoneH * 0.40777778;
			w = safeZoneW * 0.259375;
			h = safeZoneH * 0.36888889;
			
		};
		
	};
	class Controls
	{
		class CXP_MM_ListBoxSelect : Cxp_RscListNBox 
		{
			idc = 38510;
			x = safeZoneX + safeZoneW * 0.0475;
			y = safeZoneY + safeZoneH * 0.22111112;
			w = safeZoneW * 0.25875;
			h = safeZoneH * 0.17666667;
            coloumns[] = {0,0,0.9};
            drawSideArrows = 0;
            idcLeft = -1;
            idcRight = -1;
            rowHeight = 0.050;
            text = "";
            onLBSelChanged = "_this call cxp_fnc_spawnPointSelected;";
		};
		class CXP_MM_BTNCLOSE : Cxp_RscButtonMenu
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.0725;
			y = safeZoneY + safeZoneH * 0.78444445;
			w = safeZoneW * 0.06625;
			h = safeZoneH * 0.04111112;
			text = "SAIR";
			onButtonClick = "closeDialog 0;[] spawn cxp_fnc_logeOut;";
			tooltip = "Voltar para o Lobby...";
		};
		class CXP_MM_BTNSPAWN : Cxp_RscButtonMenu
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.2175;
			y = safeZoneY + safeZoneH * 0.78555556;
			w = safeZoneW * 0.063125;
			h = safeZoneH * 0.04;
			text = "INICIAR";
			onButtonClick = "if ((lbCurSel 38510) == -1) then {hint localize ""STR_ISTR_SelectItemFirst"";} else {[] call cxp_fnc_spawnConfirm;};";
			tooltip = "Iniciar nova vida...";
		};
	};
};