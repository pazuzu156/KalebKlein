@echo off
title Kaleb's Batch Messenger
color 1f
:title
cls
echo.
echo.--------------------------------------------------
echo Kaleb's Batch Messenger Client for Windows Vista/7
echo     Version 0.13 Build 5 (C)2011 Kaleb Klein
echo.--------------------------------------------------
echo.
echo Need assistance? Type 'help' so see a list of commands
echo.
:begin
set /p begin=COMMAND: 
if "%begin%"=="about" goto about
if "%begin%"=="cls" goto title
if "%begin%"=="color" goto color
if "%begin%"=="compInfo" goto compInfo
if "%begin%"=="exit" exit
if "%begin%"=="help" Goto help
if "%begin%"=="ipInfo" goto ipInfo
if "%begin%"=="ipInfo --help" goto helpIP
if "%begin%"=="message" goto message
if "%begin%"=="message --help" goto helpMSG
if "%begin%"=="netList" goto netList
if "%begin%"=="netList --help" goto helpNET
echo "%begin%" is not a valid command
echo.
goto begin

:about
cls
echo.
echo.--------------------------------------------------
echo Kaleb's Batch Messenger Client for Windows Vista/7
echo     Version 0.13 Build 5 (C)2011 Kaleb Klein
echo.--------------------------------------------------
echo.
echo This DOS based batch client was build in Notepad++
echo This is free open source software for the world to use and edit
echo All code (C)2011 Kaleb Klein(Jostled Arts Entertainment)
echo Website: http://www.jae-entertainment.we.bs/
echo Contact: klein.jae@gmail.com
echo.-----------------------------------------------------------------------
echo Messenger client build from Notepad++ Using Batch scripting
echo Edit, modify, add, distribute to your liking
echo I am in no way liable for anthing beyond this program
echo In no way may I recieve any legal notices based on this program
echo.
echo Press enter to return
pause >NUL
goto title

:color
cls
echo.
color help
echo.
echo Choose the color you want based on the choices above
set /p bc=Background Color: 
set /p fc=Font Color: 
color %bc%%fc%
echo.
echo Color change success, press enter to return
pause >NUL
goto title

:compInfo
cls
echo.
echo Computer info..
echo.
echo Date: %date%
echo Time: %time%
echo Computer Name: %computername%
echo User: %username%
echo Sysdrive: %systemdrive%
echo Domain: %userdomain%
echo Logon: %logonserver%
echo Windowsroot: %windir%
echo Programs op: %programfiles%
echo Profilemap: %userprofile%
echo Temp map: %temp%
echo.
echo press enter to return
pause >NUL
goto title

:help
cls
echo.
echo List of commands for the client
echo.
echo about = Shows information about the program and legal info
echo color = Change the colors of the font and background
echo compInfo = Shows the information of your computer
echo exit = Exits the program
echo help = Brings up this help menu
echo ipInfo = Shows your IP Information. 'ipInfo --help' for more info
echo netList = Shows all online computers in your network. 'netList --help' for more info
echo message = Send a message to someone. 'message --help' for more info
echo.
echo Press enter to return
pause >NUL
goto title

:helpIP
cls
echo.
echo ipInfo displays all the IP information for your computer
echo To find your IP Address, look for the category IPv4, and that is it.
echo.
echo Press enter to return
pause >NUL
goto title

:helpMSG
cls
echo.
echo Send messages to other computers.
echo.
echo Send a message to anyone within your LAN newtork, 
echo to find out the computer names within your network, use netList.
echo.
echo To send a message, use their computer name or IP address, and type your message
echo.
echo Press enter to return
pause >NUL
goto title

:helpNET
cls
echo.
echo netList shows a list of all computers that are currently
echo connected to the internet through your server
echo.
echo Run this command to display all computers in the network
echo.
echo Press enter to return
pause >NUL
goto title

:ipInfo
cls
echo.
echo Getting IP Info
echo.
ipconfig /all
echo.
set /p yn=Would you like to save this information in text format? 
if "%yn%"=="yes" set ah=ipconfig /all
echo.
echo Generating text file...
%ah% > ipInfo.txt
echo.
echo done
echo.
echo Press enter to return
pause >NUL
goto title

:message
cls
echo.
echo Send a message to another computer
echo.
set /p n=Recipient(Computer Name or IP Address): 
set /p m=Message: 
msg %n% %m% send
echo Creating text file...
echo Date: %date% Time: %time% Recipient: %n% Message: %m% > messages.txt
echo File created
echo.
echo Press enter to return
pause >NUL
goto title

:netList
cls
echo.
echo List of computers within the network
echo.
net view
echo.
echo Press enter to return
pause >NUL
goto title