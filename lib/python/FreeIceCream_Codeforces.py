# Problem Name : A. Free Ice Cream
# Problem Link : https://codeforces.com/contest/686/my


n,x = map(int,input().split(" "))
noKids = 0

for i in range(n):
    person = input()
    d = int(person[2:])
    if person[0] == "+":
        x += d
    else :
        if d > x:
            noKids +=1
        else :
            x -=d
print(f"{x} {noKids}")
