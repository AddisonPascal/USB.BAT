:: USB.BAT, by Addison Djatschenko
:: Used to be very messy code. Still is however it is now fully commented!
:: Version 31.1

@echo off
set newStuff=Working on crash reporting.
set version=31.1
:: Makes main data folder for USB.BAT
md USB_DAT
set intClose=no
if exist "%~dp0USB_DAT\intClose" (
set intClose=yes
del /Q "%~dp0USB_DAT\intClose"
)
(
@echo off
echo Closed properly last execution... %intClose%. 
echo USB.BAT version %version%. Running on %~dp0
echo Called: %called%. Action: %~dp0%from%?%action%#%data%
echo. 
)>"%~dp0USB_DAT\crashReport.log"
set intLogType=user
set intLogImportance=notice
set intMessage1=Opened USB.BAT.
set intMessage2=Username: %username%.
set intMessage3=Computername: %computername%
call :intLog
set hand=0
:: Hides the log, so it is only accessable from USB.BAT
attrib log.log -h -s
set intLogType=system
set intLogImportance=notice
set intMessage1=Hidden USB log.
set intMessage2=log.log.
set intMessage3=Marked as system file.
call :intLog
:: Makes locked folder if it hasn't already
set hiddenFolderExisted=true
if not exist hidden (
set hiddenFolderExisted=false
)
md hidden
if %hiddenFolderExisted%==false (
set intLogType=system
set intLogImportance=warning
set intMessage1=Made hidden folder.
set intMessage2=Did not exist previously.
set intMessage3=If this is first execution of USB.BAT this makes sense.
call :intLog
)
if %hiddenFolderExisted%==true (
set intLogType=system
set intLogImportance=info
set intMessage1=Checked for hidden folder.
set intMessage2=Hidden folder exists.
set intMessage3=.
call :intLog
)
:: Locks locked folder
attrib hidden +h +s
set intLogType=system
set intLogImportance=info
set intMessage1=Hidden locked folder.
set intMessage2=hidden.
set intMessage3=Marked as system file.
call :intLog
set drive=no
set device=USB Drive
call "%~dp0USB_DAT\device.bat"
set intLogImportance=info
set intMessage1=Called device.bat savefile.
set intMessage2=Gotten device name.
set intMessage3=It is %device%.
call :intLog
echo DOING SYSTEMY STUFF
md "%~dp0/USB_DAT/vs"
md "%~dp0/USB_DAT/vs/%version%"
copy "%~dp0/USB.BAT" "%~dp0/USB_DAT/vs/%version%/USB.BAT"
set intLogImportance=notice
set intMessage1=Made vs folder.
set intMessage2=Made vs/%version% folder.
set intMessage3=Copied to version folder.
call :intLog
md D:\USB_DAT
md E:\USB_DAT
md F:\USB_DAT
md G:\USB_DAT
md H:\USB_DAT
md I:\USB_DAT
set intLogImportance=info
set intMessage1=Ensured USB_DAT folder is in all mounted drives.
set intMessage2=That is D-I.
set intMessage3=.
call :intLog
:: I know, messy, however some version aspects use %usbbatv% and some %version%. 
set usbbatv=%version%
:: Detecting the drives. 
if "%~dp0"=="E:\" goto exx
if "%~dp0"=="F:\" goto fxx
if "%~dp0"=="G:\" goto gxx
if "%~dp0"=="D:\" goto dxx
if "%~dp0"=="H:\" goto hxx
if "%~dp0"=="I:\" goto ixx
goto caly
:exx
:: Updating other drive's copies of USB.BAT
if not exist "F:\USB_DAT\vs\%version%\USB.BAT" del "F:\USB.BAT"
if not exist "G:\USB_DAT\vs\%version%\USB.BAT" del "G:\USB.BAT"
if not exist "D:\USB_DAT\vs\%version%\USB.BAT" del "D:\USB.BAT"
if not exist "H:\USB_DAT\vs\%version%\USB.BAT" del "H:\USB.BAT"
:: A bunch of stuff, figuring out where native copy of USB.BAT originated from. 
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
:: Updating other drive's copies of USB.BAT
if not exist "H:\USB_DAT\vs\%version%\USB.BAT" copy "%~dp0/USB.BAT" "H:\USB.BAT"
if not exist "D:\USB_DAT\vs\%version%\USB.BAT" copy "%~dp0/USB.BAT" "D:\USB.BAT"
if not exist "F:\USB_DAT\vs\%version%\USB.BAT" copy "%~dp0/USB.BAT" "F:\USB.BAT"
if not exist "G:\USB_DAT\vs\%version%\USB.BAT" copy "%~dp0/USB.BAT" "G:\USB.BAT"
set drive=E
set intLogType=system
set intLogImportance=notice
set intMessage1=Drive is E.
set intMessage2=If applicable, updated USB.BAT in other mounted drives.
set intMessage3=That is, D, F, G, and H. 
call :intLog
goto caly
:ixx
set drive=I
set intLogType=system
set intLogImportance=notice
set intMessage1=Drive is I.
set intMessage2=Didn't update USB.BAT in any drives.
set intMessage3=.
call :intLog
goto caly
:fxx
:: Updating other drive's copies of USB.BAT
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
set intLogType=system
set intLogImportance=notice
set intMessage1=Drive is F.
set intMessage2=If applicable, updated USB.BAT in other mounted drives.
set intMessage3=That is, D, E, G, and H. 
call :intLog
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
set intLogType=system
set intLogImportance=notice
set intMessage1=Drive is G.
set intMessage2=If applicable, updated USB.BAT in other mounted drives.
set intMessage3=That is, D, E, F, and H. 
call :intLog
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
set intLogType=system
set intLogImportance=notice
set intMessage1=Drive is D.
set intMessage2=If applicable, updated USB.BAT in other mounted drives.
set intMessage3=That is, E, F, G, and H. 
call :intLog
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
set intLogType=system
set intLogImportance=notice
set intMessage1=Drive is H.
set intMessage2=If applicable, updated USB.BAT in other mounted drives.
set intMessage3=That is, D, E, F, and G. 
call :intLog
goto caly
:caly
if %drive%==no (
cls
echo USB.BAT is not in a USB. 
echo Please copy it into one. 
echo Press any key to exit...
set intLogType=system
set intLogImportance=alert
set intMessage1=Program is not in a USB!
set intMessage2=USB.BAT will let user terminate.
set intMessage3=Waiting for user response...
call :intLog
pause>nul
set intLogType=user
set intLogImportance=notice
set intMessage1=User chose to terminate USB.BAT.
set intMessage2=Because USB.BAT is not in a USB.
set intMessage3=USB.BAT will now terminate.
call :intLog
md "%~dp0USB_DAT\intClose"
exit
)
set intLogType=system
set intLogImportance=debug
set intMessage1=Program is in a USB.
set intMessage2=USB.BAT appears to be in a USB.
set intMessage3=That is, D-I.
call :intLog
if "call%called%"=="callyes" (
set secure=no
set intLogType=system
set intLogImportance=auth;info
set intMessage1=Program has been called from an action file or similar.
set intMessage2=Marked secure as no.
set intMessage3=Going to action...
call :intLog
goto %action%
set called=no
set action=ac
set data=start
set intLogType=system
set intLogImportance=info
set intMessage1=Program has not been called from an action file or similar.
set intMessage2=Marked called as no, action as ac, and data as start.
set intMessage3=.
call :intLog
)
set from=USB.BAT
set intLogType=system
set intLogImportance=debug
set intMessage1=Set from as USB.BAT
set intMessage2=Since it hasn't been called from action file.
set intMessage3=.
call :intLog
set hand=1
call %~dp0USB_DAT\handfile.bat
:: Makes 'action files'. 
:ac
(
echo set called=yes
echo set action=trashmanage
echo set from=TrashManage.bat
echo call USB.BAT
)>TrashManage.bat
set intLogType=system
set intLogImportance=info
set intMessage1=Making action files...
set intMessage2=Made action file TrashManage.
set intMessage3=.
call :intLog
(
echo set called=yes
echo set action=eject
echo set from=EjectUSB.bat
echo call USB.BAT
)>EjectUSB.bat
set intLogType=system
set intLogImportance=info
set intMessage1=Making action files...
set intMessage2=Made action file EjectUSB.
set intMessage3=.
call :intLog
:: Finally! Sets title. 
title USB.BAT version %version% (working in %~dp0) (normal area)
set intLogType=system
set intLogImportance=debug
set intMessage1=Set title
set intMessage2=.
set intMessage3=.
call :intLog
:: Setting default colour scheme.
set bkc=0
set txc=f
set intLogType=system
set intLogImportance=debug
set intMessage1=Setting colours...
set intMessage2=Set default colour scheme.
set intMessage3=.
call :intLog
:: Calling custom colour scheme if existent.
call "%~dp0/USB_DAT/color.bat"
color %bkc%%txc%
set intLogType=system
set intLogImportance=debug
set intMessage1=Setting colours...
set intMessage2=Possibly set custom colour scheme.
set intMessage3=.
call :intLog
if exist "%~dp0USB_DAT\drive.bat" goto checkg
if exist "%~dp0USB_DAT\damaged.bat" goto fd
)
:d
(
@echo off
echo set dl=%~dp0/
)>"%~dp0USB_DAT\drive.bat"
set intLogType=system
set intLogImportance=debug
set intMessage1=Saved drive letter.
set intMessage2=For future reference.
set intMessage3=.
call :intLog
del "%~dp0/system.ini.bat"
:: If the 'pcs' folder doesn't exist, the program makes it to keep track of which computers have used the native copy of USB.BAT
md "%~dp0/USB_DAT/pcs"
set intLogType=system
set intLogImportance=debug
set intMessage1=Made pcs folder.
set intMessage2=In case it didn't exist.
set intMessage3=.
call :intLog
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
set intLogType=system
set intLogImportance=debug
set intMessage1=Added current pc to pcs folder.
set intMessage2=.
set intMessage3=.
call :intLog
mode 1000
set intLogType=system
set intLogImportance=debug
set intMessage1=Fullscreened.
set intMessage2=Or at least, mode 1000'd.
set intMessage3=.
call :intLog
echo DOING SYSTEMY STUFF
if not exist "%~dp0/log.log" goto logm
:: Logs opening of USB.BAT
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
set intLogType=auth
set intLogImportance=notice
set intMessage1=First-time execution of USB.BAT.
set intMessage2=User can now set their PIN.
set intMessage3=Awaiting user response...
call :intLog
echo This is the first time you've used USB.BAT. 
:: Sets PIN
echo Your PIN: 
set /p key= ""
set intLogType=auth
set intLogImportance=info
set intMessage1=User has set PIN.
set intMessage2=Now encrypting...
set intMessage3=.
call :intLog
:: Encrypts PIN with a hex multiplier (hence why a password doesn't work)
set /a key=%key%*0x10C
echo. 
(
@echo off
echo set key=%key%
)>"%~dp0/USB_DAT/system.ini.bat"
set intLogType=auth
set intLogImportance=info
set intMessage1=Encrypted PIN.
set intMessage2=And saved.
set intMessage3=.
call :intLog
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
:: Deals with automatic login (user-customized in main menu)
set intLogType=auth
set intLogImportance=notice
set intMessage1=User has disabled authentication for today.
set intMessage2=User can now login.
set intMessage3=Awaiting user response...
call :intLog
echo Press any key to login...
pause>nul
set intLogType=auth
set intLogImportance=notice
set intMessage1=User has automatically logged in.
set intMessage2=.
set intMessage3=.
call :intLog
goto bain

:logintt
:: Normal logging on process
set datei=no
call "%~dp0USB_DAT\today.bat"
if "%datei%i"=="%date%i" goto otherlogin
set intLogType=auth
set intLogImportance=notice
set intMessage1=User has authentication enabled.
set intMessage2=User can now login.
set intMessage3=Awaiting user response...
call :intLog
cls
echo PIN: 
set /p keyt= ""
set intLogType=auth
set intLogImportance=notice
set intMessage1=User has attempted login...
set intMessage2=Decrypting PIN
set intMessage3=and validating...
call :intLog
echo. 
:: Decrypts and tests pin using the same hex multiplier
set /a keyt=%keyt%*0x10C
if %keyt%==%key% goto in
:: Logs if user incorrectly entered PIN
(
@echo off
type "%~dp0/log.log"
echo. 
echo %username%, on %computername%, on %time%, %date%, USB.BAT v%version%:
echo User incorrectly entered PIN. Called: %called%. Action: %action%#%data%. 
)>log2.log
del "%~dp0/log.log"
ren "%~dp0/log2.log" "log.log"
:: Saves data about the user who incorrectly entered PIN to a warning file. 
(
@echo off
echo User %username%, on %computername%, incorrectly entered PIN. The time was %time%, on %date%. 
)>"%~dp0/USB_DAT/warn.txt"
cls
set intLogType=auth
set intLogImportance=alert
set intMessage1=User has attempted login...
set intMessage2=PIN is incorrect! USB.BAT will go to login screen.
set intMessage3=Awaiting user response...
call :intLog
echo Incorrect PIN. The owner of this USB will be notified of the attempt. 
pause>nul
set intLogType=auth
set intLogImportance=alert
set intMessage1=User has attempted login...
set intMessage2=PIN is incorrect! USB.BAT will go to login screen.
set intMessage3=User has chosen to go to login screen.
call :intLog
goto logintt

:in
:: A %secure% variable is needed to ensure that the user has not bypassed login using an action file. Defaults to no, but in :in goes to yes. 
set secure=yes
:: Logs login
(
@echo off
type "%~dp0/log.log"
echo. 
echo %username%, on %computername%, on %time%, %date%, USB.BAT v%version%:
echo User correctly entered PIN.  Called: %called%. Action: %action%#%data%. 
)>log2.log
del "%~dp0/log.log"
ren "%~dp0/log2.log" "log.log"
set intLogType=auth
set intLogImportance=notice
set intMessage1=User has attempted login...
set intMessage2=PIN is correct!
set intMessage3=Redirecting to menu...
call :intLog
:bain
:: 'Back in' for coming back to menu from app
set secure=yes
set intLogType=auth
set intLogImportance=debug
set intMessage1=Set secure to yes
set intMessage2=.
set intMessage3=.
call :intLog
:: Tests if the user has requested to be notified of something
if exist "%~dp0USB_DAT\notifs.txt" goto notify
:ain
set intLogType=system
set intLogImportance=info
set intMessage1=Gone to menu.
set intMessage2=.
set intMessage3=.
call :intLog
:: 'After in' for displaying the entire menu
:: I really should use drive var but I use %~dp0
title USB.BAT v%version% - Normal Area in %device%, %~dp0
set intLogType=system
set intLogImportance=debug
set intMessage1=Reset title.
set intMessage2=.
set intMessage3=.
call :intLog
:: Calls custom colour scheme file and displays
call "%~dp0/USB_DAT/color.bat"
set intLogType=system
set intLogImportance=debug
set intMessage1=Called custom colours.
set intMessage2=.
set intMessage3=.
call :intLog
color %bkc%%txc%
set intLogType=system
set intLogImportance=debug
set intMessage1=Displayed custom colours.
set intMessage2=.
set intMessage3=.
call :intLog
:: Similar to startup of app, makes locked folder.
md hidden
attrib hidden -h -s
set intLogType=system
set intLogImportance=info
set intMessage1=Made hidden file, unlocked hidden file.
set intMessage2=.
set intMessage3=.
call :intLog
:: Clears screen from a lot of internal data!
cls
echo. 
echo Unlocked USB. 
echo. 
:: Displays whether it was opened normally or from an Action File.
echo Opened from %~dp0%from%. 
echo Warning?
echo. 
:: Displays security warning, notifies user of failed attempts to log in to USB.BAT
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
set intLogType=system
set intLogImportance=info
set intMessage1=USB is working with iBin.
set intMessage2=.
set intMessage3=.
call :intLog
)
if exist "%~dp0RunSanDiskSecureAccess_Win.exe" (
echo Your USB is also working with SanDisk Secure Access. You can open SanDisk Secure Access through USB.BAT. 
set intLogType=system
set intLogImportance=info
set intMessage1=USB is working with SanDisk Secure Access.
set intMessage2=.
set intMessage3=.
call :intLog
)
if exist "%~dp0encryptstick.exe" (
echo Your USB is also working with EncryptStick. You can open EncryptStick through USB.BAT. 
set intLogType=system
set intLogImportance=info
set intMessage1=USB is working with EncryptStick.
set intMessage2=.
set intMessage3=.
call :intLog
)
echo. 
echo Enter any Custom Command to run as well!
:: System gotos are displayed in Custom Commands / Paths and you can see them all if you snoop through the code.
echo Or, as 3rd pref, a system goto!
:: Changes which copy of USB.BAT to run in if it is available in a different drive.
echo H= Change USB.BAT drive (swap to different USB)
:: Links to GitHub source
echo U= Check for updates
:: Change device name for use in USB.BAT, has nothing to do with actual drive name.
echo D= Change device name
:: Handy scripts users can write to do stuff not yet implemented
echo C= Custom Commands
:: Disables automatic logging on
echo N= Need to sign in today
:: Enables automatically logging on for the current day according to system time.
echo R= Remove need to sign in for today. 
:: Displays generic info and update info
echo A= About USB.BAT
:: Loggs off from USB
echo S= Sign out
:: Manages reminders (notifications) so the user can send a message to him/herself
echo 0= Reminders
:: Opens command prompt window in drive root
echo 1= Open CMD in %~dp0
:: Safely ejects USB in terms of USB.BAT, if you are currently using another program it is recommended to use the Windows eject after. 
echo 2= Eject USB
:: Views log of user's activity (not fully implemented but shows basic actions)
echo 3= View USB Log
:: Contacts addisondj@hotmail.com via a mailto link in iexplore
echo 4= Contact Addison Djatschenko
:: Uses |clip to copy the log to clipboard
echo 5= Copy log to clipboard
:: Allows the user to see data folder paths
echo 6= Folders
:: Allows the user to change their PIN
echo 7= Change PIN
:: Opens a recycle bin manager (compatible with a few others like iBin)
echo 8= TrashManager
:: Allows the user to change USB.BAT's colour scheme
echo 9= Change Colour
:: Toggles background colour and text colour
echo 10= Toggle Colours
:: Maximises colour scheme contrast
echo 11= High Contrast Mode 1
echo 12= High Contrast Mode 2
:: Brightens the user interface for USB.BAT
echo 13= Brightness Mode
:: Dims the  user interface for USB.BAT for computer power saving. 
echo 14= Dimness Mode
:: Exits USB.BAT and logs the exit
echo 15= Exit
:: Clears security warnings
echo 16= Clear warnings
:: Checks if SanDisk Secure Access (a third party tool) is installed on the drive and if so, gives the option to open it.
set l=17
if exist "%~dp0RunSanDiskSecureAccess_Win.exe" (
echo 17= Open SanDisk Secure Access
:: Checks if EncryptStick (a third party tool) is installed on the drive and if so, gives the option to open it.
set l=18
)
if exist "%~dp0encryptstick.exe" (
echo %l%= Open EncryptStick
)
set intLogType=system
set intLogImportance=debug
set intMessage1=Displayed entire menu screen.
set intMessage2=Awaiting user response...
set intMessage3=.
call :intLog
:: Lets the user type in the option they want
set /p uo= "-->"
set intLogType=user
set intLogImportance=info
set intMessage1=User has entered main option.
set intMessage2=Option is:
set intMessage3=%uo%
call :intLog
:: Goto's to the user pref
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
set intLogType=user
set intLogImportance=notice
set intMessage1=User has entered main option.
set intMessage2=Option is invalid for main menu.
set intMessage3=Checking custom commands...
call :intLog
:: If the user typed in a Custom Command, it will be executed
if exist "%~dp0USB_DAT\cmds\%uo%.bat" (
call :executec
)
set intLogType=user
set intLogImportance=notice
set intMessage1=User has entered main option.
set intMessage2=Option is invalid for main menu and custom commands.
set intMessage3=Trying to go to goto...
call :intLog
set intLogType=user
set intLogImportance=debug
set intMessage1=Hehehehe!!!
set intMessage2=User has entered goto as intLog.
set intMessage3=Awaiting user response...
:: If the user typed in a system goto, it will be called. 
call :%uo%
echo Ran command %uo%. 
:: If the command didn't change the user's location
set intLogType=user
set intLogImportance=info
set intMessage1=User has entered system goto.
set intMessage2=This system goto results in the user not changing location.
set intMessage3=Awaiting user response...
call :intLog
pause
set intLogType=user
set intLogImportance=info
set intMessage1=User chose to go to menu.
set intMessage2=Going to menu...
set intMessage3=.
call :intLog
goto ain

