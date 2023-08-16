# Lists
4 data types in python to store collections of data:
 - Lists
 - Tuples
 - Set
 - Dictionary

## Key-terms
- Lists - Lists are used to store multiple items in a single variable. Lists are created using square brackets `[ ]`
List items are indexed, the first item has index [0], the second item has index [1] etc.
The list is changeable, meaning that we can change, add, and remove items in a list after it has been created.

- Tuples - Immutable. Tuples are created using round brackets `( )`
- Set - An unordered collection of unique elements. This means that a set doesn't maintain the order of the elements and doesn't allow duplicate values.
- Dictionary - Stores a mutable, unordered collection of items. Each item is stored as a pair of a key and its corresponding value. Dictionaries are created using `{ }`

## Opdracht
### Gebruikte bronnen
- https://www.geeksforgeeks.org/-python-ways-to-find-length-of-list/
- https://www.w3schools.com/python/python_lists.asp

### Ervaren problemen
Weinig problemen ondervonden.
Bij exercise 2 moest ik lang nadenken hoe het laatste getal bij de eerste opgeteld kon worden. Door gebruik te maken van een if condition is dat gelukt.

### Resultaat
```Exercise 1:
Create a new script.
Create a variable that contains a list of five names.
Loop over the list using a for loop. Print every individual name in the list on a new line.
```
[script (exercise 1)](code/07_1.py)
```
Exercise 2:
Create a new script.
Create a list of five integers.
Use a for loop to do the following for every item in the list:
Print the value of that item added to the value of the next item in the list. 
If it is the last item, add it to the value of the first item instead (since there is no next item).

The first result above is created by adding 9 and 80. 
The second result is created by adding 80 and 16, etc. 
The last result is created by adding 35 and 9.
```
[script (exercise 2)](code/07_2.py)