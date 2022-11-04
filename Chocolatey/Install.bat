@ECHO off

:: Nettoyage de la Console
cls

:: Fonction Menu
:MENU

:: ECHO.
ECHO -------------- Utilitaires --------------
ECHO.
ECHO Menu 0 : Chocolatey
ECHO Menu 1 : Google Chrome
ECHO Menu 2 : Opera GX
ECHO Menu 3 : MuseScore 3
ECHO Menu 4 : Microsoft Teams
ECHO Menu 5 : Anydesk
ECHO Menu 6 : Steam
ECHO Menu 7 : Teamspeak 3
ECHO Menu 8 : Nvidia Geforce Now
ECHO Menu 9 : Origin
ECHO Menu A : Hamachi Logmein
ECHO Menu B : Epic Games
ECHO Menu C : Discord
ECHO Menu D : 7zip
ECHO Menu E : Ubisoft Connect
ECHO Menu F : Autoruns
ECHO Menu G : Custom Menu Démarré
:: ECHO.
:: ECHO -------------- Divertissements -------------
:: ECHO.
:: ECHO Menu H : 
:: ECHO Menu I : 
:: ECHO Menu J : 
:: ECHO Menu K :  
:: ECHO Menu L : 
:: ECHO Menu M : 
:: ECHO Menu N : 
:: ECHO.
:: ECHO -------------- Packages ------------------
:: ECHO.
:: ECHO Menu O : 
:: ECHO Menu P : 
:: ECHO Menu Q : 
:: ECHO.
:: ECHO -------------- Special ------------------
:: ECHO.
:: ECHO Menu R : 
:: ECHO Menu S : 
:: ECHO Menu T :
:: ECHO Menu U : 
:: ECHO Menu V : 
:: ECHO Menu W : 
:: ECHO Menu X : 
ECHO Menu Y :
ECHO Menu Z : Quitter
ECHO.
ECHO -------------------------------------------
ECHO.
ECHO.

:: Phrase de choix
SET /P M=Taper la commande de votre choix  (Z:quitter) 

:: Menu
IF %M%==0 GOTO Fonction_0 
IF %M%==1 GOTO Fonction_1
IF %M%==2 GOTO Fonction_2
IF %M%==3 GOTO Fonction_3
IF %M%==4 GOTO Fonction_4
IF %M%==5 GOTO Fonction_5
IF %M%==6 GOTO Fonction_6
IF %M%==7 GOTO Fonction_7
IF %M%==8 GOTO Fonction_8
IF %M%==9 GOTO Fonction_9
IF %M%==a GOTO Fonction_A
IF %M%==b GOTO Fonction_B
IF %M%==c GOTO Fonction_C
IF %M%==d GOTO Fonction_D
IF %M%==e GOTO Fonction_E
IF %M%==f GOTO Fonction_F
IF %M%==g GOTO Fonction_G
:: IF %M%==h GOTO Fonction_H
:: IF %M%==i GOTO Fonction_I
:: IF %M%==j GOTO Fonction_J
:: IF %M%==k GOTO Fonction_K
:: IF %M%==l GOTO Fonction_L
:: IF %M%==m GOTO Fonction_M
:: IF %M%==n GOTO Fonction_N
:: IF %M%==o GOTO Fonction_O
:: IF %M%==p GOTO Fonction_P
:: IF %M%==r GOTO Fonction_R
:: IF %M%==s GOTO Fonction_S
:: IF %M%==t GOTO Fonction_T
:: IF %M%==u GOTO Fonction_U
:: IF %M%==v GOTO Fonction_V
:: IF %M%==w GOTO Fonction_W
:: IF %M%==x GOTO Fonction_X
IF %M%==y GOTO Fonction_Y
IF %M%==z GOTO Fonction_Z
IF %M%==q GOTO EOF


:Fonction_0
	cls
	:: Installation de chocolatey
	@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

	:: Desactiver confirmation installation
	choco feature enable -n=allowGlobalConfirmation

	:: Installation de la GUI
	choco install chocolateygui -y

	:: Installation du script purge du cache Chocolatey
	choco install choco-cleaner -y
GOTO MENU


:Fonction_1
	cls
	 choco install -y googlechrome
GOTO MENU


:Fonction_2
	cls
	 choco install -y opera-gx
GOTO MENU


:Fonction_3
	cls
	choco install -y musescore
GOTO MENU


:Fonction_4
	cls
	choco install -y microsoft-teams
GOTO MENU


:Fonction_5
	cls
	choco install -y anydesk
GOTO MENU


:Fonction_6
	cls
	choco install -y steam
GOTO MENU

:Fonction_7
	cls
	choco install -y teamspeak
GOTO MENU

:Fonction_8
	cls
	choco install -y --ignore-checksums nvidia-geforce-now
GOTO MENU

