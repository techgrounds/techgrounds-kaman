# original
"""
'''
The output should be:
True
'''
def rtn(x):
	return(x)

foo = rtn(3)

if foo > rtn(4):
	print(True)
else:
	print(False)
 """
 
 

def rtn(x):
    return(x)

foo = rtn(3)

# change > to < to make the condition True
if foo < rtn(4):
    print(True)
else:
	print(False)