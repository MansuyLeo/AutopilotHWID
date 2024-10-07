@echo off
setlocal

REM Définir le répertoire courant (où run.bat est situé)
set "currentDir=%~dp0"

REM Définir le chemin du script PowerShell (situé dans le même répertoire que run.bat)
set "scriptPath=%currentDir%Get-WindowsAutoPilotInfo.ps1"

REM Définir le chemin du fichier de sortie (également dans le même répertoire que run.bat)
set "outputFile=%currentDir%AutoPilotHWID.csv"

REM Exécuter le script PowerShell avec l'argument -OutputFile
echo Execution du script PowerShell...
powershell -ExecutionPolicy Bypass -File "%scriptPath%" -OutputFile "%outputFile%"

REM Vérifier si la commande PowerShell a réussi
if %ERRORLEVEL% neq 0 (
    echo Une erreur est survenue lors de l'execution du script PowerShell.
    exit /b %ERRORLEVEL%
)

REM Vérifier si le fichier de sortie a été créé
if exist "%outputFile%" (
    echo Le fichier "%outputFile%" a ete cree avec succes.
) else (
    echo Le fichier "%outputFile%" n'a pas ete cree.
    exit /b 1
)

REM Pause pour garder la fenêtre ouverte après l'exécution
pause

endlocal


