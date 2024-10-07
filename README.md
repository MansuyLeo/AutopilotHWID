# Script d'obtention du HWID pour Windows Autopilot (Intune)

Utilisation du script Powershell Get-WindowsAutopilotInfo.ps1 fourni par Microsoft pour exporter les données HWID (Numéro de série et hashage matériel) du PC dans un ficher .csv. Il peut servir pour inscrire manuellement des appareils sur Intune. Il peut-être executable via session powershell, depuis un support amovible en local, sur réseau externe, interne et hors réseau. Surtout, il a le gros avantage de ne pas à avoir à installer les fonctionnalités du package NuGet lors du téléchargement du fichier .ps1 via commandes Powershell qui est souvent bloqué sur les réseaux internes d'entreprise.

## Instructions

1. Lancez "run.bat" en tant qu'administrateur (Get-WindowsAutopilotInfo.ps1 doit être dans le même dossier que le fichier .bat)
2. Le fichier "AutopilotHWID.csv" se générera dans le dossier du script. Vérifiez qu'il n'est pas vide.
   
Version tout public du script effectué dans le cadre de mon alternance à la SNCF pour les transformations de PCs Offre bureautique standard en PCs Offre Intune.

Contact: mansuy.leo.mz@gmail.com

Script par MANSUY Léo. Alternant TAM PSL chez e.SNCF Solutions.
