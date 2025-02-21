@echo off
title Advanced System Cleaner
color 0A

:menu
cls
echo ==============================
echo      System Cleaner Menu      
echo ==============================
echo 1. Clean Temporary Files
echo 2. Clean Prefetch Files
echo 3. Clean Windows Logs
echo 4. Clean All (Full Cleanup)
echo 5. Exit
echo ==============================
choice /c 12345 /n /m "Select an option: "

if errorlevel 5 exit
if errorlevel 4 goto fullcleanup
if errorlevel 3 goto logs
if errorlevel 2 goto prefetch
if errorlevel 1 goto temp

:temp
echo Cleaning Temporary Files...
del /s /q "%temp%\*.*"
rd /s /q "%temp%"
md "%temp%"
echo Temp files cleaned!
pause
goto menu

:prefetch
echo Cleaning Prefetch Files...
del /s /q "C:\Windows\Prefetch\*.*"
echo Prefetch cleaned!
pause
goto menu

:logs
echo Cleaning Windows Log Files...
del /s /q "C:\Windows\Logs\*.*"
echo Log files cleaned!
pause
goto menu

:fullcleanup
echo Running Full System Cleanup...
call :temp
call :prefetch
call :logs
echo Full Cleanup Complete!
pause
goto menu