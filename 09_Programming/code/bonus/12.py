# original
"""
'''
The output should be:
4
16129
'''
def square(x):
	return x**2

nr = square(2)
print(nr)

big = square(foo)
print(big)

foo = 127
"""


def square(x):
	return x**2

nr = square(2)
print(nr)

# the function is called before foo is defined. moved foo above the function
foo = 127
big = square(foo)
print(big)