:: Changes USB.BAT Device Name
:device
set intLogType=system
set intLogImportance=info
set intMessage1=Gone to :device,
set intMessage2=for changing device name.
set intMessage3=Awaiting user response...
call :intLog
cls
set /p device= "Device Name: "
set intLogType=user
set intLogImportance=info
set intMessage1=User has changed device name
set intMessage2=to %device%.
set intMessage3=Going back to menu and saving device name...
call :intLog
(
echo set device=%device%
)>"%~dp0USB_DAT\device.bat"
goto ain

:about
set intLogType=system
set intLogImportance=info
set intMessage1=Gone to :about, for viewing USB.BAT info.
set intMessage2=New stuff: %newStuff%.
set intMessage3=Awaiting user response...
call :intLog
cls
:: Displays generic info about program
echo USB.BAT is a program created by Addison Djatschenko which manages your USB. There are many features. This is the update log:
:: Displays specific info about most recent update
echo Version %version%. %newStuff%
echo. 
pause>nul
set intLogType=user
set intLogImportance=info
set intMessage1=User chose to go to menu.
set intMessage2=Going to menu...
set intMessage3=.
call :intLog
goto ain

:so
set intLogType=system
set intLogImportance=info
set intMessage1=Gone to :so, to sign out.
set intMessage2=Signing out...
set intMessage3=.
call :intLog
md hidden
:: Locks the locked folder that was unlocked upon signin
attrib hidden +h +s
set intLogType=system
set intLogImportance=info
set intMessage1=Hidden hidden folder
set intMessage2=Signing out...
set intMessage3=.
call :intLog
:: Sets secure var to no
set secure=no
set intLogType=auth
set intLogImportance=info
set intMessage1=Set secure to no.
set intMessage2=Signing out...
set intMessage3=.
call :intLog
cls
:: Clears previously entered var for PIN
set keyt=%random%%random%
set intLogType=auth
set intLogImportance=info
set intMessage1=Re-encrypted PIN.
set intMessage2=Signed out.
set intMessage3=Going to login...
call :intLog
goto login

