# Exercise 1:
# Create a new script.
# Copy the code below into your script.
# a = 'int'
# b = 7
# c = False
# d = "18.5"
# Determine the data types of all four variables (a, b, c, d) using a built in function.
# Make a new variable x and give it the value b + d. Print the value of x. This will raise an error. Fix it so that print(x) prints a float.

# variables a,b,c,d, each with differenct values
a = 'int'
b = 7
c = False
d = "18.5"

# find out what datatype each variable is using the function type()
print("The datatype of a is:",type(a))
print("The datatype of b is:",type(b))
print("The datatype of c is:",type(c))
print("The datatype of d is:",type(d))


# the sum of b+d gives an error because b is an integer and d is a string
#fixed d by converting it to a float
x = b + float(d)

#print the value of x
print(x)