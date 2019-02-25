/*File: fn_drinkbeer.sqf author:[midgetgrimm] drinkypoo*/
closeDialog 0;
hint parseText format["Sua taxa de alcoolismo:<br/> <t size='1.4'><t color='#FF0000'>%1</t></t>",[cxp_drink] call cxp_fnc_numberText];
uiSleep 4;
"chromAbberation" ppEffectEnable true;
"radialBlur" ppEffectEnable true;
enableCamShake true;
player setVariable["inDrink",true,true];

for "_i" from 0 to 59 do
{
    if(cxp_drink > 0.8) then {

		"chromAberration" ppEffectAdjust[0.16,random 0.16, true];
		"chromAberration" ppEffectCommit 1;
		"radialBlur" ppEffectAdjust  [random 0.05,random 0.05,0.3,0.3];
		"radialBlur" ppEffectCommit 1;
		addcamShake[random 4, 2, random 4];
		uiSleep 1;
	} else {
		"chromAberration" ppEffectAdjust [random 0.05,random 0.05,true];
		"chromAberration" ppEffectCommit 1;
		"radialBlur" ppEffectAdjust  [random 0.03,random 0.03,0.4,0.4];
		"radialBlur" ppEffectCommit 1;
		addcamShake[random 3, 1, random 3];
		uiSleep 1;
	};
};
if (cxp_drink > 0.9) then {
	titleText [localize "STR_MISC_DrunkBlackOut","BLACK OUT"];
	player playMoveNow "Incapacitated";
	uiSleep 15;

	player playMoveNow "AinjPpneMstpSnonWrflDnon_rolltoback";
	uiSleep 10;
	cxp_drink = 0;
	titleText[localize "STR_MISC_DrunkBlackOut1","PLAIN"];
	player playMoveNow "amovppnemstpsraswrfldnon";
	[getPlayerUID player,profileName,"390"] remoteExec ["cxp_fnc_wantedAdd",false];
};
//Stop effects
player setVariable["inDrink",false,true];
"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
uiSleep 6;

//Deactivate ppEffects
//"chromAberration" ppEffectEnable false;
//"radialBlur" ppEffectEnable false;
resetCamShake;
if(cxp_drink != 0) then {cxp_drink = cxp_drink - 0.2;};