/*
	File: fn_attachSmoke.sqf
	Author: John "Paratus" VanderZwet

	Modified : Casperento

*/
if (cxp_usingDroga) then {
    hint "Termine de usar seu cigarro antes de começar a usar outra coisa !";
}else{
	cxp_cigar_uses = cxp_cigar_uses + 1;
	cxp_usingDroga = true;
	_pe = "#particlesource" createVehicle (getpos player);
	_pe setParticleCircle [0, [0, 0, 0]];
	_pe setParticleRandom [2, [0.1, 0.1, 0], [0.05, 0.05, 0.3], 0.3, 0.25, [1, 1, 1, 1], 0, 0];
	_pe setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 1, 2, 8,0], "", "Billboard", 1, 3, [0, 0, 0], [0, 0, 0.5], 0, 10.1, 7.9, 0.01, [0.1, 0.1, 0.2], [[1,1,1,1], [1,1,1,1]], [0.3,0.2], 1, 0, "", "", nil];
	_pe setDropInterval 0.015;
	_pe attachTo [player,[0,0,0],"head"];
	sleep 240;
	detach _pe;
	deleteVehicle _pe;
	cxp_usingDroga = false;
	if (cxp_cigar_uses isEqualTo 15) then {[false,"cigarro",1] call cxp_fnc_handleInv;cxp_cigar_uses = 0;};
};