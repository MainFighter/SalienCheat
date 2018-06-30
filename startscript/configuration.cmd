:: Global Configuration

:: Kill running bots
set killrunning=false

:: Path to PHP Executable
set phpdir=bin\php
set phppath=%phpdir%\php.exe

:: Path to actual cheat.php file
set botdir=botfiles
set botpath=%botdir%\cheat.php

:: Automatically downloads bot files using git
:: You need git for this to work https://git-scm.com/downloads
set autodownloadbot=true

:: Automatically updates bot files using git
:: You need git for this to work https://git-scm.com/downloads
set autoupdatebot=true

:: Script Customization
set cmdcolor=0A

:: Debug/Test - You probably won't need to use it
:: Turns echo on or off
set echo=off
:: Turns on any debug options, currently just adds pauses on most of the steps
set debug=false