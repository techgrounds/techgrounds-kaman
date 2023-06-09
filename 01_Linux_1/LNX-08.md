# Cron jobs
Cron is een tijdgebaseerde taakplanner. Gebruikers kunnen opdrachten of scripts inplannen (cronjobs) om op specifieke tijden of op specifieke dagen te draaien.

## Key-terms
- Chron
- Chron job
- chrontab

- Cron Job Syntax
```
* * * * * command-to-be-executed
- - - - -
| | | | |
| | | | +--- dag van de week (0 - 6) (zondag = 0)
| | | +----- maand (1 - 12)
| | +------- dag van de maand (1 - 31)
| +--------- uur (0 - 23)
+----------- minuut (0 - 59)
```

## Opdracht
### Gebruikte bronnen
- https://www.cherryservers.com/blog/how-to-use-cron-to-automate-linux-jobs-on-ubuntu-20-04
- https://crontab.guru/


### Ervaren problemen
Deze [webpagina](https://www.cherryservers.com/blog/how-to-use-cron-to-automate-linux-jobs-on-ubuntu-20-04) bestudeerd om te weten wat chron is, wat het doet en hoe het werkt.

- crontab -e - edit crontab.
- crontab -l - geeft je crontab weer.
- crontab -r - verwijder je crontab.

De datum werd niet geschreven door chron. bleek dat ik de path naar de script niet goed heb opgegeven in de chronjob.

### Resultaat

Een script die de datum en tijd op het moment schrijf naar een file.
```
#!/bin/bash
date >> ~/dateswritten
```

Om deze script aan crontab toe te voegen zodat hij elke minuut zal worden uitgevoerd moet er een instructie in de crontab geplaatst worden.

 `crontab -e`

`* * * * *` zal uitgevoerd worden elk minuut van het uur, dag, maand.

![Image](https://github.com/kaman-codes/techgrounds-kaman/blob/main/00_includes/LNX-08_screen01.PNG)

Om een script weekelijks uit te laten voeren die available disk space in een file schrijft in de map /var/logs zijn root-rechten voor nodig.

script:
```
#!/bin/bash
df -h >> /var/log/available_diskspace.log
```

`sudo crontab -e` gebruikt om in de crontab van de root user te schrijven.

![Image](https://github.com/kaman-codes/techgrounds-kaman/blob/main/00_includes/LNX-08_screen02.PNG)

`1 * * * 1` zal uitgevoerd worden op minuut 1 van elke maandag. 
