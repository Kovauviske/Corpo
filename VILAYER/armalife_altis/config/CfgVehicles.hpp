#define true 1
#define false 0
class CarShops {
    /*
    *    ARRAY FORMAT:
    *        0: STRING (Classname)
    *        1: STRING (Condition)
    *    FORMAT:
    *        STRING (Conditions) - Must return boolean :
    *            String can contain any amount of conditions, aslong as the entire
    *            string returns a boolean. This allows you to check any levels, licenses etc,
    *            in any combination. For example:
    *                "call cxp_coplevel && license_civ_someLicense"
    *            This will also let you call any other function.
    *
    *   BLUFOR Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_WEST
    *   OPFOR Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_EAST
    *   Independent Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_GUER
    *   Civilian Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_CIV
    */
    class civ_car {
        side = "civ";
        vehicles[] = {
            { "B_Quadbike_01_F", "" },
            { "C_Hatchback_01_F", "" },
            { "C_Offroad_01_F", "" },
            { "C_SUV_01_F", "" },
            { "C_Hatchback_01_sport_F", "" },
            { "C_Offroad_02_unarmed_F", "" },
            { "C_Offroad_01_repair_F", "" },
            { "C_Van_01_transport_F", "" },
            { "C_Van_01_fuel_F", "" },
			      { "C_Van_02_vehicle_F", "" },
			      { "C_Van_02_transport_F", "" }
        };
    };

    class bounty_veh_store {
        side = "civ";
        vehicles[] = {
            { "C_Offroad_01_F", "" }
        };
    };

    class kart_shop {
        side = "civ";
        vehicles[] = {
            { "C_Kart_01_Blu_F", "" },
            { "C_Kart_01_Fuel_F", "" },
            { "C_Kart_01_Red_F", "" },
            { "C_Kart_01_Vrana_F", "" }
        };
    };

    class civ_truck {
        side = "civ";
        vehicles[] = {
            { "C_Van_01_box_F", "" },
            { "B_Truck_01_transport_F", "" },
            { "I_Truck_02_transport_F", "" },
            { "I_Truck_02_covered_F", "" },
            { "B_Truck_01_covered_F", "" },
            { "O_Truck_03_transport_F", "" },
            { "O_Truck_03_covered_F", "" },
            { "B_Truck_01_box_F", "" },
            { "B_Truck_01_ammo_F", "" },
            { "I_Truck_02_fuel_F", "" },
            { "B_Truck_01_fuel_F", "" },
            { "O_Truck_03_ammo_F", "" },
            { "O_Truck_03_device_F", "" }
        };
    };

    class civ_air {
        side = "civ";
        vehicles[] = {
			{ "C_Heli_Light_01_civil_F", "" }, // m-900
            { "B_Heli_Light_01_F", "" }, // mh-9
            { "O_Heli_Light_02_unarmed_F", "" }, // orca
            { "B_Heli_Transport_03_unarmed_F", "" }, // huron
            { "C_Plane_Civil_01_racing_F", "" }, // caesar
            { "I_Heli_Transport_02_F", "" } // mohawk
        };
    };

    class civ_ship {
        side = "civ";
        vehicles[] = {
            { "C_Rubberboat", "" },
            { "C_Scooter_Transport_01_F", "" },
            { "C_Boat_Civil_01_F", "" },
            { "O_SDV_01_F", "" }
        };
    };

/* REBELDE */
    class reb_car_b {
        side = "civ";
        vehicles[] = {
            { "B_Quadbike_01_F", "" }, // quadbike
            { "C_SUV_01_F", "" }, // suv
            { "B_G_Offroad_01_F", "" }, // offroad rebelde
            { "C_Offroad_02_unarmed_F", "" }, // jeep
            { "I_MRAP_03_F", "" }, // strider
            { "O_MRAP_02_F", "" } // ifrit
        };
    };

	class reb_air {
		side = "civ";
		vehicles[] = {
            { "B_Heli_Light_01_stripped_F", "" }, //mh-9(reb)
            { "O_Heli_Light_02_unarmed_F", "" }, // orca(reb)
            { "I_Heli_light_03_unarmed_F", "" }, // hellcat(reb)
		       	{ "O_Heli_Transport_04_box_F", "" } // taru carga(reb)
		};
	};

/* REBELDE - FIM */

	// "call cxp_mediclevel >= 1" , "call cxp_mediclevel >= 2" , "call cxp_mediclevel >= 3", etc...
    class med_shop {
        side = "med";
        vehicles[] = {
		      	{ "I_Truck_02_fuel_F", "call cxp_mediclevel >= 1" }, // zamak shell
            { "C_Offroad_01_F", "call cxp_mediclevel >= 1" },// offroad
            { "O_MRAP_02_F", "call cxp_mediclevel >= 1" },// ifrit
            { "B_MRAP_01_F", "call cxp_mediclevel >= 1" },// Hunter
            { "I_MRAP_03_F", "call cxp_mediclevel >= 1" },// Hunter
            { "C_SUV_01_F", "call cxp_mediclevel >= 1" },// SUV
            { "C_Van_02_medevac_F", "call cxp_mediclevel >= 1" }, // Van
            { "C_IDAP_Van_02_medevac_F", "call cxp_mediclevel >= 1" } // Van
        };
    };

