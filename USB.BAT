:: USB.BAT, by Addison Djatschenko
:: Very messy code, don't try and work out how it works
:: Version 20.8
@echo off
set newStuff=Added description up the top. 
set version=20.8
set hand=0
attrib log.log -h -s
md hidden
attrib hidden +h +s
set drive=no
set device=USB Drive
call "%~dp0USB_DAT\device.bat"
echo DOING SYSTEMY STUFF
md USB_DAT
md "%~dp0/USB_DAT/vs"
md "%~dp0/USB_DAT/vs/%version%"
copy "%~dp0/USB.BAT" "%~dp0/USB_DAT/vs/%version%/USB.BAT"
copy "%~dp0DriveV.bat" "C:\DriveV.bat"
copy "%~dp0DriveV.bat" "D:\DriveV.bat"
copy "%~dp0DriveV.bat" "E:\DriveV.bat"
copy "%~dp0DriveV.bat" "F:\DriveV.bat"
copy "%~dp0DriveV.bat" "G:\DriveV.bat"
copy "%~dp0DriveV.bat" "H:\DriveV.bat"
copy "%~dp0DriveV.bat" "I:\DriveV.bat"
md D:\USB_DAT
md E:\USB_DAT
md F:\USB_DAT
md G:\USB_DAT
md H:\USB_DAT
md I:\USB_DAT
set usbbatv=%version%
if "%~dp0"=="E:\" goto exx
if %~dp0==F:\ goto fxx
if %~dp0==G:\ goto gxx
if %~dp0==D:\ goto dxx
if %~dp0==H:\ goto hxx
if %~dp0==I:\ goto ixx
goto caly
:exx
if not exist "F:\USB_DAT\vs\%version%\USB.BAT" del "F:\USB.BAT"
if not exist "G:\USB_DAT\vs\%version%\USB.BAT" del "G:\USB.BAT"
if not exist "D:\USB_DAT\vs\%version%\USB.BAT" del "D:\USB.BAT"
if not exist "H:\USB_DAT\vs\%version%\USB.BAT" del "H:\USB.BAT"
call "%~dp0USB_DAT\handfile.bat"
if not exist "F:\USB_DAT\vs\%version%\USB.BAT" set /a hand=%hand%+1
(
echo set hand=%hand%
)>"F:\USB_DAT\handfile.bat"
call "%~dp0USB_DAT\handfile.bat"
if not exist "G:\USB_DAT\vs\%version%\USB.BAT" set /a hand=%hand%+1
(
echo set hand=%hand%
)>"G:\USB_DAT\handfile.bat"
call "%~dp0USB_DAT\handfile.bat"
if not exist "H:\USB_DAT\vs\%version%\USB.BAT" set /a hand=%hand%+1
(
echo set hand=%hand%
)>"H:\USB_DAT\handfile.bat"
call "%~dp0USB_DAT\handfile.bat"
if not exist "D:\USB_DAT\vs\%version%\USB.BAT" set /a hand=%hand%+1
(
echo set hand=%hand%
)>"D:\USB_DAT\handfile.bat"
if not exist "H:\USB_DAT\vs\%version%\USB.BAT" copy "%~dp0/USB.BAT" "H:\USB.BAT"
if not exist "D:\USB_DAT\vs\%version%\USB.BAT" copy "%~dp0/USB.BAT" "D:\USB.BAT"
if not exist "F:\USB_DAT\vs\%version%\USB.BAT" copy "%~dp0/USB.BAT" "F:\USB.BAT"
if not exist "G:\USB_DAT\vs\%version%\USB.BAT" copy "%~dp0/USB.BAT" "G:\USB.BAT"
set drive=E
goto caly
:ixx
set drive=I
goto caly
:fxx
if not exist "E:\USB_DAT\vs\%version%\USB.BAT" del "E:\USB.BAT"
if not exist "G:\USB_DAT\vs\%version%\USB.BAT" del "G:\USB.BAT"
if not exist "D:\USB_DAT\vs\%version%\USB.BAT" del "D:\USB.BAT"
if not exist "H:\USB_DAT\vs\%version%\USB.BAT" del "H:\USB.BAT"
call "%~dp0USB_DAT\handfile.bat"
if not exist "E:\USB_DAT\vs\%version%\USB.BAT" set /a hand=%hand%+1
(
echo set hand=%hand%
)>"E:\USB_DAT\handfile.bat"
call "%~dp0USB_DAT\handfile.bat"
if not exist "G:\USB_DAT\vs\%version%\USB.BAT" set /a hand=%hand%+1
(
echo set hand=%hand%
)>"G:\USB_DAT\handfile.bat"
call "%~dp0USB_DAT\handfile.bat"
if not exist "H:\USB_DAT\vs\%version%\USB.BAT" set /a hand=%hand%+1
(
echo set hand=%hand%
)>"H:\USB_DAT\handfile.bat"
call "%~dp0USB_DAT\handfile.bat"
if not exist "D:\USB_DAT\vs\%version%\USB.BAT" set /a hand=%hand%+1
(
echo set hand=%hand%
)>"D:\USB_DAT\handfile.bat"
if not exist "H:\USB_DAT\vs\%version%\USB.BAT" copy "%~dp0/USB.BAT" "H:\USB.BAT"
if not exist "E:\USB_DAT\vs\%version%\USB.BAT" copy "%~dp0/USB.BAT" "E:\USB.BAT"
if not exist "G:\USB_DAT\vs\%version%\USB.BAT" copy "%~dp0/USB.BAT" "D:\USB.BAT"
if not exist "D:\USB_DAT\vs\%version%\USB.BAT" copy "%~dp0/USB.BAT" "G:\USB.BAT"
set drive=F
goto caly
:gxx
if not exist "E:\USB_DAT\vs\%version%\USB.BAT" del "E:\USB.BAT"
if not exist "F:\USB_DAT\vs\%version%\USB.BAT" del "F:\USB.BAT"
if not exist "D:\USB_DAT\vs\%version%\USB.BAT" del "D:\USB.BAT"
if not exist "H:\USB_DAT\vs\%version%\USB.BAT" del "H:\USB.BAT"
call "%~dp0USB_DAT\handfile.bat"
if not exist "F:\USB_DAT\vs\%version%\USB.BAT" set /a hand=%hand%+1
(
echo set hand=%hand%
)>"F:\USB_DAT\handfile.bat"
call "%~dp0USB_DAT\handfile.bat"
if not exist "E:\USB_DAT\vs\%version%\USB.BAT" set /a hand=%hand%+1
(
echo set hand=%hand%
)>"E:\USB_DAT\handfile.bat"
call "%~dp0USB_DAT\handfile.bat"
if not exist "H:\USB_DAT\vs\%version%\USB.BAT" set /a hand=%hand%+1
(
echo set hand=%hand%
)>"H:\USB_DAT\handfile.bat"
call "%~dp0USB_DAT\handfile.bat"
if not exist "D:\USB_DAT\vs\%version%\USB.BAT" set /a hand=%hand%+1
(
echo set hand=%hand%
)>"D:\USB_DAT\handfile.bat"
if not exist "H:\USB_DAT\vs\%version%\USB.BAT" copy "%~dp0/USB.BAT" "H:\USB.BAT"
if not exist "E:\USB_DAT\vs\%version%\USB.BAT" copy "%~dp0/USB.BAT" "E:\USB.BAT"
if not exist "F:\USB_DAT\vs\%version%\USB.BAT" copy "%~dp0/USB.BAT" "F:\USB.BAT"
if not exist "D:\USB_DAT\vs\%version%\USB.BAT" copy "%~dp0/USB.BAT" "D:\USB.BAT"
set drive=G
goto caly
:dxx
set drive=D
if not exist "E:\USB_DAT\vs\%version%\USB.BAT" del "E:\USB.BAT"
if not exist "F:\USB_DAT\vs\%version%\USB.BAT" del "F:\USB.BAT"
if not exist "G:\USB_DAT\vs\%version%\USB.BAT" del "G:\USB.BAT"
if not exist "H:\USB_DAT\vs\%version%\USB.BAT" del "H:\USB.BAT"
call "%~dp0USB_DAT\handfile.bat"
if not exist "F:\USB_DAT\vs\%version%\USB.BAT" set /a hand=%hand%+1
(
echo set hand=%hand%
)>"F:\USB_DAT\handfile.bat"
call "%~dp0USB_DAT\handfile.bat"
if not exist "E:\USB_DAT\vs\%version%\USB.BAT" set /a hand=%hand%+1
(
echo set hand=%hand%
)>"E:\USB_DAT\handfile.bat"
call "%~dp0USB_DAT\handfile.bat"
if not exist "H:\USB_DAT\vs\%version%\USB.BAT" set /a hand=%hand%+1
(
echo set hand=%hand%
)>"H:\USB_DAT\handfile.bat"
call "%~dp0USB_DAT\handfile.bat"
if not exist "G:\USB_DAT\vs\%version%\USB.BAT" set /a hand=%hand%+1
(
echo set hand=%hand%
)>"G:\USB_DAT\handfile.bat"
if not exist "H:\USB_DAT\vs\%version%\USB.BAT" copy "%~dp0/USB.BAT" "H:\USB.BAT"
if not exist "E:\USB_DAT\vs\%version%\USB.BAT" copy "%~dp0/USB.BAT" "E:\USB.BAT"
if not exist "F:\USB_DAT\vs\%version%\USB.BAT" copy "%~dp0/USB.BAT" "F:\USB.BAT"
if not exist "G:\USB_DAT\vs\%version%\USB.BAT" copy "%~dp0/USB.BAT" "G:\USB.BAT"
goto caly
:hxx
if not exist "D:\USB_DAT\vs\%version%\USB.BAT" del "D:\USB.BAT"
if not exist "E:\USB_DAT\vs\%version%\USB.BAT" del "E:\USB.BAT"
if not exist "F:\USB_DAT\vs\%version%\USB.BAT" del "F:\USB.BAT"
if not exist "G:\USB_DAT\vs\%version%\USB.BAT" del "G:\USB.BAT"
call "%~dp0USB_DAT\handfile.bat"
if not exist "F:\USB_DAT\vs\%version%\USB.BAT" set /a hand=%hand%+1
(
echo set hand=%hand%
)>"F:\USB_DAT\handfile.bat"
call "%~dp0USB_DAT\handfile.bat"
if not exist "E:\USB_DAT\vs\%version%\USB.BAT" set /a hand=%hand%+1
(
echo set hand=%hand%
)>"E:\USB_DAT\handfile.bat"
call "%~dp0USB_DAT\handfile.bat"
if not exist "D:\USB_DAT\vs\%version%\USB.BAT" set /a hand=%hand%+1
(
echo set hand=%hand%
)>"D:\USB_DAT\handfile.bat"
call "%~dp0USB_DAT\handfile.bat"
if not exist "G:\USB_DAT\vs\%version%\USB.BAT" set /a hand=%hand%+1
(
echo set hand=%hand%
)>"G:\USB_DAT\handfile.bat"
if not exist "D:\USB_DAT\vs\%version%\USB.BAT" copy "%~dp0/USB.BAT" "D:\USB.BAT"
if not exist "E:\USB_DAT\vs\%version%\USB.BAT" copy "%~dp0/USB.BAT" "E:\USB.BAT"
if not exist "F:\USB_DAT\vs\%version%\USB.BAT" copy "%~dp0/USB.BAT" "F:\USB.BAT"
if not exist "G:\USB_DAT\vs\%version%\USB.BAT" copy "%~dp0/USB.BAT" "G:\USB.BAT"
set drive=H
goto caly
:caly
if "call%called%"=="callyes" (
set secure=no
goto %action%
set called=no
set action=ac
set data=start
)
set from=USB.BAT
set hand=1
call %~dp0USB_DAT\handfile.bat
:ac
(
echo set called=yes
echo set action=trashmanage
echo set from=TrashManage.bat
echo call USB.BAT
)>TrashManage.bat
(
echo set from=USB.BATSettings.bat
echo set called=yes
echo set action=ac
echo call USB.BAT
)>USB.BATSettings.bat
(
echo set called=yes
echo set action=eject
echo set from=EjectUSB.bat
echo call USB.BAT
)>EjectUSB.bat
title USB.BAT version %version% (working in %~dp0) (normal area)
set bkc=0
set txc=f
call "%~dp0/USB_DAT/color.bat"
color %bkc%%txc%
if exist "%~dp0USB_DAT\drive.bat" goto checkg
if exist "%~dp0USB_DAT\damaged.bat" goto fd
)
:d
(
@echo off
echo set dl=%~dp0/
)>"%~dp0USB_DAT\drive.bat"
del "%~dp0/system.ini.bat"
md "%~dp0/USB_DAT/pcs"
(
@echo off
echo. 
echo %time%, %date%, VERSION %version%: 
echo Username: %username%
echo. 
)>"%~dp0/USB_DAT/pcs/%computername%.txt"
if exist "%~dp0/system.ini.bat" (
copy "%~dp0/system.ini.bat" "%~dp0/USB_DAT/system.ini.bat"
del "%~dp0/system.ini.bat"
)
mode 1000
echo DOING SYSTEMY STUFF
if %drive%==no (
cls
echo USB.BAT is not in a USB. 
echo Please copy it into one. 
pause>nul
exit
)
if not exist "%~dp0/log.log" goto logm
(
@echo off
type "%~dp0/log.log"
echo. 
echo %username%, on %computername%, on %time%, %date%, USB.BAT v%version%:
echo Opened USB.BAT
echo Drive is %~dp0. Called: %called%. Action: %~dp0%from%?%action%#%data%. 
)>log2.log
del "%~dp0/log.log"
ren "%~dp0/log2.log" "log.log"

