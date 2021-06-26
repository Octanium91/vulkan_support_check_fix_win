:: **************************************
:: * Vulkan lib support checker         *
:: * version 1                          *
:: * by Octanium91                      *
:: **************************************
@echo off
title=Vulkan lib support checker
if not exist "%~dp0data" goto dataNotFound
echo.
echo  Start check Vulkan versions?
echo.
pause

cls
echo.
echo.
set "vlkFolder=%~dp0data\vlk"
set "resultFolder=%~dp0data\result"
if exist "%resultFolder%" rmdir /s /q "%resultFolder%"
mkdir "%resultFolder%\s"
mkdir "%resultFolder%\ns"
IF "%PROCESSOR_ARCHITECTURE%"=="x86" (set "cpuArh=x86") else (set "cpuArh=x64")
for /f %%v in ('dir /b "%vlkFolder%"') do (
    title= Check version %%v
    cls
    echo.
    echo  Check version %%v
    for /f %%f in ('"%vlkFolder%\%%v\%cpuArh%\vulkaninfo.exe"') do (
        if "%%f" EQU "VULKANINFO" mkdir "%resultFolder%\s\%%v"
    )
    if not exist "%resultFolder%\s\%%v" mkdir "%resultFolder%\ns\%%v"
)
cls
title=Vulkan lib support checker : Result
echo.
echo   Result : on date %date% %time%
echo.
echo  Supported versions:
for /f %%v in ('dir /b "%resultFolder%\s"') do (
    echo   [ %%v ]
)
echo.
echo  Not Supported versions:
for /f %%v in ('dir /b "%resultFolder%\ns"') do (
    echo   [ %%v ]
)
rmdir /s /q "%resultFolder%"
echo.
pause
exit

:dataNotFound
title=Vulkan lib support checker : ERROR
echo.
echo  Ooops '.\data' folder not found!
echo.
pause
exit