    class med_air_hs {
        side = "med";
        vehicles[] = {
            { "B_Heli_Light_01_F", "call cxp_mediclevel >= 1" }, // humming bird samu
		      	{ "O_Heli_Light_02_unarmed_F", "call cxp_mediclevel >= 1" }, // orca
            { "O_Heli_Transport_04_medevac_F", "call cxp_mediclevel >= 1" }, // taru samu
            { "I_Heli_Transport_02_F", "call cxp_mediclevel >= 1" } // mowhank samu
        };
    };

	// "call cxp_coplevel >= 1" , "call cxp_coplevel >= 2" , "call cxp_coplevel >= 3", etc...
    class cop_car {
        side = "cop";
        vehicles[] = {

            { "B_Quadbike_01_F", "call cxp_coplevel >= 1" },
            { "C_Offroad_01_F", "call cxp_coplevel >= 1" },
            { "C_SUV_01_F", "call cxp_coplevel >= 1" },
            { "C_Hatchback_01_sport_F", "call cxp_coplevel >= 1" },
            { "I_Truck_02_fuel_F", "call cxp_coplevel >= 3" },
            { "B_MRAP_01_F", "call cxp_coplevel >=3" }, // Hunter
            { "O_MRAP_02_F", "call cxp_coplevel >=3" }, // Hunter
            { "B_GEN_Van_02_Vehicle_F", "call cxp_coplevel >=3" }, // Hunter
		      	{ "C_Van_02_transport_F", "call cxp_coplevel >=3" }
        };
    };

    class cop_air {
        side = "cop";
        vehicles[] = {
            { "B_Heli_Light_01_F", "call cxp_coplevel >= 3" }, //	MH-9 Hummingbird Policia
            { "I_Heli_light_03_unarmed_F", "call cxp_coplevel >= 3" }, //WY-55 Hellcat
            { "O_Heli_Transport_04_F", "call cxp_coplevel >= 3"} //Taru Policia
        };
    };

    class cop_ship {
        side = "cop";
        vehicles[] = {
            { "B_Boat_Transport_01_F", "call cxp_coplevel >= 3" },
            { "C_Boat_Civil_01_police_F", "call cxp_coplevel >= 3" },
            { "B_SDV_01_F", "call cxp_coplevel >= 3" }
        };
    };
};

class CxpCfgVehicles {
    /*
    *    Vehicle Configs (Contains textures and other stuff)
    *
    *    "price" e o preco basico para civis
    *    "price_cop" e o preco basico para policiais
    *    "price_samu" e o preco basico para medicos
    *
    *    Default Multiplier Values & Calculations:
    *       Civilian [Purchase, Sell]: [1.0, 0.5]
    *       Cop [Purchase, Sell]: [0.5, 0.5]
    *       Medic [Purchase, Sell]: [0.75, 0.5]
    *       ChopShop: Payout = price * 0.25
    *       GarageSell: Payout = price * [0.5, 0.5, 0.5, -1]
    *       Cop Impound: Payout = price * 0.1
    *       Pull Vehicle from Garage: Cost = price * [1, 0.5, 0.75, -1] * [0.5, 0.5, 0.5, -1]
    *           -- Pull Vehicle & GarageSell Array Explanation = [civ,cop,medic,east]
    *
    *       1: STRING (Condition)
    *    Textures config follows { Texture Name, side, {texture(s)path}, Condition}
    *    Texture(s)path follows this format:
    *    INDEX 0: Texture Layer 0
    *    INDEX 1: Texture Layer 1
    *    INDEX 2: Texture Layer 2
    *    etc etc etc
    *
        class Default {
            vItemSpace = -1; // Tamanho do inventario virtual
            conditions = ""; // condicao para esse veiculo ser comprado/usado
            price = -1; // preco para civis
            price_cop = -1; // preco para cops
            price_samu = -1; // preco para medicos
            textures[] = {}; // skins desse veiculo
            desarmar = false; // 'true': deixa veiculo (armado) sem suas municoes....'false': deixa veiculo (armado) com suas municoes ---> By Casperento
        };
    */

    class I_Truck_02_medical_F {
        vItemSpace = 150;
        conditions = "";
        price = 25000;
        price_cop = 10000;
        price_samu = 7500;
        textures[] = {};
        desarmar = false;
    };

    class C_Plane_Civil_01_racing_F {
        vItemSpace = 150;
        conditions = "license_civ_pilot || {!(playerSide isEqualTo civilian)}";
        price = 6000000;
        price_cop = 3000000;
        price_samu = 1500000;
        textures[] = {};
        desarmar = false;
    };

    class O_Plane_Fighter_02_F {
        vItemSpace = 180;
        conditions = "license_cop_cAir";
        price = -1;
        price_cop = 1000000;
        price_samu = -1;
        textures[] = {};
        desarmar = true;
    };

    class B_Heli_Transport_03_unarmed_F {
        vItemSpace = 400;
        conditions = "license_civ_pilot || {!(playerSide isEqualTo civilian)}";
        price = 5500000;
        price_cop = 2550000;
        price_samu = 1225000;
        textures[] = {};
        desarmar = false;
    };

