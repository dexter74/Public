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
ECHO Menu 3 : MuseCore 3
ECHO Menu 4 : 
ECHO Menu 5 : 
ECHO Menu 6 : 
ECHO Menu 7 : 
ECHO Menu 8 : 
ECHO Menu 9 : 
ECHO Menu A : 
ECHO Menu B : 
ECHO Menu C : 
ECHO Menu D : 
ECHO Menu E : 
ECHO Menu F : 
ECHO Menu G : 
ECHO.
ECHO -------------- Divertissements -------------
ECHO.
ECHO Menu H : 
ECHO Menu I : 
ECHO Menu J : 
ECHO Menu K :  
ECHO Menu L : 
ECHO Menu M : 
ECHO Menu N : 
ECHO.
ECHO -------------- Packages ------------------
ECHO.
ECHO Menu O : 
ECHO Menu P : 
ECHO Menu Q : 
ECHO.
ECHO -------------- Special ------------------
ECHO.
ECHO Menu R : 
ECHO Menu S : 
ECHO Menu T :
ECHO Menu U : 
ECHO Menu V : 
ECHO Menu W : 
ECHO Menu X : 
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
IF %M%==h GOTO Fonction_H
IF %M%==i GOTO Fonction_I
IF %M%==j GOTO Fonction_J
IF %M%==k GOTO Fonction_K
IF %M%==l GOTO Fonction_L
IF %M%==m GOTO Fonction_M
IF %M%==n GOTO Fonction_N
IF %M%==o GOTO Fonction_O
IF %M%==p GOTO Fonction_P
IF %M%==q GOTO Fonction_Q
IF %M%==r GOTO Fonction_R
IF %M%==s GOTO Fonction_S
IF %M%==t GOTO Fonction_T
IF %M%==u GOTO Fonction_U
IF %M%==v GOTO Fonction_V
IF %M%==w GOTO Fonction_W
IF %M%==x GOTO Fonction_X
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
 choco install -y googlechrome
GOTO MENU

:Fonction_2
 choco install -y opera-gx
GOTO MENU

:Fonction_3
choco install -y musescore
GOTO MENU

:Fonction_4
GOTO MENU

:Fonction_5
GOTO MENU

:Fonction_6
GOTO MENU

:Fonction_7
GOTO MENU

:Fonction_8
GOTO MENU

:Fonction_9
GOTO MENU

:: --------------------------------------------------------------------

:Fonction_A
GOTO MENU

:Fonction_B
GOTO MENU

:Fonction_C
GOTO MENU

:Fonction_D
GOTO MENU

:Fonction_E
GOTO MENU

:Fonction_F
GOTO MENU

:Fonction_G
GOTO MENU

:Fonction_H
GOTO MENU

:Fonction_I
GOTO MENU

:Fonction_J
GOTO MENU

:Fonction_K
GOTO MENU

:Fonction_L
GOTO MENU

:Fonction_M
GOTO MENU

:Fonction_N
GOTO MENU

:Fonction_O
GOTO MENU

:Fonction_P
GOTO MENU

:Fonction_Q
GOTO MENU

:Fonction_R
GOTO MENU

:Fonction_S
GOTO MENU

:Fonction_T
GOTO MENU

:Fonction_U
GOTO MENU

:Fonction_V
GOTO MENU

:Fonction_W
GOTO MENU

:Fonction_X
GOTO MENU

:Fonction_Y
GOTO MENU

:Fonction_Z
exit
GOTO MENU