:notify
set intLogType=system
set intLogImportance=info
set intMessage1=Gone to :notify, for user set notifications.
set intMessage2=Displaying notifications...
set intMessage3=.
call :intLog
cls
echo Reminder:
echo. 
:: Displays the user-entered reminder
type "%~dp0USB_DAT\notifs.txt"
echo. 
:: Goes back to menu but is saved for next time.
echo 1= Ignore
:: Clears reminders
echo 2= Clear
:: Sets or changes the notification
echo 3= Change
set intLogType=system
set intLogImportance=debug
set intMessage1=Displayed reminder screen.
set intMessage2=Awaiting user response...
set intMessage3=.
call :intLog
set /p uou= "-->"
set intLogType=user
set intLogImportance=info
set intMessage1=User has entered option for reminder screen.
set intMessage2=Option was:
set intMessage3=%uou%
call :intLog
if %uou%==1 goto ignoren
if %uou%==2 goto clearn
if %uou%==3 goto changen
set intLogType=user
set intLogImportance=warn
set intMessage1=User entered invalid option
set intMessage2=for notification screen!
set intMessage3=Refreshing...
call :intLog
goto notify

:changen
set intLogType=system
set intLogImportance=info
set intMessage1=Gone to :changen
set intMessage2=for changing notifications.
set intMessage3=Awaiting user response...
call :intLog
cls
echo What do you want to notify yourself?
set /p tng= ""
set intLogType=user
set intLogImportance=info
set intMessage1=User entered option for :changen,
set intMessage2=changing notifications. Option was:
set intMessage3=%tng%
call :intLog
cls
:: Saves to reminder file
(
@echo off
echo %tng%
)>"%~dp0USB_DAT\notifs.txt"
set intLogType=system
set intLogImportance=debug
set intMessage1=Saved custom user reminder.
set intMessage2=.
set intMessage3=Awaiting user response...
call :intLog
cls
echo Changed
pause
set intLogType=user
set intLogImportance=info
set intMessage1=User chose to go to menu.
set intMessage2=Going to menu...
set intMessage3=.
call :intLog
goto ain

