////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Casperento, v1.063, #Quxufi)
////////////////////////////////////////////////////////
class cxp_actualdead_List {
    idd = 52900;
    name = "cxp_actualdead_List";
	movingEnable = false;
	enableSimulation = true;
	
	class ControlsBackground
	{
		class CXP_DLST_MAINBG
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.23875;
			y = safeZoneY + safeZoneH * 0.19111112;
			w = safeZoneW * 0.523125;
			h = safeZoneH * 0.65666667;
			style = 0;
			text = "";
			colorBackground[] = {0,0,0,0.8413};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			
		};
		class CXP_DLST_TIT
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.23875;
			y = safeZoneY + safeZoneH * 0.16111112;
			w = safeZoneW * 0.52375;
			h = safeZoneH * 0.02888889;
			style = 2;
			text = "CXP DEAD LIST";
			colorBackground[] = {1,0,0,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			
		};
		class CXP_DLST_STATUSPAC
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.470625;
			y = safeZoneY + safeZoneH * 0.21333334;
			w = safeZoneW * 0.28875;
			h = safeZoneH * 0.05666667;
			style = 1;
			text = "Sobre o paciente:";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			
		};
		class CXP_DLST_PACLISTtIT
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.24875;
			y = safeZoneY + safeZoneH * 0.22222223;
			w = safeZoneW * 0.176875;
			h = safeZoneH * 0.04;
			style = 0;
			text = "Pacientes disponiveis:";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			
		};
		
	};
	class Controls
	{
		class CXP_DLST_MapPacLocate : Cxp_RscMapControl
		{
			idc = 1650;
			x = safeZoneX + safeZoneW * 0.431875;
			y = safeZoneY + safeZoneH * 0.38111112;
			w = safeZoneW * 0.319375;
			h = safeZoneH * 0.30777778;
			maxSatelliteAlpha = 0.75;
            alphaFadeStartScale = 1.15;//0.15;
            alphaFadeEndScale = 1.29;//0.29;
		};
		class CXP_DLST_ListBoxPac
		{
			type = 5;
			idc = 52901;
			x = safeZoneX + safeZoneW * 0.248125;
			y = safeZoneY + safeZoneH * 0.26888889;
			w = safeZoneW * 0.173125;
			h = safeZoneH * 0.55333334;
			style = 16;
			colorBackground[] = {0,0,0,1};
			colorDisabled[] = {0,0,0,1};
			colorSelect[] = {0.2541,1,0,1};
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
			onLBSelChanged = "_this call cxp_fnc_onLbChangeDeadList;";
		};
		class CXP_DLST_BtnCancel
		{
			type = 1;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.433125;
			y = safeZoneY + safeZoneH * 0.77333334;
			w = safeZoneW * 0.08375;
			h = safeZoneH * 0.04222223;
			style = 0+2;
			text = "CANCELAR";
			onButtonClick = "closeDialog 0;[] spawn cxp_fnc_cancelarChamado;";
			borderSize = 0;
			colorBackground[] = {0.6,0,0,1};
			colorBackgroundActive[] = {0.702,0.702,0.702,1};
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
			tooltip = "Cancelar chamado atual...";
			
		};
		class CXP_DLST_BtnLock
		{
			type = 1;
			idc = 52962;
			x = safeZoneX + safeZoneW * 0.43375;
			y = safeZoneY + safeZoneH * 0.71555556;
			w = safeZoneW * 0.08375;
			h = safeZoneH * 0.04222223;
			style = 0+2;
			text = "LOCALIZAR";
			onButtonClick = "[] spawn cxp_fnc_localizarDefunto;";
			borderSize = 0;
			colorBackground[] = {0.6,0,0,1};
			colorBackgroundActive[] = {0.702,0.702,0.702,1};
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
			tooltip = "Localizar paciente selecionado...";
			
		};
		class CXP_DLST_BtnRemove
		{
			type = 1;
			idc = 52961;
			x = safeZoneX + safeZoneW * 0.524375;
			y = safeZoneY + safeZoneH * 0.77333334;
			w = safeZoneW * 0.08375;
			h = safeZoneH * 0.04222223;
			style = 0+2;
			text = "REMOVER";
			onButtonClick = "closeDialog 0;[] call cxp_fnc_apagarItemLista;";
			borderSize = 0;
			colorBackground[] = {0.6,0,0,1};
			colorBackgroundActive[] = {0.702,0.702,0.702,1};
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
			tooltip = "Remover item da lista...";
			
		};
		class CXP_DLST_BtnClose
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.615625;
			y = safeZoneY + safeZoneH * 0.77333334;
			w = safeZoneW * 0.08375;
			h = safeZoneH * 0.04222223;
			style = 0+2;
			text = "FECHAR";
			borderSize = 0;
			colorBackground[] = {0.6,0,0,1};
			colorBackgroundActive[] = {0.702,0.702,0.702,1};
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
			tooltip = "Fechar menu...";
			onButtonClick = "closeDialog 0;";
		};
		class CXP_DLST_Team
		{
			type = 0;
			idc = 1649;
			x = safeZoneX + safeZoneW * 0.436875;
			y = safeZoneY + safeZoneH * 0.33888889;
			w = safeZoneW * 0.310625;
			h = safeZoneH * 0.04222223;
			style = 0;
			text = "Time: ?";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			
		};
		class CXP_DLST_NamePac
		{
			type = 0;
			idc = 1648;
			x = safeZoneX + safeZoneW * 0.436875;
			y = safeZoneY + safeZoneH * 0.28333334;
			w = safeZoneW * 0.31125;
			h = safeZoneH * 0.04222223;
			style = 0;
			text = "Nome do paciente: ?";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			
		};
		class CXP_DLST_DeadBy
		{
			type = 0;
			idc = 1647;
			x = safeZoneX + safeZoneW * 0.436875;
			y = safeZoneY + safeZoneH * 0.31111112;
			w = safeZoneW * 0.3125;
			h = safeZoneH * 0.04222223;
			style = 0;
			text = "Morreu de: ?";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			
		};
		class CXP_DLST_NbAtualPac
		{
			type = 0;
			idc = 1646;
			x = safeZoneX + safeZoneW * 0.449375;
			y = safeZoneY + safeZoneH * 0.69444445;
			w = safeZoneW * 0.305;
			h = safeZoneH * 0.08;
			style = 1;
			text = "Numero de pacientes atuais: 0";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			
		};
		
	};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
/* Author: Casperento */