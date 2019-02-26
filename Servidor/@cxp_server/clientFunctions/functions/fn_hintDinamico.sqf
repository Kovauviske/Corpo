#include "\cxp_server\script_macros.hpp"
/*
  File : fn_hintDinamico.sqf
  Author : Casperento
  Description :
  Exibe mensagem customizada na tela do jogador
*/
params [
  ["_titulo","",[""]],
  ["_msg","",[""]],
  ["_tempo",0,[0]],
  ["_corMsg","",[""]],
  ["_align","center",[""]],
  ["_sizeTit",1.5,[0]]
];

if (_corMsg isEqualTo "azul")  exitWith {
  hint parseText format["<t color='#0d05f4' size='%4' shadow='1' align='center'>%1</t><t size='1' align='%3'>%2</t>",_titulo,_msg,_align,_sizeTit];
  sleep _tempo;
  hint "";
};

if (_corMsg isEqualTo "vermelho")  exitWith {
  hint parseText format["<t color='#f40505' size='%4' shadow='1' align='center'>%1</t><t size='1' align='%3'>%2</t>",_titulo,_msg,_align,_sizeTit];
  sleep _tempo;
  hint "";
};

if (_corMsg isEqualTo "amarelo")  exitWith {
  hint parseText format["<t color='#e6f405' size='%4' shadow='1' align='center'>%1</t><t size='1' align='%3'>%2</t>",_titulo,_msg,_align,_sizeTit];
  sleep _tempo;
  hint "";
};

if (_corMsg isEqualTo "verde")  exitWith {
  hint parseText format["<t color='#25f405' size='%4' shadow='1' align='center'>%1</t><t size='1' align='%3'>%2</t>",_titulo,_msg,_align,_sizeTit];
  sleep _tempo;
  hint "";
};

if (_corMsg isEqualTo "rosa")  exitWith {
  hint parseText format["<t color='#f405de' size='%4' shadow='1' align='center'>%1</t><t size='1' align='%3'>%2</t>",_titulo,_msg,_align,_sizeTit];
  sleep _tempo;
  hint "";
};

if (_corMsg isEqualTo "")  exitWith {
  hint parseText format["<t color='#ffffff' size='%4' shadow='1' align='center'>%1</t><t size='1' align='%3'>%2</t>",_titulo,_msg,_align,_sizeTit];
  sleep _tempo;
  hint "";
};