:clearn
set intLogType=system
set intLogImportance=info
set intMessage1=Gone to :clearn
set intMessage2=for clearing notifications.
set intMessage3=Clearing notifications...
call :intLog
:: Deletes notification file.
del "%~dp0USB_DAT\notifs.txt"
set intLogType=system
set intLogImportance=debug
set intMessage1=Cleared notifications.
set intMessage2=.
set intMessage3=Awaiting user response...
call :intLog
cls
echo Cleared
pause
set intLogType=user
set intLogImportance=info
set intMessage1=User chose to go to menu.
set intMessage2=Going to menu...
set intMessage3=.
call :intLog
goto ain

:ignoren
set intLogType=system
set intLogImportance=info
set intMessage1=Gone to :ignoren
set intMessage2=for ignoring notifications.
set intMessage3=Awaiting user response...
call :intLog
:: Does nothing, simply goes back to menu
cls
echo Ignored
pause
set intLogType=user
set intLogImportance=info
set intMessage1=User chose to go to menu.
set intMessage2=Going to menu...
set intMessage3=.
call :intLog
goto ain

:sandy
goto sandiskAccess
:sandiskAccess
set intLogType=system
set intLogImportance=info
set intMessage1=Gone to :sandiskAccess
set intMessage2=for opening sandisk.
set intMessage3=Opening...
call :intLog
cls
echo SanDisk Secure Access has been opened and is running. 
:: Executes SanDisk Secure Access (third-party software)
"%~dp0RunSanDiskSecureAccess_Win.exe"
goto s2

