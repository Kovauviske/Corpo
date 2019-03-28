/*
*    Format:
*        3: STRING (Conditions) - Must return boolean :
*            String can contain any amount of conditions, aslong as the entire
*            string returns a boolean. This allows you to check any levels, licenses etc,
*            in any combination. For example:
*                "call cxp_coplevel && license_civ_someLicense"
*            This will also let you call any other function.
*
*/
class CfgSpawnPoints {

    class Altis {
        class Civilian {
            class Kavala {
                displayName = "Kavala";
                spawnMarker = "civ_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };

            class Athira {
                displayName = "Athira";
                spawnMarker = "civ_spawn_3";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };

            class Pyrgos {
                displayName = "Pyrgos";
                spawnMarker = "civ_spawn_2";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };

            class Sofia {
                displayName = "Sofia";
                spawnMarker = "civ_spawn_4";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };

            class RebelN {
                displayName = $STR_MAR_Rebel_North;
                spawnMarker = "sp_reb_BC_N";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "license_civ_rebellic";
            };

            class RebelS {
                displayName = $STR_MAR_Rebel_South;
                spawnMarker = "sp_reb_BC_S";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "license_civ_rebellic";
            };

            class spGangP1 {
                displayName = "Base de Gangue 1";
                spawnMarker = "sp_gangP1";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "license_civ_josTrex";
            };

            class spGangP2 {
                displayName = "Base de Gangue 2";
                spawnMarker = "sp_gangP2";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "license_civ_dxcTrex";
            };

            class spGangP3 {
                displayName = "Base de Gangue 3";
                spawnMarker = "sp_gangP3";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "license_civ_pbTrex";
            };

            class spGangP4 {
                displayName = "Base de Gangue 4";
                spawnMarker = "sp_gangP4";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "license_civ_s1dTrex";
            };

            class spGangP5 {
                displayName = "Base de Gangue 5";
                spawnMarker = "sp_gangP5";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "license_civ_o2dTrex";
            };

            class spGangP6 {
                displayName = "Base de Gangue 6";
                spawnMarker = "sp_gangP6";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "license_civ_b1dTrex";
            };

            class spGangP7 {
                displayName = "Base de Gangue 7";
                spawnMarker = "sp_gangP7";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "license_civ_lynxTrex";
            };

            class spGangP8 {
                displayName = "Base de Gangue 8";
                spawnMarker = "sp_gangP8";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "license_civ_tyxTrex8i";
            };

            class spGangP9 {
                displayName = "Base de Gangue 9";
                spawnMarker = "sp_gangP9";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "license_civ_josTrexton";
            };

            class spGangP10 {
                displayName = "Base de Gangue 10";
                spawnMarker = "sp_gangP10";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "license_civ_uipTrexy";
            };

			class spGangP11 {
                displayName = "Base de Gangue 11";
                spawnMarker = "sp_gangP11"; // Variable Name (Marcador Empty)
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "license_civ_bdsctn";
            };

			class spGangP12 {
                displayName = "Base de Gangue 12";
                spawnMarker = "sp_gangP12";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "license_civ_ctnseg";
            };

			class spGangP13 {
                displayName = "Base de Gangue 13";
                spawnMarker = "sp_gangP13";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "license_civ_bdcpter";
            };

			class spGangP14 {
                displayName = "Base de Gangue 14";
                spawnMarker = "sp_gangP14";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "license_civ_dsqrt";
            };

			class spGangP15 {
                displayName = "Base de Gangue 15";
                spawnMarker = "sp_gangP15";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "license_civ_dbcapqnt";
            };

        };

        class Cop {

            class Athira {
                displayName = "Batalhão Central";
                spawnMarker = "cop_spawn_3";
                icon = "\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa";
                conditions = "";
            };

        };

        class Medic {
            class Kavala {
                displayName = "Bombeiro Batalhão";
                spawnMarker = "medic_spawn_3";
                icon = "icons\logo_supMed.paa";
                conditions = "";
            };
        };
    };

    class Tanoa {

        class Civilian {
            class Georgetown {
                displayName = "Georgetown";
                spawnMarker = "civ_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "!license_civ_rebel";
            };

            class Balavu {
                displayName = "Balavu";
                spawnMarker = "civ_spawn_3";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };

            class Tuvanaka {
                displayName = "Tuvanaka";
                spawnMarker = "civ_spawn_2";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };

            class Lijnhaven {
                displayName = "Lijnhaven";
                spawnMarker = "civ_spawn_4";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };

            class RebelNW {
                displayName = $STR_MAR_Rebel_North;
                spawnMarker = "Rebelop";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "license_civ_rebel";
            };

            class RebelS {
                displayName = $STR_MAR_Rebel_South;
                spawnMarker = "Rebelop_1";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "license_civ_rebel";
            };

            class RebelNE {
                displayName = $STR_MAR_Rebel_North;
                spawnMarker = "Rebelop_2";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "license_civ_rebel";
            };
        };

        class Cop {


            class SWAirport {
                displayName = $STR_SP_Cop_Air_SW;
                spawnMarker = "cop_spawn_3";
                icon = "\a3\ui_f\data\map\MapControl\fuelstation_ca.paa";
                conditions = "";
            };

        };

        class Medic {

            class SEHospital {
                displayName = $STR_SP_EMS_SE;
                spawnMarker = "medic_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };

            class TanoukaHospital {
                displayName = $STR_SP_EMS_Tan;
                spawnMarker = "medic_spawn_2";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };

            class NEAirportHospital {
                displayName = $STR_SP_EMS_NEair;
                spawnMarker = "medic_spawn_3";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };

        };

    };

};