:Fonction_9
	cls
	choco install -y origin
GOTO MENU

:: --------------------------------------------------------------------

:Fonction_A
	cls
	choco install -y hamachi
GOTO MENU


:Fonction_B
	cls
	choco install -y epicgameslauncher
GOTO MENU

:Fonction_C
	cls
	choco install -y discord
GOTO MENU


:Fonction_D
	cls
	choco install -y 7zip.install
GOTO MENU


:Fonction_E
	cls
	choco install -y ubisoft-connect
GOTO MENU

:Fonction_F
	cls
	choco install autoruns -y --ignore-checksum
GOTO MENU

:Fonction_G
	cls
	
GOTO MENU

:Fonction_H
	cls
GOTO MENU

:Fonction_I
	cls
GOTO MENU

:Fonction_J
	cls
GOTO MENU

:Fonction_K
	cls
GOTO MENU

:Fonction_L
	cls
GOTO MENU

:Fonction_M
	cls
GOTO MENU

:Fonction_N
	cls
GOTO MENU

:Fonction_O
	cls
GOTO MENU

:Fonction_P
	cls
GOTO MENU

:: Ne pas attribuer la fonction Q
:Fonction_Q
cls
GOTO MENU

:Fonction_R
	cls
GOTO MENU

:Fonction_S
	cls
GOTO MENU

:Fonction_T
	cls
GOTO MENU

:Fonction_U
	cls
GOTO MENU

:Fonction_V
	cls
GOTO MENU

:Fonction_W
	cls
GOTO MENU

:Fonction_X
	cls
GOTO MENU

