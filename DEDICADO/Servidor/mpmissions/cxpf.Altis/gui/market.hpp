class Market
{
    idd = 39000;
    name = "Market";
    movingEnable = false;
    enableSimulation = true;

    class controlsBackground
    {
        class TitleBackground: Cxp_RscText
        {
            idc = 1000;
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.044 * safezoneH;
            colorBackground[] = {0.05,0.5,0.05,0.8};
            colorActive[] = {0.05,0.5,0.05,0.8};
        };
        class MarketBackground: Cxp_RscText
        {
            idc = 1001;
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.269 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.506 * safezoneH;
            colorBackground[] = {0,0,0,0.6};
        };
        class Title: Cxp_RscText
        {
            idc = 1002;
            text = "Mercado Dinamico";
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.044 * safezoneH;
        };
    };

    class Controls
    {
        class GoodsDisplay: Cxp_RscListbox
        {
            idc = 39001;
            text = "";
            sizeEx = 0.035;
            onLBSelChanged = "[] spawn cxp_fnc_marketGrab";
            x = 0.304062 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.418 * safezoneH;
        };
        class GoodsTitle: Cxp_RscText
        {
            idc = -1;
            text = "Lista";
            x = 0.329844 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.0360937 * safezoneW;
            h = 0.033 * safezoneH;
        };
        class InfoTitle: Cxp_RscText
        {
            idc = -1;
            text = "Info";
            x = 0.515469 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.0567187 * safezoneW;
            h = 0.033 * safezoneH;
        };
        class CurrentGood: Cxp_RscText
        {
            idc = 39002;
            text = "Produto Atual:";
            x = 0.448438 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.232031 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class CurrentPrice: Cxp_RscText
        {
            idc = 39003;
            text = "Preço Atual:";
            x = 0.448438 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.232031 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class RecentPrice: Cxp_RscText
        {
            idc = 39004;
            text = "Preço Antigo Recente:";
            x = 0.448438 * safezoneW + safezoneX;
            y = 0.467 * safezoneH + safezoneY;
            w = 0.232031 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class RecentChange: Cxp_RscText
        {
            idc = 39005;
            text = "Mudança de Valor Atual:";
            x = 0.448438 * safezoneW + safezoneX;
            y = 0.533 * safezoneH + safezoneY;
            w = 0.232031 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class StartPrice: Cxp_RscText
        {
            idc = 39006;
            text = "Preço de Inicio do Servidor:";
            x = 0.448438 * safezoneW + safezoneX;
            y = 0.599 * safezoneH + safezoneY;
            w = 0.232031 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class StartChange: Cxp_RscText
        {
            idc = 39007;
            text = "Mudança Desde o Inicio do Servidor:";
            x = 0.448438 * safezoneW + safezoneX;
            y = 0.665 * safezoneH + safezoneY;
            w = 0.232031 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class ExitButton: Cxp_RscButtonMenu
        {
            idc = 39008;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            x = 0.654688 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.0360937 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0.05,0.5,0.05,0.8};
            colorActive[] = {0.05,0.5,0.05,0.8};
        };
    };
};