@echo off
title Windows XP Theme Installer by: Kaleb Klein
color 17
:title
cls
echo.
echo.--------------------------
echo Windows XP Theme Installer
echo   (C) 2011 Kaleb Klein
echo        Version 2.1
echo.--------------------------
echo.
echo Type 'readme' before you do anything else!
echo.
echo Type 'cmd' for the command list
echo.
:begin
set /p begin="COMMAND /> "
if "%begin%"=="clean" goto cls
if "%begin%"=="cmd" goto cmd
if "%begin%"=="credits" goto credits
if "%begin%"=="exit" exit
if "%begin%"=="install" goto install
if "%begin%"=="readme" goto readme
if "%begin%"=="uninstall" goto uninstall
if "%begin%"=="" goto begin
echo "%begin%" is not a valid command
echo.
goto begin

:cls
cls
goto begin

:cmd
echo.
echo List of commands for the client
echo.
echo clean = Cleans up the window
echo cmd = Shows command list
echo credits = Shows credits, version, etc.
echo exit = Closes the window
echo install = Installs themes and the XP task bar as well as patches your system
echo readme = Shows a small readme for you to read before installation
echo uninstall = Uninstalls the themes and the XP task bar
echo.
echo All commands must be typed in lowercase
echo.
goto begin

:credits
cls
echo.
echo Windows XP Theme Installer Version 2.1
echo Created by: Kaleb Klein (C) 2011
echo.
echo AutoPatcher for XP Theme Installer (C) 2011 Kaleb Klein
echo.
echo Built for 32 and 64 bit Windows Vista and Windows 7 Systems
echo.
echo Theme credited to Satokoro.
echo Original Luna Theme (c) Microsoft
echo.
echo This program was created to aid in installing the Windows XP theme and task bar
echo for Windows Vista and Windows 7 for those who love the look of XP. Please use 
echo with caution and don't take any credit for this program or the themes 
echo themselves as they are not yours.
echo.
echo Installer copywrite 2011 by: Kaleb Klein. All Rights Reserved
echo.
echo.
echo Press any key to return to the main menu
pause >NUL
goto title

:install
cls
echo.
echo Are you sure you wish to install the themes and task bar? Y=yes, N=no"
set /p yn="COMMAND /> "
if "%yn%"=="Y" (
	echo.
) else if "%yn%"=="y" (
	echo.
) else if "%yn%"=="N" (
	echo Press any key to return to the main menu
	pause >NUL
	goto title
) else if "%yn%"=="n" (
	echo Press any key to return to the main menu
	pause >NUL
	goto title
) else (
	echo "%yn%" is not valid.
	pause >NUL
	goto install
)
echo.
echo Patching system...
echo.
mkdir "%appdata%\.theme_backup"
ren "%windir%\System32\uxtheme.dll" uxtheme.dll.bak
copy /y  "Resources\theme_patch\uxtheme.dll" "%windir%\System32"
move /y "%windir%\System32\uxtheme.dll.bak" "%appdata%\.theme_backup"
ren "%windir%\System32\themeui.dll" themeui.dll.bak
copy /y  "Resources\theme_patch\themeui.dll" "%windir%\System32"
move /y "%windir%\System32\themeui.dll.bak" "%appdata%\.theme_backup"
ren "%windir%\System32\themeservice.dll" themeservice.dll.bak
copy /y  "Resources\theme_patch\themeservice.dll" "%windir%\System32"
move /y "%windir%\System32\themeservice.dll.bak" "%appdata%\.theme_backup"
echo.
echo Patching Complete
echo.
echo Installing theme packages...
echo.
xcopy /y /e /i "Themes" "%windir%\Resources\Themes"
echo.
echo Packages Installed
echo.
echo Determining your computer's architecture...
if defined ProgramFiles(x86) (
	set ar=64 bit
	set file=x64
) else (
	set ar=32 bit
	set file=x86
)
echo Architecture: %ar%
echo.
ren "%windir%\explorer.exe" explorer.exe.bak
copy /y "Resources\%file%\explorer.exe" %windir%
move /y "%windir%\explorer.exe.bak" "%appdata%\.theme_backup"
echo.
taskkill /F /IM explorer.exe
echo Restarting Explorer...
start %windir%\explorer.exe
echo Explorer successfully restarted
echo.
echo Now that everything is complete, you need to restart your computer
set /p restart=Would you like to restart now or later? (N=now, L=later) 
if "%restart%"=="N" (
	shutdown /r /t 0
) else if "%restart%"=="L" (
	echo For the themes to take effect, you need to restart.
) else if "%restart%"=="n" (
	shutdown /r /t 0
) else if "%restart%"=="l" (
	echo For the themes to take effect, you need to restart.
) else (
	echo "%restart%" is not valid
)
echo.
echo Installation complete, return to main menu
pause >NUL
goto title

