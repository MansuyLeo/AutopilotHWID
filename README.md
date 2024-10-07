# Script d'obtention du HWID pour Windows Autopilot (Intune)

Le script .bat utilise le script Get-WindowsAutopilotInfo.ps1 fourni par Microsoft pour exporter les données HWID (Numéro de série et hashage matériel) du PC dans un ficher .csv

## Instructions

1. Lancez "run.bat" en tant qu'administrateur (Get-WindowsAutopilotInfo.ps1 doit être dans le même dossier que le fichier .bat)
2. Le fichier "AutopilotHWID.csv" se générera dans le dossier du script. Vérifiez qu'il n'est pas vide.
   
Version tout public du script effectué dans le cadre de mon alternance à la SNCF pour les transformations d'un PC bureautique standard en PC Intune.
Script par MANSUY Léo. Contact: mansuy.leo.mz@gmail.com