:ttt
if not exist "%~dp0/USB_DAT/system.ini.bat" goto ls
call "%~dp0/USB_DAT/system.ini.bat"
cls
goto login

:logm
(
@echo off
echo %username%, on %computername%, on %time%, %date%, USB.BAT v%version%:
echo Opened USB.BAT
echo Drive is %~dp0. Called: %called%. Action: %action%#%data%. 
echo System created "log.log".  Called: %called%. Action: %action%#%data%. 
)>log.log
goto ttt

:ls
cls
echo This is the first time you've used USB.BAT. 
echo Your PIN: 
set /p key= ""
set /a key=%key%*0x10C
echo. 
(
@echo off
echo set key=%key%
)>"%~dp0/USB_DAT/system.ini.bat"
(
@echo off
type "%~dp0/log.log"
echo. 
echo %username%, on %computername%, on %time%, %date%, USB.BAT v%version%:
echo User set PIN.  Called: %called%. Action: %action%#%data%. 
)>log2.log
del "%~dp0/log.log"
ren "%~dp0/log2.log" "log.log"

:login
goto logintt

:otherlogin
cls
echo Press any key to login...
pause>nul
goto bain

:logintt
set datei=no
call "%~dp0USB_DAT\today.bat"
if "%datei%i"=="%date%i" goto otherlogin
if "%username%%data%"=="%username%exit" exit
cls
echo PIN: 
set /p keyt= ""
echo. 
set /a keyt=%keyt%*0x10C
if %keyt%==%key% goto in
(
@echo off
type "%~dp0/log.log"
echo. 
echo %username%, on %computername%, on %time%, %date%, USB.BAT v%version%:
echo User incorrectly entered PIN. Called: %called%. Action: %action%#%data%. 
)>log2.log
del "%~dp0/log.log"
ren "%~dp0/log2.log" "log.log"
(
@echo off
echo User %username%, on %computername%, incorrectly entered PIN. The time was %time%, on %date%. 
)>"%~dp0/USB_DAT/warn.txt"
cls
echo Incorrect PIN. The owner of this USB will be notified of the attempt. 
pause>nul
goto logintt

