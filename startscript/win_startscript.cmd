@echo off

:: Made by Main Fighter [mainfighter.com]
:: Simple start script for SteamDB Cheat [https://github.com/SteamDatabase/SalienCheat]
:: Adapted from my https://github.com/MainFighter/salien-bot start script for use with this
:: v1.1.0 [23-06-2018]

::===============================================================================================================::

:Greeting

:: Calls configuration stuff
call configuration.cmd

echo Starting Sailen Bots

::===============================================================================================================::

:: Debug
if %debug%==true @echo on

:: Sets rootdir var to the currently directory of script
set rootdir=%~dp0

:: Clone botfiles
echo Downloading bot files
if %autodownloadbot%==true call :DownloadBotFiles
if %debug%==true pause

:: Update botfiles
echo Updating bot files
if %autoupdatebot%==true call :UpdateBotFiles
if %debug%==true pause

:: Start all bots in config
for %%a in ("instances\*.cmd") do call "%%a" & call :StartScript
if %debug%==true pause

::===============================================================================================================::

:Farewell

echo All bots started

exit

::===============================================================================================================::

:DownloadBotFiles

echo.
echo Downloading Bot Files

:: Sets the directory back to the root
cd "%rootdir%"

:: Checks if bot files don't already exist > if they don't creates folder > if they don't clones bot to directory
if not exist %botdir% ( mkdir %botdir% & git clone --quiet https://github.com/SteamDatabase/SalienCheat.git %botdir% & echo Bot files downloaded ) else ( echo Bot files already exist )

call :SetDefaults

goto :eof

::===============================================================================================================::

:UpdateBotFiles

echo.
echo Updating Bot Files

:: Sets the directory back to the root
cd "%rootdir%"

if exist %botdir% ( cd %botdir% & git pull --quiet & echo Bot files updated ) else ( echo Bot files don't exist )

call :SetDefaults

goto :eof

::===============================================================================================================::

:StartScript

echo.
echo %name% - Starting bot

:: Sets the directory back to the root
cd "%rootdir%"

:: Opens CMD Window > Sets title and color of window > Changes to dir > runs npm install if enabled > starts bot
set commandline="title Sailen Bot - %name% & color %color% & %phppath% %botpath% %token% & exit"
if %enabled%==true if %minimized%==true (start /min cmd /k  %commandline%) else (start cmd /k %commandline%)

call :SetDefaults

goto :eof

::===============================================================================================================::

:SetDefaults

:: Don't change these
set token=notconfigured
set enabled=false
set minimized=false
set name=untitled
set color=0C

goto :eof