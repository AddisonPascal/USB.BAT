:: USB.BAT, by Addison Djatschenko
:: Used to be very messy code. Still is however it is now fully commented!
:: Version 33.6

set execTime=%time%
@echo off
set newStuff=Simplified crash reporting and moved 'set execTime'
set version=33.6
set lastUpdated=08Jan19
set crashUpTo=0
if exist "%~dp0USB_DAT\warn.txt" goto warnExists
(
@echo off
echo No warnings to show :-^). 
)>"%~dp0/USB_DAT/warn.txt"
:warnExists
call "%~dp0USB_DAT\crashData.bat"
:: Makes main data folder for USB.BAT
md USB_DAT
md "%~dp0USB_DAT\crashes"
set intClose=no
if exist "%~dp0USB_DAT\intClose" (
set intClose=yes
rd "%~dp0USB_DAT\intClose" /s /q
)
if %intClose%==no (
ren "%~dp0USB_DAT\crashReport.log" "Crash report %crashUpTo%.log"
move "%~dp0USB_DAT\Crash report %crashUpTo%.log" "%~dp0USB_DAT\crashes"
set /a crashUpTo=%crashUpTo%+1
)
(
@echo off
echo set crashUpTo=%crashUpTo%
)>"%~dp0USB_DAT\crashData.bat"
(
@echo off
echo Closed properly last execution... %intClose%. 
echo Exact execution time: %execTime%.
echo USB.BAT version %version% - last updated %lastUpdated%. Running on %~dp0
echo Called: %called%. Action: %~dp0%from%?%action%#%data%
echo.
echo SYSTEM INFO:
systeminfo
echo. 
echo. 
vol
echo. 
wmic diskdrive get serialnumber
echo. 
)>"%~dp0USB_DAT\crashReport.log"
set intLogType=user
set intLogImportance=notice
set intMessage=Opened USB.BAT. Started crashReport. Username: %username%. Computername: %computername%
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
set intMessage=Made hidden folder which did not exist previously. If this is first execution of USB.BAT this makes sense.
call :intLog
)
if %hiddenFolderExisted%==true (
set intLogType=system
set intLogImportance=info
set intMessage=Checked for hidden folder. It exists.
call :intLog
)
:: Locks locked folder
attrib hidden +h +s
set intLogType=system
set intLogImportance=info
set intMessage=Hidden locked folder. Marked as system file.
call :intLog
set drive=no
set device=USB Drive
call "%~dp0USB_DAT\device.bat"
set intLogImportance=info
set intMessage=Called device.bat savefile. Gotten device name - it is %device%.
call :intLog
:: Detecting the drives. 
if "%~dp0"=="E:\" set drive=E
if "%~dp0"=="F:\" set drive=F
if "%~dp0"=="G:\" set drive=G
if "%~dp0"=="D:\" set drive=D
if "%~dp0"=="H:\" set drive=H
if "%~dp0"=="I:\" set drive=I
set intLogType=system
set intLogImportance=notice
set intMessage=Drive is %drive%. 
call :intLog
:caly
if %drive%==no (
cls
echo USB.BAT is not in a USB. 
echo Please copy it into one. 
echo Press any key to exit...
set intLogType=system
set intLogImportance=alert
set intMessage=Program is not in a USB! USB.BAT will let user terminate. Waiting for user response...
call :intLog
pause>nul
set intLogType=user
set intLogImportance=notice
set intMessage=User chose to terminate USB.BAT, because USB.BAT is not in a USB. USB.BAT will now terminate.
call :intLog
md "%~dp0USB_DAT\intClose"
exit
)
set intLogType=system
set intLogImportance=debug
set intMessage=Program is in a USB. That is, root folder D-I.
call :intLog
if "call%called%"=="callyes" (
set secure=no
set intLogType=system
set intLogImportance=auth
set intMessage=Program has been called from an action file or similar. Marked secure as no. Going to action...
call :intLog
goto %action%
set called=no
set action=ac
set data=start
set intLogType=system
set intLogImportance=info
set intMessage=Program has not been called from an action file or similar. Marked called as no, action as ac, and data as start.
call :intLog
)
set from=USB.BAT
set intLogType=system
set intLogImportance=debug
set intMessage=Set from as USB.BAT, since it hasn't been called from action file.
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
set intMessage=Making action files... Made action file TrashManage.
call :intLog
(
echo set called=yes
echo set action=eject
echo set from=EjectUSB.bat
echo call USB.BAT
)>EjectUSB.bat
set intLogType=system
set intLogImportance=info
set intMessage=Making action files... Made action file EjectUSB.
call :intLog
:: Finally! Sets title. 
title USB.BAT version %version% (working in %~dp0) (normal area)
set intLogType=system
set intLogImportance=debug
set intMessage=Set title.
call :intLog
:: Setting default colour scheme.
set bkc=0
set txc=f
set intLogType=system
set intLogImportance=debug
set intMessage=Setting colours... Set default colour scheme.
call :intLog
:: Calling custom colour scheme if existent.
call "%~dp0/USB_DAT/color.bat"
color %bkc%%txc%
set intLogType=system
set intLogImportance=debug
set intMessage=Setting colours... Possibly set custom colour scheme.
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
set intMessage=Saved drive letter, for future reference.
call :intLog
del "%~dp0/system.ini.bat"
:: If the 'pcs' folder doesn't exist, the program makes it to keep track of which computers have used the native copy of USB.BAT
md "%~dp0/USB_DAT/pcs"
set intLogType=system
set intLogImportance=debug
set intMessage=Made pcs folder, if it didn't exist.
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
set intMessage=Added current pc to pcs folder.
call :intLog
mode 1000
set intLogType=system
set intLogImportance=debug
set intMessage=Fullscreened.
call :intLog
echo DOING SYSTEMY STUFF

