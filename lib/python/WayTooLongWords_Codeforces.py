# Problem Name : A. Way Too Long Words
# Problem Link : https://codeforces.com/contest/71/my


no_word =int(input())

for i in range(no_word):
    word = input()
    if len(word)>10:
        word = word[0] +str(len(word)-2) + word[-1]
    print(word)
