#include "\life_server\script_macros.hpp"
/*
    File: fn_syncPrices.sqf
    Author: Derek Benson
    Modified: Casperento
    Description:
    refreshes the SQL database with the new sell prices
*/
[] call CXPSV_fnc_loadPrices;
for "_i" from 0 to 1 step 0 do {
    diag_log format["Sync prices at uptime: %1",round(time/60)];
    _market = missionNamespace getVariable "MarketPrices";

    if (isNil "_market") then {
        [] call CXPSV_fnc_loadPrices;
        _market = missionNamespace getVariable "MarketPrices";
    };

    _goods = [];

    {
        if ((_x select 1) != 0) then {
            _name = format["%1MarketGoodPrice",(_x select 0)];
            _price = missionNamespace getVariable _name;
            _goods pushBack [(_price select 0),(_price select 2)];
        };
    } forEach _market;

    {
        _name = (_x select 0);
        _price = (_x select 1);
        _query = format["UPDATE economy SET sellprice=%1 WHERE resource='%2'",_price,_name];
        [_query,1] call CXPDB_fnc_asyncCall;
    } forEach _goods;

    _endtime = (CXP_SETTINGS(getNumber,"end_time"));
    _diff = _endtime - time;
    _syncRate = (CXP_SETTINGS(getNumber,"sync_rate"));
    if (_diff > _syncRate || time > _endtime+5) then {
        sleep (_syncRate);
    } else {
        sleep (_diff - 5);
    };
};