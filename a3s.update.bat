@echo off
@rem http://media.steampowered.com/installer/steamcmd.zip
SETLOCAL ENABLEDELAYEDEXPANSION
	SET STEAMLOGIN=rlsvsteamlogin rlsvbstsvlinux
    SET A3serverBRANCH=233780 -beta
    SET A3serverPath=C:\a3server
    SET STEAMPATH=C:\steamCMD
echo.
echo     You are about to update ArmA 3 server
echo        Dir: %A3serverPath%
echo        Branch: %A3serverBRANCH%
echo.
echo     Key "ENTER" to proceed
pause
%STEAMPATH%\steamcmd.exe +login %STEAMLOGIN% +force_install_dir %A3serverPath% +"app_update %A3serverBRANCH%" validate +quit
echo .
echo     Your ArmA 3 server is now up to date
echo     key "ENTER" to exit
pause