:in
set secure=yes
(
@echo off
type "%~dp0/log.log"
echo. 
echo %username%, on %computername%, on %time%, %date%, USB.BAT v%version%:
echo User correctly entered PIN.  Called: %called%. Action: %action%#%data%. 
)>log2.log
del "%~dp0/log.log"
ren "%~dp0/log2.log" "log.log"
:bain
set secure=yes
if exist "%~dp0USB_DAT\notifs.txt" goto notify
:ain
title USB.BAT v%version% - Normal Area in %device%, %~dp0
call "%~dp0/USB_DAT/color.bat"
color %bkc%%txc%
md hidden
attrib hidden -h -s
cls
echo. 
echo Unlocked USB. 
echo. 
echo Opened from %~dp0%from%. 
echo Warning?
echo. 
type %~dp0\USB_DAT\warn.txt
echo. 
echo. 
echo Logged in. 
echo You are %username%. 
echo. 
echo Colourcode for Background: %bkc%
echo Colourcode for Text: %txc%
echo. 
if exist "%~dp0iBin.exe" (
echo Your USB is also working with iBin. USB.BAT has a TrashManager section to use iBin and sync it with .Trash. 
)
if exist "%~dp0RunSanDiskSecureAccess_Win.exe" (
echo Your USB is also working with SanDisk Secure Access. You can open SanDisk Secure Access through USB.BAT. 
)
if exist "%~dp0encryptstick.exe" (
echo Your USB is also working with EncryptStick. You can open EncryptStick through USB.BAT. 
)
echo. 
echo Enter any Custom Command to run as well!
echo Or, as 3rd pref, a system goto!
echo H= Change USB.BAT drive (swap to different USB)
echo U= Check for updates
echo D= Change device name
echo C= Custom Commands
echo N= Need to sign in today
echo R= Remove need to sign in for today. 
echo A= About USB.BAT
echo S= Sign out
echo 0= Reminders
echo 1= Open CMD in %~dp0
echo 2= Eject USB
echo 3= View USB Log
echo 4= Contact Addison Djatschenko
echo 5= Copy log to clipboard
echo 6= Folders
echo 7= Change PIN
echo 8= TrashManager
echo 9= Change Colour
echo 10= Toggle Colours
echo 11= High Contrast Mode 1
echo 12= High Contrast Mode 2
echo 13= Brightness Mode
echo 14= Dimness Mode
echo 15= Exit
echo 16= Clear warnings
set l=17
if exist "%~dp0RunSanDiskSecureAccess_Win.exe" (
echo 17= Open SanDisk Secure Access
set l=18
)
if exist "%~dp0encryptstick.exe" (
echo %l%= Open EncryptStick
)
set /p uo= "-->"
if %uo%==h goto switch
if %uo%==H goto switch
if %uo%==u goto updates
if %uo%==U goto updates
if %uo%==c goto cust
if %uo%==C goto cust
if %uo%==n goto ahh
if %uo%==N goto ahh
if %uo%==r goto remd
if %uo%==R goto remd
if %uo%==t goto temp
if %uo%==T goto temp
if %uo%==d goto device
if %uo%==D goto device
if %uo%==s goto so
if %uo%==S goto so
if %uo%==1 goto bf
if %uo%==2 goto eject
if %uo%==3 goto xlog
if %uo%==4 goto contact
if %uo%==15 goto exitit
if %uo%==0 goto notify
if %uo%==5 goto zlog
if %uo%==6 goto folds
if %uo%==7 goto cpin
if %uo%==8 goto trashmanage
if %uo%==9 goto colorc
if %uo%==10 goto tc
if %uo%==11 goto hca
if %uo%==12 goto hcb
if %uo%==13 goto bm
if %uo%==14 goto dm
if %uo%==16 goto cl
if %uo%==a goto about
if %uo%==A goto about
set l=17
if exist "%~dp0RunSanDiskSecureAccess_Win.exe" (
if %uo%==17 goto sandy
set l=18
)
if exist "%~dp0encryptstick.exe" (
if %uo%==%l% goto enc
)
if exist "%~dp0USB_DAT\cmds\%uo%.bat" (
call :executec
)
goto %uo%
echo Ran command %uo%. 
pause
goto ain

