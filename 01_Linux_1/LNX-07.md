# Bash scripting

Bash scripting stelt gebruikers in staat om complexe, repetitieve taken te automatiseren en aangepaste commando's te maken. Een (Bash)shell-script is een tekstbestand dat een reeks opdrachten bevat die de bash-shell kan uitvoeren. Ze kunnen variabelen, functies en controlestructuren zoals lussen en conditionele statements bevatten, wat ze zeer flexibel en krachtig maakt.

## Key-terms
- Bash/Bash-shell
- Bash-script - een Bashscript begint altijd met `#!/bin/bash`
- PATH
- Variables
- if-else
- RANDOM

## Opdracht
### Gebruikte bronnen
- https://unix.stackexchange.com/questions/26047/how-to-correctly-add-a-path-to-path
- https://ubuntu.com/server/docs/web-servers-apache
- https://www.freecodecamp.org/news/bash-scripting-tutorial-linux-shell-script-and-command-line-for-beginners/
- https://ryanstutorials.net/bash-scripting-tutorial/bash-variables.php
- https://linuxhint.com/generate-random-number-bash/
- https://www.digitalocean.com/community/tutorials/if-else-in-shell-scripts


### Ervaren problemen

Probleem 1: De httpd package staat niet in de ubuntu repository. Al snel kreeg ik door dat je apache2 moet installeren.

Probleem 2: Bij het toevoegen van de PATH moest uitgezocht worden in welke file je het moet zetten. `~/.profile` is de juiste file.

Probleem 3: Het "greater then" is niet `>` maar `-gt`. Dat duurde even om uit te zoeken.

Probleem 4: De code wilde niet goed runnen. Ik kwam erachter dat er spaties tussen de brackets moeten worden gebruikt `if [ $RANDOMNUM -gt 5 ]` in plaats van `if [$RANDOMNUM -gt 5]`

### Resultaat

**exercise 1**

`PATH=$PATH:~/scripts/` toegevoegd aan `~/.profile`. Daarna in- en uitgelogd om het in werking te stellen.

Een script die een tekstregel toevoegd elke keer als deze wordt uitgevoerd.


![Image](https://github.com/kaman-codes/techgrounds-kaman/blob/main/00_includes/LNX-07_screen06.PNG)

Dit is de output van de script die apache2 installeerd (unattended), start, enabled en de status weergeeft.

![Image](https://github.com/kaman-codes/techgrounds-kaman/blob/main/00_includes/LNX-07_screen03.PNG)


**exercise 2**

Deze script genereerd een random nummer en schrijft deze naar een text file.

![Image](https://github.com/kaman-codes/techgrounds-kaman/blob/main/00_includes/LNX-07_screen04.PNG)


**exercise 3**
Dit is een uitbreiding op de script in exercise 2.
|command|description|
|-------|-----------|
|-gt    |greater than|
|-ge    |greater or equal|
|-le    |less or equal|
|-lt    |less than|
|-eq	|equality check|
|-ne    |inequality check|

Structuur if-else:
```
if 
then    
else      
fi
```
script:

![Image](https://github.com/kaman-codes/techgrounds-kaman/blob/main/00_includes/LNX-07_screen05.PNG)