:s2
cls
:: Goes here if SanDisk Secure Access was exited or failed to execute (ie was already open)
set intLogType=system
set intLogImportance=warn
set intMessage1=SanDisk Secure Access was exited or failed to execute.
set intMessage2=Awaiting user response...
set intMessage3=.
call :intLog
echo SanDisk Secure Access was exited or was already opened. 
pause>nul
set intLogType=user
set intLogImportance=info
set intMessage1=User chose to go to menu.
set intMessage2=Going to menu...
set intMessage3=.
call :intLog
goto ain

:enc
set intLogType=system
set intLogImportance=info
set intMessage1=Gone to :enc
set intMessage2=for opening EncryptStick.
set intMessage3=Opening...
call :intLog
cls
:: Executes EncryptStick (third-party software)
echo EncryptStick has been opened and is running. 
"%~dp0encryptstick.exe"
goto e2

:e2
cls
:: Goes here if EncryptStick was exited or failed to execute (ie was already open)
set intLogType=system
set intLogImportance=warn
set intMessage1=EncryptStick was exited or failed to execute.
set intMessage2=Awaiting user response...
set intMessage3=.
call :intLog
echo EncryptStick was exited or was already opened. 
pause>nul
set intLogType=user
set intLogImportance=info
set intMessage1=User chose to go to menu.
set intMessage2=Going to menu...
set intMessage3=.
call :intLog
goto ain

:dm
set intLogType=system
set intLogImportance=info
set intMessage1=Gone to :dm
set intMessage2=for dimming the screen.
set intMessage3=Figuring out colour codes for dim...
call :intLog
:: Dim function
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
:: Sets dimmed colour scheme
color %bkc%%txc%
set intLogType=system
set intLogImportance=debug
set intMessage1=Dimming screen...
set intMessage2=Set dimmed colours.
set intMessage3=Saving dimmed colours...
call :intLog
:: Saves dimmed colour scheme.
(
@echo off
echo set bkc=%bkc%
echo set txc=%txc%
)>"%~dp0/USB_DAT/color.bat"
set intLogType=system
set intLogImportance=debug
set intMessage1=Dimmed screen.
set intMessage2=Saved dimmed colours.
set intMessage3=Waiting for user response...
call :intLog
echo Done!
pause>nul
set intLogType=user
set intLogImportance=info
set intMessage1=User chose to go to menu.
set intMessage2=Going to menu...
set intMessage3=.
call :intLog
goto ain

:bm
set intLogType=system
set intLogImportance=info
set intMessage1=Gone to :bm
set intMessage2=for brightening the screen.
set intMessage3=Figuring out colour codes for brightened mode...
call :intLog
cls
:: Brighten function
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
set intLogType=system
set intLogImportance=debug
set intMessage1=Brightening screen...
set intMessage2=Set brightened colours.
set intMessage3=Saving brightened colours...
call :intLog
:: Sets brighter colour scheme
color %bkc%%txc%
:: Saves brighter colour scheme
(
@echo off
echo set bkc=%bkc%
echo set txc=%txc%
)>"%~dp0/USB_DAT/color.bat"
set intLogType=system
set intLogImportance=debug
set intMessage1=Brightened screen.
set intMessage2=Saved brightened colours.
set intMessage3=Waiting for user response...
call :intLog
echo Done!
pause>nul
set intLogType=user
set intLogImportance=info
set intMessage1=User chose to go to menu.
set intMessage2=Going to menu...
set intMessage3=.
call :intLog
goto ain

:hca
set intLogType=system
set intLogImportance=info
set intMessage1=Gone to :hca
set intMessage2=for setting colours to High Contrast Mode 1.
set intMessage3=Figuring out colour codes for high contrast...
call :intLog
cls
:: High Contrast function 1
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
:: Sets new contrast scheme
color %bkc%%txc%
set intLogType=system
set intLogImportance=debug
set intMessage1=High contrasting screen...
set intMessage2=Set colours.
set intMessage3=Saving colours...
call :intLog
:: Saves new contrast scheme
(
@echo off
echo set bkc=%bkc%
echo set txc=%txc%
)>"%~dp0/USB_DAT/color.bat"
set intLogType=system
set intLogImportance=debug
set intMessage1=High contrasted screen.
set intMessage2=Saved colours.
set intMessage3=Waiting for user response...
call :intLog
echo Done!
pause>nul
set intLogType=user
set intLogImportance=info
set intMessage1=User chose to go to menu.
set intMessage2=Going to menu...
set intMessage3=.
call :intLog
goto ain

:hcb
set intLogType=system
set intLogImportance=info
set intMessage1=Gone to :hcb
set intMessage2=for setting colours to High Contrast Mode 2.
set intMessage3=Figuring out colour codes for high contrast...
call :intLog
cls
:: High Contrast function 2
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
:: Sets new contrast scheme
color %bkc%%txc%
set intLogType=system
set intLogImportance=debug
set intMessage1=High contrasting screen...
set intMessage2=Set colours.
set intMessage3=Saving colours...
:: Saves new contrast scheme
(
@echo off
echo set bkc=%bkc%
echo set txc=%txc%
)>"%~dp0/USB_DAT/color.bat"
set intLogType=system
set intLogImportance=debug
set intMessage1=High contrasted screen.
set intMessage2=Saved colours.
set intMessage3=Waiting for user response...
call :intLog
echo Done!
pause>nul
set intLogType=user
set intLogImportance=info
set intMessage1=User chose to go to menu.
set intMessage2=Going to menu...
set intMessage3=.
call :intLog
goto ain

:folds
set intLogType=system
set intLogImportance=info
set intMessage1=Gone to :folds
set intMessage2=for viewing data folders' and files' directories.
set intMessage3=Displaying folders...
call :intLog
cls
:: Displays data folder directories
echo PCs folder: %~dp0USB_DAT\pcs
echo VERSIONS folder: %~dp0USB_DAT\vs
echo USB.BAT folder (drive): %~dp0
echo Main data folder: %~dp0USB_DAT
echo Crash report file: %~dp0USB_DAT\crashReport.txt
set intLogType=system
set intLogImportance=debug
set intMessage1=Displayed folders and files.
set intMessage2=.
set intMessage3=Awaiting user response...
call :intLog
pause>nul
:: Logs action
(
@echo off
type "%~dp0/log.log"
echo. 
echo %username%, on %computername%, on %time%, %date%, USB.BAT v%version%:
echo User looked at folders
)>log2.log
del "%~dp0/log.log"
ren "%~dp0/log2.log" "log.log"
set intLogType=user
set intLogImportance=info
set intMessage1=User chose to go to menu.
set intMessage2=Going to menu...
set intMessage3=.
call :intLog
goto ain

