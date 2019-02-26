/*
*   class:
*       MaterialsReq (Needed to process) = Array - Format -> {{"ITEM CLASS",HOWMANY}}
*       MaterialsGive (Returned items) = Array - Format -> {{"ITEM CLASS",HOWMANY}}
*       Text (Progess Bar Text) = Localised String
*
*   Example for multiprocess:
*
*   class Example {
*       MaterialsReq[] = {{"cocaine_processed",1},{"heroin_processed",1}};
*       MaterialsGive[] = {{"diamond_cut",1}};
*       Text = "STR_Process_Example";
*       //ScrollText = "Process Example";
*   };
*/

class ProcessAction {
    class uranium {
        MaterialsReq[] = {{"uranium_unrefined",1}};
        MaterialsGive[] = {{"uranium_refined",1}};
        Text = "STR_Process_Uranium";
        //ScrollText = "Refine Uranium";
    };	

    class oil {
        MaterialsReq[] = {{"oil_unprocessed",1}};
        MaterialsGive[] = {{"oil_processed",1}};
        Text = "STR_Process_Oil";
        //ScrollText = "Process Oil";
    };

    class chocolat {
        MaterialsReq[] = {{"chocolat_unprocessed",1}};
        MaterialsGive[] = {{"chocolat_processed",1}};
        Text = "STR_Process_Chocolat";
        //ScrollText = "Chocolate";
    };

	class woodP {
        MaterialsReq[] = {{"wood",1}};
		MaterialsGive[] = {{"plank",1}};
        Text = "STR_Process_plank";
        //ScrollText = "Mix Cement";
	};

	class canaP {
        MaterialsReq[] = {{"cana",1}};
		MaterialsGive[] = {{"canad",1}};
        Text = "STR_Process_Cana";
        //ScrollText = "Mix Cement";
	};

	class canaPD {
        MaterialsReq[] = {{"canad",1}};
		MaterialsGive[] = {{"pinga",1}};
        Text = "STR_Process_EngarrafarP";
        //ScrollText = "Mix Cement";
	};

	class cevadaP {
        MaterialsReq[] = {{"cevada",1}};
		MaterialsGive[] = {{"cevadad",1}};
        Text = "STR_Process_Cevada";
        //ScrollText = "Mix Cement";
	};

	class cevadaPD {
        MaterialsReq[] = {{"cevadad",1}};
		MaterialsGive[] = {{"latacerveja",1}};
        Text = "STR_Process_EnlatarC";
        //ScrollText = "Mix Cement";
	};

    class diamond {
        MaterialsReq[] = {{"diamond_uncut",1}};
        MaterialsGive[] = {{"diamond_cut",1}};
        Text = "STR_Process_Diamond";
        //ScrollText = "Cut Diamonds";
    };

    class heroin {
        MaterialsReq[] = {{"heroin_unprocessed",1}};
        MaterialsGive[] = {{"heroinp",1}};
        Text = "STR_Process_Heroin";
        //ScrollText = "Process Heroin";
    };

    class copper {
        MaterialsReq[] = {{"copper_unrefined",1}};
        MaterialsGive[] = {{"copper_refined",1}};
        Text = "STR_Process_Copper";
        //ScrollText = "Refine Copper";
    };

    class iron {
        MaterialsReq[] = {{"iron_unrefined",1}};
        MaterialsGive[] = {{"iron_refined",1}};
        Text = "STR_Process_Iron";
        //ScrollText = "Refine Iron";
    };

    class sand {
        MaterialsReq[] = {{"sand",1}};
        MaterialsGive[] = {{"glass",1}};
        Text = "STR_Process_Sand";
        //ScrollText = "Melt Sand into Glass";
    };

    class salt {
        MaterialsReq[] = {{"salt_unrefined",1}};
        MaterialsGive[] = {{"salt_refined",1}};
        Text = "STR_Process_Salt";
        //ScrollText = "Refine Salt";
    };

    class cocaine {
        MaterialsReq[] = {{"cocaine_unprocessed",1}};
        MaterialsGive[] = {{"cocap",1}};
        Text = "STR_Process_Cocaine";
        //ScrollText = "Process Cocaine";
    };

    class marijuana {
        MaterialsReq[] = {{"cannabis",1}};
        MaterialsGive[] = {{"marijuana",1}};
        Text = "STR_Process_Marijuana";
        //ScrollText = "Harvest Marijuana";
    };

    class cement {
        MaterialsReq[] = {{"rock",1}};
        MaterialsGive[] = {{"cement",1}};
        Text = "STR_Process_Cement";
        //ScrollText = "Mix Cement";
    };

    class methPure {
        MaterialsReq[] = {{"methi",1}};
        MaterialsGive[] = {{"methp",1}};
        Text = "STR_Process_Meth";
        //ScrollText = "Mix Cement";
    };
};
