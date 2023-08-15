"""
Rock Paper Scissors:
The player plays against a computer opponent typing either a letter (rps) or an entire word (rock paper scissors) to play their move.
Create a function that checks whether the move is valid or not.
Create another function to create a computer move.
Create another function to check who wins the round.
Finally, create a function that keeps track of the score.
The game should be played in a predetermined number of rounds.
"""

import random
import time

# CPU randomly selects r, p or s
def cpu_move():
    cpu_random = ("r", "p", "s")[random.randint(0, 2)]
    #print(cpu_random)
    return cpu_random

# Check whether the move is valid or not. Prints the move you played. Return True or False.
def valid_move_check(move):
    if move == "r" or move == "p" or move == "s":
        if move == "r":
            print("You play: ROCK!")
        elif move == "p":
            print("You play: PAPER!")
        else:
            print("You play: SCISSORS!")
        return True
    else:
        print("invalid move")
        return False

#Check who wins the round by comparing every possible combinations
def who_wins(player_hand, cpu_hand):
    if cpu_hand == "r":
        time.sleep(1)
        print("CPU plays: ROCK!")
        time.sleep(1)
    elif cpu_hand == "p":
        time.sleep(1)
        print("CPU plays: PAPER!")
        time.sleep(1)
    else:
        time.sleep(1)
        print("CPU plays: SCISSORS!")
        time.sleep(1)
    
    # combinations
    if player_hand == cpu_hand:
        print("\n   It's a Draw!\n")
        return "draw"
    elif player_hand == "r" and cpu_hand == "s":
        print("\n   You won!\n")
        return "player"
    elif player_hand == "p" and cpu_hand == "r":
        print("\n   You won!\n")
        return "player"
    elif player_hand == "s" and cpu_hand == "p":
        print("\n   You won!\n")
        return "player"
    else:
        print("\n   You lose!\n")

#score = {"player": 0, "cpu": 0, "draw": 0}
#def keep_score(winner):
#    score[winner] += 1


#Start of the game
rounds = 1
total_rounds = 5
print("\nWelcome to Rock Paper Scissors!\n")        
while rounds <= total_rounds:
    player_move = input("What is your move? (r,p,s): ").lower()
    if valid_move_check(player_move) == False:
        continue
    #compare user input with cpu 
    who_wins(player_move, cpu_move())
    
    #keep_score(who_wins)
    #keep_score(who_wins)
    rounds += 1
    