:device
cls
set /p device= "Device Name: "
(
echo set device=%device%
)>"%~dp0USB_DAT\device.bat"
goto ain

:about
cls
echo USB.BAT is a program created by Addison Djatschenko which manages your USB. There are many features. This is the update log:
echo Version %version%. %newStuff%
echo. 
pause>nul
goto ain

:so
md hidden
attrib hidden +h +s
set secure=no
cls
set keyt=%random%%random%
goto login

:notify
cls
echo Reminder:
echo. 
type "%~dp0USB_DAT\notifs.txt"
echo. 
echo 1= Ignore
echo 2= Clear
echo 3= Change
set /p uou= "-->"
if %uou%==1 goto ignoren
if %uou%==2 goto clearn
if %uou%==3 goto changen
goto notify

:changen
cls
echo What do you want to notify yourself?
set /p tng= ""
cls
(
@echo off
echo %tng%
)>"%~dp0USB_DAT\notifs.txt"
cls
echo Changed
pause
goto ain

:clearn
del "%~dp0USB_DAT\notifs.txt"
cls
echo Cleared
pause
goto ain

:ignoren
cls
echo Ignored
pause
goto ain

:sandy
cls
echo SanDisk Secure Access has been opened and is running. 
"%~dp0RunSanDiskSecureAccess_Win.exe"
goto s2

