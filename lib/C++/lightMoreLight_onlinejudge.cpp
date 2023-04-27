// Problem Name: Light, more light
// Problem Link: https://onlinejudge.org/index.php?option=com_onlinejudge&Itemid=8&page=show_problem&problem=1051

#include <iostream>
#include <math.h>
using namespace std;

// optimize solution

int main()
{
   while (true)
   {
      unsigned int n;
      cin >> n;
      if (n != 0)
      {
         unsigned int sq = (int) sqrt(n);
         cout << (sq * sq == n ? "yes" : "no") << endl;
      }
      else
      {
         break;
      }
   }
}

// -----------------------------------

// bad soluiton

int factors(unsigned int n);
int main()
{

   while (true)
   {
      unsigned int n;
      cin >> n;
      if (n != 0)
      {
         if (factors(n) % 2 == 1)
         {
            cout << "yes" << endl;
         }
         else
         {

            cout << "no" << endl;
         }
      }
      else
      {
         break;
      }
   }

   return 0;
}

int factors(unsigned int n)
{
   int sum = 0;
   for (unsigned int i = 1; i <= n; i++)
   {
      if (n % i == 0)
         sum++;
   }

   return sum;
}

