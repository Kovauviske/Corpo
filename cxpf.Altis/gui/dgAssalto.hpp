////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Casperento, v1.063, #Pymiqu)
////////////////////////////////////////////////////////
class dgAssalto {
    idd = 9000;
    name= "dgAssalto";
    movingEnable = 0;
    enableSimulation = 1;

	class controlsBackground {
		class RscFrame_1000: Cxp_RscFrame {
			idc = 1000;
			x = 0.295;
			y = 0.168;
			w = 0.3625;
			h = 0.6;
			colorText[] = {1,-1,-1,1};
		};

		class RscText_1001: Cxp_RscText {
			idc = 1001;
			x = 0.2875;
			y = 0.16;
			w = 0.375;
			h = 0.62;
			colorBackground[] = {-1,-1,-1,0.5};
		};
		class RscFrame_1002: Cxp_RscFrame {
			idc = 1002;
			x = 0.2875;
			y = 0.16;
			w = 0.375;
			h = 0.62;
			colorText[] = {1,-1,-1,1};
		};

		class RscText_1003: Cxp_RscText {
			idc = 1003;
			text = "$STR_ASS_DG_String1";
			x = 0.3525;
			y = 0.22;
			w = 0.3625;
			h = 0.08;
		};
		class RscText_1004: Cxp_RscText {
			idc = 1004;
			text = "$STR_ASS_DG_String2";
			x = 0.38;
			y = 0.248;
			w = 0.3625;
			h = 0.08;
		};
		class RscFrame_1005: Cxp_RscFrame {
			idc = 1005;
			x = 0.3425;
			y = 0.236;
			w = 0.25;
			h = 0.08;
			colorText[] = {1,-1,-1,1};
		};
	};

	class controls {
		class RscButtonMenu_2401: Cxp_RscButtonMenu {
			idc = 2401;
			text = "btn1";
			show = false;
			x = 0.4125;
			y = 0.44;
			w = 0.125;
			h = 0.04;
		};
		class RscButtonMenu_2402: Cxp_RscButtonMenu {
			idc = 2402;
			text = "btn2";
			show = false;
			x = 0.4125;
			y = 0.52;
			w = 0.125;
			h = 0.04;
		};
		class RscButtonMenu_2403: Cxp_RscButtonMenu {
			idc = 2403;
			text = "btn3";
			show = false;
			x = 0.4125;
			y = 0.6;
			w = 0.125;
			h = 0.04;
		};
		class RscButtonMenu_2404: Cxp_RscButtonMenu {
			idc = 2404;
			text = "X";
            onButtonClick = "closeDialog 0;";
			tooltip = "FECHAR";
			x = 0.6125;
			y = 0.2;
			w = 0.025;
			h = 0.04;
			colorText[] = {1,-1,-1,1};
		};
		class RscStructuredText_2405: Cxp_RscStructuredText {
			idc = 2405;
			text = "*AVISOS*";
			x = 0.4225;
			y = 0.364;
			w = 0.1;
			h = 0.04;
		};
	};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
