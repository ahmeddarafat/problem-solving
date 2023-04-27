// Problem Name: Product
// Problem Link: https://onlinejudge.org/index.php?option=com_onlinejudge&Itemid=8&page=show_problem&category=0&problem=1047&mosmsg=Submission+received+with+ID+28422674

#include <iostream>
#include <math.h>
#include <bits/stdc++.h>
using namespace std;

// optimize solution

int main()
{
   const int max = 500;
   string s1, s2;
   while (cin>>s1)
   {
      cin >> s2;
      reverse(s1.begin(), s1.end());
      reverse(s2.begin(), s2.end());
      int result[max];
      memset(result, 0, sizeof(result));
      for (int i = 0; i < s1.length(); i++)
      {
         for (int j = 0; j < s2.length(); j++)
         {
            result[i + j] += (s1[i] - '0') * (s2[j] - '0');
         }
      }
      for (int i = 0; i < max - 1; i++)
      {
         result[i + 1] += result[i] / 10;
         result[i] %= 10;
      }
      int k = max - 1;
      while (k > 0 && result[k] == 0)
      {
         k--;
      }
      for (; k >= 0; k--)
      {
         cout << result[k];
      }
      cout << endl;
   }
   return 0;
}
