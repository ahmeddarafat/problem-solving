# Problem Name : A. Shaass and Oskols
# Problem Link : https://codeforces.com/contest/294/my

# Final

nOLine =int(input())
n = input().split(" ")
nOBird =[int(i) for i in n]
nOShots = int(input())

while nOShots > 0:
    shot = input().split(" ")
    x = int(shot[0]) - 1  # to convert to index
    y = int(shot[1])
    if nOLine > 1:
        if x > 0:
            nOBird[x - 1] += y-1
        if x < nOLine -1 :
            nOBird[x+1] += nOBird[x] - y
    nOBird[x] = 0
    
    nOShots -=1
    
for i in nOBird:
    print(i)
    
# ------------------------------------------------------------------

# primary

numOfLines = int(input())
numOfBirdsAtline = input().split(" ")
numOfBirdsAtlineInteger = []
for i in range(len(numOfBirdsAtline)):
    numOfBirdsAtlineInteger.append(int(numOfBirdsAtline[i]))

numOfShoots = int(input())


def shootBirdAtMiddleLine(indexOfLine,indexOfbird):
    numOfBirdsAtlineInteger[indexOfLine-2] +=  indexOfbird - 1
    numOfBirdsAtlineInteger[indexOfLine] += numOfBirdsAtlineInteger[indexOfLine-1] - indexOfbird
    numOfBirdsAtlineInteger[indexOfLine-1] = 0

def shootBirdAtFirstLine(indexOfbird):
    if numOfLines > 1 :
        numOfBirdsAtlineInteger[1] += numOfBirdsAtlineInteger[0] - indexOfbird
    numOfBirdsAtlineInteger[0] = 0
        
    
def shootBirdAtLastLine(indexOfbird):
    numOfBirdsAtlineInteger[len(numOfBirdsAtline)-2] +=  indexOfbird - 1
    numOfBirdsAtlineInteger[len(numOfBirdsAtline)-1] = 0

for shoot in range(1, numOfShoots+1):
    postionOfBird = input().split(" ")
    if int(postionOfBird[0]) == 1:
        shootBirdAtFirstLine(int(postionOfBird[1]))
    elif int(postionOfBird[0]) == numOfLines:
        shootBirdAtLastLine(int(postionOfBird[1]))
    else :
        shootBirdAtMiddleLine(int(postionOfBird[0]),int(postionOfBird[1]))
    
    
for i in range(len(numOfBirdsAtlineInteger)):
    print(numOfBirdsAtlineInteger[i])
