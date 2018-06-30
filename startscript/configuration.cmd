:: Global Configuration

:: Kill running bots
set killrunning=false

:: Automatically downloads PHP and sets it up
set autodownloadphp=true

:: Automatically downloads bot files using git
:: You need git for this to work https://git-scm.com/downloads
set autodownloadbot=true

:: Automatically updates bot files using git
:: You need git for this to work https://git-scm.com/downloads
set autoupdatebot=true

:: Script Customization
set cmdcolor=0A

:: Paths
:: Just leave these alone if you don't know what you are doing
:: Bin directory
set bindir=bin
:: PHP directory
set phpdir=%bindir%\php
:: php.exe path
set phppath=%phpdir%\php.exe
:: Bot directory
set botdir=botfiles
:: cheat.php path
set botpath=%botdir%\cheat.php


:: Debug/Test - You probably won't need to use it
:: Turns echo on or off
set echo=off
:: Turns on any debug options, currently just adds pauses on most of the steps
set debug=false