# File permissions
Aan elk bestand in Linux worden rechten toegekend. De basisrechten zijn lezen (r), schrijven (w) en uitvoeren (x). Deze rechten kunnen worden ingesteld voor de eigenaar, groep en anderen. Door het gebruik van chmod kunnen rechten veranderd worden.

## Key-terms
- chmod - change file mode bits
- chown - change file owner and group
- chgrp - change group ownership


## Opdracht
### Gebruikte bronnen
Geen bronnen gebruikt.

### Ervaren problemen
Geen problemen tegengekomen.

### Resultaat

Er is een nieuwe file aangemaakt met `touch newfile` 

`ls -la` geeft een long listing weer, zodat file permissions te zien zijn.

![Image](https://github.com/kaman-codes/techgrounds-kaman/blob/main/00_includes/LNX-05_screen01.PNG)

Deze file kan executable gemaakt worden met `chmod +x newfile`

![Image](https://github.com/kaman-codes/techgrounds-kaman/blob/main/00_includes/LNX-05_screen02.PNG)

Met `chmod 700 newfile` worden (r) en (w)  van group en others weggehaald.

Met `sudo chown superkaman newfile` veranderd de owner van 'kaman_' naar 'superkaman'. Het bestand is inderdaad niet meer te lezen door 'kaman_'

![Image](https://github.com/kaman-codes/techgrounds-kaman/blob/main/00_includes/LNX-05_screen03.PNG)

Met `sudo chgrp superkaman newfile` is de groupowner ook veranderd naar 'superkaman'.