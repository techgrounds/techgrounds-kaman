# Data types and comments

Variables can store data of different types, and different types can do different things.

Python has the following data types built-in by default, in these categories:

|   |   |
|---|---|
|Text Type|str|
|Numeric Types|int, float, complex|
|Sequence Types|list, tuple, range|
|Mapping Type|dict|
|Set Types|set, frozenset|
|Boolean Type|bool|
|Binary Types|bytes, bytearray, memoryview|
|None Type|NoneType|

## Key-terms
- Datatypes
    - boolean
    - string
    - int
    - float
- Comments
    - `#` voor een comment-regel
    - `"""` voor comments-blocks
    

functions:
- **input()** - reads a line from input and returns it as a string.
- **type()** - returns the type of an object or a new type object based on the arguments provided

## Opdracht
### Gebruikte bronnen
[Plaats hier de bronnen die je hebt gebruikt.]

### Ervaren problemen
Geen problemen tegengekomen.

### Resultaat

```
Exercise 1:
Create a new script.
Copy the code below into your script.
a = 'int'
b = 7
c = False
d = "18.5"
Determine the data types of all four variables (a, b, c, d) using a built in function.
Make a new variable x and give it the value b + d. Print the value of x. This will raise an error. Fix it so that print(x) prints a float.
Write a comment above every line of code that tells the reader what is going on in your script.

```
[script (exercise 1)](code/03_1.py)


```
Exercise 2:
Create a new script.
Use the input() function to get input from the user. Store that input in a variable.
Find out what data type the output of input() is. See if it is different for different kinds of input (numbers, words, etc.).
```

`input()` leest de input van de user en geeft deze als een string terug.
De output van de gebruikers-input is daarom altijd een string.
[script (exercise 2)](code/03_2.py)
