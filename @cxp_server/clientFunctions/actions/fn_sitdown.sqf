//////////////////////////////////////////////////////////////////////////
//                            Script Made By                            //
//                                MacRae                                //
//                        Modified by Casperento                        //
//////////////////////////////////////////////////////////////////////////
if (cxp_sitting) then{
    player switchMove "";
    cxp_sitting = false;
} else {
	[player,"Crew"] remoteExec ["cxp_fnc_animSync",-2];
    player setPos (getPos cursorTarget);
    player setDir ((getDir cursorTarget) - 180);
    player setpos [getpos player select 0, getpos player select 1,((getpos player select 2) +1)];
    cxp_sitting = true;
};