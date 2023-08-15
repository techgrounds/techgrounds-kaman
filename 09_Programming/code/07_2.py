"""
Exercise 2:
Create a new script.
Create a list of five integers.
Use a for loop to do the following for every item in the list:
Print the value of that item added to the value of the next item in the list. 
If it is the last item, add it to the value of the first item instead (since there is no next item).
[image]
The first result above is created by adding 9 and 80. The second result is created by adding 80 and 16, etc. 
The last result is created by adding 35 and 9.
"""

my_list = [8,3,20,6,12]

for i in range(len(my_list)):

# tel de 2 getallen bij elkaar op tot dat i bij de laatste is.
    if i != len(my_list) - 1:
        print( my_list[i] + my_list[i + 1])
    else:
    #  tel de laatste op bij de eerste.
        print( my_list[i] + my_list[0])
    