:ttt
if not exist "%~dp0/USB_DAT/system.ini.bat" goto ls
call "%~dp0/USB_DAT/system.ini.bat"
cls
goto login

:ls
cls
set intLogType=auth
set intLogImportance=notice
set intMessage=First-time execution of USB.BAT. User can now set their PIN. Awaiting user response...
call :intLog
echo This is the first time you've used USB.BAT. 
:: Sets PIN
echo Your PIN: 
set /p key= ""
set intLogType=auth
set intLogImportance=info
set intMessage=User has set PIN. Now encrypting...
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
set intMessage=Encrypted PIN and saved.
call :intLog
:login
goto logintt

:otherlogin
cls
:: Deals with automatic login (user-customized in main menu)
set intLogType=auth
set intLogImportance=notice
set intMessage=User has disabled authentication for today. User can now login. Awaiting user response...
call :intLog
echo Press any key to login...
pause>nul
set intLogType=auth
set intLogImportance=notice
set intMessage=User has automatically logged in.
call :intLog
goto bain

:logintt
:: Normal logging on process
set datei=no
call "%~dp0USB_DAT\today.bat"
if "%datei%i"=="%date%i" goto otherlogin
set intLogType=auth
set intLogImportance=notice
set intMessage=User has authentication enabled. User can now login. Awaiting user response...
call :intLog
cls
echo PIN: 
set /p keyt= ""
set intLogType=auth
set intLogImportance=notice
set intMessage=User has attempted login... Decrypting PIN and validating...
call :intLog
echo. 
:: Decrypts and tests pin using the same hex multiplier
set /a keyt=%keyt%*0x10C
if %keyt%==%key% goto in
:: Saves data about the user who incorrectly entered PIN to a warning file. 
(
@echo off
echo User %username%, on %computername%, incorrectly entered PIN. The time was %time%, on %date%. 
)>"%~dp0/USB_DAT/warn.txt"
cls
set intLogType=auth
set intLogImportance=alert
set intMessage=User has attempted login... PIN is incorrect! USB.BAT will go to login screen. Awaiting user response...
call :intLog
echo Incorrect PIN. The owner of this USB will be notified of the attempt. 
pause>nul
set intLogType=auth
set intLogImportance=alert
set intMessage=User has chosen to go to login screen.
call :intLog
goto logintt

