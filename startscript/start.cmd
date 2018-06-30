@echo off
cd "%~dp0"

:: Made by Main Fighter [mainfighter.com]
:: Start script for SteamDB's SailenCheat [https://github.com/SteamDatabase/SalienCheat]
:: Adapted from start script for meepen's sailen-bot [https://github.com/meepen/salien-bot]
:: v1.2.0 [24-06-2018]

::===============================================================================================================::

:Greeting

call configuration.cmd 
@echo %echo%

title Start script for SteamDB's SailenCheat
color %cmdcolor%

:: Checks
:: Git
git.exe --version >nul 2>nul 
if %autodownloadbot%==true if %autoupdatebot%==true if %errorlevel%==9009 ( set error=Git not found & set autodownloadbot=false & set autoupdatebot=false & start "" https://git-scm.com/ & call :ErrorScreen )

::===============================================================================================================::

:: Sets rootdir var to the currently directory of script
set rootdir=%~dp0

:: Kill running bots
if %killrunning%==true (
    color %cmdcolor%
    title Start script for SteamDB's SailenCheat - Kill Running Bots
    echo.
    echo Killing running bots
    echo.
    cd "%rootdir%"
    call :KillRunning
    if %debug%==true pause
    cls 
)

:: Clone botfiles
if %autodownloadbot%==true (
    color %cmdcolor%
    title Start script for SteamDB's SailenCheat - Download Files
    echo.
    echo Downloading bot files
    echo.
    cd "%rootdir%"
    call :DownloadBotFiles
    if %debug%==true pause
    cls
)

:: Checks if bot files exist, if they don't the script will throw fatal error
if not exist "%botdirectory%" ( 
    set error=%botdirectory% not found 
    set fatal=true
    
    if not exist "%botdirectory%\cheat.php" ( 
        set error2=%botdirectory%\cheat.php not found 
        set fatal=true 
    )
    
    call :ErrorScreen
    if %debug%==true pause
    cls
)

:: Update botfiles
if %autoupdatebot%==true (
    color %cmdcolor%
    title Start script for SteamDB's SailenCheat - Update Files
    echo.
    echo Updating bot files
    echo.
    cd "%rootdir%"
    call :UpdateBotFiles
    if %debug%==true pause
    cls
)

:: Start all bots in config
color %cmdcolor%
title Start script for SteamDB's SailenCheat - Start Bots
echo.
echo Starting bots
cd "%rootdir%"
for %%a in ("instances\*.cmd") do call :SetDefaults & cd "%rootdir%" & call "%%a" & call :StartScript
echo.
echo All bots started
if %debug%==true pause
cls

::===============================================================================================================::

:Farewell

exit

::===============================================================================================================::

:KillRunning

:: Actual script stuff
:: Should only kill Sailen Bot instances
:: Might improve later, only really adding it for myself
taskkill /f /im cmd.exe /fi "WINDOWTITLE eq Sailen Bot*" & taskkill /f /im node.exe /fi "WINDOWTITLE eq Sailen Bot*" & echo Bots killed

goto :eof

::===============================================================================================================::

:DownloadBotFiles

:: Actual script stuff
:: Checks to make sure botfiles doesn't already exist > if it doesn't it clones the bot files to the botfiles directory
if not exist "%botdirectory%" ( git clone --quiet https://github.com/SteamDatabase/SalienCheat.git "%botdirectory%" & echo Bot files downloaded ) else ( echo Bot files already exist )

goto :eof

::===============================================================================================================::

:UpdateBotFiles

:: Actual script stuff
:: Checks if botfiles exists > if it does then update botfiles using git
if exist "%botdirectory%" ( cd "%botdirectory%" & git pull --quiet & echo Bot files updated ) else ( echo Bot files don't exist )

goto :eof

::===============================================================================================================::

:StartScript

echo.

:: Probably not the best way to do it but it works
if %name%==untitled ( goto :eof )
if %enabled%==false ( echo %name% - Disabled & goto :eof )

echo %name% - Starting bot

:: Checks
:: Skips starting bot if base64token or no token file configured
if not defined token ( echo %name% - Token not configured & pause & goto :eof )

:: Actual script stuff
:: Opens CMD Window > Sets title and color of window > Changes to dir > starts bot
set commandline="title Sailen Bot - %name% & color %color% & cd %botdirectory% & %phppath% %botpath% %token% & if %debug%==true pause & exit"
if %minimized%==true (start /min cmd /k  %commandline%) else (start cmd /k %commandline%)

goto :eof

::===============================================================================================================::

:ErrorScreen

cls
color 47
if %fatal%==true ( title %name% - ERROR ) else ( title %name% - FATAL ERROR )
echo.
if %fatal%==true ( echo FATAL ERROR & echo %error% & if defined error2 echo %error2% ) else ( echo ERROR & echo %error% & if defined error2 echo %error2% )
echo.

pause
if %fatal%==true exit

set error=unknown
set error2=
set fatal=false

goto :eof

::===============================================================================================================::

:SetDefaults

:: Don't change these
set enabled=false
set token=
set botargs=
set minimized=false
set name=untitled
set color=0C

goto :eof