    class B_Heli_Transport_03_unarmed_green_F {
        vItemSpace = 50;
        conditions = "license_med_mAir";
        price = 3800000;
        price_cop = 1520000;
        price_samu = 1140000;
        textures[] = {};
        desarmar = false;
    };

    class B_Heli_Light_01_stripped_F {
        vItemSpace = 200;
        conditions = "license_civ_rebellic || {!(playerSide isEqualTo civilian)}";
        price = 1600000;
        price_cop = 640000;
        price_samu = 480000;
        textures[] = {
            { "Rebel Digital", "reb", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"
            }, "" }
        };
        desarmar = false;
    };

    class O_Heli_Transport_04_F {
        vItemSpace = 200;
        conditions = "license_cop_cAir || {!(playerSide isEqualTo west)}";
        price = 1600000;
        price_cop = 640000;
        price_samu = 480000;
        textures[] =  {
          { "SAMU", "med", {
              "textures\cop\veh\c_taru1.jpg",
              "textures\cop\veh\c_taru2.jpg"
          }, "" }
        };
        desarmar = false;
    };

    class I_Heli_Transport_02_F {
        vItemSpace = 350;
        conditions = "license_civ_pilot || license_med_mAir || license_cop_cAir ";
        price = 2200000;
        price_cop = 880000;
        price_samu = 660000;
        textures[] = {
            { "Civil", "civ", {
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_dahoman_co.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_dahoman_co.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_dahoman_co.paa"
            }, "" },
            { "Civil 2", "civ", {
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\Heli_Transport_02_1_ion_CO.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\Heli_Transport_02_2_ion_CO.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_ion_co.paa"
            }, "" },
            { "Resgate", "med", {
                "textures\resgate\veh\m_mon1.jpg",
                "textures\resgate\veh\m_mon2.jpg",
                "textures\resgate\veh\m_mon3.jpg"
            }, "" }
        };
        desarmar = false;
    };

    class B_GEN_Van_02_Vehicle_F {
        vItemSpace = 300;
        conditions = "license_civ_rebellic || license_cop_cAir || license_med_mAir";
        price = 2000000;
        price_cop = 800000;
        price_samu = 600000;
        textures[] = {
            { "HellCat GATE", "cop", {
                "textures\cop\veh\c_vantrans.jpg"
            }, "" }
        };
        desarmar = false;
    };

    class I_Heli_light_03_unarmed_F {
        vItemSpace = 300;
        conditions = "license_civ_rebellic || license_cop_cAir || license_med_mAir";
        price = 2000000;
        price_cop = 800000;
        price_samu = 600000;
        textures[] = {
            { "REBELDE", "reb", {
                "\a3\air_f_epb\Heli_Light_03\data\Heli_Light_03_base_CO.paa"
            }, "" },
            { "HellCat GATE", "cop", {
                "textures\cop\veh\hellcat_cop.jpg"
            }, "" }
        };
        desarmar = false;
    };

    class I_Heli_light_03_dynamicLoadout_F : I_Heli_light_03_unarmed_F {
        conditions = "license_cop_cAir";
        desarmar = true;
    };

    class B_Heli_Transport_01_F : I_Heli_light_03_unarmed_F {
        conditions = "license_cop_cAir";
        price_cop = 850000;
        desarmar = true;
    };

    class O_Heli_Transport_04_medevac_F {
        vItemSpace = 0;
        conditions = "license_med_mAir";
        price = 3600000;
        price_cop = 1440000;
        price_samu = 1080000;
        textures[] = {
          { "SAMU", "med", {
              "textures\resgate\veh\taru_samu_0.jpg",
              "textures\resgate\veh\taru_samu_1.jpg",
              "textures\resgate\veh\taru_samu_2.jpg",
              "textures\resgate\veh\taru_samu_3.jpg"
          }, "" }
        };
        desarmar = false;
    };

    class O_Heli_Transport_04_box_F {
        vItemSpace = 580;
        conditions = "license_civ_rebellic || {!(playerSide isEqualTo civilian)}";
        price = 3800000;
        price_cop = 1520000;
        price_samu = 1140000;
        textures[] = {};
        desarmar = false;
    };

    class B_T_VTOL_01_vehicle_F {
        vItemSpace = 950;
        conditions = "license_civ_rebellic || {!(playerSide isEqualTo civilian)}";
        price = 15000000;
        price_cop = 6000000;
        price_samu = 4500000;
        textures[] = {};
        desarmar = false;
    };

    class O_T_LSV_02_unarmed_F {
        vItemSpace = 95;
        conditions = "license_civ_rebellic || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        price_cop = 44000;
        price_samu = 33000;
        textures[] = {};
        desarmar = false;
    };

    class O_LSV_02_unarmed_F {
        vItemSpace = 90;
        conditions = "{!(playerSide isEqualTo civilian)}";
        price = 110000;
        price_cop = 44000;
        price_samu = 33000;
        textures[] = {};
        desarmar = false;
    };

    class B_MRAP_01_F {
        vItemSpace = 70;
        conditions = "license_civ_rebellic || {!(playerSide isEqualTo civilian)}";
        price = 400000;
        price_cop = 160000;
        price_samu = 120000;
        textures[] = {
          { "COP", "cop", {
              "textures\cop\veh\hunter_cop_0.jpg",
              "textures\cop\veh\hunter_cop_1.jpg"
          }, "" },
          { "Resgate", "med", {
              "textures\resgate\veh\m_hunter1.jpg",
              "textures\resgate\veh\m_hunter2.jpg"
          }, "" }

        };
        desarmar = false;
    };

    class O_MRAP_02_F {
        vItemSpace = 70;
        conditions = "license_civ_rebellic || {!(playerSide isEqualTo civilian)}";
        price = 600000;
        price_cop = 240000;
        price_samu = 180000;
        textures[] = {
            { "Gate", "cop", {
                "textures\cop\veh\c1_ifrit.jpg",
                "textures\cop\veh\c2_ifrit.jpg"
            }, "" },
            { "Resgate", "med", {
                "textures\resgate\veh\m_ifrit1.jpg",
                "textures\resgate\veh\m_ifrit2.jpg"
            }, "" }
        };
        desarmar = false;
    };

    class I_MRAP_03_F {
        vItemSpace = 60;
        conditions = "license_civ_rebellic || {!(playerSide isEqualTo civilian)}";
        price = 400000;
        price_cop = 160000;
        price_samu = 120000;
        textures[] = {
            { "REB", "reb", {
                "\A3\soft_f_beta\MRAP_03\Data\MRAP_03_ext_INDP_CO.paa"
            }, "" },
            { "Samu", "med", {
                "textures\resgate\veh\strider_samu.jpg"
            }, "" }
        };
        desarmar = false;
    };

    class O_Truck_03_medical_F {
        vItemSpace = 10;
        conditions = "";
        price = 45000;
        price_cop = 18000;
        price_samu = 13500;
        textures[] = {};
        desarmar = false;
    };

    class B_Truck_01_medical_F {
        vItemSpace = 10;
        conditions = "";
        price = 60000;
        price_cop = 24000;
        price_samu = 18000;
        textures[] = {};
        desarmar = false;
    };

    class C_Rubberboat {
        vItemSpace = 45;
        conditions = "license_civ_boat || {!(playerSide isEqualTo civilian)}";
        price = 5000;
        price_cop = 2000;
        price_samu = 1500;
        textures[] = { };
        desarmar = false;
    };

    class C_Scooter_Transport_01_F {
        vItemSpace = 35;
        conditions = "license_civ_boat || {!(playerSide isEqualTo civilian)}";
        price = 15000;
        price_cop = 6000;
        price_samu = 4500;
        textures[] = { };
        desarmar = false;
    };

    class B_Boat_Transport_01_F {
        vItemSpace = 45;
        conditions = "license_cop_cg";
        price = 3000;
        price_cop = 1200;
        price_samu = 900;
        textures[] = { };
        desarmar = false;
    };

    class O_Truck_03_transport_F {
        vItemSpace = 700;
        conditions = "license_civ_trucking || {!(playerSide isEqualTo civilian)}";
        price = 700000;
        price_cop = 224000;
        price_samu = 168000;
        textures[] = { };
        desarmar = false;
    };

    class O_Truck_03_device_F {
        vItemSpace = 450;
        conditions = "license_civ_trucking || {!(playerSide isEqualTo civilian)}";
        price = 2000000;
        price_cop = 800000;
        price_samu = 600000;
        textures[] = { };
        desarmar = false;
    };

    class O_Truck_03_ammo_F {
        vItemSpace = 600;
        conditions = "license_civ_trucking || {!(playerSide isEqualTo civilian)}";
        price = 1300000;
        price_cop = 520000;
        price_samu = 390000;
        textures[] = { };
        desarmar = false;
    };

    class Land_CargoBox_V1_F {
        vItemSpace = 5000;
        conditions = "";
        price = -1;
        price_cop = -1;
        price_samu = -1;
        textures[] = {};
        desarmar = false;
    };

    class Box_IND_Grenades_F {
        vItemSpace = 350;
        conditions = "";
        price = -1;
        price_cop = -1;
        price_samu = -1;
        textures[] = {};
        desarmar = false;
    };

    class B_supplyCrate_F {
        vItemSpace = 700;
        conditions = "";
        price = -1;
        price_cop = -1;
        price_samu = -1;
        textures[] = {};
        desarmar = false;
    };

    class B_G_Offroad_01_F {
        vItemSpace = 90;
        conditions = "license_civ_rebellic || {!(playerSide isEqualTo civilian)}";
        price = 60000;
        price_cop = 24000;
        price_samu = 18000;
        textures[] = { };
        desarmar = false;
    };

    class C_Boat_Civil_01_F {
        vItemSpace = 85;
        conditions = "license_civ_boat || {!(playerSide isEqualTo civilian)}";
        price = 22000;
        price_cop = 8800;
        price_samu = 6600;
        textures[] = { };
        desarmar = false;
    };

    class O_SDV_01_F {
        vItemSpace = 200;
        conditions = "license_civ_boat || {!(playerSide isEqualTo civilian)}";
        price = 200000;
        price_cop = 80000;
        price_samu = 60000;
        textures[] = { };
        desarmar = false;
    };

    class C_Boat_Civil_01_police_F {
        vItemSpace = 85;
        conditions = "license_cop_cg || {!(playerSide isEqualTo west)}";
        price = 20000;
        price_cop = 8000;
        price_samu = 6000;
        textures[] = {};
        desarmar = false;
    };

    class B_SDV_01_F {
        vItemSpace = 85;
        conditions = "license_cop_cg || {!(playerSide isEqualTo west)}";
        price = 20000;
        price_cop = 9000;
        price_samu = 6000;
        textures[] = {};
        desarmar = false;
    };

    class B_Truck_01_box_F {
        vItemSpace = 950;
        conditions = "license_civ_trucking || {!(playerSide isEqualTo civilian)}";
        price = 1900000;
        price_cop = 760000;
        price_samu = 570000;
        textures[] = { };
        desarmar = false;
    };

    class B_Truck_01_ammo_F {
        vItemSpace = 850;
        conditions = "license_civ_trucking || {!(playerSide isEqualTo civilian)}";
        price = 850000;
        price_cop = 700000;
        price_samu = 525000;
        textures[] = { };
        desarmar = false;
    };

    class I_Truck_02_fuel_F {
        vItemSpace = 350;
        vFuelSpace = 60000;
        conditions = "license_civ_trucking || {!(playerSide isEqualTo civilian)}";
        price = 400000;
        price_cop = 160000;
        price_samu = 120000;
        textures[] = {
            { "Shell", "civ", {
                "textures\civ\veh\zamaktank.jpg",
                "textures\civ\veh\zamaktank2.jpg"
            }, "" }
        };
        desarmar = false;
    };

    class B_Truck_01_fuel_F {
        vItemSpace = 300;
        vFuelSpace = 30000;
        conditions = "license_civ_trucking || {!(playerSide isEqualTo civilian)}";
        price = 400000;
        price_cop = 160000;
        price_samu = 120000;
        textures[] = { };
        desarmar = false;
    };

    class B_Truck_01_transport_F {
        vItemSpace = 300;
        conditions = "license_civ_trucking || {!(playerSide isEqualTo civilian)}";
        price = 300000;
        price_cop = 392000;
        price_samu = 294000;
        textures[] = { };
        desarmar = false;
    };

    class O_T_LSV_02_unarmed_black_F {
        vItemSpace = 100;
        conditions = "{!(playerSide isEqualTo civilian)}";
        price = 150000;
        price_cop = 60000;
        price_samu = 45000;
        textures[] = { };
        desarmar = false;
    };

    class C_Offroad_01_F {
        vItemSpace = 90;
        conditions = "license_civ_driver || {!(playerSide isEqualTo civilian)}";
        price = 90000;
        price_cop = 36000;
        price_samu = 27000;
        textures[] = {
            { "Red", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"
            }, "" },
            { "Yellow", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa"
            }, "" },
            { "White", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa"
            }, "" },
            { "Blue", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa"
            }, "" },
            { "Dark Red", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa"
            }, "" },
            { "Blue / White", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa"
            }, "" },
            { "AMARELA", "civ", {
                "#(argb,8,8,3)color(0.6,0.3,0.01,1)"
            }, "" },
            { "PM", "cop", {
                "textures\cop\veh\c_offpm.jpg"
            }, "" },
            { "GATE", "cop", {
                "textures\cop\veh\c_offgate.jpg"
            }, "" },
            { "RESGATE", "med", {
                "textures\resgate\veh\offSAMU.jpg"
            }, "" }
        };
        desarmar = false;
    };

	class C_Van_02_transport_F {
        vItemSpace = 90;
        conditions = "license_civ_driver || {!(playerSide isEqualTo civilian)}";
        price = 200000;
        price_cop = 36000;
        price_samu = 27000;
        textures[] = {
            { "Preto", "civ", {
                "\A3\soft_f_orange\Van_02\Data\van_body_black_CO.paa"
            }, "" },
			{ "Azul", "civ", {
                "\A3\soft_f_orange\Van_02\Data\van_body_blue_CO.paa"
            }, "" },
			{ "Branco", "civ", {
                "\A3\soft_f_orange\Van_02\Data\van_body_white_CO.paa"
            }, "" },
			{ "Laranja", "civ", {
                "\A3\soft_f_orange\Van_02\Data\van_body_Orange_CO.paa"
            }, "" },
            { "Gate", "Cop", {
                "textures\cop\veh\c_vantrans.jpg"
            }, "" },
            { "Maconha", "civ", {
                "textures\civ\veh\VANMACONHA.jpg"
            }, "" }
        };
        desarmar = false;
    };

	class C_Van_02_service_F {
        vItemSpace = 90;
        conditions = "license_civ_driver || {!(playerSide isEqualTo civilian)}";
        price = 200000;
        price_cop = 36000;
        price_samu = 27000;
        textures[] = {
            { "Serviço", "civ", {
                "\A3\soft_f_orange\Van_02\Data\van_body_CivService_CO.paa"
            }, "" },
            { "Maconha", "civ", {
                "textures\civ\veh\VANMACONHA.jpg"
            }, "" }
        };
        desarmar = false;
    };

	class C_Van_02_vehicle_F {
        vItemSpace = 150;
        conditions = "license_civ_driver || {!(playerSide isEqualTo civilian)}";
        price = 200000;
        price_cop = 36000;
        price_samu = 27000;
        textures[] = {
            { "Empresa", "civ", {
                "\A3\soft_f_orange\Van_02\Data\van_body_Armazon_CO.paa"
            }, "" },
			 { "Jornal", "civ", {
                "\A3\soft_f_orange\Van_02\Data\van_body_AAN_CO.paa"
            }, "" },
			{ "Empresa2", "civ", {
                "\A3\soft_f_orange\Van_02\Data\van_body_Daltgreen_CO.paa"
            }, "" },
			{ "Combustivel", "civ", {
                "\A3\soft_f_orange\Van_02\Data\van_body_Fuel_CO.paa"
            }, "" },
			{ "Redstone", "civ", {
                "\A3\soft_f_orange\Van_02\Data\van_body_Redstone_CO.paa"
            }, "" },
			{ "Empresa3", "civ", {
                "\A3\soft_f_orange\Van_02\Data\van_body_Vrana_CO.paa"
            }, "" },
            { "Maconha", "civ", {
                "textures\civ\veh\VANMACONHA.jpg"
            }, "" }
        };
        desarmar = false;
    };

    class C_Van_02_medevac_F {
        vItemSpace = 300;
        conditions = "license_civ_driver || {!(playerSide isEqualTo civilian)}";
        price = 100000;
        price_cop = 50000;
        price_samu = 20000;
        textures[] = {
            { "SAMU", "med", {
                "textures\resgate\veh\vansamu.jpg"
            }, "" }
        };
        desarmar = false;
    };

    class C_IDAP_Van_02_medevac_F {
        vItemSpace = 300;
        conditions = "license_civ_driver || {!(playerSide isEqualTo civilian)}";
        price = 100000;
        price_cop = 50000;
        price_samu = 20000;
        textures[] = {
            { "SAMU", "med", {
                "textures\resgate\veh\vansamu.jpg"
            }, "" }
        };
        desarmar = false;
    };

    class C_Offroad_01_repair_F {
        vItemSpace = 100;
        conditions = "license_civ_driver || {!(playerSide isEqualTo civilian)}";
        price = 100000;
        price_cop = 40000;
        price_samu = 30000;
        textures[] = {};
        desarmar = false;
    };

    class C_Kart_01_Blu_F {
        vItemSpace = 0;
        conditions = "license_civ_driver || {!(playerSide isEqualTo civilian)}";
        price = 15000;
        price_cop = 6000;
        price_samu = 4500;
        textures[] = {};
        desarmar = false;
    };
