/* System Wide Stuff */
#define SYSTEM_TAG "cxp"
#define CASH bafTuirY_ncioe9f
#define BANK kniroNEKI0_yu
#define GANG_FUNDS group player getVariable ["gang_bank",0]

/*
    remoteExec Section
    When uncommented it enables proper testing via local testing
    Otherwise leave it commented out for "LIVE" servers
*/
//#define DEBUG 1

#ifdef DEBUG
#define RCLIENT 0
#else
#define RCLIENT -2
#endif

#define RSERV 2
#define RANY 0

//Scripting Macros
#define CONST(var1,var2) var1 = compileFinal (if (var2 isEqualType "") then {var2} else {str(var2)})
#define CONSTVAR(var) var = compileFinal (if (var isEqualType "") then {var} else {str(var)})
#define FETCH_CONST(var) (call var)
#define EXTSQL "extDB3" callExtension
#define EXTSQLCXP_STNG(TYPE,SETTING) TYPE(configFile >> "CfgServer" >> SETTING)
#define EXTSQLCXP_FAILED(MESSAGE) \
    cxp_server_extDB_notLoaded = [true,##MESSAGE]; \
    publicVariable "cxp_server_extDB_notLoaded"; \
    diag_log MESSAGE;

//Display Macros
#define CONTROL(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
#define CONTROL_DATA(ctrl) (lbData[ctrl,lbCurSel ctrl])
#define CONTROL_DATAI(ctrl,index) ctrl lbData index

//System Macros
#define LICENSE_VARNAME(varName,flag) format ["license_%1_%2",flag,M_CONFIG(getText,"Licenses",varName,"variable")]
#define LICENSE_VALUE(varName,flag) missionNamespace getVariable [LICENSE_VARNAME(varName,flag),false]
#define ITEM_VARNAME(varName) format ["%1_inv_%2",SYSTEM_TAG,M_CONFIG(getText,"VirtualItems",varName,"variable")]
#define ITEM_VALUE(varName) missionNamespace getVariable [ITEM_VARNAME(varName),0]
#define ITEM_ILLEGAL(varName) M_CONFIG(getNumber,"VirtualItems",varName,"illegal")
#define ITEM_SELLPRICE(varName) M_CONFIG(getNumber,"VirtualItems",varName,"sellPrice")
#define ITEM_BUYPRICE(varName) M_CONFIG(getNumber,"VirtualItems",varName,"buyPrice")
#define ITEM_NAME(varName) M_CONFIG(getText,"VirtualItems",varName,"displayName")
#define ITEM_ICON(varName) M_CONFIG(getText,"VirtualItems",varName,"icon")
#define ITEM_COOKED(varName) M_CONFIG(getText,"VirtualItems",varName,"cooked")
#define ITEM_WEIGHT(varName) M_CONFIG(getNumber,"VirtualItems",varName,"weight")
#define ITEM_VARPRICE(varName) M_CONFIG(getNumber,"VirtualItems",varName,"varPrice")
#define ITEM_MAXPRICE(varName) M_CONFIG(getNumber,"VirtualItems",varName,"maxPrice")
#define ITEM_MINPRICE(varName) M_CONFIG(getNumber,"VirtualItems",varName,"minPrice")
#define ITEM_FACTOR(varName) M_CONFIG(getNumber,"VirtualItems",varName,"factor")

//Condition Macros
#define KINDOF_ARRAY(a,b) [##a,##b] call {_veh = _this select 0;_types = _this select 1;_res = false; {if (_veh isKindOf _x) exitWith { _res = true };} forEach _types;_res}

//Config Macros
#define FETCH_CONFIG(TYPE,CFG,SECTION,CLASS,ENTRY) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY)
#define FETCH_CONFIG2(TYPE,CFG,CLASS,ENTRY) TYPE(configFile >> CFG >> CLASS >> ENTRY)
#define FETCH_CONFIG3(TYPE,CFG,SECTION,CLASS,ENTRY,SUB) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY >> SUB)
#define FETCH_CONFIG4(TYPE,CFG,SECTION,CLASS,ENTRY,SUB,SUB2) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY >> SUB >> SUB2)
#define M_CONFIG(TYPE,CFG,CLASS,ENTRY) TYPE(missionConfigFile >> CFG >> CLASS >> ENTRY)
#define BASE_CONFIG(CFG,CLASS) inheritsFrom(configFile >> CFG >> CLASS)
#define CXP_SETTINGS(TYPE,SETTING) TYPE(missionConfigFile >> "CxpBasic_Settings" >> SETTING)
#define BASEGANG_CFG(TYPE,SETTING) TYPE(missionConfigFile >> "BasesGang_cfg" >> SETTING)
#define CXP_CFG_CRAFT(TYPE,SETTING) TYPE(missionConfigFile >> "CxpCfgCraft" >> SETTING)

//UI Macros
#define CXP_Display (uiNamespace getVariable ["playerHUD",displayNull])
#define CXP_Ctrl(ctrl) ((uiNamespace getVariable ["playerHUD",displayNull]) displayCtrl ctrl)