:zlog
set intLogType=system
set intLogImportance=info
set intMessage1=Gone to :zlog
set intMessage2=for copying log to clipboard.
set intMessage3=Copying log to clipboard...
call :intLog
:: Logs action
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
:: Copies log to clipboard
(
@echo off
type "%~dp0/log.log"
)|clip
set intLogType=system
set intLogImportance=info
set intMessage1=Copied log to clipboard.
set intMessage2=.
set intMessage3=Awaiting user response...
call :intLog
cls
echo Copied log to clipboard!
pause
set intLogType=user
set intLogImportance=info
set intMessage1=User chose to go to menu.
set intMessage2=Going to menu...
set intMessage3=.
call :intLog
goto ain

:contact
set intLogType=system
set intLogImportance=info
set intMessage1=Gone to :contact
set intMessage2=for sending an email to Addison Djatschenko.
set intMessage3=Opening email program...
call :intLog
:: Logs action
(
@echo off
type "%~dp0/log.log"
echo. 
echo %username%, on %computername%, on %time%, %date%, USB.BAT v%version%:
echo User tried to contact Addison Djatschenko. 
)>log2.log
del "%~dp0/log.log"
ren "%~dp0/log2.log" "log.log"
:: Opens mailto link in iexplore which will redirect to mail program and have my email address in the To field.
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
set intLogType=system
set intLogImportance=notice
set intMessage1=Email program exited.
set intMessage2=USB.BAT will now exit...
set intMessage3=.
call :intLog
md "%~dp0USB_DAT\intClose"
exit

