"""
Exercise 1:
Create a new script.
Import the random package.
Print 5 random integers with a value between 0 and 100.
"""


import random

def print_5_numbers():
    
    for i in range(5):
        print(random.randint(1,100))    
        
        
print_5_numbers()