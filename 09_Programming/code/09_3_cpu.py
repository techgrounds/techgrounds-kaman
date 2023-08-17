""" Tic Tac Toe
Game structure:
-ask player1
-draw board
-check if board is full
-check if there is a winner

-do the same for player2

-continue until board is full or a player wins
"""
import random

# create board as a list with 9 spaces
board = [
    " "," "," ",
    " "," "," ",
    " "," "," "
]

p1_token = "X"
p2_token = "O"

def draw_board(board):
    print("")
    print("+---+---+---+")
    print("| " + board[0] + " | " + board[1] +  " | " + board[2] + " |")
    print("+---+---+---+")
    print("| " + board[3] + " | " + board[4] +  " | " + board[5] + " |")
    print("+---+---+---+")
    print("| " + board[6] + " | " + board[7] +  " | " + board[8] + " |")
    print("+---+---+---+")
    

# check if board is full by counting spaces in the list
def check_board_ful():
    spacecounter = 0
    for i in range(len(board)):
        if board[i] == " ":
            spacecounter += 1
    #print(spacecounter)
    
    if spacecounter > 0:
        return False
    else:
        return True
        

# check who won, by comparing all winning combinations (8)
def check_win():
    if board[0] == board[1] == board[2] != " ":
        return board[0]
    elif board[3] == board[4] == board[5] != " ":
        return board[3]
    elif board[6] == board[7] == board[8] != " ":
        return board[6]
    elif board[0] == board[3] == board[6] != " ":
        return board[0]
    elif board[1] == board[4] == board[7] != " ":
        return board[1]
    elif board[2] == board[5] == board[8] != " ":
        return board[2]
    elif board[0] == board[4] == board[8] != " ":
        return board[4]
    elif board[2] == board[4] == board[6] != " ":
        return board[4]

def player1():
    #wrapped code in a while loop to loop the code. The loop will break when input met al conditions
    while (True):

        try:
            p1_box_number = int(input("Player 1: Where do you want to put " + p1_token + "? "))
            # check if number is between 0-8, if not ask for input again.
            if p1_box_number < 0 or p1_box_number > 8:
                print("Please enter a valid number from 0 - 8.")
                continue
            # check is if input is a empty position, write input to board.
            if board[p1_box_number] == " ":
                board[p1_box_number] = p1_token
                break
            else:
                print("That position is occupied. Try another position.")
                continue
        except ValueError:
            print("Please enter a valid number from 0 - 8.")

# same as player 1
def player2():
    while (True):
        p2_box_number = random.randint(0,8) 
        if board[p2_box_number] == " ":
            board[p2_box_number] = p2_token
            print("CPU's turn:")
            break
        else:
            continue
        
# Game Starts
print("\nWelcome to Tic Tac Toe!")
draw_board(board)

# loop to make player 1 and player 2 take turns
while (True):
    player1()
    draw_board(board)
    if check_win() == p1_token:
        print("Player 1 wins!")
        break
    if check_board_ful() == True:
        print("It's a draw!")
        break
    
    player2()
    draw_board(board)
    check_win()
    if check_win() == p2_token:
        print("Player 2 wins!")
        break
    if check_board_ful() == True:
        print("It's a draw!")
        break