:in
:: A %secure% variable is needed to ensure that the user has not bypassed login using an action file. Defaults to no, but in :in goes to yes. 
set secure=yes
set intLogType=auth
set intLogImportance=notice
set intMessage=User has attempted login... PIN is correct! Redirecting to menu...
call :intLog
:bain
:: 'Back in' for coming back to menu from app
set secure=yes
set intLogType=auth
set intLogImportance=debug
set intMessage=Set secure to yes.
call :intLog
:: Tests if the user has requested to be notified of something
if exist "%~dp0USB_DAT\notifs.txt" goto notify
:ain
set intLogType=system
set intLogImportance=info
set intMessage=Gone to menu.
call :intLog
:: 'After in' for displaying the entire menu
:: I really should use drive var but I use %~dp0
title USB.BAT v%version% - Normal Area in %device%, %~dp0
set intLogType=system
set intLogImportance=debug
set intMessage=Reset title.
call :intLog
:: Calls custom colour scheme file and displays
call "%~dp0/USB_DAT/color.bat"
set intLogType=system
set intLogImportance=debug
set intMessage=Called custom colours.
call :intLog
color %bkc%%txc%
set intLogType=system
set intLogImportance=debug
set intMessage=Displayed custom colours.
call :intLog
:: Similar to startup of app, makes locked folder.
md hidden
attrib hidden -h -s
set intLogType=system
set intLogImportance=info
set intMessage=Made hidden file, unlocked hidden file.
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
set intMessage=USB is working with iBin.
call :intLog
)
if exist "%~dp0RunSanDiskSecureAccess_Win.exe" (
echo Your USB is also working with SanDisk Secure Access. You can open SanDisk Secure Access through USB.BAT. 
set intLogType=system
set intLogImportance=info
set intMessage=USB is working with SanDisk Secure Access.
call :intLog
)
if exist "%~dp0encryptstick.exe" (
echo Your USB is also working with EncryptStick. You can open EncryptStick through USB.BAT. 
set intLogType=system
set intLogImportance=info
set intMessage=USB is working with EncryptStick.
call :intLog
)
echo. 
echo Enter any Custom Command to run as well!
:: System gotos are displayed in Custom Commands / Paths and you can see them all if you snoop through the code.
echo Or, as 3rd pref, a system goto!
:: Links to GitHub source
echo U= Check for updates
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
:: Locked folder
echo F= Open locked folder
:: Manages reminders (notifications) so the user can send a message to him/herself
echo 0= Reminders
:: Opens command prompt window in drive root
echo 1= Open CMD in %~dp0
:: Safely ejects USB in terms of USB.BAT, if you are currently using another program it is recommended to use the Windows eject after. 
echo 2= Eject USB
:: Change device name for use in USB.BAT, has nothing to do with actual drive name.
echo 3= Change device name
:: Contacts addisondj@hotmail.com via a mailto link in iexplore
echo 4= Contact Addison Djatschenko
:: Changes which copy of USB.BAT to run in if it is available in a different drive.
echo 5= Change USB.BAT drive (swap to different USB)
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
set intMessage=Displayed entire menu screen. Awaiting user response...
call :intLog
:: Lets the user type in the option they want
set /p uo= "-->"
set intLogType=user
set intLogImportance=info
set intMessage=User has entered main option. Option is: %uo%
call :intLog
:: Goto's to the user pref
if %uo%==5 goto switch
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
if %uo%==3 goto device
if %uo%==s goto so
if %uo%==S goto so
if %uo%==f goto lockedFolder
if %uo%==F goto lockedFolder
if %uo%==1 goto bf
if %uo%==2 goto eject
if %uo%==4 goto contact
if %uo%==15 goto exitit
if %uo%==0 goto notify
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
set intMessage=User has entered main option. Option is invalid for main menu. Checking custom commands...
call :intLog
:: If the user typed in a Custom Command, it will be executed
if exist "%~dp0USB_DAT\cmds\%uo%.bat" (
call :executec
)
set intLogType=user
set intLogImportance=notice
set intMessage=User has entered main option. Option is invalid for main menu and custom commands. Trying to go to goto...
call :intLog
set intLogType=user
set intLogImportance=debug
set intMessage=Hehehehe!!! User has entered goto as intLog. Awaiting user response...
:: If the user typed in a system goto, it will be called. 
call :%uo%
echo Ran command %uo%. 
:: If the command didn't change the user's location
set intLogType=user
set intLogImportance=info
set intMessage=User has entered system goto. This system goto results in the user not changing location. Awaiting user response...
call :intLog
pause
set intLogType=user
set intLogImportance=info
set intMessage=User chose to go to menu. Going to menu...
call :intLog
goto ain

:: Changes USB.BAT Device Name
:device
set intLogType=system
set intLogImportance=info
set intMessage=Gone to :device, for changing device name. Awaiting user response...
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

:lockedFolder
set intLogType=system
set intLogImportance=info
set intMessage=Gone to :lockedFolder, for opening the locked folder. Opening locked folder...
call :intLog
cls
explorer "%~dp0hidden"
set intLogType=system
set intLogImportance=info
set intMessage=Opened explorer. Going back to menu...
call :intLog
cls
goto ain

:about
set intLogType=system
set intLogImportance=info
set intMessage=Gone to :about, for viewing USB.BAT info. New stuff: %newStuff%. Awaiting user response...
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
set intMessage=User chose to go to menu. Going to menu...
call :intLog
goto ain

