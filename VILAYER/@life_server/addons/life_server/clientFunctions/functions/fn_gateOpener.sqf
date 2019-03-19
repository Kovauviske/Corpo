/*
 Ouverture de porte automatique avec une Touche = O
 Modified CASPERENTO
*/

{
	if (_x animationPhase "Door_1_rot" isEqualTo 1) then {
		_x animate ["Door_1_rot", 0];
	}
	else
	{
		_x animate ["Door_1_rot", 1];
	};

} forEach (nearestObjects [player, ["Land_BarGate_F"], 20]);