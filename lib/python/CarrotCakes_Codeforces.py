# Problem Name : A. Carrot Cakes
# Problem Link : https://codeforces.com/contest/799/my

import math 

n,t,k,d = map(int,input().split(" "))

timewithout = math.ceil(n/k)*t

# the rest of cakes needed after building the second oven
n_rest = n-(d/t)*k 

if n_rest>0:
    timewith = d + math.ceil(n_rest/(2*k))*t

    if timewithout <= timewith:
        print("No")
    else:
        print("YES")
else :
    print("No")


# ------------------------------------------------------------------

# Solution 2 :

n,t,k,d = map(int,input().split(" "))

cakes,time1,time2 = 0,0,0

while(cakes < n):
    cakes +=k
    time1 +=t

# accepted but I think it is not correct
time2 = d + t

if time1 <= time2:
    print("No")
else:
    print("YES")
