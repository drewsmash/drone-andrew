echo=1/*>nul&@cls
@echo off
setlocal enableDelayedExpansion
::runas administrator
%1:start "" mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v "tello-install" /t REG_SZ /d "cmd.exe /c %~s0" /f
echo ------------------------------------------------------
echo                   Downloading python 3.10.0                  
echo ------------------------------------------------------
curl -L -O https://www.python.org/ftp/python/3.10.0/python-3.10.0-amd64.exe 



set install-path=%~dp0

 SET mypath=%~dp0
echo %mypath:~0,-1%
 
  start %mypath%\python-3.10.0-amd64.exe
echo ------------------------------------------------------
echo                   Downloading pip                    
echo ------------------------------------------------------
:downpip
 py -m pip install --upgrade pip
:downpipend
echo ------------------------------------------------------
echo                   Downloading opencv-python                   
echo ------------------------------------------------------
:downpip
 py -m pip install opencv-python 
:downpipend
echo ------------------------------------------------------
echo                   Downloading numpy                
echo ------------------------------------------------------
:downpip
py -m pip install numpy
:downpipend
echo ------------------------------------------------------
echo                   Downloading tello-python                   
echo ------------------------------------------------------
:downpip
 py -m pip install djitellopy
:downpipend
pause
exit