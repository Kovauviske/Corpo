/*
	Author: Maximum
	Description: Placeables for the cop\medic sides.
	Disclaimer: Don't be a asshole and pass this off as your own or become a KAI and sell it for profit, Im releasing this for FREE... Credits: Killerty69 for a second pare of eyes when mine got to sleepy
	P.S. - Don't be a faggot like i know some of you all will be.
*/
disableSerialization;
if (!cxp_barrier_active) exitWith {};
if (cxp_barrier_activeObj isEqualTo ObjNull) exitWith {};

_currentPos = getPosATL cxp_barrier_activeObj;
detach cxp_barrier_activeObj;
cxp_barrier_activeObj setPos[(getPos cxp_barrier_activeObj select 0), (getPos cxp_barrier_activeObj select 1), 0];
cxp_barrier_activeObj enableSimulationGlobal true;
cxp_bar_placey pushBack cxp_barrier_activeObj;
cxp_barrier_active = false;
cxp_barrier_activeObj = ObjNull;