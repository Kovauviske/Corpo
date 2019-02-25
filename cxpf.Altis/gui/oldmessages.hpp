class Cxp_cell_old_msgs {
	idd = 98111;
	name= "Cxp_cell_old_msgs";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "";

	class controlsBackground {
		class Cxp_RscTitleBackground: Cxp_RscText {
			idc = -1;
			text = "Mensagens";
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.2965 * safezoneH + safezoneY;
			w = 0.314531 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class MainBackground: Cxp_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.314531 * safezoneW;
			h = 0.308 * safezoneH;
		};
		
		class FromBar: Cxp_RscText {
			idc = -1;
			text = "De";
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class MessageBar: Cxp_RscText {
			idc = -1;
			text = "Mensagem";
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};

	class controls {
		
		class TextBox: Cxp_RscStructuredText {
			idc = 98113;
			text = "";
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.253 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		
		class PlayerList: Cxp_RscListBox {
			idc = 98112;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[] call cxp_fnc_lbChanged";
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.253 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		
		class CloseButtonKey: Cxp_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class DeleteButton: Cxp_RscButtonMenu {
			idc = 98114;
			text = "Deletar";
			colorBackground[] = {0.7, 0, 0, 0.7};
			onButtonClick = "[] spawn cxp_fnc_deleteMessage";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class ReplyButton: Cxp_RscButtonMenu {
			idc = 98115;
			text = "Responder";
			colorBackground[] = {0.9,0.5,0.1,1};
			onButtonClick = "[] spawn cxp_fnc_replyMessage";
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};