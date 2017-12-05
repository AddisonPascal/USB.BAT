:: USB.BAT, by Addison Djatschenko
:: Used to be very messy code. Still is however it is now fully commented!
:: Version 30.3

@echo off
set newStuff=Working on crash reporting.
set version=30.3
set hand=0
:: Hides the log, so it is only accessable from USB.BAT
attrib log.log -h -s
:: Makes locked folder if it hasn't already
md hidden
:: Locks locked folder
attrib hidden +h +s
set drive=no
set device=USB Drive
call "%~dp0USB_DAT\device.bat"
echo DOING SYSTEMY STUFF
:: Makes main data folder for USB.BAT
md USB_DAT
md "%~dp0/USB_DAT/vs"
md "%~dp0/USB_DAT/vs/%version%"
copy "%~dp0/USB.BAT" "%~dp0/USB_DAT/vs/%version%/USB.BAT"
md D:\USB_DAT
md E:\USB_DAT
md F:\USB_DAT
md G:\USB_DAT
md H:\USB_DAT
md I:\USB_DAT
:: I know, messy, however some version aspects use %usbbatv% and some %version%. 
set usbbatv=%version%
:: Detecting the drives. 
if "%~dp0"=="E:\" goto exx
if %~dp0==F:\ goto fxx
if %~dp0==G:\ goto gxx
if %~dp0==D:\ goto dxx
if %~dp0==H:\ goto hxx
if %~dp0==I:\ goto ixx
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
goto caly
:ixx
set drive=I
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
:: Makes 'action files'. 
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
:: Finally! Sets title. 
title USB.BAT version %version% (working in %~dp0) (normal area)
:: Setting default colour scheme.
set bkc=0
set txc=f
:: Calling custom colour scheme if existent.
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
:: If the 'pcs' folder doesn't exist, the program makes it to keep track of which computers have used the native copy of USB.BAT
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
:: This section actually doesn't work.
if %drive%==no (
cls
echo USB.BAT is not in a USB. 
echo Please copy it into one. 
pause>nul
exit
)
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
echo This is the first time you've used USB.BAT. 
:: Sets PIN
echo Your PIN: 
set /p key= ""
:: Encrypts PIN with a hex multiplier (hence why a password doesn't work)
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
:: Deals with automatic login (user-customized in main menu)
echo Press any key to login...
pause>nul
goto bain

:logintt
:: Normal logging on process
set datei=no
call "%~dp0USB_DAT\today.bat"
if "%datei%i"=="%date%i" goto otherlogin
if "%username%%data%"=="%username%exit" exit
cls
echo PIN: 
set /p keyt= ""
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
echo Incorrect PIN. The owner of this USB will be notified of the attempt. 
pause>nul
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
:bain
:: 'Back in' for coming back to menu from app
set secure=yes
:: Tests if the user has requested to be notified of something
if exist "%~dp0USB_DAT\notifs.txt" goto notify
:ain
:: 'After in' for displaying the entire menu
:: I really should use drive var but I use %~dp0
title USB.BAT v%version% - Normal Area in %device%, %~dp0
:: Calls custom colour scheme file and displays
call "%~dp0/USB_DAT/color.bat"
color %bkc%%txc%
:: Similar to startup of app, makes locked folder.
md hidden
attrib hidden -h -s
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
)
if exist "%~dp0RunSanDiskSecureAccess_Win.exe" (
echo Your USB is also working with SanDisk Secure Access. You can open SanDisk Secure Access through USB.BAT. 
)
if exist "%~dp0encryptstick.exe" (
echo Your USB is also working with EncryptStick. You can open EncryptStick through USB.BAT. 
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
:: Lets the user type in the option they want
set /p uo= "-->"
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
:: If the user typed in a Custom Command, it will be executed
if exist "%~dp0USB_DAT\cmds\%uo%.bat" (
call :executec
)
:: If the user typed in a system goto, it will be called. 
goto %uo%
echo Ran command %uo%. 
:: If the command didn't change the user's location
pause
goto ain

:: Changes USB.BAT Device Name
:device
cls
set /p device= "Device Name: "
(
echo set device=%device%
)>"%~dp0USB_DAT\device.bat"
goto ain

:about
cls
:: Displays generic info about program
echo USB.BAT is a program created by Addison Djatschenko which manages your USB. There are many features. This is the update log:
:: Displays specific info about most recent update
echo Version %version%. %newStuff%
echo. 
pause>nul
goto ain

:so
md hidden
:: Locks the locked folder that was unlocked upon signin
attrib hidden +h +s
:: Sets secure var to no
set secure=no
cls
:: Clears previously entered var for PIN
set keyt=%random%%random%
goto login

:notify
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
:: Saves to reminder file
(
@echo off
echo %tng%
)>"%~dp0USB_DAT\notifs.txt"
cls
echo Changed
pause
goto ain

:clearn
:: Deletes notification file.
del "%~dp0USB_DAT\notifs.txt"
cls
echo Cleared
pause
goto ain

:ignoren
:: Does nothing, simply goes back to menu
cls
echo Ignored
pause
goto ain

:sandy
cls
echo SanDisk Secure Access has been opened and is running. 
:: Executes SanDisk Secure Access (third-party software)
"%~dp0RunSanDiskSecureAccess_Win.exe"
goto s2

:s2
cls
:: Goes here if SanDisk Secure Access was exited or failed to execute (ie was already open)
echo SanDisk Secure Access was exited or was already opened. 
pause>nul
goto ain

:enc
cls
:: Executes EncryptStick (third-party software)
echo EncryptStick has been opened and is running. 
"%~dp0encryptstick.exe"
goto e2

:e2
cls
:: Goes here if EncryptStick was exited or failed to execute (ie was already open)
echo EncryptStick was exited or was already opened. 
pause>nul
goto ain

:dm
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
:: Saves dimmed colour scheme.
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
:: Sets brighter colour scheme
color %bkc%%txc%
:: Saves brighter colour scheme
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
:: Saves new contrast scheme
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
:: Saves new contrast scheme
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
:: Displays data folder directories
echo PCs folder: %~dp0USB_DAT\pcs
echo VERSIONS folder: %~dp0USB_DAT\vs
echo USB.BAT folder (drive): %~dp0
echo Log folder: %~dp0
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
goto ain

:zlog
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
exit

:eject
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
"%~dp0USB_DAT\alert.html"
exit

:bf
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
exit

:xlog
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
echo. 
echo. 
echo. 
echo That was the log, which may of been incomplete. 
echo Press any key to view the complete log. 
pause>nul
:: Views full log in default .log file editor
"%~dp0/log.log"
exit

:cpin
cls
echo New PIN: 
:: Allows user to change PIN
set /p key= ""
:: Encrypts PIN with hex multiplier
set /a key=%key%*0x10C
echo. 
:: Saves PIN
(
@echo off
echo set key=%key%
)>"%~dp0/USB_DAT/system.ini.bat"
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
goto ain
ren "%~dp0/log2.log" "log.log"

:trashmanage
:: Opens TrashManage
cls
:: Makes trash can files
md .Trash
md iBin
mode 1000
:: Sets title (this used to be a separate program)
title TrashManager
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
:: If iBin (a third-party program) isn't installed on the drive, the program gives instructions on how to recycle items.
if not exist "%~dp0iBin.exe" (
echo To dump a file into iBin or .Trash, simply drag it from Windows Explorer of File Explorer from its previous directory. 
)
:: And if it is.
if exist "%~dp0iBin.exe" (
echo To dump a file into iBin, simply check that iBin.exe is running, and select the file and do START + delete. 
)
echo. 
:: Synchronised recycle bin folders
echo Copying iBin/* to .Trash/*
copy "%~dp0/iBin" "%~dp0/.Trash"
echo Copying .Trash/* to iBin/*
copy "%~dp0/.Trash" "%~dp0/iBin"
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
:: Opens iBin
"%~dp0iBin.exe"
goto ibint

:ibint
cls
:: This is displayed if iBin was exited or failed to execute (ie if it was already running)
echo iBin was exited or was already running. 
pause>nul
goto starttm

:factoryreset
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
echo Done. 
pause>nul
goto starttm

:colorc
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
pause
:: Saves colour scheme settings
(
@echo off
echo set bkc=%bkc%
echo set txc=%txc%
)>"%~dp0/USB_DAT/color.bat"
:: Exits
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
:: Checks for problems with USB.BAT config
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
:: Fixes config
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
:: Clears security warnings
cls
(
@echo off
echo No warnings to show :-^). 
)>%~dp0/USB_DAT/warn.txt
cls
pause
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
cls
(
type "%~dp0USB_DAT\crashReport.log"
echo. 
echo %time%, %date%, on %drive% - %device%, USB.BAT version %version%... Called: %called%. Action: %~dp0%from%?%action%#%data%...  %intLogType% %intLogImportance% %intMessage1% %intMessage2% %intMessage3%
echo. 
)>"%~dp0USB_DAT\intLog.tmp"
del "%~dp0USB_DAT\crashReport.log"
ren "%~dp0USB_DAT\intLog.tmp" "crashReport.log"

:eof
:: End of Program!! 
