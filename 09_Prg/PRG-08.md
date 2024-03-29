# Dictionary 

Stores a mutable, ~~un~~ordered collection of items. Each item is stored as a pair of a key and its corresponding value. Dictionaries are created using `{ }`

`As of Python version 3.7, dictionaries are ordered. In Python 3.6 and earlier, dictionaries are unordered.`

## Key-terms
- Dictionary (dict)
- Key-value pairs
- `open()` - to open a file.
- `try-except` block
- DictWriter
    Syntax:
    `DictWriter( (filename), fieldnames = [list of field names] )`

## Opdracht
### Gebruikte bronnen
- https://www.w3schools.com/python/python_dictionaries.asp
- https://www.programiz.com/python-programming/dictionary
- https://www.python-engineer.com/posts/check-if-file-exists/
- https://www.geeksforgeeks.org/how-to-save-a-python-dictionary-to-a-csv-file/
- [Try Except Block](https://www.w3schools.com/python/python_try_except.asp)


### Ervaren problemen
Excercise 2:
**Probleem 1**:

Geprobeerd om de dictionary aan te maken met de `dict()` functie. Maar kreeg het niet voor elkaar om spaties te gebruiken in de "key"-waarden. Uiteindelijk zonder `dict()` opgelost.

**Probleem 2**:
Kreeg het voor elkaar om de dictionary naar een CSV bestand te schrijven. Maar inhoud van het bestand mag niet overgeschreven worden bij meermaals runnen van de script.
Dat kon door de argument 'w' te veranderen naar 'a' (append).
`with open(file_name,'a', newline='') as csvfile:`

**Probleem 3**:
Elke keer worden bij 'append' opnieuw de headers in het bestand geschreven. De oplossing is om eerst te checken of het bestand al bestaat om te bepalen of  `writer.writeheader()` regel uitgevoerd moet worden.
![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/PRG-08_screenshot02.png)

### Resultaat

```
Exercise 1:
Create a new script.
Create a dictionary with the following keys and values:
Key Value
First name Casper
Last name Velzen
Job title Learning coach
Company Techgrounds

Loop over the dictionary and print every key-value pair in the terminal.
```
[script (exercise 1)](code/08_1.py)

```
Exercise 2:
Create a new script.
Use user input to ask for their information (first name, last name, job title, company). 
Store the information in a dictionary.
Write the information to a csv file (comma-separated values). 
The data should not be overwritten when you run the script multiple times.
```
[script (exercise 1)](code/08_2.py)

inhoud CSV file:

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/PRG-08_screenshot01.png)