@echo off
title BUN INSTALLER
echo ----------------------------------------------------
echo Welcome to the Bun installer for Windows!
echo (Unofficial) Created by: @RatWithAFace
echo ----------------------------------------------------
echo --- /!\ PLEASE READ ALL /!\ ---
echo Unfortunately, Bun does not natively support Windows yet
echo so we have to use a workaround using Windows Subsystem for Linux.
echo ----------------------------------------------------
echo You may be installing:
echo Windows Subsystem for Linux (Ubuntu)
echo VSCode and Remote Development Pack (Optional)
echo Bun
echo ----------------------------------------------------
PAUSE
cls

echo Installing WSL... 
timeout /t 1 > nul
wsl --install -d Ubuntu -n 

PAUSE
cls

echo Installing Bun... 
timeout /t 1 > nul
ubuntu run "curl -fsSL https://bun.sh/install | bash"

PAUSE
cls

:choice1
set /P c=Install VSCode and Remote Development Pack [Y/N]? 
if /I "%c%" EQU "Y" goto :vsc
if /I "%c%" EQU "N" goto :next1
goto :choice1

:vsc
echo Installing VSCode...
timeout /t 1 > nul
winget install -e --id Microsoft.VisualStudioCode
timeout /t 3 > nul

echo Installing Remote Development Pack...
code --install-extension ms-vscode-remote.vscode-remote-extensionpack --force & PAUSE
goto :next1

:next1
cls
echo You have installed Bun on WSL!

:choice2
set /P c=Open VSCode in WSL [Y/N]? 
if /I "%c%" EQU "Y" goto :open
if /I "%c%" EQU "N" goto :next2
goto :choice2

:open
ubuntu run "code ."
goto next2

:next2
start https://bun.sh/docs
start https://ratwithaface.com/bun-installer/thank-you.html

rem @RatWithAFace