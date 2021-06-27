:: **************************************
:: * Vulkan lib force install           *
:: * version 1                          *
:: * by Octanium91                      *
:: **************************************
@echo off
set "vlkFolder=%~dp0data\vlk"
:home
title=Vulkan lib force install
cls
echo.
echo   Force install Vulkan lib
echo.
set /p "version= Enter version (e.g. 1.2.162.0):"
echo.
if not exist "%vlkFolder%\%version%" goto verNotFound
echo  force install version: %version%
if exist "%systemroot%\system32" (
    echo  Copy libs in %systemroot%\system32
    if exist "%vlkFolder%\%version%\x86\vulkan-1.dll" copy /y "%vlkFolder%\%version%\x86\vulkan-1.dll" "%systemroot%\system32\vulkan-1.dll"
    if exist "%vlkFolder%\%version%\x86\vulkan-1-999-0-0-0.dll" copy /y "%vlkFolder%\%version%\x86\vulkan-1-999-0-0-0.dll" "%systemroot%\system32\vulkan-1-999-0-0-0.dll"
    if exist "%vlkFolder%\%version%\x86\vulkaninfo.exe" copy /y "%vlkFolder%\%version%\x86\vulkaninfo.exe" "%systemroot%\system32\vulkaninfo.exe"
    if exist "%vlkFolder%\%version%\x86\vulkaninfo-1-999-0-0-0.exe" copy /y "%vlkFolder%\%version%\x86\vulkaninfo-1-999-0-0-0.exe" "%systemroot%\system32\vulkaninfo-1-999-0-0-0.exe"
)
if exist "%systemroot%\SysWOW64" (
    echo  Copy libs in %systemroot%\SysWOW64
    if exist "%vlkFolder%\%version%\x64\vulkan-1.dll" copy /y "%vlkFolder%\%version%\x64\vulkan-1.dll" "%systemroot%\SysWOW64\vulkan-1.dll"
    if exist "%vlkFolder%\%version%\x64\vulkan-1-999-0-0-0.dll" copy /y "%vlkFolder%\%version%\x64\vulkan-1-999-0-0-0.dll" "%systemroot%\SysWOW64\vulkan-1-999-0-0-0.dll"
    if exist "%vlkFolder%\%version%\x64\vulkaninfo.exe" copy /y "%vlkFolder%\%version%\x64\vulkaninfo.exe" "%systemroot%\SysWOW64\vulkaninfo.exe"
    if exist "%vlkFolder%\%version%\x64\vulkaninfo-1-999-0-0-0.exe" copy /y "%vlkFolder%\%version%\x64\vulkaninfo-1-999-0-0-0.exe" "%systemroot%\SysWOW64\vulkaninfo-1-999-0-0-0.exe"
)
echo.
echo  Done!
echo.
pause
exit

:verNotFound
cls
echo.
echo  Ooops, version [%version%] not found!
echo.
pause
goto home