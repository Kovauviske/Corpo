class cxp_cell_phone {
    idd = 3000;
    name= "cxp_cell_phone";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "[] spawn cxp_fnc_cellphone";

    class controlsBackground {
        class cxp_RscTitleBackground: cxp_RscText {
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.335 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.33 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class MainBackground: cxp_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.335 * safezoneW + safezoneX;
            y = 0.3592 * safezoneH + safezoneY;
            w = 0.33 * safezoneW;
            h = 0.2816 * safezoneH;
        };
        
        class SendTo: cxp_RscText {
            idc = -1;
            text = "Enviar Para:";
            x = 0.340156 * safezoneW + safezoneX;
            y = 0.478 * safezoneH + safezoneY;
            w = 0.314531 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };

    class controls 
    {
        class Title: cxp_RscTitle 
        {
            colorBackground[] = {0, 0, 0, 0};
            idc = 3001;
            text = "E-MAIL";
            x = 0.335 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.33 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TextToSend: cxp_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = 3002;
            text = "$STR_CELL_TextToSend";
            x = 0.340156 * safezoneW + safezoneX;
            y = 0.368 * safezoneH + safezoneY;
            w = 0.2475 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class textEdit: cxp_RscEdit {
            idc = 3003;
            text = "";
            sizeEx = 0.030;
            x = 0.340156 * safezoneW + safezoneX;
            y = 0.39 * safezoneH + safezoneY;
            w = 0.314531 * safezoneW;
            h = 0.077 * safezoneH;
        };

        class TextMsgButton: cxp_RscButtonMenu {
            idc = 3015;
            text = "Enviar Mensagem";
            onButtonClick = "[] call CXPSV_fnc_cell_textmsg";
            x = 0.345312 * safezoneW + safezoneX;
            y = 0.566 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.022 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0.9,0.5,0.1,1};
        };

        class PlayerList: cxp_RscCombo {
            idc = 3004;
            x = 0.340156 * safezoneW + safezoneX;
            y = 0.5 * safezoneH + safezoneY;
            w = 0.314531 * safezoneW;
            h = 0.044 * safezoneH;
        };

        class TextCopButton: cxp_RscButtonMenu {
            idc = 3016;
            text = "Policia";
            tooltip = "Enviar mensagens para a policia...";
            onButtonClick = "[] call CXPSV_fnc_cell_textcop";
            x = 0.422656 * safezoneW + safezoneX;
            y = 0.566 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.022 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0.5,1};
        };
/*
        class TextAdminButton: cxp_RscButtonMenu {
            idc = 3017;
            text = "$STR_CELL_TextAdmins";
            onButtonClick = "[] call CXPSV_fnc_cell_textadmin";
            x = 0.505156 * safezoneW + safezoneX;
            y = 0.566 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.022 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0.5,0,0,0.7};
        };

        class AdminMsgButton: cxp_RscButtonMenu {
            idc = 3020;
            text = "$STR_CELL_AdminMsg";
            onButtonClick = "[] call CXPSV_fnc_cell_adminmsg";
            x = 0.5825 * safezoneW + safezoneX;
            y = 0.566 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.022 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0.5,0,0,0.7};
        };

        class AdminMsgAllButton: cxp_RscButtonMenu {
            idc = 3021;
            text = "$STR_CELL_AdminMSGAll";
            x = 0.505156 * safezoneW + safezoneX;
            y = 0.599 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.022 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0.5,0,0,0.7};
        };
*/

        class EMSRequest: cxp_RscButtonMenu {
            idc = 3022;
            text = "SAMU";
            tooltip = "Enviar mensagens para o samu...";
            onButtonClick = "[] call CXPSV_fnc_cell_emsrequest";
            x = 0.422656 * safezoneW + safezoneX;
            y = 0.599 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.022 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0.5,0,0.7};
        };

        class CloseButtonKey: cxp_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            tooltip = "Fechar menu...";
            onButtonClick = "closeDialog 0;";
            x = 0.5825 * safezoneW + safezoneX;
            y = 0.599 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.022 * safezoneH;
        };
        
        class MessagesButtonKey: cxp_RscButtonMenu {
            idc = -1;
            text = "Mensagens";
            tooltip = "Mensagens salvas...";
            onButtonClick = "[] spawn cxp_fnc_messagesMenu";
            x = 0.345312 * safezoneW + safezoneX;
            y = 0.599 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.022 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0.9,0.5,0.1,1};
        };
    };
};