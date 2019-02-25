@echo off
cd C:\Program Files (x86)\Steam\steamapps\common\Arma 3 Server\
:start
echo Iniciando servidor..
start "arma3" /wait /HIGH /affinity 30 "arma3server.exe" -port=2302 -malloc=tbbmalloc -loadmissiontomemory -autoInit -noPause -high "-config=C:\Program Files (x86)\Steam\steamapps\common\Arma 3 Server\SERVER\server.cfg" "-cfg=C:\Program Files (x86)\Steam\steamapps\common\Arma 3 Server\SERVER\network.cfg" "-profiles=C:\Program Files (x86)\Steam\steamapps\common\Arma 3 Server\SERVER" -name=SERVER -filePatching "-servermod=@extDB3;@cxp_server;@infiSTAR_A3;"
echo Servidor Offline...reiniciando...
goto start