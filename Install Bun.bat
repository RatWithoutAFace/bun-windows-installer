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

echo Installing WSL... 
timeout /T 1
wsl --install -d Ubuntu -n 

timeout /T 3
cls

echo Installing Bun... 
timeout /T 1
ubuntu run "curl -fsSL https://bun.sh/install | bash"

PAUSE
cls

choice /C:YN /M:"Install VSCode and Remote Development Pack? [Y/N]"
IF ERRORLEVEL ==1 goto vsc
IF ERRORLEVEL ==2 goto next1
goto next1

:vsc
winget install -e --id Microsoft.VisualStudioCode
code --install-extension ms-vscode-remote.vscode-remote-extensionpack
goto next1

:next1
PAUSE
cls
echo You have installed Bun on WSL!

choice /C:YN /M:"Open VSCode on WSL? [Y/N]"
IF ERRORLEVEL ==1 goto open
IF ERRORLEVEL ==2 goto next 2
goto next2

:open
ubuntu run "code ."
goto next2

:next2
start https://bun.sh/docs
start https://ratwithaface.com/bun-installer/thank-you.html

rem @RatWithAFace