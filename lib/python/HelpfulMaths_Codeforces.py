# Problem Name : A. Helpful Maths
# Problem Link : https://codeforces.com/contest/339/my


line = input()
length = len(line)
result = ""

if length < 2:
    result = line
else:
    numbers = line[::2]
    sortedNumbers = sorted(numbers)
    result = '+'.join(sortedNumbers)
print(result)
