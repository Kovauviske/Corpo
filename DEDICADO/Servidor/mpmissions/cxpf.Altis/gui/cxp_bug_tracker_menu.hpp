/* Author: Casperento */
class cxp_bug_tracker_menu
{
	idd = 717273;
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn {if ((time - cxp_bt_timer) < (60 * getNumber(missionConfigFile >> ""CxpBasic_Settings"" >> ""cxp_bt_delay"")) && cxp_bt_timer != 0) exitWith {closeDialog 0; hint format[localize ""STR_CXPBT_DelayTimer"",([((60 * getNumber(missionConfigFile >> ""CxpBasic_Settings"" >> ""cxp_bt_delay"")) - (time - cxp_bt_timer)),""MM:SS""] call BIS_fnc_secondsToString)];};};";

	class ControlsBackground
	{
		class CXP_BT_MAINBG
		{
			type = 0;
			idc = -1;
			x = safeZoneX+safeZoneW*0.2375;
			y = safeZoneY+safeZoneH*0.29666667;
			w = safeZoneW*0.525;
			h = safeZoneH*0.39;
			style = 0;
			text = "";
			colorBackground[] = {0,0,0,0.7857};
			colorText[] = {0,0,0,1};
			font = "RobotoCondensed";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			
		};
		class CXP_BT_TITBOX
		{
			type = 0;
			idc = -1;
			x = safeZoneX+safeZoneW*0.2375;
			y = safeZoneY+safeZoneH*0.26;
			w = safeZoneW*0.525;
			h = safeZoneH*0.03;
			style = 2;
			text = "CXP BUG TRACKER";
			colorBackground[] = {1,0,0,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			
		};
		class CXP_BT_EXPTDBEHAV
		{
			type = 0;
			idc = -1;
			x = safeZoneX+safeZoneW*0.2625;
			y = safeZoneY+safeZoneH*0.45888889;
			w = safeZoneW*0.555;
			h = safeZoneH*0.04;
			style = 0;
			text = "$STR_CXPBT_ExpectedBehavior";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			
		};
		class CXP_BT_BUGDESC
		{
			type = 0;
			idc = -1;
			x = safeZoneX+safeZoneW*0.2625;
			y = safeZoneY+safeZoneH*0.35;
			w = safeZoneW*0.41;
			h = safeZoneH*0.04;
			style = 0;
			text = "$STR_CXPBT_BugDescription";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			
		};
		class CXP_BT_CREDITS
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.25390625;
			y = safeZoneY + safeZoneH * 0.64583334;
			w = safeZoneW * 0.63964844;
			h = safeZoneH * 0.03819445;
			style = 0;
			text = "$STR_CXPBT_Credits";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,0.302,1};
			font = "RobotoCondensed";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			lineSpacing = 0;
			
		};
		class CXP_BT_DESC
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.25390625;
			y = safeZoneY + safeZoneH * 0.30902778;
			w = safeZoneW * 0.49511719;
			h = safeZoneH * 0.02951389;
			style = 16;
			text = "$STR_CXPBT_Description";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,0.302,1};
			font = "RobotoCondensed";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			lineSpacing = 1;
		};
	};
	class Controls
	{
		class CXP_BT_BEHAVEDIT
		{
			type = 2;
			idc = 7301;
			x = safeZoneX+safeZoneW*0.273125;
			y = safeZoneY+safeZoneH*0.5;
			w = safeZoneW*0.45375;
			h = safeZoneH*0.04;
			style = 0;
			text = "";
			autocomplete = false;
			colorBackground[] = {0,0,0,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelection[] = {1,0,0,1};
			colorText[] = {1,0.7131,0,1};
			font = "RobotoCondensed";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CXP_BT_BUGEDIT
		{
			type = 2;
			idc = 7302;
			x = safeZoneX+safeZoneW*0.273125;
			y = safeZoneY+safeZoneH*0.39;
			w = safeZoneW*0.45375;
			h = safeZoneH*0.04;
			style = 0;
			text = "";
			autocomplete = false;
			colorBackground[] = {0,0,0,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelection[] = {1,0,0,1};
			colorText[] = {1,0.7131,0,1};
			font = "RobotoCondensed";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CXP_BT_BTNREPORT
		{
			type = 1;
			idc = 7304;
			x = safeZoneX+safeZoneW*0.5375;
			y = safeZoneY+safeZoneH*0.56;
			w = safeZoneW*0.095;
			h = safeZoneH*0.06;
			style = 2;
			text = "$STR_CXPBT_Report";
			onButtonClick = "[] call cxp_fnc_reportarBug;";
			borderSize = 0;
			colorBackground[] = {1,0,0,1};
			colorBackgroundActive[] = {0.839,0.839,0.839,1};
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
			
		};
		class CXP_BT_BTNCLOSE
		{
			type = 1;
			idc = 7303;
			x = safeZoneX+safeZoneW*0.3875;
			y = safeZoneY+safeZoneH*0.56;
			w = safeZoneW*0.095;
			h = safeZoneH*0.06;
			style = 2;
			text = "$STR_Global_Close";
			borderSize = 0;
			colorBackground[] = {1,0,0,1};
			colorBackgroundActive[] = {0.839,0.839,0.839,1};
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
			onButtonClick = "closeDialog 0;";
		};
	};
};