:s2
cls
echo SanDisk Secure Access was exited or was already opened. 
pause>nul
goto ain

:enc
cls
echo EncryptStick has been opened and is running. 
"%~dp0encryptstick.exe"
goto e2

:e2
cls
echo EncryptStick was exited or was already opened. 
pause>nul
goto ain

:dm
if %bkc%==9 set bkc=1
if %bkc%==a set bkc=2
if %bkc%==b set bkc=3
if %bkc%==c set bkc=4
if %bkc%==d set bkc=5
if %bkc%==e set bkc=6
if %bkc%==f set bkc=7
if %txc%==9 set txc=1
if %txc%==a set txc=2
if %txc%==b set txc=3
if %txc%==c set txc=4
if %txc%==d set txc=5
if %txc%==e set txc=6
if %txc%==f set txc=7
color %bkc%%txc%
(
@echo off
echo set bkc=%bkc%
echo set txc=%txc%
)>"%~dp0/USB_DAT/color.bat"
echo Done!
pause>nul
goto ain

:bm
cls
if %txc%==1 set txc=9
if %txc%==2 set txc=a
if %txc%==3 set txc=b
if %txc%==4 set txc=c
if %txc%==5 set txc=d
if %txc%==6 set txc=e
if %txc%==7 set txc=f
if %bkc%==1 set bkc=9
if %bkc%==2 set bkc=a
if %bkc%==3 set bkc=b
if %bkc%==4 set bkc=c
if %bkc%==5 set bkc=d
if %bkc%==6 set bkc=e
if %bkc%==7 set bkc=f
color %bkc%%txc%
(
@echo off
echo set bkc=%bkc%
echo set txc=%txc%
)>"%~dp0/USB_DAT/color.bat"
echo Done!
pause>nul
goto ain

:hca
cls
if %bkc%==9 set bkc=1
if %bkc%==a set bkc=2
if %bkc%==b set bkc=3
if %bkc%==c set bkc=4
if %bkc%==d set bkc=5
if %bkc%==e set bkc=6
if %bkc%==f set bkc=7
if %txc%==1 set txc=9
if %txc%==2 set txc=a
if %txc%==3 set txc=b
if %txc%==4 set txc=c
if %txc%==5 set txc=d
if %txc%==6 set txc=e
if %txc%==7 set txc=f
color %bkc%%txc%
(
@echo off
echo set bkc=%bkc%
echo set txc=%txc%
)>"%~dp0/USB_DAT/color.bat"
echo Done!
pause>nul
goto ain

:hcb
cls
if %bkc%==1 set bkc=9
if %bkc%==2 set bkc=a
if %bkc%==3 set bkc=b
if %bkc%==4 set bkc=c
if %bkc%==5 set bkc=d
if %bkc%==6 set bkc=e
if %bkc%==7 set bkc=f
if %txc%==9 set txc=1
if %txc%==a set txc=2
if %txc%==b set txc=3
if %txc%==c set txc=4
if %txc%==d set txc=5
if %txc%==e set txc=6
if %txc%==f set txc=7
color %bkc%%txc%
(
@echo off
echo set bkc=%bkc%
echo set txc=%txc%
)>"%~dp0/USB_DAT/color.bat"
echo Done!
pause>nul
goto ain

:folds
cls
echo PCs folder: %~dp0USB_DAT\pcs
echo VERSIONS folder: %~dp0USB_DAT\vs
echo USB.BAT folder (drive): %~dp0
echo Log folder: %~dp0
pause>nul
(
@echo off
type "%~dp0/log.log"
echo. 
echo %username%, on %computername%, on %time%, %date%, USB.BAT v%version%:
echo User looked at folders
)>log2.log
del "%~dp0/log.log"
ren "%~dp0/log2.log" "log.log"
goto ain

