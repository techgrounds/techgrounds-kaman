# Working with text (CLI)
Door gebruik te maken van verschillende commands en operators kun je in de CLI  tekstbestanden manipuleren. Met commands zoals 'grep' en 'cat' kun je o.a. informatie extraheren, opzoeken, bestanden creeëren of tekst aan een file toevoegen.

## Key-terms
- Standaardinvoer (stdin) - invoer van de keyboard
- Standaarduitvoer (stdout) - uitvoer van de terminal 
- **Commands**
    - grep - print lines that match patterns
    - cat - concatenate files and print on the standard output
    - echo - display a line of text
- **Operators**
    - Pipe `|` - kan worden gebruikt om de output van het ene command de input van een ander command te laten zijn.
    - Redirect `>` - schrijft de output van een command naar een file en schrijft deze over.
    - Redirect `>>` - voegt de output van een command toe aan een file.


## Opdracht
### Gebruikte bronnen
https://linuxize.com/post/linux-cat-command/?utm_content=cmp-true

https://tldp.org/LDP/intro-linux/html/sect_05_01.html

### Ervaren problemen
Heb enkele websites opgezocht over commands en operators om mijn geheugen op te frissen. Verder geen problemen tegengekomen.

### Resultaat

Deze instructie voegt de output van echo toe aan het eind van de file “sometext”


 ``echo 'dit is de cloud opleiding van techgrounds' >> sometext``


![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/LNX-03_screenshot01.PNG)


Deze instructie geeft de output van cat als input door aan grep, die dan de zin die het woord techgrounds bevat als output teruggeeft.

``cat sometext | grep techgrounds`` 


![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/LNX-03_screenshot02.PNG)


Deze instructie pakt de output van de vorige opdracht en redirect hem naar het bestand techgrounds.txt. Omdat deze nog niet bestaat wordt deze aangemaakt.


``cat sometext | grep techgrounds >techgrounds.txt`` 


![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/LNX-03_screenshot03.PNG)




