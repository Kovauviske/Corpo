#define F(NAME,TARGET) class NAME { \
    allowedTargets = TARGET; \
};

#define JIP(NAME,TARGET) class NAME { \
    allowedTargets = TARGET; \
    jip = 1; \
};

#define ANYONE 0
#define CLIENT 1
#define SERVER 2
//#define HC CXP_HC

class CfgRemoteExec {
    class Functions {
        mode = 1;
        jip = 0;

        /* Bounty Hunter */
        F(cxp_fnc_setGroupTrackMarker,CLIENT)
        F(cxp_fnc_alvoKilled,CLIENT)
        F(cxp_fnc_wantedGetBounty,SERVER)
        F(cxp_fnc_wantedBountyCiv,SERVER)
        F(cxp_fnc_setBounty,ANYONE)
        F(cxp_fnc_removerBountyLic,ANYONE)
        F(cxp_fnc_updateBountyListLocal,ANYONE)
        F(cxp_fnc_checarGlobal,ANYONE)

        /* Funcoes Cliente CXP */
    	// cxp
		F(cxp_fnc_getOffmem,CLIENT)
        F(cxp_fnc_hintTggGZ,CLIENT)
        F(cxp_fnc_speedCamera,CLIENT)
        F(cxp_fnc_msgSafezone,CLIENT)
        F(cxp_fnc_receiveMoney,CLIENT)
        F(cxp_fnc_setupCellPhone,CLIENT)
    	F(cxp_fnc_moveInCargo,CLIENT)
    	F(cxp_fnc_tieing,CLIENT)
    	F(cxp_fnc_tieingb,CLIENT)
    	F(cxp_fnc_gagged,CLIENT)
        F(cxp_fnc_AAN,CLIENT)
        F(cxp_fnc_addVehicle2Chain,CLIENT)
        F(cxp_fnc_perdeuRabo,CLIENT)
        F(cxp_fnc_terminarCurarAnal,CLIENT)
        JIP(cxp_fnc_copLights,CLIENT)
        JIP(cxp_fnc_copSiren,CLIENT)
    	JIP(cxp_fnc_copSiren2,CLIENT)
		F(cxp_fnc_copSearch,CLIENT)
        F(cxp_fnc_gangCreated,CLIENT)
        F(cxp_fnc_gangDisbanded,CLIENT)
        F(cxp_fnc_gangInvite,CLIENT)
        F(cxp_fnc_garageRefund,CLIENT)
        F(cxp_fnc_giveDiff,CLIENT)
        F(cxp_fnc_impoundMenu,CLIENT)
        F(cxp_fnc_jail,CLIENT)
        F(cxp_fnc_jailMe,CLIENT)
        F(cxp_fnc_knockedOut,CLIENT)
        F(cxp_fnc_licenseCheck,CLIENT)
        F(cxp_fnc_licensesRead,CLIENT)
        F(cxp_fnc_lightHouse,CLIENT)
        JIP(cxp_fnc_mediclights,CLIENT)
        JIP(cxp_fnc_medicSiren,CLIENT)
        JIP(cxp_fnc_medicSiren2,CLIENT)
        F(cxp_fnc_moveIn,CLIENT)
        F(cxp_fnc_pickupItem,CLIENT)
        F(cxp_fnc_pickupMoney,CLIENT)
        F(cxp_fnc_receiveItem,CLIENT)
        F(cxp_fnc_removeLicenses,CLIENT)
        F(cxp_fnc_restrain,CLIENT)
        F(cxp_fnc_revived,CLIENT)
        F(cxp_fnc_robPerson,CLIENT)
        F(cxp_fnc_robReceive,CLIENT)
        F(cxp_fnc_searchClient,CLIENT)
        F(cxp_fnc_seizeClient,CLIENT)
        F(cxp_fnc_seizeClientMed,CLIENT)
        F(cxp_fnc_soundDevice,CLIENT)
        F(cxp_fnc_spikeStripEffect,CLIENT)
        F(cxp_fnc_ticketPaid,CLIENT)
        F(cxp_fnc_ticketPrompt,CLIENT)
        F(cxp_fnc_vehicleAnimate,CLIENT)
        F(cxp_fnc_wantedList,CLIENT)
        F(cxp_fnc_wireTransfer,CLIENT)
    	F(cxp_fnc_breathalyzer,CLIENT)
    	F(cxp_fnc_geradordeefeitos,CLIENT)
        F(cxp_fnc_multaAutomatica,CLIENT)
        F(cxp_fnc_calcMoneyRemote,CLIENT)
        F(cxp_fnc_vAHreciever,CLIENT)
        F(cxp_fnc_stopEscorting,CLIENT)
        F(cxp_fnc_custPlaySound,CLIENT)
        F(cxp_fnc_updateBaseLic,CLIENT)
        F(cxp_fnc_completeBugTracking,CLIENT)
        F(cxp_fnc_getNamesExUID,CLIENT)
        F(cxp_fnc_novoDonator,CLIENT)
        F(cxp_fnc_pickupAction,SERVER)
    	// CXPSKT
        F(CXPSKT_fnc_dataQuery,CLIENT)
        F(CXPSKT_fnc_insertPlayerInfo,CLIENT)
        F(CXPSKT_fnc_requestReceived,CLIENT)
        F(CXPSKT_fnc_updateRequest,CLIENT)
    	// CXPSV
        F(CXPSV_fnc_clientGangKick,CLIENT)
        F(CXPSV_fnc_clientGangLeader,CLIENT)
        F(CXPSV_fnc_clientGangLeft,CLIENT)
        F(CXPSV_fnc_clientGetKey,CLIENT)
        F(CXPSV_fnc_clientMessage,CLIENT)

