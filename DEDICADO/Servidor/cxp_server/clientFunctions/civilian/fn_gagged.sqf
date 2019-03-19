/*
    File: fn_gagged.sqf
    Author: Lowheartrate & Panda
    Modified : Casperento
*/
private _gagger = param [0,ObjNull,[ObjNull]];
hint format ["%1 colocou uma fita adesiva em sua boca para você ficar calado !", _gagger getVariable["realname",_gagger]];
titleText ["Voce esta com uma fita adesiva em sua boca, de agora em diante voce nao consegue falar !", "PLAIN"];
enableRadio false;
5 enableChannel false;
3 enableChannel false;
4 enableChannel false;
waitUntil {!(player getVariable ["gagged",false]) || !(player getVariable ["tied",false])};
hint format ["A fita adesiva foi removida, agora voce pode falar novamente !"];
titleText ["Agora você pode falar novamente !", "PLAIN"];
enableRadio true;
5 enableChannel true;
3 enableChannel true;
4 enableChannel true;