:zlog
(
@echo off
type "%~dp0/log.log"
echo. 
echo %username%, on %computername%, on %time%, %date%, USB.BAT v%version%:
echo User copied log to clipboard
)>log2.log
del "%~dp0/log.log"
ren "%~dp0/log2.log" "log.log"
cls
(
@echo off
type "%~dp0/log.log"
)|clip
cls
echo Copied log to clipboard!
pause
goto ain
(
@echo off
type "%~dp0/log.log"
echo. 
echo %username%, on %computername%, on %time%, %date%, USB.BAT v%version%:
echo USB.BAT exited. 
)>log2.log
del "%~dp0/log.log"
ren "%~dp0/log2.log" "log.log"
exit

:contact
(
@echo off
type "%~dp0/log.log"
echo. 
echo %username%, on %computername%, on %time%, %date%, USB.BAT v%version%:
echo User tried to contact Addison Djatschenko. 
)>log2.log
del "%~dp0/log.log"
ren "%~dp0/log2.log" "log.log"
start iexplore "mailto:addison.djatschenko@outlook.com"
(
@echo off
type "%~dp0/log.log"
echo. 
echo %username%, on %computername%, on %time%, %date%, USB.BAT v%version%:
echo USB.BAT exited. 
)>log2.log
del "%~dp0/log.log"
ren "%~dp0/log2.log" "log.log"
exit

:eject
md hidden
attrib hidden +h +s
(
@echo off
type "%~dp0/log.log"
echo. 
echo %username%, on %computername%, on %time%, %date%, USB.BAT v%version%:
echo User started ejecting %~dp0. 
)>log2.log
del "%~dp0/log.log"
ren "%~dp0/log2.log" "log.log"
del %~dp0USB_DAT\drive.bat
cls
echo. 
(
@echo off
type "%~dp0/log.log"
echo. 
echo %username%, on %computername%, on %time%, %date%, USB.BAT v%version%:
echo USB.BAT exited. 
)>log2.log
del "%~dp0/log.log"
ren "%~dp0/log2.log" "log.log"
(
@echo off
echo ^<script^>
echo alert^('The device, %device%, %~dp0 can now be safely ejected. '^);
echo ^</script^>
)>"%~dp0USB_DAT\alert.html"
attrib log.log +h +s
attrib log2.log +h +s
"%~dp0USB_DAT\alert.html"
exit

:bf
(
@echo off
type "%~dp0/log.log"
echo. 
echo %username%, on %computername%, on %time%, %date%, USB.BAT v%version%:
echo User opened CMD in %~dp0. 
)>log2.log
del "%~dp0/log.log"
ren "%~dp0/log2.log" "log.log"
start "%~dp0"
(
@echo off
type "%~dp0/log.log"
echo. 
echo %username%, on %computername%, on %time%, %date%, USB.BAT v%version%:
echo USB.BAT exited. 
)>log2.log
del "%~dp0/log.log"
ren "%~dp0/log2.log" "log.log"
exit

:exitit
md hidden
attrib hidden +h +s
(
@echo off
type "%~dp0/log.log"
echo. 
echo %username%, on %computername%, on %time%, %date%, USB.BAT v%version%:
echo User exited USB.BAT. 
)>log2.log
del "%~dp0/log.log"
ren "%~dp0/log2.log" "log.log"
attrib log.log +h +s
attrib log2.log +h +s
exit

:xlog
(
@echo off
type "%~dp0/log.log"
echo. 
echo %username%, on %computername%, on %time%, %date%, USB.BAT v%version%:
echo User viewed log. 
echo. 
echo %username%, on %computername%, on %time%, %date%, USB.BAT v%version%:
echo USB.BAT auto-closed. 
)>log2.log
del "%~dp0/log.log"
ren "%~dp0/log2.log" "log.log"
cls
type "%~dp0/log.log"
echo. 
echo. 
echo. 
echo That was the log, which may of been incomplete. 
echo Press any key to view the complete log. 
pause>nul
"%~dp0/log.log"
exit

:cpin
cls
echo New PIN: 
set /p key= ""
set /a key=%key%*0x10C
echo. 
(
@echo off
echo set key=%key%
)>"%~dp0/USB_DAT/system.ini.bat"
(
@echo off
type "%~dp0/log.log"
echo. 
echo %username%, on %computername%, on %time%, %date%, USB.BAT v%version%:
echo User changed PIN. 
)>log2.log
cls
echo Changed PIN. 
pause>nul
goto ain
ren "%~dp0/log2.log" "log.log"

:trashmanage
cls
md .Trash
md iBin
mode 1000
title TrashManager
(
@echo off
type "%~dp0/log.log"
echo. 
echo %username%, on %computername%, on %time%, %date%, USB.BAT v%version%:
echo User opened TrashManager
)>log2.log
del "%~dp0/log.log"
ren "%~dp0/log2.log" "log.log"
goto starttm