        /* Funcoes Servidor CXP */
    	// BIS
        F(BIS_fnc_execVM,SERVER)
    	// CXPDB
        F(CXPDB_fnc_insertRequest,SERVER)
        F(CXPDB_fnc_queryRequest,SERVER)
        F(CXPDB_fnc_updatePartial,SERVER)
        F(CXPDB_fnc_updateRequest,SERVER)
        F(CXPDB_fnc_cellPhoneRequest,SERVER)
        F(CXPDB_fnc_saveCellPhone,SERVER)
        F(CXPDB_fnc_getRealTime,SERVER)
        F(CXPDB_fnc_insertDoadores,SERVER)
    	// cxp
        F(cxp_fnc_jailSys,SERVER)
        F(cxp_fnc_wantedAdd,SERVER)
        F(cxp_fnc_wantedBounty,SERVER)
        F(cxp_fnc_wantedCrimes,SERVER)
        F(cxp_fnc_wantedFetch,SERVER)
        F(cxp_fnc_wantedProfUpdate,SERVER)
        F(cxp_fnc_wantedRemove,SERVER)
    	// CXPSV
        F(CXPSV_fnc_addContainer,SERVER)
        F(CXPSV_fnc_addHouse,SERVER)
        F(CXPSV_fnc_chopShopSell,SERVER)
        F(CXPSV_fnc_cleanupRequest,SERVER)
        F(CXPSV_fnc_deleteDBContainer,SERVER)
        F(CXPSV_fnc_getVehicles,SERVER)
        F(CXPSV_fnc_insertGang,SERVER)
        F(CXPSV_fnc_keyManagement,SERVER)
        F(CXPSV_fnc_manageSC,SERVER)
        F(CXPSV_fnc_removeGang,SERVER)
        F(CXPSV_fnc_sellHouse,SERVER)
        F(CXPSV_fnc_sellHouseContainer,SERVER)
        F(CXPSV_fnc_spawnVehicle,SERVER)
        F(CXPSV_fnc_spikeStrip,SERVER)
        F(CXPSV_fnc_updateGang,SERVER)
        F(CXPSV_fnc_updateHouseContainers,SERVER)
        F(CXPSV_fnc_updateHouseTrunk,SERVER)
        F(CXPSV_fnc_vehicleCreate,SERVER)
        F(CXPSV_fnc_vehicleDelete,SERVER)
        F(CXPSV_fnc_vehicleStore,SERVER)
        F(CXPSV_fnc_vehicleUpdate,SERVER)
        F(CXPSV_fnc_handleBlastingCharge,SERVER)
        F(CXPSV_fnc_houseGarage,SERVER)
        F(CXPSV_fnc_insureCar,SERVER)
    	F(CXPSV_fnc_vAHupdate,SERVER)
    	F(CXPSV_fnc_vAHinit,SERVER)
    	F(CXPSV_fnc_adjustPrices,SERVER)
    	F(CXPSV_fnc_donoCartel,SERVER)
        F(CXPSV_fnc_addMorteListaSv,SERVER)
        F(CXPSV_fnc_rmMorteListaSv,SERVER)
        F(CXPSV_fnc_envListaClient,SERVER)
        F(CXPSV_fnc_baseGangueSet,SERVER)
        F(CXPSV_fnc_saveBugReported,SERVER)
        F(CXPSV_fnc_getNameByUID,SERVER)
        F(CXPSV_fnc_getOfflineMemb,SERVER)

