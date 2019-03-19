#include "\life_server\script_macros.hpp"
/*
    File: fn_loadPrices.sqf
    Author: Derek Benson
    Modified: Casperento
    Description:
    Loads the SQL database into the economy variable: marketPrices and dynamically
    created variables for each good.

    Structure of each price variable
    0 - ressource
    1 - buyprice
    2 - sellprice
    3 - varprice
    4 - minprice
    5 - maxprice
    6 - factor shoptype
    7 - recent sell price
    8 - server start sell price
*/
private _marketPrices = [];
{
    _marketPrices pushBack [configName _x, getNumber(_x >> "factor")];
} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));

diag_log "Loading prices from the database...";
private _query = "SELECT resource, sellprice FROM economy";
private _queryResult = [_query,2,true] call CXPDB_fnc_asyncCall;

{
    _varName = _x select 0;
    _sellPrice = _x select 1;
    _name = format["%1MarketGoodPrice", _varName];
    _info = [_varName,ITEM_BUYPRICE(_varName),_sellPrice,ITEM_VARPRICE(_varName),ITEM_MINPRICE(_varName),ITEM_MAXPRICE(_varName),ITEM_FACTOR(_varName),_sellPrice,_sellPrice];
    missionNamespace setVariable [_name, _info];
    publicVariable _name;
} forEach _queryResult;

missionNamespace setVariable ["MarketPrices", _marketPrices];
publicVariable "MarketPrices";