// thanks for Tonic and all of his stuff
class DefaultEventhandlers;
class CfgPatches {
    class cxp_server {
        units[] = {"C_man_1"};
        weapons[] = {};
        requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
        fileName = "cxp_server.pbo";
        author = "Tonic";
    };
};

class CfgServer {
    DatabaseName = "cxpdb"; //Config name that'll be grep in the extdb-conf.ini. Default: [altislife]
    DebugMode = 0; //Enable many server/hc debugging logs. Default: 0 (1 = Enabled / 0 = Disabled)
    HeadlessSupport = 0; //Enable/Disable Headless client support. Default: 1 (1 = Enabled / 0 = Disabled)
	SupportSqlCustom = 0; //Ativar o filtro de consultas SQL customizadas (Em Desenvolvimento: 0-> desliga, 1-> liga)
};

class CfgFunctions {
    class cxp_SQL_Database {
        tag = "CXPDB";

        class MySQL {
            file = "\life_server\serverFunctions\MySQL";
            class numberSafe {};
            class mresArray {};
            class queryRequest {};
            class asyncCall {};
            class insertRequest {};
            class updateRequest {};
            class mresToArray {};
            class insertVehicle {};
            class bool {};
            class mresString {};
            class updatePartial {};
            class cellPhoneRequest {};
			class saveCellPhone {};
			class getRealTime {};
			class insertDoadores {};
        };
    };

    class Cxp_System {
        tag = "cxp";
		
		class Client_Functions {
			file = "\life_server\clientFunctions";
			class initClientFunct {preInit=1;};
		};

        class Wanted_Sys {
            file = "\life_server\serverFunctions\WantedSystem";
            class wantedFetch {};
            class wantedPerson {};
            class wantedBounty {};
            class wantedRemove {};
            class wantedAdd {};
            class wantedCrimes {};
            class wantedProfUpdate {};
        };

        class Jail_Sys {
            file = "\life_server\serverFunctions\Jail";
            class jailSys {};
      		class jailTimer {};
      		class jailPlayer {};
        };

        class BountyHunter {
            file = "\life_server\serverFunctions\bounty";
            class checarGlobal {};
            class wantedGetBounty {};
            class wantedBountyCiv {};
        };
    };

    class CXPSV_System {
      tag = "CXPSV";

		class Systems {
			file = "\life_server\serverFunctions\Systems";
			class isUIDActive {};
			class managesc {};
			class cleanup {};
			class huntingZone {};
			class vehicleCreate {};
			class spawnVehicle {};
			class getVehicles {};
			class vehicleStore {};
			class vehicleDelete {};
			class spikeStrip {};
			class transferOwnership {};
			class federalUpdate {};
			class chopShopSell {};
			class clientConnect {};
			class clientDisconnect {};
			class cleanupRequest {};
			class keyManagement {};
			class vehicleUpdate {};
			class recupkeyforHC {};
			class handleBlastingCharge {};
			class terrainSort {};
			class insureCar {};
			class entityRespawned {};
			class saveBugReported {};
			class initDeadListServer {};
			class addMorteListaSv {};
			class rmMorteListaSv {};
			class cleanerListaSv {};
			class envListaClient {};
			class initGbSysDntServer {};
			class persistGbSysDntServer {};
		};

		class Housing {
			file = "\life_server\serverFunctions\Housing";
			class addHouse {};
			class addContainer {};
			class deleteDBContainer {};
			class fetchPlayerHouses {};
			class initHouses {};
			class sellHouse {};
			class sellHouseContainer {};
			class updateHouseContainers {};
			class updateHouseTrunk {};
			class houseCleanup {};
			class houseGarage {};
		};

		class Economy {
			file = "\life_server\serverFunctions\Economy";
			class adjustPrices {};
			class loadPrices {};
			class syncPrices {};
		};

		class Gangs {
			file = "\life_server\serverFunctions\Gangs";
			class insertGang {};
			class queryPlayerGang {};
			class removeGang {};
			class updateGang {};
			class parcelaCartel {};
			class donoCartel {};
			class baseGangueSet {};
			class getNameByUID {};
			class getOfflineMemb {};
		};

		class PlayTime {
			file = "\life_server\serverFunctions\PlayTime";
			class setPlayTime {};
			class getPlayTime {};
		};

  		class vAH {
  			file = "\life_server\serverFunctions\vAH";
  			class vAH_init {};
  			class vAH_update {};
  		};
    };
};

class CfgVehicles {
    class Car_F;
    class CAManBase;
    class Civilian;
    class Civilian_F : Civilian {
        class EventHandlers;
    };

    class C_man_1 : Civilian_F {
        class EventHandlers: EventHandlers {
            init = "(_this select 0) execVM ""\life_server\fix_headgear.sqf""";
        };
    };
};
