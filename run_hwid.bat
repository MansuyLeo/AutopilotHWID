:: Script batch pour obtenir le HWID par MANSUY Léo - Alternant TAM PSL - DSNU ASU IDF - e.SNCF Solutions

@echo off
setlocal

:: Vérification si le .bat est exécuté avec les droits administrateurs
net session >nul 2>&1
if %errorlevel% neq 0 (
    PowerShell -Command "Write-Host 'Relancement avec demande droits administrateurs...'"
    PowerShell -Command "Start-Process '%~0' -Verb RunAs"
    exit /b
)

:: Définir le répertoire courant (où run.bat est situé)
set "currentDir=%~dp0"

:: Définir le chemin du script PowerShell (situé dans le même répertoire que run_hwid.bat)
set "scriptPath=%currentDir%Get-WindowsAutoPilotInfo.ps1"

:: Définir le chemin du fichier de sortie (également dans le même répertoire que run_hwid.bat)
set "outputFile=%currentDir%AutoPilotHWID.csv"

:: Exécuter le script PowerShell avec l'argument -OutputFile
echo Lancement du script PowerShell Get-WindowsAutoPilotInfo...
powershell -ExecutionPolicy Bypass -File "%scriptPath%" -OutputFile "%outputFile%"

:: Vérifier si la commande PowerShell a réussi
if %ERRORLEVEL% neq 0 (
    PowerShell -Command Write-Host "Une erreur est survenue lors du lancement du script PowerShell Get-WindowsAutoPilotInfo." -ForegroundColor Red
    exit /b %ERRORLEVEL%
    pause
)

:: Vérifier si le fichier de sortie a été créé
if exist "%outputFile%" (
    PowerShell -Command "Write-Host '%outputFile% -> OK'" -ForeGroundColor Green
) else (
    PowerShell -Command "Write-Host 'Erreur lors de l'extraction du fichier AutoPilotHWID.csv'" -ForeGroundColor Red
    exit /b %ERRORLEVEL%
    pause
)

:: Pause pour garder la fenêtre ouverte après l'exécution
pause

endlocal
