# Script d'obtention du HWID pour Windows Autopilot (Intune)

Utilisation du script Powershell Get-WindowsAutopilotInfo.ps1 fourni par Microsoft pour exporter les données HWID (Numéro de série et hashage matériel) du PC dans un ficher .csv. Il peut servir pour inscrire manuellement des appareils sur Intune. Il peut-être executable via session powershell, depuis un support amovible en local, sur réseau externe, interne et hors réseau. Surtout, il a le gros avantage de ne pas à avoir à installer les fonctionnalités du package NuGet lors du téléchargement du fichier .ps1 via commandes Powershell qui est souvent bloqué sur les réseaux internes d'entreprise.

## Instructions

### Méthode avec .exe:
1. Téléchargez et éxecutez en tant qu'administrateur "AutoPilotHWID.exe"
2. Le fichier "AutopilotHWID.csv" se générera dans le dossier de l'application. Vérifiez qu'il n'est pas vide.

### Méthode fiable avec .bat et .ps1:
1. Téléchargez "run_hwid.bat" et "Get-WindowsAutoPilotInfo.ps1" et déplacer les dans un même dossier.
1. Executez "run_hwid.bat" en tant qu'administrateur.
2. Le fichier "AutopilotHWID.csv" se générera dans le dossier du script. Vérifiez qu'il n'est pas vide.

### Méthode non-recommandé avec .exe (bloqué par Windows Defender):
1. Téléchargez et éxecutez en tant qu'administrateur "AutoPilotHWID.exe".
2. Le fichier "AutopilotHWID.csv" se générera dans le dossier de l'application. Vérifiez qu'il n'est pas vide.
<span style="color: red;">**NOTE IMPORTANTE**</span>: Si Windows Defender est actif sur le poste, le .exe sera mis en quarantaine, il faut ajouter le faux-positif en menaces autorisées depuis Windows Defender puis répétez l'étape 1. Je travaille actuellement pour vérifier le script par microsoft en faux positif.

Le répo est public car c'est un script plutôt général.
Script par MANSUY Léo. Alternant TAM PSL chez e.SNCF Solutions.
Contact: leo.mansuy@sncf.fr - mansuy.leo.mz@gmail.com
