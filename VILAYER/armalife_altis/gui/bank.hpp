/*
    Nome: Atm Da Caixa Economica v3.0
    Autor : Casperento
        Nao se esqueça de deixar os creditos caso voce queira usar em seu servidor !
*/
class cxp_atm_menu {
    idd = 2700;
    name= "cxp_atm_menu";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class MainBackground : Cxp_RscText
        {
            idc = -1;
            x = 0.2375;
            y = 0.08;
            w = 0.5375;
            h = 0.82;
            colorBackground[] = {-1,-1,-1,0.5};
        };
        class Cxp_RscFrameBackGround : Cxp_RscFrame
        {
            idc = -1;
            x = 0.25;
            y = 0.1;
            w = 0.5125;
            h = 0.78;
            colorText[] = {-1,-1,1,1};
        };
        class Picture_Background : Cxp_RscPicture
        {
            idc = -1;
            text = "textures\interface\cx.paa";
            x = 0.3;
            y = 0.14;
            w = 0.4125;
            h = 0.14;
        };
    };
    class controls {
        class CashTitle : Cxp_RscStructuredText
        {
            idc = 2701;
            x = 0.375;
            y = 0.3;
            w = 0.275;
            h = 0.12;
            colorBackground[] = {-1,-1,-1,0};
        };
		class WithdrawAllButton : Cxp_RscButtonMenu 
		{
			idc = -1;
			x = 0.275;
			y = 0.66;
			w = 0.15;
			h = 0.06;
			text = "S. TUDO";
			onButtonClick = "[] call cxp_fnc_bankWithdrawAll";
			tooltip = "Sacar tudo...";
		};
		class DepositAllButton : Cxp_RscButtonMenu 
		{
			idc = -1;
			x = 0.6;
			y = 0.66;
			w = 0.15;
			h = 0.06;
			text = "D. TUDO";
			onButtonClick = "[] call cxp_fnc_bankDepositAll";
			tooltip = "Depositar tudo...";
		};
        class WithdrawButton : Cxp_RscButtonMenu
        {
            idc = -1;
            text = "SACAR";
            onButtonClick = "[] call cxp_fnc_bankWithdraw";
            x = 0.275;
            y = 0.56;
            w = 0.15;
            h = 0.06;
        };
        class DepositButton : Cxp_RscButtonMenu
        {
            idc = -1;
            text = "DEPOSITAR";
            onButtonClick = "[] call cxp_fnc_bankDeposit";
            x = 0.4375;
            y = 0.56;
            w = 0.15;
            h = 0.06;
        };
        class moneyEdit : Cxp_RscEdit
        {
            idc = 2702;
            text = "1";
            x = 0.4125;
            y = 0.44;
            w = 0.2;
            h = 0.04;
            colorBackground[] = {-1,-1,-1,1};
        };
        class PlayerList : Cxp_RscCombo
        {
            idc = 2703;
            x = 0.3875;
            y = 0.5;
            w = 0.25;
            h = 0.04;
        };
        class TransferButton : Cxp_RscButtonMenu
        {
            idc = -1;
            text = "TRANSFERIR";
            onButtonClick = "[] call cxp_fnc_bankTransfer";
            x = 0.6;
            y = 0.56;
            w = 0.15;
            h = 0.06;
        };
        class CloseButtonKey : Cxp_RscButtonMenu
        {
            idc = 2405;
            text = "FECHAR";
            onButtonClick = "closeDialog 0;";
            x = 0.4375;
            y = 0.78;
            w = 0.15;
            h = 0.06;
        };
    };
};