:readme
cls
echo.
echo This installer is to aid in installing the Windows XP themes and 
echo task bar without you having to do all the crazy work. The installer
echo Will auto patch your system, so everything will be taken care of in
echo one sweep. You must restart the computer in order for everything to take 
echo effect correctly. When you install the themes and task bar, you are 
echo given a restart option, taking it is highly recommended. Also, if you 
echo havent already, please read the readme.txt file before installing.
echo.
echo Press any key to view more info...
pause >NUL
echo.
echo So, what exactly is going on when I install and patch my computer?
echo.
echo Well, when you run the installer, you are taking library files form
echo your system's core directory and storing them in a safe place, and 
echo replacing them with the newer files, then the themes are added to 
echo the "Themes" directory.
echo.
echo When you uninstall the themes and task bar, all the files that were
echo replaced with the "patched" files are placed back where they belong
echo and the patched files are archived, and removed from your computer.
echo.
echo Press any key to view more info...
pause >NUL
echo.
echo Is this safe for my computer?
echo.
echo All files that are replaced are stored in a safe place until you decide
echo to run the uninstall. Once you run the uninstall, all the files are
echo restored, untouched and everything is as it was before you installed
echo and patched your system. So yes, it is safe.
echo.
echo Press any key to return to the main menu
pause >NUL
goto title

:uninstall
cls
echo.
echo Are you sure you wish to uninstall the themes and task bar? Y=yes, N=no"
set /p yn="COMMAND /> "
if "%yn%"=="Y" (
	echo.
) else if "%yn%"=="y" (
	echo.
)else if "%yn%"=="N" (
	echo Press any key to return to the main menu
	pause >NUL
	goto title
) else if "%yn%"=="n" (
	echo Press any key to return to the main menu
	pause >NUL
	goto title
) else (
	echo "%yn%" is not valid
	pause >NUL
	goto uninstall
)
echo.
echo Unpatching system...
echo.
mkdir "C:\theme_temp"
ren "%windir%\System32\uxtheme.dll" uxtheme.dll.old
move /y "%windir%\System32\uxtheme.dll.old" "C:\temp"
move /y "%appdata%\.theme_backup\uxtheme.dll.bak" "%windir%\System32"
ren "%windir%\System32\uxtheme.dll.bak" uxtheme.dll
ren "%windir%\System32\themeui.dll" themeui.dll.old
move /y "%windir%\System32\themeui.dll.old" "C:\theme_temp"
move /y "%appdata%\.theme_backup\themeui.dll.bak" "%windir%\System32"
ren "%windir%\System32\themeui.dll.bak" themeui.dll
ren "%windir%\System32\themeservice.dll" themeservice.dll.old
move /y "%windir%\System32\themeservice.dll.old" "C:\theme_temp"
move /y "%appdata%\.theme_backup\themeservice.dll.bak" "%windir%\System32"
ren "%windir%\System32\themeservice.dll.bak" themeservice.dll
echo.
echo Unpatching complete
echo.
echo Removing packages...
echo.
rmdir /s /q "%windir%\Resources\Themes\Luna"
rmdir /s /q "%windir%\Resources\Themes\Luna Aero"
del /q "%windir%\Resources\Themes\Luna.theme"
del /q "%windir%\Resources\Themes\Luna Aero.theme"
echo.
echo Packages removed
echo.
echo Determining your computer's architecture...
if defined ProgramFiles(x86) (
	set ar=64 bit
	set file=x64
) else (
	set ar=32 bit
	set file=x86
)
echo Architecture: %ar%
echo.
ren "%windir%\explorer.exe" explorer.exe.old
move /y "%windir%\explorer.exe.old" "C:\theme_temp"
move /y "%appdata%\.theme_backup\explorer.exe.bak" %windir%
ren %windir%\explorer.exe.bak explorer.exe
rmdir /s /q "%appdata%\.theme_backup"
echo.
taskkill /F /IM explorer.exe
start %windir%\explorer.exe
echo Explorer successfully restarted
echo.
echo Removing temporary cache files
rmdir /s /q "C:\theme_temp"
echo.
echo Uninstallation successful, return to the main menu
pause >NUL
goto title