# Problem Name : A. Juicer
# Problem Link : https://codeforces.com/contest/709/my


sum = 0
overflows = 0

inputs = input().split(" ")
maxSize = int(inputs[1])
juiceSize = int(inputs[2])
oranges = input().split(' ')

for orange in oranges:
    orange = int(orange)
    if orange <= maxSize:
        sum += orange
    if sum > juiceSize:
        overflows +=1
        sum = 0

print(overflows)
