# Table "Relation"
# x --> y
# 2 --> 1
# 3 --> 3
# 4 --> 6
# 5 --> 10
# 6 --> 15

# y = x-1 + x-2 + x-3 + x-4 + ... + 2 + 1

# find the Equation

# y = x-1 + x-2 + x-3 + x-4 + ... +  2  +  1     --> (1)
# y =  1  +  2  +  3  +  4  + ... + x-2 + x-1    --> (2)
# Adding the 2 equations
# 2y = x  +  x  +  x  +  x  + ... +  x  +  x
# 2y = x * (x-1)

# so, y = x * (x-1) / 2

def getNumOfMatches(numOfPlayers):
    x = numOfPlayers
    y = int(x * (x-1) / 2)
    print(f"When The Number of Players is {x}, The Number of Matches is {y}")
    
getNumOfMatches(100)  # When The Number of Players is 100, The Number of Matches is 4950