        /* Funcoes HC CXP */
        /*
        F(CXPHC_fnc_addContainer,HC)
        F(CXPHC_fnc_addHouse,HC)
        F(CXPHC_fnc_chopShopSell,HC)
        F(CXPHC_fnc_deleteDBContainer,HC)
        F(CXPHC_fnc_getVehicles,HC)
        F(CXPHC_fnc_houseGarage,HC)
        F(CXPHC_fnc_insertGang,HC)
        F(CXPHC_fnc_insertRequest,HC)
        F(CXPHC_fnc_insertVehicle,HC)
        F(CXPHC_fnc_jailSys,HC)
        F(CXPHC_fnc_keyManagement,HC)
        F(CXPHC_fnc_queryRequest,HC)
        F(CXPHC_fnc_removeGang,HC)
        F(CXPHC_fnc_sellHouse,HC)
        F(CXPHC_fnc_sellHouseContainer,HC)
        F(CXPHC_fnc_spawnVehicle,HC)
        F(CXPHC_fnc_spikeStrip,HC)
        F(CXPHC_fnc_insureCar,HC)
        F(CXPHC_fnc_cellPhoneRequest,HC)
        F(CXPHC_fnc_saveCellPhone,HC)
        F(CXPHC_fnc_updateGang,HC)
        F(CXPHC_fnc_updateHouseContainers,HC)
        F(CXPHC_fnc_updateHouseTrunk,HC)
        F(CXPHC_fnc_updatePartial,HC)
        F(CXPHC_fnc_updateRequest,HC)
        F(CXPHC_fnc_vehicleCreate,HC)
        F(CXPHC_fnc_vehicleDelete,HC)
        F(CXPHC_fnc_vehicleStore,HC)
        F(CXPHC_fnc_vehicleUpdate,HC)
        F(CXPHC_fnc_wantedAdd,HC)
        F(CXPHC_fnc_wantedBounty,HC)
        F(CXPHC_fnc_wantedCrimes,HC)
        F(CXPHC_fnc_wantedFetch,HC)
        F(CXPHC_fnc_wantedProfUpdate,HC)
        F(CXPHC_fnc_wantedRemove,HC)*/

        /* Funcoes Globais (Cliente/Servidor) CXP */
    	// BIS
        F(BIS_fnc_effectKilledAirDestruction,ANYONE)
        F(BIS_fnc_effectKilledSecondaries,ANYONE)
        F(BIS_fnc_setTask,ANYONE)
        F(BIS_fnc_deletetask,ANYONE)
		F(BIS_fnc_holdActionAdd,ANYONE)
    	// cxp
    	F(cxp_fnc_animate,ANYONE)
        F(cxp_fnc_animSync,ANYONE)
    	F(cxp_fnc_animDynSync,ANYONE)
        F(cxp_fnc_broadcast,ANYONE)
        F(cxp_fnc_colorVehicle,ANYONE)
        F(cxp_fnc_corpse,ANYONE)
        F(cxp_fnc_demoChargeTimer,ANYONE)
        F(cxp_fnc_jumpFnc,ANYONE)
        F(cxp_fnc_lockVehicle,ANYONE)
        F(cxp_fnc_pulloutVeh,ANYONE)
        F(cxp_fnc_say3D,ANYONE)
        F(cxp_fnc_setFuel,ANYONE)
        F(cxp_fnc_simDisable,ANYONE)
        F(cxp_fnc_recebListClient,ANYONE)
        F(cxp_fnc_deleteClienteProx,ANYONE)
        F(cxp_fnc_pacienteAceito,ANYONE)
        F(cxp_fnc_rmCorpseArr,ANYONE)
        F(cxp_fnc_avisarPvpEntorno,ANYONE)
        F(cxp_fnc_showRRMessage,ANYONE)
		// CXPSV
		F(CXPSV_fnc_receiveClientFunct,ANYONE)
    };

    class Commands {
        mode = 1;
        jip = 0;

        F(addHandgunItem,ANYONE)
        F(addMagazine,ANYONE)
        F(addPrimaryWeaponItem,ANYONE)
        F(addWeapon,ANYONE)
        F(setFuel,ANYONE)
    };
};
