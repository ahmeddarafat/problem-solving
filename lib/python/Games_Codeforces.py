# Problem Name : A. Games
# Problem Link : https://codeforces.com/contest/268/my


n = int(input())
home,guest = [],[]
num = 0
dic = {}
for i in range(n):
    x,y = map(int,input().split(" "))
    home.append(x)
    guest.append(y)

for i in range(n):
    if dic.__contains__(home[i]):
        num += dic[home[i]]
    else:
        dic[home[i]] = 0
        for j in range(n):
            if guest[j] == home[i]:
                dic[home[i]] +=1
                num +=1
print(num)

# ------------------------------------------------------------

# Another solution

lines = int(input())
h,g = [None]*lines,[None]*lines
number = 0

for i in range(lines):
    h[i],g[i] = map(int,input().split(" "))
    for j in range(i):
        if h[i] == g[j]:
            number +=1
        if g[i] == h[j]:
            number +=1
            
print(number)
