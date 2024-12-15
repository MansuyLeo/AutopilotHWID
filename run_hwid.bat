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

echo.
echo ##############################################
echo #                                            #
echo #     SCRIPT D'OBTENTION DU HWID EN .CSV     #
echo #   Auteur: MANSUY Leo - Alternant TAM PSL   #
echo #              e.SNCF Solutions              #
echo #                                            #
echo ##############################################
echo.

:: Chemin du répertoire actuel
set "currentDir=%~dp0"

:: Chemin du script PowerShell (dans le même répertoire que le .bat)
set "scriptPath=%currentDir%Get-WindowsAutoPilotInfo.ps1"

:: Vérification si le script PowerShell existe
if not exist "%scriptPath%" (
    PowerShell -Command "Write-Host 'Le script Get-WindowsAutoPilotInfo.ps1 est introuvable, merci de copier le script Get-WindowsAutoPilotInfo.ps1 dans le dossier situé à l'emplacement du script run_hwid.bat' -ForegroundColor Red"
    echo.
    pause
    goto end
)

:: Chemin du fichier de sortie (dans le même répertoire que le .bat)
set "outputFile=%currentDir%AutoPilotHWID.csv"

:: Exécuter le script PowerShell avec l'argument -OutputFile
echo Lancement du script PowerShell Get-WindowsAutoPilotInfo...
PowerShell -ExecutionPolicy Bypass -File "%scriptPath%" -OutputFile "%outputFile%" >nul

if %ERRORLEVEL% neq 0 (
    PowerShell -Command "Write-Host 'Une erreur est survenue lors du lancement du script PowerShell Get-WindowsAutoPilotInfo' -ForegroundColor Red"
    echo.
    pause
    goto end
)

:: Vérification si le fichier de sortie a été créé
if exist "%outputFile%" (
    PowerShell -Command "Write-Host '%outputFile% -> Extraction du fichier AutoPilotHWID.csv OK' -ForegroundColor Green"
    echo.
) else (
    PowerShell -Command "Write-Host 'Erreur lors de l'extraction du fichier AutoPilotHWID.csv' -ForegroundColor Red"
    echo.
    pause
    goto end
)

pause

:end
endlocal