:Fonction_Y
	cls
	:: #########################################################################################################################################
	set START_MENU=C:\ProgramData\Microsoft\Windows\Start Menu\Programs
	set START_MENU2=C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\
	:: #########################################################################################################################################
	mkdir "%START_MENU%\Logiciels"
	mkdir "%START_MENU%\Microsoft Office 2016"
	mkdir "%START_MENU%\Jeux"
	:: #########################################################################################################################################
	move "%START_MENU%\AMD Software꞉ Adrenalin Edition\AMD Software꞉ Adrenalin Edition.lnk" "%START_MENU%\Logiciels"
	move "%START_MENU%\Access*.lnk"                               "%START_MENU%\Microsoft Office 2016"
	move "%START_MENU%\Access.lnk"                                "%START_MENU%\Microsoft Office 2016"
	move "%START_MENU%\Excel*.lnk"                                "%START_MENU%\Microsoft Office 2016"
	move "%START_MENU%\OneNote*.lnk"                              "%START_MENU%\Microsoft Office 2016"
	move "%START_MENU%\Outlook*.lnk"                              "%START_MENU%\Microsoft Office 2016"
	move "%START_MENU%\Powerpoint*.lnk"                           "%START_MENU%\Microsoft Office 2016"
	move "%START_MENU%\Publisher*.lnk"                            "%START_MENU%\Microsoft Office 2016"
	move "%START_MENU%\Skype Entreprise*.lnk"                     "%START_MENU%\Microsoft Office 2016"
	move "%START_MENU%\Word*.lnk"                                 "%START_MENU%\Microsoft Office 2016"
	move "%START_MENU%\ASUS\AI Suite 3\AI Suite 3.lnk"            "%START_MENU%\Logiciels"
	move "%START_MENU%\7-Zip\7-Zip File Manager.lnk"              "%START_MENU%\Logiciels"
	move "%START_MENU%\Acronis"    				      "%START_MENU%\Logiciels"
	move "%START_MENU%\Autoruns.lnk"                              "%START_MENU%\Logiciels"
	move "%START_MENU%\Battle.net\Battle.net.lnk"                 "%START_MENU%\Jeux"
	move "%START_MENU%\CPUID\ASUS CPU-Z\ASUS CPU-Z.lnk"           "%START_MENU%\Logiciels"
	move "%START_MENU%\Chocolatey Cleaner.lnk"                    "%START_MENU%\Logiciels"
	move "%START_MENU%\Chocolatey GUI.lnk"                        "%START_MENU%\Logiciels"
	move "%START_MENU%\Epic Games Launcher.lnk"                   "%START_MENU%\Jeux"
	move "%START_MENU%\Microsoft Edge.lnk" 			      "%START_MENU%\Logiciels"
	move "%START_MENU%\MPC-HC x64\MPC-HC x64.lnk"                 "%START_MENU%\Logiciels"
	move "%START_MENU%\mRemoteNG\mRemoteNG.lnk"                   "%START_MENU%\Logiciels"
	move "%START_MENU%\Notepad++.lnk"                             "%START_MENU%\Logiciels"
	move "%START_MENU%\Oracle VM VirtualBox\Oracle VM VirtualBox.lnk"  "%START_MENU%\Logiciels"
	move "%START_MENU%\qBittorrent\qBittorrent.lnk"               "%START_MENU%\Logiciels"
	move "%START_MENU%\Roberts Space Industries\RSI Launcher.lnk" "%START_MENU%\Jeux"
	move "%START_MENU%\World of Warcraft\World of Warcraft.lnk"   "%START_MENU%\Jeux"
	move "%START_MENU%\Riot Games\Client Riot.lnk"                "%START_MENU%\Jeux"
	move "%START_MENU%\Google Chrome.lnk"			      "%START_MENU%\Logiciels"
	move "%START_MENU%\Navigateur Opera GX.lnk"                   "%START_MENU%\Logiciels"
	move "%START_MENU%\Origin.lnk"                                "%START_MENU%\Jeux"
	move "%START_MENU%\TeamSpeak 3 Client.lnk"                    "%START_MENU%\Logiciels"
	move "%START_MENU%\LogMeIn Hamachi\LogMeIn Hamachi.lnk"       "%START_MENU%\Logiciels"
	:: #########################################################################################################################################
	move "%START_MENU2%\Bitwarden.lnk"                            "%START_MENU%\Logiciels"
	move "%START_MENU2%\CrystalDiskInfo.lnk"                      "%START_MENU%\Logiciels"
	move "%START_MENU2%\Discord Inc\Discord.lnk"                  "%START_MENU%\Jeux"
	move "%START_MENU2%\Molotov\Molotov.lnk"                      "%START_MENU%\Logiciels"
	move "%START_MENU2%\Microsoft Teams.lnk"                      "%START_MENU%\Logiciels"
	move "%START_MENU2%\Oracle VM VirtualBox Guest Additions"     "%START_MENU%\Logiciels"
	move "%START_MENU2%\Overwolf\Overwolf.lnk"                    "%START_MENU%\Jeux"
	move "%START_MENU2%\Overwolf\Porofessor.gg.lnk"               "%START_MENU%\Jeux"
	move "%START_MENU2%\Steam\Steam.lnk"                          "%START_MENU%\Jeux"
	move "%START_MENU2%\WinDirStat\WinDirStat.lnk"                "%START_MENU%\Logiciels"
	move "%START_MENU2%\GitHub, Inc\GitHub Desktop.lnk"           "%START_MENU%\Logiciels"
	move "%START_MENU2%\MuseScore 3\MuseScore 3.lnk"              "%START_MENU%\Logiciels"
	move "%START_MENU2%\NVIDIA GeForce NOW.lnk"                   "%START_MENU%\Logiciels"
	move "%START_MENU2%\OneDrive.lnk"                             "%START_MENU%\Logiciels"
	move "%START_MENU2%\Ubisoft\Ubisoft Connect\Ubisoft Connect.lnk" "%START_MENU%\Jeux"
	:: #########################################################################################################################################
	rmdir /Q /S "%START_MENU%\7-Zip"
	rmdir /Q /S "%START_MENU%\AMD Bug Report Tool"
	rmdir /Q /S "%START_MENU%\AMD Software꞉ Adrenalin Edition"
	rmdir /Q /S "%START_MENU%\ASUS\"
	rmdir /Q /S "%START_MENU%\Burning Crusade Classic"
	rmdir /Q /S "%START_MENU%\Battle.net"
	rmdir /Q /S "%START_MENU%\CPUID"
	rmdir /Q /S "%START_MENU%\MPC-HC x64"
	rmdir /Q /S "%START_MENU2%\GitHub, Inc"
	rmdir /Q /S "%START_MENU%\mRemoteNG"
	rmdir /Q /S "%START_MENU%\qBittorrent"
	rmdir /Q /S "%START_MENU%\StarCraft II"
	rmdir /Q /S "%START_MENU%\Steam"
	rmdir /Q /S "%START_MENU2%\Discord Inc"
	rmdir /Q /S "%START_MENU2%\Molotov"
	rmdir /Q /S "%START_MENU%\Riot Games\
	rmdir /Q /S "%START_MENU2%\WinDirStat"
	rmdir /Q /S "%START_MENU%\World of Warcraft"
	rmdir /Q /S "%START_MENU%\Oracle VM VirtualBox\"
	rmdir /Q /S "%START_MENU2%\Overwolf"
	rmdir /Q /S "%START_MENU%\Roberts Space Industries"
	rmdir /Q /S "%START_MENU2%\Steam"
	rmdir /Q /S "%START_MENU2%\Riot Games"
	rmdir /Q /S "%START_MENU%\LogMeIn Hamachi"
	rmdir /Q /S "%START_MENU2%\MuseScore 3\"
	rmdir /Q /S "%START_MENU2%\Ubisoft\"
	
GOTO MENU

:Fonction_Z
	exit
GOTO MENU

