### How to use this

1. Install PHP (yes, really)
   1. Download https://windows.php.net/downloads/releases/php-7.2.7-nts-Win32-VC15-x64.zip
   2. Extract zip to `C:\php`
   3. Extract the contents of this script to the same folder 
2. Install and enable `curl` extension in PHP
   1. Open `php.ini-production` in a text editor
   2. Find `;extension=curl` and remove the semicolon
   3. Save as `php.ini`
3. Join https://steamcommunity.com/groups/SteamDB (needed to represent captures)
4. Grab `token` field (it looks like a hexadecimal string) from https://steamcommunity.com/saliengame/gettoken and put it in `token.txt` (replace all content there)
5. Run the script: `php cheat.php`