"""
Exercise 2:
Create a new script.
Ask the user of your script for a number. Give them a response based on whether the number is higher than, lower than, or equal to 100.
Make the game repeat until the user inputs 100.
"""


winning_number = 100

while (True):
    guessed_number = int(input("Voer een getal in: "))

    if winning_number == guessed_number:
        print("Goed geraden!")
        break        
    elif guessed_number < winning_number:
            print("Het getal is te klein")
    else:
            print("Het getal is te groot")
        