# Problem Name : A. Anton and Letters
# Problem Link : https://codeforces.com/contest/443/my


string = input()
lenth = len(set(string[1:-1].replace(", ", "")))
print(lenth)
