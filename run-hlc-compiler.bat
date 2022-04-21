@echo off

:: add --verbose for more info
haxelib run hlc-compiler --srcDir out\c --outDir bin --saveCmd out\compile_hlc.bat --exFile C:\Windows\System32\dbghelp.dll --copyRuntimeFiles --runtime res -mwindows -w