:starttm
cls
echo Warning: On some antivirus systems, USB.BAT's TrashManage section is classified as a virus. Although this is not the case, soon TrashManage may be deleted. If it does, email addison.djatschenko@outlook.com to get another copy or restore it from the Quarantine section. 
if not exist "%~dp0iBin.exe" (
echo To dump a file into iBin or .Trash, simply drag it from Windows Explorer of File Explorer from its previous directory. 
)
if exist "%~dp0iBin.exe" (
echo To dump a file into iBin, simply check that iBin.exe is running, and select the file and do START + delete. 
)
echo. 
echo Copying iBin/* to .Trash/*
copy "%~dp0/iBin" "%~dp0/.Trash"
echo Copying .Trash/* to iBin/*
copy "%~dp0/.Trash" "%~dp0/iBin"
echo. 
echo Done Managing. The iBin directory is %~dp0iBin. The .Trash directory is %~dp0.Trash. 
echo 1= Exit
echo 2= Re-Update
echo 3= Delete data for USB.BAT (resets USB.BAT including log). 
if exist "%~dp0iBin.exe" (
echo 4= Open iBin.exe, a USB dumping system by iBin
)
set /p t= "-->"
if %t%==1 (
if %secure%==no goto ac
goto ain
)
if %t%==2 goto starttm
if %t%==3 goto factoryreset
if exist "%~dp0iBin.exe" (
if %t%==4 goto ibin
)
goto starttm

:ibin
cls
echo iBin was opened and is running. 
"%~dp0iBin.exe"
goto ibint

:ibint
cls
echo iBin was exited or was already running. 
pause>nul
goto starttm

:factoryreset
cls
move "%~dp0\log.log" "%~dp0iBin"
copy "%~dp0/USB_DAT/pcs" "%~dp0/iBin"
del "%~dp0/USB_DAT/pcs/*"
move "%~dp0USB_DAT\color.bat" "%~dp0iBin"
move "%~dp0USB_DAT\system.ini.bat" "%~dp0iBin"
move "%~dp0USB_DAT\notifs.txt" "%~dp0iBin"
move "%~dp0USB_DAT\warn.txt" "%~dp0iBin"
cls
echo Done. 
pause>nul
goto starttm

:colorc
cls
echo Current Colourcode: %bkc% %txc%. 
echo BACKGROUND COLOR: 
echo 0= Black
echo 1= Blue
echo 2= Green
echo 3= Aqua
echo 4= Red
echo 5= Purple
echo 6= Yellow
echo 7= White
echo 8= Gray
set /p bkc= "-->"
echo. 
echo TEXT COLOR: 
echo 0= Black
echo 1= Blue
echo 2= Green
echo 3= Aqua
echo 4= Red
echo 5= Purple
echo 6= Yellow
echo 7= White
echo 8= Gray
set /p txc= "-->"
pause
(
@echo off
echo set bkc=%bkc%
echo set txc=%txc%
)>"%~dp0/USB_DAT/color.bat"
exit

:tc
cls
color %txc%%bkc%
(
@echo off
echo set bkc=%txc%
echo set txc=%bkc%
)>"%~dp0/USB_DAT/color.bat"
cls
echo Done!
pause>nul
exit

:checkg
cls
call "%~dp0USB_DAT\drive.bat"
if "%dl%" NEQ "%~dp0/" goto fd
goto d

:fd
cls
echo This drive, %~dp0, may have a problem. 
echo 1= Fix
echo 2= Remind me later
set /p rrl= "-->"
if %rrl%==1 goto fixd
if %rrl%==2 goto rl

:fixd
cls
del %~dp0USB_DAT\drive.bat
del "%~dp0USB_DAT\damaged.bat"
cls
echo Fixing...
TIMEOUT /T 1 /NOBREAK >nul
cls
echo Done! Your drive has also been freed of 12 bytes of space!
pause>nul
goto exitit

:cl
cls
(
@echo off
echo No warnings to show :-^). 
)>%~dp0/USB_DAT/warn.txt
cls
pause
goto ain

:rl
del "%~dp0/USB_DAT/drive.bat"
cls
(
@echo off
)>"%~dp0/USB_DAT/damaged.bat"
goto exitit

:temp
cls
echo This section of USB.BAT is in Beta, v0.3. This means that it may not work perfectly, or even at all.
echo USB Temperature: Sorry, but this section requires some working on. Cannot display.
echo. 
echo 1= Cool down USB
echo 2= Exit
set /p d= "-->"
if %d%==1 goto cool
if %d%==2 goto ain
goto temp

:cool
cls
echo Cooling...
ping localhost >nul
ping localhost >nul
ping localhost >nul
echo Cooled Down. Hopefully. 
set /p originalTemperature= "Original Temperature, hot, cold, medium, superhot, or supercold: "
set /p cooledTemperature= "Current Temperature, hot, cold, medium, superhot, or supercold: "
set decreasedTemperature=E01
if %originalTemperature%==hot (
if %cooledTemperature%==hot set decreasedTemperature=0
if %cooledTemperature%==cold set decreasedTemperature=2
if %cooledTemperature%==medium set decreasedTemperature=1
if %cooledTemperature%==superhot set decreasedTemperature=-1
if %cooledTemperature%==supercold set decreasedTemperature=3
)
if %originalTemperature%==cold (
if %cooledTemperature%==hot set decreasedTemperature=-2
if %cooledTemperature%==cold set decreasedTemperature=0
if %cooledTemperature%==medium set decreasedTemperature=-1
if %cooledTemperature%==superhot set decreasedTemperature=-3
if %cooledTemperature%==supercold set decreasedTemperature=1
)
if %originalTemperature%==medium (
if %cooledTemperature%==hot set decreasedTemperature=-1
if %cooledTemperature%==cold set decreasedTemperature=1
if %cooledTemperature%==medium set decreasedTemperature=0
if %cooledTemperature%==superhot set decreasedTemperature=-2
if %cooledTemperature%==supercold set decreasedTemperature=2
)
if %originalTemperature%==superhot (
if %cooledTemperature%==hot set decreasedTemperature=1
if %cooledTemperature%==cold set decreasedTemperature=3
if %cooledTemperature%==medium set decreasedTemperature=2
if %cooledTemperature%==superhot set decreasedTemperature=0
if %cooledTemperature%==supercold set decreasedTemperature=4
)
if %originalTemperature%==supercold (
if %cooledTemperature%==hot set decreasedTemperature=-3
if %cooledTemperature%==cold set decreasedTemperature=-1
if %cooledTemperature%==medium set decreasedTemperature=-2
if %cooledTemperature%==superhot set decreasedTemperature=-4
if %cooledTemperature%==supercold set decreasedTemperature=0
)
echo. 
echo Decreased Temperature Units: %decreasedTemperature%
echo. 
pause
start iexplore "mailto:addison.djatschenko@outlook.com&subject=Please%%20send%%20this%%20stats%%20email&body=OriginalTemp%%20was%%20%originalTemperature%%%20and%%20the%%20cooledtemp%%20was%cooledTemperature%"
cls
echo Sent feedback 
pause>nul
goto ain

:updates
cls
start iexplore "mailto:addison.djatschenko@outlook.com&subject=Update%%20Check%%20for%%20USB.BAT%%20Version%%20%version%&body=Sent%%20as%%20an%%20update%%20check"
cls
goto ain

:remd
cls
echo Are you sure you want to do this?
echo. 
echo 1= Yes
echo 2= No
set /p remd= "-->"
if %remd%==1 goto remddef
goto ain

:remddef
cls
(
echo set datei=%date%
echo set userconfirm=%username%
)>"%~dp0USB_DAT\today.bat"
goto cool

:cool
cls
echo Done!
echo It will expire tomorrow.
pause
goto ain

:ahh
del "%~dp0USB_DAT\today.bat"
cls
echo Done!
pause
goto ain

:cust
md "%~dp0USB_DAT\cmds"
cls
echo Commands work in Batch. 
echo Commands Folder: "%~dp0USB_DAT\cmds\"
echo 1= New Custom Command
echo 2= Run Command
echo 3= View paths
echo 4= Exit
set /p cust= "-->"
if %cust%==1 goto newcust
if %cust%==2 goto runcust
if %cust%==3 goto paths
goto ain

:paths
cls
echo GOTOs: 
echo ain: Home
echo about: Changelog
echo so: Signout
echo notify: Reminders
echo changen: Change reminder
echo clearn: Clear reminder
echo ignoren: Ignore reminder
echo sandy: SanDisk Secure Access
echo enc: EncryptStick
echo dm: Dim screen
echo bm: Bright screen
echo hca: High contrast A
echo hcb: High contrast B
echo folds: Folders
echo zlog: Copy log to clipboard
echo contact: Contact Addison Djatschenko
echo eject: Eject USB
echo bf: Open CMD in %~dp0
echo exitit: Exit program
echo xlog: View log
echo cpin: Change PIN
echo trashmanage: TrashManager
echo ibin: iBin
echo factoryreset: Reset USB.BAT
echo colorc: Change colour
echo cl: Clear warnings
echo temp: Temperature
echo cool: Cool down USB
echo remd: Remove need to sign in for today
echo ahh: Need to sign in today
echo cust: Custom commands
echo paths: Paths
echo newcust: New custom command
echo runcust: Run custom command
echo device: Change device name
echo executec: Execute custom command (after setting %%uo%%)
echo updates: Check for updates
echo switch: Switch USB.BAT USB
echo. 
echo That's all, apart from system and warning ones!
pause
goto cust

:switch
cls
set /p d= "Drive to switch to (single letter): "
"%d%:\USB.BAT"
exit

:newcust
cls
set /p runname= "Name of command: "
set /p l1= "Line 1 out of 4: "
set /p l2= "Line 2 out of 4: "
set /p l3= "Line 3 out of 4: "
set /p l4= "Line 4 out of 4: "
(
echo rem action "%runname%". 
echo %l1%
echo %l2%
echo %l3%
echo %l4%
)>"%~dp0USB_DAT\cmds\%runname%.bat"
echo Saved %runname% command. 
goto cust

:runcust
cls
set /p uo= "Name of command to run: "
call :executec
:executec
call "%~dp0USB_DAT\cmds\%uo%.bat"
echo Ran command %uo%. 
pause
goto ain