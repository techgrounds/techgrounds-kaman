"""
Number Guessing:
Generate a random number between 1 and 100 (or any other range).
The player guesses a number. For every wrong answer the player receives a clue.
When the player guesses the right number, display a score.
"""

import random

winning_number = random.randint(1,100)
score = 1000

while (True):
    guessed_number = int(input("Raad het getal tussen 0 en 100. \nvoer een getal in: "))
    
    if guessed_number == winning_number:
        print("Goed geraden! jouw score is:", score)
        break
    elif guessed_number < winning_number:
        print("Het getal is te klein, 50 strafpunten!")
        score -=50
    else:
        print("Het getal is te groot, 50 strafpunten!")
        score -=50            