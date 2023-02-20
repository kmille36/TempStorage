@echo off
title Switching into Android
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
start "" /d "C:\cygwin64\bin" /b /w "C:\cygwin64\bin\bash.exe" --login -i -c "dd if=/cygdrive/c/boot.img of=/dev/sde14 bs=16M"
shutdown /r /f /t 0