:so
set intLogType=system
set intLogImportance=info
set intMessage=Gone to :so, to sign out. Signing out...
call :intLog
md hidden
:: Locks the locked folder that was unlocked upon signin
attrib hidden +h +s
set intLogType=system
set intLogImportance=info
set intMessage=Hidden hidden folder. Signing out...
call :intLog
:: Sets secure var to no
set secure=no
set intLogType=auth
set intLogImportance=info.
set intMessage=Set secure to no. Signing out...
call :intLog
cls
:: Clears previously entered var for PIN
set keyt=%random%%random%
set intLogType=auth
set intLogImportance=info
set intMessage=Re-encrypted PIN. Signed out. Going to login...
call :intLog
goto login

:notify
set intLogType=system
set intLogImportance=info
set intMessage=Gone to :notify, for user set notifications. Displaying notifications...
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
set intMessage=Displayed reminder screen. Awaiting user response...
call :intLog
set /p uou= "-->"
set intLogType=user
set intLogImportance=info
set intMessage=User has entered option for reminder screen. Option was: %uou%
call :intLog
if %uou%==1 goto ignoren
if %uou%==2 goto clearn
if %uou%==3 goto changen
set intLogType=user
set intLogImportance=warn
set intMessage=User entered invalid option for notification screen! Refreshing...
call :intLog
goto notify

:changen
set intLogType=system
set intLogImportance=info
set intMessage=Gone to :changen for changing notifications. Awaiting user response...
call :intLog
cls
echo What do you want to notify yourself?
set /p tng= ""
set intLogType=user
set intLogImportance=info
set intMessage=User entered option for :changen, changing notifications. Option was: %tng%
call :intLog
cls
:: Saves to reminder file
(
@echo off
echo %tng%
)>"%~dp0USB_DAT\notifs.txt"
set intLogType=system
set intLogImportance=debug
set intMessage=Saved custom user reminder. Awaiting user response...
call :intLog
cls
echo Changed
pause
set intLogType=user
set intLogImportance=info
set intMessage=User chose to go to menu. Going to menu...
call :intLog
goto ain

:clearn
set intLogType=system
set intLogImportance=info
set intMessage=Gone to :clearn for clearing notifications. Clearing notifications...
call :intLog
:: Deletes notification file.
del "%~dp0USB_DAT\notifs.txt"
set intLogType=system
set intLogImportance=debug
set intMessage=Cleared notifications. Awaiting user response...
call :intLog
cls
echo Cleared
pause
set intLogType=user
set intLogImportance=info
set intMessage=User chose to go to menu. Going to menu...
call :intLog
goto ain

:ignoren
set intLogType=system
set intLogImportance=info
set intMessage=Gone to :ignoren for ignoring notifications. Awaiting user response...
call :intLog
:: Does nothing, simply goes back to menu
cls
echo Ignored
pause
set intLogType=user
set intLogImportance=info
set intMessage=User chose to go to menu. Going to menu...
call :intLog
goto ain

:sandy
goto sandiskAccess
:sandiskAccess
set intLogType=system
set intLogImportance=info
set intMessage=Gone to :sandiskAccess for opening sandisk. Opening...
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
set intMessage=SanDisk Secure Access was exited or failed to execute. Awaiting user response...
call :intLog
echo SanDisk Secure Access was exited or was already opened. 
pause>nul
set intLogType=user
set intLogImportance=info
set intMessage=User chose to go to menu. Going to menu...
call :intLog
goto ain

:enc
set intLogType=system
set intLogImportance=info
set intMessage=Gone to :enc for opening EncryptStick. Opening..
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
set intMessage=EncryptStick was exited or failed to execute. Awaiting user response...
call :intLog
echo EncryptStick was exited or was already opened. 
pause>nul
set intLogType=user
set intLogImportance=info
set intMessage=User chose to go to menu. Going to menu...
call :intLog
goto ain

:dm
set intLogType=system
set intLogImportance=info
set intMessage=Gone to :dm for dimming the screen. Figuring out colour codes for dim...
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
set intMessage=Dimming screen... Set dimmed colours. Saving dimmed colours...
call :intLog
:: Saves dimmed colour scheme.
(
@echo off
echo set bkc=%bkc%
echo set txc=%txc%
)>"%~dp0/USB_DAT/color.bat"
set intLogType=system
set intLogImportance=debug
set intMessage=Dimmed screen. Saved dimmed colours. Waiting for user response...
call :intLog
echo Done!
pause>nul
set intLogType=user
set intLogImportance=info
set intMessage=User chose to go to menu. Going to menu...
call :intLog
goto ain

:bm
set intLogType=system
set intLogImportance=info
set intMessage=Gone to :bm for brightening the screen. Figuring out colour codes for brightened mode...
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
set intMessage=Brightening screen... Set brightened colours. Saving brightened colours...
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
set intMessage=Brightened screen. Saved brightened colours. Waiting for user response...
call :intLog
echo Done!
pause>nul
set intLogType=user
set intLogImportance=info
set intMessage=User chose to go to menu. Going to menu...
call :intLog
goto ain

