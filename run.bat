@echo off
setlocal

REM Define the current directory (where run.bat is located)
set "currentDir=%~dp0"

REM Define the path of the PowerShell script (located in the same directory as run.bat)
set "scriptPath=%currentDir%Get-WindowsAutoPilotInfo.ps1"

REM Define the output file path (also in the same directory as run.bat)
set "outputFile=%currentDir%AutoPilotHWID.csv"

REM Execute the PowerShell script with the argument -OutputFile
echo Execution du script PowerShell...
powershell -ExecutionPolicy Bypass -File "%scriptPath%" -OutputFile "%outputFile%"

REM Check if the PowerShell command was successful
if %ERRORLEVEL% neq 0 (
    echo Une erreur est survenue lors de l'execution du script PowerShell.
    exit /b %ERRORLEVEL%
)

REM Check if the output file was created
if exist "%outputFile%" (
    echo Le fichier "%outputFile%" a ete cree avec succes.
) else (
    echo Le fichier "%outputFile%" n'a pas ete cree.
    exit /b 1
)

REM Pause to keep the window open after execution
pause

endlocal