/*
To edit another information in this classes you can use this exemple.
class C_Kart_01_Fuel_F : C_Kart_01_Blu_F{
    vItemSpace = 40;
    price = ;
};

will modify the virtual space and the price of the vehicle, but other information such as license and textures will pick up the vehicle declare at : Vehicle {};
*/
    class C_Kart_01_Fuel_F : C_Kart_01_Blu_F{}; // Get all information of C_Kart_01_Blu_F
    class C_Kart_01_Red_F  : C_Kart_01_Blu_F{};
    class C_Kart_01_Vrana_F : C_Kart_01_Blu_F{};

    class C_Hatchback_01_sport_F {
        vItemSpace = 60;
        conditions = "license_civ_driver || {!(playerSide isEqualTo civilian)}";
        price = 90000;
        price_cop = 45000;
        price_samu = 20000;
        textures[] = {
            { "Red", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa"
            }, "" },
            { "Dark Blue", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"
            }, "" },
            { "Orange", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport03_co.paa"
            }, "" },
            { "Black / White", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport04_co.paa"
            }, "" },
            { "Beige", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport05_co.paa"
            }, "" },
            { "Green", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport06_co.paa"
            }, "" },
            { "Laranja Custom.", "civ", {
                "textures\civ\veh\laranjacustom.jpg"
            }, "" },
            { "Maconha", "civ", {
                "textures\civ\veh\weedhatch.jpg"
            }, "" },
            { "Atletico Min.", "civ", {
                "textures\civ\veh\htb_atletc.jpg"
            }, "" },
            { "Corinthians", "civ", {
                "textures\civ\veh\htb_corint.jpg"
            }, "" },
            { "Atletico Min.", "civ", {
                "textures\civ\veh\htb_atletc.jpg"
            }, "" },
            { "Cruzeiro", "civ", {
                "textures\civ\veh\htb_cruz.jpg"
            }, "" },
            { "Gremio", "civ", {
                "textures\civ\veh\htb_gremio.jpg"
            }, "" },
            { "Internacional", "civ", {
                "textures\civ\veh\htb_inter.jpg"
            }, "" },
            { "Flamengo", "civ", {
                "textures\civ\veh\htb_mengo.jpg"
            }, "" },
            { "Palmeiras", "civ", {
                "textures\civ\veh\htb_palm.jpg"
            }, "" },
            { "RbsNoticias", "civ", {
                "textures\civ\veh\rbs.jpg"
            }, "" },
            { "SbtNoticias", "civ", {
                "textures\civ\veh\sbt.jpg"
            }, "" },
		      	{ "COP", "cop", {
                "textures\cop\veh\hatspo_cop.jpg"
            }, "" },
            { "Google", "civ", {
                "textures\civ\veh\google.jpg"
            }, "" }
        };
        desarmar = false;
    };

    class B_Quadbike_01_F {
        vItemSpace = 40;
        conditions = "license_civ_driver || {!(playerSide isEqualTo civilian)}";
        price = 5000;
        price_cop = 2000;
        price_samu = 1500;
        textures[] = {
            { "Digi Desert", "reb", {
                "\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa"
            }, "" },
            { "Black", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa"
            }, "" },
            { "Blue", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa"
            }, "" },
            { "Red", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa"
            }, "" },
            { "White", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa"
            }, "" },
            { "Digi Green", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa"
            }, "" },
            { "Hunter Camo", "civ", {
                "\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"
            }, "" },
            { "Rebel Camo", "reb", {
                "\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"
            }, "" },
		    { "Quad", "cop", {
                "textures\cop\veh\c_quad.jpg"
            }, "" }
        };
        desarmar = false;
    };

    class I_Truck_02_covered_F {
        vItemSpace = 500;
        conditions = "license_civ_trucking || {!(playerSide isEqualTo civilian)}";
        price = 500000;
        price_cop = 168000;
        price_samu = 126000;
        textures[] = {
            { "Orange", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            }, "" },
            { "Black", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            }, "" }
        };
        desarmar = false;
    };

    class I_Truck_02_transport_F {
        vItemSpace = 400;
        conditions = "license_civ_trucking || {!(playerSide isEqualTo civilian)}";
        price = 400000;
        price_cop = 112000;
        price_samu = 84000;
        textures[] = {
            { "Orange", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            }, "" },
            { "Black", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            }, "" }
        };
        desarmar = false;
    };

    class B_Truck_01_covered_F {
        vItemSpace = 600;
        conditions = "license_civ_trucking || {!(playerSide isEqualTo civilian)}";
        price = 600000;
        price_cop = 80000;
        price_samu = 60000;
        textures[] = {};
        desarmar = false;
    };

    class O_Truck_03_covered_F {
        vItemSpace = 800;
        conditions = "license_civ_trucking || {!(playerSide isEqualTo civilian)}";
        price = 800000;
        price_cop = 280000;
        price_samu = 210000;
        textures[] = {};
        desarmar = false;
    };

    class C_Offroad_02_unarmed_F {
        vItemSpace = 98;
        conditions = "license_civ_driver || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        price_cop = 44000;
        price_samu = 33000;
        textures[] = {
            { "Azul", "civ", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa",
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_blue_co.paa"
            }, "" },
            { "Verde", "civ", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa",
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_green_co.paa"
            }, "" },
            { "Laranja", "civ", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_orange_co.paa",
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_orange_co.paa"
            }, "" },
            { "Vermelho", "reb", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa",
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_red_co.paa"
            }, "" },
            { "Branco", "civ", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_white_co.paa",
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_white_co.paa"
            }, "" }
        };
        desarmar = false;
    };

    class C_Hatchback_01_F {
        vItemSpace = 60;
        conditions = "license_civ_driver || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        price_cop = 18000;
        price_samu = 13500;
        textures[] = {
            { "Beige", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa"
            }, "" },
            { "Green", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa"
            }, "" },
            { "Blue", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa"
            }, "" },
            { "Dark Blue", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa"
            }, "" },
            { "Yellow", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa"
            }, "" },
            { "White", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa"
            }, "" },
            { "Grey", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa"
            }, "" },
            { "Laranja Custom.", "civ", {
                "textures\civ\veh\laranjacustom.jpg"
            }, "" },
            { "Maconha", "civ", {
                "textures\civ\veh\weedhatch.jpg"
            }, "" },
            { "Black", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa"
            }, "" },
            { "Atletico Min.", "civ", {
                "textures\civ\veh\htb_atletc.jpg"
            }, "" },
            { "Corinthians", "civ", {
                "textures\civ\veh\htb_corint.jpg"
            }, "" },
            { "Atletico Min.", "civ", {
                "textures\civ\veh\htb_atletc.jpg"
            }, "" },
            { "Cruzeiro", "civ", {
                "textures\civ\veh\htb_cruz.jpg"
            }, "" },
            { "Gremio", "civ", {
                "textures\civ\veh\htb_gremio.jpg"
            }, "" },
            { "Internacional", "civ", {
                "textures\civ\veh\htb_inter.jpg"
            }, "" },
            { "Flamengo", "civ", {
                "textures\civ\veh\htb_mengo.jpg"
            }, "" },
            { "Palmeiras", "civ", {
                "textures\civ\veh\htb_palm.jpg"
            }, "" },
            { "RbsNoticias", "civ", {
                "textures\civ\veh\rbs.jpg"
            }, "" },
            { "SbtNoticias", "civ", {
                "textures\civ\veh\sbt.jpg"
            }, "" },
            { "Google", "civ", {
                "textures\civ\veh\google.jpg"
            }, "" },
            { "PM", "cop", {
                "textures\cop\veh\c_hatch.jpg"
            }, "" },
            { "Br Shooting", "civ", {
                "textures\civ\veh\hatch_brsh.jpg"
            }, "" }
        };
        desarmar = false;
    };

    class C_SUV_01_F {
        vItemSpace = 70;
        conditions = "license_civ_driver || {!(playerSide isEqualTo civilian)}";
        price = 65000;
        price_cop = 26000;
        price_samu = 19500;
        textures[] = {
            { "Dark Red", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"
            }, "" },
            { "Silver", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"
            }, "" },
            { "Orange", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"
            }, "" },
            { "GATE", "cop", {
                "textures\cop\veh\cop_suv.jpg"
            }, "" },
            { "RESGATE", "med", {
                "textures\resgate\veh\samu_suv.jpg"
            }, "" },
            { "Monster", "civ", {
                "textures\civ\veh\monstersuv.jpg"
            }, "" }
        };
        desarmar = false;
    };

    class C_Van_01_box_F {
        vItemSpace = 250;
        conditions = "license_civ_trucking || {!(playerSide isEqualTo civilian)}";
        price = 250000;
        price_cop = 67200;
        price_samu = 50400;
        textures[] = {
            { "Colombo", "civ", {
                "textures\civ\veh\van_colomboF.jpg",
                "textures\civ\veh\van_colomboB.jpg"
            }, "" },
            { "MagazineLuiza", "civ", {
                "textures\civ\veh\van_magazineF.jpg",
                "textures\civ\veh\van_magazineB.jpg"
            }, "" },
            { "PontoFrio", "civ", {
                "textures\civ\veh\van_pontoF.jpg",
                "textures\civ\veh\van_pontoB.jpg"
            }, "" }
        };
        desarmar = false;
    };

    class C_Van_01_transport_F {
        vItemSpace = 200;
        conditions = "license_civ_trucking || {!(playerSide isEqualTo civilian)}";
        price = 200000;
        price_cop = 80000;
        price_samu = 60000;
        textures[] = {};
        desarmar = false;
    };

    class C_Van_01_fuel_F {
        vItemSpace = 150;
        vFuelSpace = 19500;
        conditions = "license_civ_trucking || {!(playerSide isEqualTo civilian)}";
        price = 125000;
        price_cop = 125000;
        price_samu = 125000;
        textures[] = {};
        desarmar = false;
    };

    class B_Heli_Light_01_F {
        vItemSpace = 90;
        conditions = "license_civ_pilot || license_cop_cAir || license_med_mAir";
        price = 2500000;
        price_cop = 1750000;
        price_samu = 950000;
        textures[] = {
            { "Sheriff", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa"
            }, "" },
            { "Civ Blue", "civ", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"
            }, "" },
            { "Civ Red", "civ", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"
            }, "" },
            { "Blueline", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"
            }, "" },
            { "Elliptical", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"
            }, "" },
            { "Furious", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"
            }, "" },
            { "Jeans Blue", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"
            }, "" },
            { "Speedy Redline", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"
            }, "" },
            { "Sunset", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"
            }, "" },
            { "Vrana", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"
            }, "" },
            { "Waves Blue", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"
            }, "" },
            { "COP", "cop", {
                "textures\cop\veh\hbird_cop.jpg"
            }, "" }
        };
        desarmar = false;
    };

    class B_Heli_Light_01_armed_F {
        vItemSpace = 0;
        conditions = "license_cop_cAir";
        price = 300000;
        price_cop = 120000;
        price_samu = 90000;
        textures[] = {
			{ "COP", "cop", {
                "textures\cop\veh\hbird_cop.jpg"
            }, "" }
        };
        desarmar = false;
    };

    class C_Heli_Light_01_civil_F : B_Heli_Light_01_F {
        vItemSpace = 80;
        price = 2000000;
        price_cop = 1000000;
        price_samu = 500000;
        conditions = "license_civ_pilot || {!(playerSide isEqualTo civilian)}";
    };

    class C_Heli_light_01_red_F {
        vItemSpace = 90;
        conditions = "license_med_mAir";
        price = 245000;
        price_cop = 98000;
        price_samu = 73500;
        textures[] = {};
        desarmar = false;
    };

    class O_Heli_Light_02_unarmed_F {
        vItemSpace = 250;
        conditions = "license_civ_rebellic || license_civ_pilot || license_med_mAir || license_cop_cAir";
        price = 3200000;
        price_cop = 1600000;
        price_samu = 800000;
        textures[] = {
            { "RESGATE", "med", {
                "textures\resgate\veh\orca_samu.jpg"
            }, "" },
            { "Black", "cop", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa"
            }, "" },
            { "White / Blue", "civ", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"
            }, "" },
            { "Digi Green", "reb", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"
            }, "" },
            { "Desert Digi", "reb", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa"
            }, "" }
        };
        desarmar = false;
    };
};