:hca
set intLogType=system
set intLogImportance=info
set intMessage=Gone to :hca for setting colours to High Contrast Mode 1. Figuring out colour codes for high contrast...
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
set intMessage=High contrasting screen... Set colours. Saving colours...
call :intLog
:: Saves new contrast scheme
(
@echo off
echo set bkc=%bkc%
echo set txc=%txc%
)>"%~dp0/USB_DAT/color.bat"
set intLogType=system
set intLogImportance=debug
set intMessage=High contrasted screen. Saved colours. Waiting for user response...
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
set intMessage=Gone to :hcb for setting colours to High Contrast Mode 2. Figuring out colour codes for high contrast...
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
set intMessage=High contrasting screen... Set colours. Saving colours...
:: Saves new contrast scheme
(
@echo off
echo set bkc=%bkc%
echo set txc=%txc%
)>"%~dp0/USB_DAT/color.bat"
set intLogType=system
set intLogImportance=debug
set intMessage=High contrasted screen. Saved colours. Waiting for user response...
call :intLog
echo Done!
pause>nul
set intLogType=user
set intLogImportance=info
set intMessage=User chose to go to menu. Going to menu...
call :intLog
goto ain

:folds
set intLogType=system
set intLogImportance=info
set intMessage=Gone to :folds for viewing data folders' and files' directories. Displaying folders...
call :intLog
cls
:: Displays data folder directories
echo PCs folder: %~dp0USB_DAT\pcs
echo USB.BAT folder (drive): %~dp0
echo Main data folder: %~dp0USB_DAT
echo Crash report file: %~dp0USB_DAT\crashReport.txt
set intLogType=system
set intLogImportance=debug
set intMessage=Displayed folders and files. Awaiting user response...
call :intLog
pause>nul
set intLogType=user
set intLogImportance=info
set intMessage=User chose to go to menu. Going to menu...
call :intLog
goto ain


:contact
set intLogType=system
set intLogImportance=info
set intMessage=Gone to :contact for sending an email to Addison Djatschenko. Opening email program...
call :intLog
:: Opens mailto link in iexplore which will redirect to mail program and have my email address in the To field.
start iexplore "mailto:addisondj@hotmail.com&subject=USB.BAT"
set intLogType=system
set intLogImportance=notice
set intMessage=Email program opened. USB.BAT will now exit...
call :intLog
attrib hidden +h +s
md "%~dp0USB_DAT\intClose"
exit

:eject
set intLogType=system
set intLogImportance=info
set intMessage=Gone to :eject for ejecting the USB. Displaying notification...
call :intLog
md hidden
:: Locks folders
attrib hidden +h +s
:: Deletes temporary files
del %~dp0USB_DAT\drive.bat
cls
echo. 
:: Displays ejection message
set intLogType=system
set intLogImportance=info
set intMessage=Displaying message and then closing USB.BAT. End of log now.
call :intLog
md "%~dp0USB_DAT\intClose"
RunDll32.exe shell32.dll,Control_RunDLL hotplug.dll
exit

:bf
set intLogType=system
set intLogImportance=info
set intMessage=Gone to :bf for opening CMD in current drive. Opening CMD...
call :intLog
:: Opens CMD window
start "%~dp0"
set intLogType=system
set intLogImportance=info
set intMessage=CMD window closed... USB.BAT will now terminate. Terminating...
call :intLog
md "%~dp0USB_DAT\intClose"
exit

:exitit
md hidden
:: Locks folder
attrib hidden +h +s
:: Exits
set intLogType=system
set intLogImportance=info
set intMessage=USB.BAT will now exit. Terminating...
call :intLog
md "%~dp0USB_DAT\intClose"
exit

:cpin
set intLogType=auth
set intLogImportance=info
set intMessage=Gone to :cpin, to change PIN. Waiting for user to change PIN...
call :intLog
cls
echo New PIN: 
:: Allows user to change PIN
set /p key= ""
set intLogType=auth;user
set intLogImportance=notice
set intMessage=User has changed PIN. Encrypting PIN...
call :intLog
:: Encrypts PIN with hex multiplier
set /a key=%key%*0x10C
set intLogType=auth
set intLogImportance=info
set intMessage=Encrypted new PIN. Saving PIN...
call :intLog
echo. 
:: Saves PIN
(
@echo off
echo set key=%key%
)>"%~dp0/USB_DAT/system.ini.bat"
set intLogType=auth
set intLogImportance=info
set intMessage=Saved PIN. Awaiting user response...
call :intLog
cls
echo Changed PIN. 
pause>nul
set intLogType=user
set intLogImportance=info
set intMessage=User chose to go to menu. Going to menu...
call :intLog
goto ain

