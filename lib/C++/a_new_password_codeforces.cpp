// Problem Name : A - New Password
// Problem Link : https://codeforces.com/contest/770/my

#include <iostream>
using namespace std;

int main()
{
    short n, k;
    cin >> n >> k;

    string password = "";
    short letter = 97;

    short temp = 0;
    for (int i = 0; i < n; i++)
    {
        password += char(letter + temp);
        temp++;
        if (temp >= k)
        {
            temp = 0;
        }
    }
    cout << password << endl;
    return 0;
}

//-----------------------------------------

// another solution

#include <iostream>
#include <string>
using namespace std;

int main()
{

    string s = "abcdefghijklmnopqrstuvwxyz";
    string s2 = "";
    int n, k;
    cin >> n >> k;
    for (int i = 0; i < n; i++)
    {
        s2 += s[i % k];
    }

    cout << s2 << endl;

    return 0;
}