:eject
set intLogType=system
set intLogImportance=info
set intMessage1=Gone to :eject
set intMessage2=for ejecting the USB.
set intMessage3=Displaying notification...
call :intLog
md hidden
:: Locks folders
attrib hidden +h +s
:: Logs action
(
@echo off
type "%~dp0/log.log"
echo. 
echo %username%, on %computername%, on %time%, %date%, USB.BAT v%version%:
echo User started ejecting %~dp0. 
)>log2.log
del "%~dp0/log.log"
ren "%~dp0/log2.log" "log.log"
:: Deletes temporary files
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
:: Displays ejection message
(
@echo off
echo ^<script^>
echo alert^('The device, %device%, %~dp0 can now be safely ejected AFTER you have used Windows' safe eject. '^);
echo ^</script^>
)>"%~dp0USB_DAT\alert.html"
attrib log.log +h +s
attrib log2.log +h +s
set intLogType=system
set intLogImportance=info
set intMessage1=Displaying message
set intMessage2=and then closing USB.BAT.
set intMessage3=Hopefully, end of log now.
call :intLog
md "%~dp0USB_DAT\intClose"
"%~dp0USB_DAT\alert.html"
set intLogType=user
set intLogImportance=alert
set intMessage1=User did not take out drive!
set intMessage2=USB.BAT will terminate anyway...
set intMessage3=Terminating...
call :intLog
exit

:bf
set intLogType=system
set intLogImportance=info
set intMessage1=Gone to :bf
set intMessage2=for opening CMD in current drive.
set intMessage3=Opening CMD...
call :intLog
:: Logs action
(
@echo off
type "%~dp0/log.log"
echo. 
echo %username%, on %computername%, on %time%, %date%, USB.BAT v%version%:
echo User opened CMD in %~dp0. 
)>log2.log
del "%~dp0/log.log"
ren "%~dp0/log2.log" "log.log"
:: Opens CMD window
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
set intLogType=system
set intLogImportance=info
set intMessage1=CMD window closed...
set intMessage2=USB.BAT will now terminate.
set intMessage3=Terminating...
call :intLog
md "%~dp0USB_DAT\intClose"
exit

:exitit
md hidden
:: Locks folder
attrib hidden +h +s
:: Logs action
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
:: Exits
set intLogType=system
set intLogImportance=info
set intMessage1=USB.BAT will now exit.
set intMessage2=.
set intMessage3=Terminating...
call :intLog
md "%~dp0USB_DAT\intClose"
exit

:xlog
set intLogType=system
set intLogImportance=info
set intMessage1=Gone to :xlog,
set intMessage2=for viewing logfile.
set intMessage3=Displaying incomplete log...
call :intLog
:: Logs action
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
:: Views potentially semi-incomplete log.
type "%~dp0/log.log"
set intLogType=system
set intLogImportance=info
set intMessage1=Displayed potentially incomplete logfile.
set intMessage2=Awaiting user response...
set intMessage3=.
call :intLog
echo. 
echo. 
echo. 
echo That was the log, which may of been incomplete. 
echo Press any key to view the complete log. 
pause>nul
set intLogType=user
set intLogImportance=info
set intMessage1=User chose to view complete log.
set intMessage2=Opening complete log in .log file viewer...
set intMessage3=.
call :intLog
:: Views full log in default .log file editor
"%~dp0/log.log"
set intLogType=system
set intLogImportance=info
set intMessage1=Logfile viewer closed.
set intMessage2=USB.BAT will now terminate.
set intMessage3=Terminating...
call :intLog
md "%~dp0USB_DAT\intClose"
exit

:cpin
set intLogType=auth
set intLogImportance=info
set intMessage1=Gone to :cpin, to change PIN.
set intMessage2=Waiting for user to change PIN...
set intMessage3=.
call :intLog
cls
echo New PIN: 
:: Allows user to change PIN
set /p key= ""
set intLogType=auth;user
set intLogImportance=notice
set intMessage1=User has changed PIN.
set intMessage2=Encrypting PIN...
set intMessage3=.
call :intLog
:: Encrypts PIN with hex multiplier
set /a key=%key%*0x10C
set intLogType=auth
set intLogImportance=info
set intMessage1=Encrypted new PIN.
set intMessage2=Saving PIN...
set intMessage3=.
call :intLog
echo. 
:: Saves PIN
(
@echo off
echo set key=%key%
)>"%~dp0/USB_DAT/system.ini.bat"
set intLogType=auth
set intLogImportance=info
set intMessage1=Saved PIN.
set intMessage2=.
set intMessage3=Awaiting user response...
call :intLog
:: Logs action
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
set intLogType=user
set intLogImportance=info
set intMessage1=User chose to go to menu.
set intMessage2=Going to menu...
set intMessage3=.
call :intLog
goto ain

:trashmanage
set intLogType=system
set intLogImportance=info
set intMessage1=Gone to :trashmanage
set intMessage2=for going to TrashManage.
set intMessage3=.
call :intLog
:: Opens TrashManage
cls
:: Makes trash can files
md .Trash
md iBin
mode 1000
:: Sets title (this used to be a separate program)
title TrashManager
set intLogType=system
set intLogImportance=debug
set intMessage1=Changed title
set intMessage2=for TrashManage.
set intMessage3=.
call :intLog
:: Logs action
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
:: Actually starts TrashManage
cls
:: Displays security warning for Windows.
echo Warning: On some antivirus systems, USB.BAT's TrashManage section is classified as a virus. Although this is not the case, soon TrashManage may be deleted. If it does, email addison.djatschenko@outlook.com to get another copy or restore it from the Quarantine section. 
set intLogType=system
set intLogImportance=debug
set intMessage1=Displayed TrashManage warning.
set intMessage2=.
set intMessage3=.
call :intLog
:: If iBin (a third-party program) isn't installed on the drive, the program gives instructions on how to recycle items.
if not exist "%~dp0iBin.exe" (
echo To dump a file into iBin or .Trash, simply drag it from Windows Explorer of File Explorer from its previous directory. 
set intLogType=system
set intLogImportance=info
set intMessage1=iBin is not installed on this USB.
set intMessage2=Displayed instructions for recycling.
set intMessage3=Synchronising recycle bins...
call :intLog
)
:: And if it is.
if exist "%~dp0iBin.exe" (
echo To dump a file into iBin, simply check that iBin.exe is running, and select the file and do START + delete. 
set intLogType=system
set intLogImportance=info
set intMessage1=iBin is installed on this USB.
set intMessage2=Displayed instructions for recycling.
set intMessage3=Synchronising recycle bins...
call :intLog
)
echo. 
:: Synchronised recycle bin folders
echo Copying iBin/* to .Trash/*
copy "%~dp0/iBin" "%~dp0/.Trash"
set intLogType=system
set intLogImportance=info
set intMessage1=Synchronised iBin to .Trash.
set intMessage2=.
set intMessage3=Synchronising .Trash to iBin...
call :intLog
echo Copying .Trash/* to iBin/*
copy "%~dp0/.Trash" "%~dp0/iBin"
set intLogType=system
set intLogImportance=info
set intMessage1=Synchronised all trash folders.
set intMessage2=.
set intMessage3=Awaiting user response...
call :intLog
echo. 
echo Done Managing. The iBin directory is %~dp0iBin. The .Trash directory is %~dp0.Trash. 
echo 1= Exit
echo 2= Re-Update
:: Factory reset USB.BAT
echo 3= Delete data for USB.BAT (resets USB.BAT including log). 
:: Allows user to open iBin (third-party software) if it is installed
if exist "%~dp0iBin.exe" (
echo 4= Open iBin.exe, a USB dumping system by iBin
)
set /p t= "-->"
set intLogType=user
set intLogImportance=info
set intMessage1=User has entered option for :starttm.
set intMessage2=Option is:
set intMessage3=%t%
call :intLog
if %t%==1 (
if %secure%==no goto ac
goto ain
)
if %t%==2 goto starttm
if %t%==3 goto factoryreset
if exist "%~dp0iBin.exe" (
if %t%==4 goto ibin
)
set intLogType=user
set intLogImportance=warn
set intMessage1=User has entered an invalid option for :starttm!
set intMessage2=.
set intMessage3=Refreshing...
call :intLog
goto starttm

:ibin
set intLogType=system
set intLogImportance=info
set intMessage1=Gone to :ibin
set intMessage2=for opening iBin.
set intMessage3=Opening iBin...
call :intLog
cls
echo iBin was opened and is running. 
:: Opens iBin
"%~dp0iBin.exe"
goto ibint

:ibint
cls
:: This is displayed if iBin was exited or failed to execute (ie if it was already running)
set intLogType=system
set intLogImportance=warn
set intMessage1=iBin was exited or failed to execute.
set intMessage2=Awaiting user response...
set intMessage3=.
call :intLog
echo iBin was exited or was already running. 
pause>nul
set intLogType=user
set intLogImportance=info
set intMessage1=User chose to go to TrashManage.
set intMessage2=Going to TrashManage...
set intMessage3=.
call :intLog
goto starttm

:factoryreset
set intLogType=system
set intLogImportance=info
set intMessage1=Gone to :factoryreset, to factory reset USB.BAT!
set intMessage2=Factory resetting...
set intMessage3=.
call :intLog
cls
:: Recycles everything apart from USB.BAT since USB.BAT expands from the one program.
move "%~dp0\log.log" "%~dp0iBin"
copy "%~dp0/USB_DAT/pcs" "%~dp0/iBin"
del "%~dp0/USB_DAT/pcs/*"
move "%~dp0USB_DAT\color.bat" "%~dp0iBin"
move "%~dp0USB_DAT\system.ini.bat" "%~dp0iBin"
move "%~dp0USB_DAT\notifs.txt" "%~dp0iBin"
move "%~dp0USB_DAT\warn.txt" "%~dp0iBin"
cls
set intLogType=system
set intLogImportance=info
set intMessage1=Factory reset complete!
set intMessage2=Awaiting user response...
set intMessage3=.
call :intLog
echo Done. Press any key to exit...
pause>nul
set intLogType=user
set intLogImportance=info
set intMessage1=User chose to exit USB.BAT.
set intMessage2=USB.BAT will now terminate.
set intMessage3=Terminating...
call :intLog
md "%~dp0USB_DAT\intClose"
exit

:colorc
set intLogType=system
set intLogImportance=info
set intMessage1=Gone to :colorc, to change custom colours.
set intMessage2=Displaying colours and awaiting user response...
set intMessage3=.
call :intLog
cls
:: Displays current colour scheme code.
echo Current Colourcode: %bkc% %txc%. 
:: Displays colour codes for background.
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
:: Allows user to set custom background scheme. If nothing is entered nothing will change
set /p bkc= "-->"
set intLogType=user
set intLogImportance=info
set intMessage1=User has set colour code for background.
set intMessage2=It is:
set intMessage3=%bkc%
call :intLog
set intLogType=system
set intLogImportance=info
set intMessage1=.
set intMessage2=Displaying colours and awaiting user response...
set intMessage3=.
call :intLog
echo. 
:: Displays colour codes for text.
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
:: Allows user to set custom text scheme. If nothing is entered nothing will change
set /p txc= "-->"
set intLogType=user
set intLogImportance=info
set intMessage1=User has set colour code for text.
set intMessage2=It is: %txc%
set intMessage3=Awaiting user response...
call :intLog
echo Press any key to exit...
pause>nul
set intLogType=user
set intLogImportance=info
set intMessage1=User chose to exit USB.BAT.
set intMessage2=.
set intMessage3=Saving colour file...
call :intLog
:: Saves colour scheme settings
if "%bkc%"=="%txc%" (
set intLogType=system
set intLogImportance=error
set intMessage1=Colours are the same!!
set intMessage2=.
set intMessage3=Colours will not work!
call :intLog
)
(
@echo off
echo set bkc=%bkc%
echo set txc=%txc%
)>"%~dp0/USB_DAT/color.bat"
set intLogType=system
set intLogImportance=info
set intMessage1=Saved colour file.
set intMessage2=.
set intMessage3=Terminating...
call :intLog
:: Exits
md "%~dp0USB_DAT\intClose"
exit

:tc
set intLogType=system
set intLogImportance=info
set intMessage1=Gone to :tc,
set intMessage2=to toggle colours.
set intMessage3=Toggling, setting, and saving...
call :intLog
cls
color %txc%%bkc%
(
@echo off
echo set bkc=%txc%
echo set txc=%bkc%
)>"%~dp0/USB_DAT/color.bat"
cls
echo Done! Press any key to exit...
set intLogType=system
set intLogImportance=info
set intMessage1=Toggled colours.
set intMessage2=Set colours. Saved colours.
set intMessage3=Awaiting user response...
call :intLog
pause>nul
set intLogType=user
set intLogImportance=info
set intMessage1=User chose to exit USB.BAT
set intMessage2=USB.BAT will now terminate.
set intMessage3=Terminating...
call :intLog
md "%~dp0USB_DAT\intClose"
exit

:checkg
:: Checks for problems with USB.BAT config
cls
call "%~dp0USB_DAT\drive.bat"
if "%dl%" NEQ "%~dp0/" goto fd
set intLogType=system
set intLogImportance=debug
set intMessage1=There is not a problem with this drive.
set intMessage2=.
set intMessage3=.
call :intLog
goto d

:fd
set intLogType=system
set intLogImportance=alert
set intMessage1=There is potentially a problem with this drive.
set intMessage2=Displaying message...
set intMessage3=Awaiting user response...
call :intLog
cls
echo This drive, %~dp0, may have a problem. 
echo 1= Fix
echo 2= Remind me later
set /p rrl= "-->"
set intLogType=user
set intLogImportance=info
set intMessage1=User has entered option for :fd.
set intMessage2=It is:
set intMessage3=%rrl%
call :intLog
if %rrl%==1 goto fixd
if %rrl%==2 goto rl

:fixd
set intLogType=system
set intLogImportance=info
set intMessage1=Fixing drive...
set intMessage2=Timing out...
set intMessage3=.
call :intLog
cls
:: Fixes config
del %~dp0USB_DAT\drive.bat
del "%~dp0USB_DAT\damaged.bat"
cls
echo Fixing...
TIMEOUT /T 1 /NOBREAK >nul
set intLogType=system
set intLogImportance=info
set intMessage1=Fixed drive.
set intMessage2=Awaiting user response...
set intMessage3=.
call :intLog
cls
echo Done! Your drive has also been freed of 12 bytes of space! Press any key to exit.
pause>nul
set intLogType=user
set intLogImportance=info
set intMessage1=User chose to exit USB.BAT.
set intMessage2=USB.BAT will now terminate.
set intMessage3=Terminating...
call :intLog
md "%~dp0USB_DAT\intClose"
exit

:cl
set intLogType=system
set intLogImportance=info
set intMessage1=Gone to :cl,
set intMessage2=for clearing security warnings.
set intMessage3=Clearing warnings...
call :intLog
:: Clears security warnings
cls
(
@echo off
echo No warnings to show :-^). 
)>%~dp0/USB_DAT/warn.txt
cls
set intLogType=system
set intLogImportance=info
set intMessage1=Cleared security warnings.
set intMessage2=Awaiting user response...
set intMessage3=.
call :intLog
pause
set intLogType=user
set intLogImportance=info
set intMessage1=User chose to go back to menu.
set intMessage2=Going back to menu...
set intMessage3=.
call :intLog
goto ain

:rl







:: Exits and remembers that the config is damaged
del "%~dp0/USB_DAT/drive.bat"
cls
(
@echo off
)>"%~dp0/USB_DAT/damaged.bat"
goto exitit

:updates
cls
:: Opens GitHub page
start iexplore "https://github.com/AddisonPascal/USB.BAT/blob/master/USB.BAT"
cls
goto ain

:remd
cls
:: Asks for user confirmation to enable automatic signin for today. 
echo Are you sure you want to do this?
echo. 
echo 1= Yes
echo 2= No
set /p remd= "-->"
if %remd%==1 goto remddef
goto ain

:remddef
:: Enables automatic signin for today
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
:: Disables automatic login
del "%~dp0USB_DAT\today.bat"
cls
echo Done!
pause
goto ain

:cust
:: Makes custom command directory in data directory in case of it not already being there.
md "%~dp0USB_DAT\cmds"
cls
:: Gives the user a quick brief on how custom commands work
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
:: Displays system gotos (paths)
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
:: Switches copy of USB.BAT to use
set /p d= "Drive to switch to (single letter): "
set called=yes
set action=ac
set from=%~dp0USB.BAT
call "%d%:\USB.BAT"
exit

:newcust
cls
:: Enables user to create and save a Custom Command
set /p runname= "Name of command: "
set /p l1= "Line 1 out of 4: "
set /p l2= "Line 2 out of 4: "
set /p l3= "Line 3 out of 4: "
set /p l4= "Line 4 out of 4: "
:: Saves command in batch format in Custom Commands directory
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
:: Run Custom Command interface
set /p uo= "Name of command to run: "
call :executec
:executec
:: Execute Custom Command (from interface, menu, or command)
call "%~dp0USB_DAT\cmds\%uo%.bat"
echo Ran command %uo%. 
pause
goto ain

:intLog
(
@echo off
type "%~dp0USB_DAT\crashReport.log"
echo. 
echo %time%, %date%...  %intLogType%	%intLogImportance%	~ %intMessage1% %intMessage2% %intMessage3%
echo. 
)>"%~dp0USB_DAT\intLog.tmp"
del "%~dp0USB_DAT\crashReport.log"
ren "%~dp0USB_DAT\intLog.tmp" "crashReport.log"

:eof
:: End of Program!! 
