@echo off
cd /d %~dp0

echo Cleaning up...
if exist out rmdir /s /q out
if exist bin rmdir /s /q bin

echo Generating HL/C output...
haxe hl-c.hxml
if %ERRORLEVEL% neq 0 exit /b 1
echo.

:: add --verbose for more info
haxelib run hlc-compiler --srcDir out\c --outDir bin --saveCmd out\compile_hlc.bat --exFile C:\Windows\System32\dbghelp.dll --copyRuntimeFiles --runtime res -w -mwindows
echo.
