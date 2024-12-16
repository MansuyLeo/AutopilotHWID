# Script d'obtention du HWID pour Windows Autopilot (Intune)

Utilisation du script Powershell Get-WindowsAutopilotInfo.ps1 fourni par Microsoft pour exporter les données HWID (Numéro de série et hashage matériel) du PC dans un ficher .csv. Il peut servir pour inscrire manuellement des appareils sur Intune. Il peut-être executable via session powershell, depuis un support amovible en local, sur réseau externe, interne et hors réseau. Surtout, il a le gros avantage de ne pas à avoir à installer les fonctionnalités du package NuGet lors du téléchargement du fichier .ps1 via commandes Powershell qui est souvent bloqué sur les réseaux internes d'entreprise.

## Instructions

1. Téléchargez "run_hwid.bat" et "Get-WindowsAutoPilotInfo.ps1" et déplacer les dans un même dossier.
1. Executez "run_hwid.bat" en tant qu'administrateur.
2. Le fichier "AutopilotHWID.csv" se générera dans le dossier du script. Vérifiez qu'il n'est pas vide.

Execution en mode OOBE (Pré-appro Intune par exemple):  

1. Téléchargez les fichiers "run_hwid.bat" et "Get-WindowsAutoPilotInfo.ps1", placez-les dans un même dossier sur un support amovible, puis insérez ce dernier dans le PC en phase OOBE.
2. Appuyez en même temps sur les touches "Shift" + "F10" pour lancer un invité de commandes (cmd).
3. tapez: explorer.exe puis la touche "Entrée".
4. Naviguez vers le support amovible et éxecutez "run_hwid.bat" en tant qu'administrateur.  

Script par MANSUY Léo. Alternant TAM PSL chez e.SNCF Solutions.  
Contact: leo.mansuy@sncf.fr - mansuy.leo.mz@gmail.com  
