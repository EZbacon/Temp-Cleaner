@echo off
title Auto Cleaner
setlocal enabledelayedexpansion

:: Check for administrator privileges
net session >nul 2>&1
if errorlevel 1 (
    powershell -Command "Start-Process '%~0' -Verb RunAs"
    exit /b
)

:: Delete %temp% folder contents
rd /s /q "%temp%" >nul 2>&1
mkdir "%temp%" >nul 2>&1

:: Delete system temp folder contents
rd /s /q "C:\Windows\Temp" >nul 2>&1
mkdir "C:\Windows\Temp" >nul 2>&1

:: Delete prefetch folder contents
rd /s /q "C:\Windows\Prefetch" >nul 2>&1
mkdir "C:\Windows\Prefetch" >nul 2>&1


exit
