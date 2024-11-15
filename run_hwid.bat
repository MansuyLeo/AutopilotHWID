:: Script batch pour obtenir le HWID par MANSUY Léo - Alternant TAM PSL - DSNU ASU IDF - e.SNCF Solutions

:: Vérification si le .bat est exécuté avec les droits administrateurs
net session >nul 2>&1
if %errorlevel% neq 0 (
    PowerShell -Command "Write-Host 'Relancement avec demande droits administrateurs...'"
    PowerShell -Command "Start-Process '%~0' -Verb RunAs"
    exit /b
)

@echo off
setlocal

:: Définir le répertoire courant (où run.bat est situé)
set "currentDir=%~dp0"

:: Définir le chemin du script PowerShell (situé dans le même répertoire que run.bat)
set "scriptPath=%currentDir%Get-WindowsAutoPilotInfo.ps1"

:: Définir le chemin du fichier de sortie (également dans le même répertoire que run.bat)
set "outputFile=%currentDir%AutoPilotHWID.csv"

:: Exécuter le script PowerShell avec l'argument -OutputFile
echo Execution du script PowerShell...
powershell -ExecutionPolicy Bypass -File "%scriptPath%" -OutputFile "%outputFile%"

:: Vérifier si la commande PowerShell a réussi
if %ERRORLEVEL% neq 0 (
    echo Une erreur est survenue lors de l'éxecution du script PowerShell.
    exit /b %ERRORLEVEL%
)

:: Vérifier si le fichier de sortie a été créé
if exist "%outputFile%" (
    echo Le fichier "%outputFile%" a été crée avec succès. -ForegroundColor Green
) else (
    echo Le fichier "%outputFile%" n'a pas été crée.
    exit /b 1
)

:: Pause pour garder la fenêtre ouverte après l'exécution
pause

endlocal
