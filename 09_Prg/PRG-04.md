# Loops
There are two types of loops in Python, for and while.
For loops iterate over a given sequence.
While loops repeat as long as a certain boolean condition is met.

## Key-terms
Functions:
- for()
- range() - The range() function returns a sequence of numbers, starting from 0 by default, and increments by 1 (by default), and stops before a specified number.
- while()
- len() - To determine how many items a list has.
- break - break is used to exit a for loop or a while loop.
- continue - continue is used to skip the current block, and return to the "for" or "while" statement

4 data types in python to store collections of data
- Lists - Lists are used to store multiple items in a single variable. Lists are created using square brackets `[ ]`
List items are indexed, the first item has index [0], the second item has index [1] etc.
The list is changeable, meaning that we can change, add, and remove items in a list after it has been created.

- Tuples - Immutable. Tuples are created using round brackets `( )`
- Set
- Dictionary



## Opdracht
### Gebruikte bronnen
- https://www.w3schools.com/python/ref_func_range.asp
- https://www.geeksforgeeks.org/python-while-loop/
- https://www.geeksforgeeks.org/python-for-loops/?ref=lbp
- https://www.geeksforgeeks.org/python-ways-to-find-length-of-list/


### Ervaren problemen
Moest alleen even verdiepen hoe len() werkte. verder geen problemen.

### Resultaat
```
Exercise 1:
Create a new script.
Create a variable x and give it the value 0.
Use a while loop to print the value of x in every iteration of the loop. After printing, the value of x should increase by 1. The loop should run as long as x is smaller than or equal to 10.
Example output:
[image]
```
[script (exercise 1)](code/04_1.py)

```
Exercise 2:
Create a new script.
Copy the code below into your script.
for i in range(10):
	# do something here
Print the value of i in the for loop. You did not manually assign a value to i. Figure out how its value is determined.
Add a variable x with value 5 at the top of your script.
Using the for loop, print the value of x multiplied by the value of i, for up to 50 iterations.
```
[script (exercise 2)](code/04_2.py)

```
Exercise 3:
Create a new script.
Copy the array below into your script.
arr = ["Coen", "Casper", "Joshua", "Abdessamad", "Saskia"]
Use a for loop to loop over the array. Print every name individually.
Example output:

Coen
Casper
Joshua
Abdessamad
Saskia
```
[script (exercise 3)](code/04_3.py)