:trashmanage
set intLogType=system
set intLogImportance=info
set intMessage=Gone to :trashmanage for going to TrashManage. 
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
set intMessage=Changed title for TrashManage.
call :intLog
goto starttm

:starttm
:: Actually starts TrashManage
cls
:: Displays security warning for Windows.
echo Warning: On some antivirus systems, USB.BAT's TrashManage section is classified as a virus. Although this is not the case, soon TrashManage may be deleted. If it does, email addison.djatschenko@outlook.com to get another copy or restore it from the Quarantine section. 
set intLogType=system
set intLogImportance=debug
set intMessage=Displayed TrashManage warning.
call :intLog
:: If iBin (a third-party program) isn't installed on the drive, the program gives instructions on how to recycle items.
if not exist "%~dp0iBin.exe" (
echo To dump a file into iBin or .Trash, simply drag it from Windows Explorer of File Explorer from its previous directory. 
set intLogType=system
set intLogImportance=info
set intMessage=iBin is not installed on this USB. Displayed instructions for recycling. Synchronising recycle bins...
call :intLog
)
:: And if it is.
if exist "%~dp0iBin.exe" (
echo To dump a file into iBin, simply check that iBin.exe is running, and select the file and do START + delete. 
set intLogType=system
set intLogImportance=info
set intMessage=iBin is installed on this USB. Displayed instructions for recycling. Synchronising recycle bins...
call :intLog
)
echo. 
:: Synchronised recycle bin folders
echo Copying iBin/* to .Trash/*
copy "%~dp0/iBin" "%~dp0/.Trash"
set intLogType=system
set intLogImportance=info
set intMessage=Synchronised iBin to .Trash. Synchronising .Trash to iBin...
call :intLog
echo Copying .Trash/* to iBin/*
copy "%~dp0/.Trash" "%~dp0/iBin"
set intLogType=system
set intLogImportance=info
set intMessage=Synchronised all trash folders. Awaiting user response...
call :intLog
echo. 
echo Done Managing. The iBin directory is %~dp0iBin. The .Trash directory is %~dp0.Trash. 
echo 1= Exit
echo 2= Re-Update
:: Allows user to open iBin (third-party software) if it is installed
if exist "%~dp0iBin.exe" (
echo 3= Open iBin.exe, a USB dumping system by iBin
)
set /p t= "-->"
set intLogType=user
set intLogImportance=info
set intMessage=User has entered option for :starttm. Option is: %t%
call :intLog
if %t%==1 (
if %secure%==no goto ac
goto ain
)
if %t%==2 goto starttm
if exist "%~dp0iBin.exe" (
if %t%==3 goto ibin
)
set intLogType=user
set intLogImportance=warn
set intMessage=User has entered an invalid option for :starttm! Refreshing...
call :intLog
goto starttm

:ibin
set intLogType=system
set intLogImportance=info
set intMessage=Gone to :ibin for opening iBin. Opening iBin...
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
set intMessage=iBin was exited or failed to execute. Awaiting user response...
call :intLog
echo iBin was exited or was already running. 
pause>nul
set intLogType=user
set intLogImportance=info
set intMessage=User chose to go to TrashManage. Going to TrashManage...
call :intLog
goto starttm

:colorc
set intLogType=system
set intLogImportance=info
set intMessage=Gone to :colorc, to change custom colours. Displaying colours and awaiting user response...
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
set intMessage=User has set colour code for background. It is: %bkc%
call :intLog
set intLogType=system
set intLogImportance=info
set intMessage=Displaying colours and awaiting user response...
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
set intMessage=User has set colour code for text. It is: %txc%. Awaiting user response...
call :intLog
echo Press any key to exit...
pause>nul
set intLogType=user
set intLogImportance=info
set intMessage=User chose to exit USB.BAT. Saving colour file...
call :intLog
:: Saves colour scheme settings
if "%bkc%"=="%txc%" (
set intLogType=system
set intLogImportance=error
set intMessage=Colours are the same!! Colours will not work!
call :intLog
)
(
@echo off
echo set bkc=%bkc%
echo set txc=%txc%
)>"%~dp0/USB_DAT/color.bat"
set intLogType=system
set intLogImportance=info
set intMessage=Saved colour file. Terminating...
call :intLog
:: Exits
md "%~dp0USB_DAT\intClose"
exit

:tc
set intLogType=system
set intLogImportance=info
set intMessage=Gone to :tc, to toggle colours. Toggling, setting, and saving...
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
set intMessage=Toggled colours. Set colours. Saved colours. Awaiting user response...
call :intLog
pause>nul
set intLogType=user
set intLogImportance=info
set intMessage=User chose to exit USB.BAT. USB.BAT will now terminate. Terminating...
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
set intMessage=There is not a problem with this drive.
call :intLog
goto d

:fd
set intLogType=system
set intLogImportance=alert
set intMessage=There is potentially a problem with this drive. Displaying message... Awaiting user response...
call :intLog
cls
echo This drive, %~dp0, may have a problem. 
echo 1= Fix
echo 2= Remind me later
set /p rrl= "-->"
set intLogType=user
set intLogImportance=info
set intMessage=User has entered option for :fd. It is: %rrl%
call :intLog
if %rrl%==1 goto fixd
if %rrl%==2 goto rl

:fixd
set intLogType=system
set intLogImportance=info
set intMessage=Fixing drive... Timing out...
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
set intMessage=Fixed drive. Awaiting user response...
call :intLog
cls
echo Done! Your drive has also been freed of 12 bytes of space! Press any key to exit.
pause>nul
set intLogType=user
set intLogImportance=info
set intMessage=User chose to exit USB.BAT. USB.BAT will now terminate. Terminating...
call :intLog
md "%~dp0USB_DAT\intClose"
exit

:cl
set intLogType=system
set intLogImportance=info
set intMessage=Gone to :cl, for clearing security warnings. Clearing warnings...
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
set intMessage=Cleared security warnings. Awaiting user response...
call :intLog
pause
set intLogType=user
set intLogImportance=info
set intMessage=User chose to go back to menu. Going back to menu...
call :intLog
goto ain

:rl
set intLogType=system
set intLogImportance=info
set intMessage1=Gone to :rl for reminding the user that the USB is damaged, later. Saving...
call :intLog
:: Exits and remembers that the config is damaged
del "%~dp0/USB_DAT/drive.bat"
cls
(
@echo off
)>"%~dp0/USB_DAT/damaged.bat"
set intLogType=system
set intLogImportance=info
set intMessage=Saved damaged.bat file. USB.BAT will now terminate. Terminating...
call :intLog
md "%~dp0USB_DAT\intClose"
exit

:updates
set intLogType=system
set intLogImportance=info
set intMessage=Gone to :updates, for going to the GitHub page to check for updates. Redirecting to GitHub page...
call :intLog
cls
:: Opens GitHub page
start iexplore "https://github.com/AddisonPascal/USB.BAT/blob/master/USB.BAT"
cls
set intLogType=system
set intLogImportance=info
set intMessage=Browser was opened. Redirecting to menu...
call :intLog
goto ain

:remd
set intLogType=system;auth
set intLogImportance=info
set intMessage=Gone to :remd, for removing need to sign in today. Awaiting user confirmation...
call :intLog
cls
:: Asks for user confirmation to enable automatic signin for today. 
echo Are you sure you want to do this?
echo. 
echo 1= Yes
echo 2= No
set /p remd= "-->"
if %remd%==1 goto remddef
set intLogType=system;auth
set intLogImportance=info
set intMessage=User decided not to enable automatic signin. Redirecting to menu...
call :intLog
goto ain

:remddef
set intLogType=auth
set intLogImportance=info
set intMessage=User decided to enable automatic signin. Enabling...
call :intLog
:: Enables automatic signin for today
cls
(
echo set datei=%date%
echo set userconfirm=%username%
)>"%~dp0USB_DAT\today.bat"
set intLogType=auth
set intLogImportance=info
set intMessage=Enabled automatic signin. It will expire the day after %date%. Awaiting user response...
call :intLog
goto cool

:cool
cls
echo Done!
echo It will expire tomorrow.
pause
set intLogType=user
set intLogImportance=info
set intMessage=User decided to go to menu. Going to menu...
call :intLog
goto ain

:ahh
set intLogType=auth
set intLogImportance=info
set intMessage=Gone to :ahh, to disable automatic login. Disabling...
call :intLog
:: Disables automatic login
del "%~dp0USB_DAT\today.bat"
set intLogType=auth
set intLogImportance=info
set intMessage=Disabled automatic login. Awaiting user response...
call :intLog
cls
echo Done!
pause
set intLogType=user
set intLogImportance=info
set intMessage=User decided to go to menu. Going to menu...
call :intLog
goto ain

:cust
set intLogType=system
set intLogImportance=info
set intMessage=Gone to :cust, to manage custom commands. Displaying menu and awaiting user response...
call :intLog
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
set intLogType=user
set intLogImportance=info
set intMessage=User entered option for :cust. It is: %cust%
call :intLog
if %cust%==1 goto newcust
if %cust%==2 goto runcust
if %cust%==3 goto paths
set intLogType=user
set intLogImportance=warn
set intMessage=User entered invalid option! Redirecting to menu...
goto ain

:paths
set intLogType=system
set intLogImportance=info
set intMessage=Gone to :paths, to view system gotos. Displaying paths and awaiting user response...
call :intLog
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
echo contact: Contact Addison Djatschenko
echo eject: Eject USB
echo bf: Open CMD in %~dp0
echo exitit: Exit program
echo cpin: Change PIN
echo trashmanage: TrashManager
echo ibin: iBin
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
set intLogType=user
set intLogImportance=info
set intMessage=User decided to go to custom command menu. Going there...
call :intLog
goto cust

:switch
set intLogType=system
set intLogImportance=info
set intMessage=Gone to :switch, to switch to another USB. Awaiting user response...
call :intLog
cls
:: Switches copy of USB.BAT to use
set /p d= "Drive to switch to (single letter): "
set intLogType=user
set intLogImportance=info
set intMessage=User entered drive to switch to. It is: %d%. Attempting to switch...
call :intLog
set called=yes
set action=ac
set from=%~dp0USB.BAT
md "%~dp0USB_DAT\intClose"
call "%d%:\USB.BAT"
set intLogType=system
set intLogImportance=info
set intMessage=USB.BAT closed in other drive, %d%. USB.BAT is terminating...
call :intLog
exit

:newcust
set intLogType=system
set intLogImportance=info
set intMessage=Gone to :newcust, to make a new Custom Command. Awaiting user entries...
call :intLog
cls
:: Enables user to create and save a Custom Command
set /p runname= "Name of command: "
set /p l1= "Line 1 out of 4: "
set /p l2= "Line 2 out of 4: "
set /p l3= "Line 3 out of 4: "
set /p l4= "Line 4 out of 4: "
set intLogType=user
set intLogImportance=info
set intMessage=User has entered new custom command. Name= %runname%. Line1= %l1%. Line2= %l2%. Line3= %l3%. Line4= %line4%. Saving command...
call :intLog
:: Saves command in batch format in Custom Commands directory
(
echo rem action "%runname%". 
echo %l1%
echo %l2%
echo %l3%
echo %l4%
)>"%~dp0USB_DAT\cmds\%runname%.bat"
set intLogType=system
set intLogImportance=info
set intMessage=Saved new custom command. Going to custom command menu...
call :intLog
goto cust

:runcust
set intLogType=system
set intLogImportance=info
set intMessage=Gone to :runcust, for running a custom command. Awaiting user to enter command to run...
call :intLog
cls
:: Run Custom Command interface
set /p uo= "Name of command to run: "
set intLogType=user
set intLogImportance=info
set intMessage=User has entered command to run. It is: %uo%. Executing command...
call :intLog
call :executec
:executec
:: Execute Custom Command (from interface, menu, or command)
call "%~dp0USB_DAT\cmds\%uo%.bat"
set intLogType=system
set intLogImportance=info
set intMessage=Ran command. Command was: %uo%. Awaiting user response...
call :intLog
echo Ran command %uo%. 
pause
set intLogType=user
set intLogImportance=info
set intMessage=User has decided to go to menu. Going to menu...
call :intLog
goto ain

:intLog
if exist USB_DAT goto usbDataExists
md USB_DAT
(
@echo off
echo Closed properly last execution... %intClose%. 
echo Exact execution time: %execTime%.
echo USB.BAT version %version% - last updated %lastUpdated%. Running on %~dp0
echo Called: %called%. Action: %~dp0%from%?%action%#%data%
echo.
echo SYSTEM INFO:
systeminfo
echo. 
echo. 
vol
echo. 
wmic diskdrive get serialnumber
echo. 
echo WARNING!
echo USB_DAT FOLDER WAS DELETED WHILST PROGRAM WAS RUNNING!
echo HERE IS ONLY WHAT FOLLOWED THAT:
)>"%~dp0USB_DAT\crashReport.log"
:usbDataExists
(
@echo off
type "%~dp0USB_DAT\crashReport.log"
echo. 
echo %time%, %date%...  %intLogType%	%intLogImportance%	~ %intMessage%
echo. 
)>"%~dp0USB_DAT\intLog.tmp"
del "%~dp0USB_DAT\crashReport.log"
ren "%~dp0USB_DAT\intLog.tmp" "crashReport.log"

:eof
:: End of Program!! 
