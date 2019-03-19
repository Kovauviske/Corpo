#include "\life_server\script_macros.hpp"
/*
    File: fn_virt_sell.sqf
    Author: Bryan "Tonic" Boardwine

    Modified : Casperento

    Description:
    Sell a virtual item to the store / shop
*/
private _type = lbData[2402,(lbCurSel 2402)];
private _price = lbValue[2402,(lbCurSel 2402)];
if (_price isEqualTo -1) exitWith {};

private _amount = (ITEM_VALUE(_type));

//Anti-dupe
if ((time - cxp_action_delay) < 0.2) exitWith {hint localize "STR_NOTF_ActionDelay";};
cxp_action_delay = time;

_price = (_price * _amount);
private _name = M_CONFIG(getText,"VirtualItems",_type,"displayName");

/////////////////////// CARTEL //////////////////////////////
private _cartelBand = [11210.265,8717.957,0] nearestObject "Flag_Red_F"; // COCA, HERO, META
private _dono = _cartelBand getVariable ["gangOwner",grpNull];
////////////////////////////////////////////////////////////
private "_parcelaCartel";
if ([false,_type,_amount] call cxp_fnc_handleInv) then {
    if (_type in ["cocap","heroinp","methp"]) then {
        if (CXP_SETTINGS(getNumber,"parcela_cartel") isEqualTo 1) then {
            if !(isNull _dono) then {
                _parcelaCartel = _price * (CXP_SETTINGS(getNumber,"parcela_cartel_multi"));
                _price = _price - _parcelaCartel;
                CASH = CASH + _price;
                hint format["%3%4 (R$%5) da quantia total que você vendeu foi para o cartel que domina o mercado de drogas. Total ganho ao vender %2 droga(s): R$%1",[_price] call cxp_fnc_numberText,_amount,[((CXP_SETTINGS(getNumber,"parcela_cartel_multi"))*100)] call cxp_fnc_numberText,"%",[_parcelaCartel] call cxp_fnc_numberText];
                [_parcelaCartel] remoteExec ["CXPSV_fnc_donoCartel",RSERV];
            } else {
                CASH = CASH + _price;
                hint format [localize "STR_Shop_Virt_SellItem",_amount,(localize _name),[_price] call cxp_fnc_numberText];
            };
        } else {
            CASH = CASH + _price;
            hint format [localize "STR_Shop_Virt_SellItem",_amount,(localize _name),[_price] call cxp_fnc_numberText];
        };
    } else {
        hint format [localize "STR_Shop_Virt_SellItem",_amount,(localize _name),[_price] call cxp_fnc_numberText];
        CASH = CASH + _price;
    };
};

[true] call cxp_fnc_hudUpdate;
[0] call CXPSKT_fnc_updatePartial;
[] call cxp_fnc_virtupdate;
if ((CXP_SETTINGS(getNumber, "dynamic_market")) isEqualTo 1) then {[0,player,cxp_shop_type,_amount,_price,_type] remoteExec ["CXPSV_fnc_adjustPrices",RSERV];};

if (cxp_shop_type isEqualTo "drugdealer") then {
    private ["_array","_ind","_val"];
    _array = cxp_shop_npc getVariable ["sellers",[]];
    _ind = [getPlayerUID player,_array] call CXPSV_fnc_index;
    if (!(_ind isEqualTo -1)) then {
        _val = ((_array select _ind) select 2);
        _val = _val + _price;
        _array set[_ind,[getPlayerUID player,profileName,_val]];
        cxp_shop_npc setVariable ["sellers",_array,true];
    } else {
        _array pushBack [getPlayerUID player,profileName,_price];
        cxp_shop_npc setVariable ["sellers",_array,true];
    };
};

if (cxp_shop_type isEqualTo "gold" && (CXP_SETTINGS(getNumber,"noatm_timer")) > 0) then {
    [] spawn {
        cxp_use_atm = false;
        sleep ((CXP_SETTINGS(getNumber,"noatm_timer")) * 60);
        cxp_use_atm = true;
    };
};

[3] call CXPSKT_fnc_updatePartial;