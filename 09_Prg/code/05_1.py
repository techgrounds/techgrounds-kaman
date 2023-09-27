"""
Exercise 1:
Create a new script.
Use the input() function to ask the user of your script for their name. 
If the name they input is your name, print a personalized welcome message. If not, print a different personalized message.
"""

name = "Kaman"

input_name = input ("Voer je naam in: ")

# print welcome message als name overeenkomt met input_name in kleine letters
if name.lower() == input_name.lower():
    print("Welkom " + name + "!")
else:
    print("Jij bent niet welkom!")