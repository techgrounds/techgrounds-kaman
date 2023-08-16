# original
"""

'''
The output should be:
100
'''
foo = 20
bar = '80'
print(foo + bar)
"""



foo = 20
bar = '80'
# bar is a string. changing it to an integer did the trick.
print(foo + int(bar))