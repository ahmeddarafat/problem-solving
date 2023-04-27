// Problem description:
//          - how many integers in {1,2,3,..., 100} are divisible by 2,3,5,7

// first answer "not optimized"

#include <iostream>
using namespace std;
main()
{
   int n = 100;
   int count = 0;
   for (int i = 1; i <= n; i++)
   {
      if (i % 2 == 0 || i % 3 == 0 || i % 5 == 0 || i % 7 == 0)
      {
         count++;
      }
   }
   cout << count << endl;   // 78
}

// -----------------------------------------------

// second answer "optimized"
// inclusion - exclusion principle

#include <iostream>
using namespace std;
main()
{
   int n = 100;
   int count = 0;
   for (int i2 = 0; i2 < 2; i2++)
   {
      for (int i3 = 0; i3 < 2; i3++)
      {
         for (int i5 = 0; i5 < 2; i5++)
         {
            for (int i7 = 0; i7 < 2; i7++)
            {
               int d = 1;
               int noOfSubset = 0;

               if (i2)
                  d *= 2, noOfSubset++;
               if (i3)
                  d *= 3, noOfSubset++;
               if (i5)
                  d *= 5, noOfSubset++;
               if (i7)
                  d *= 7, noOfSubset++;

               if (noOfSubset ==0)
                  continue;

               int sign = noOfSubset % 2 == 1 ? 1 : -1;
               count += sign * n / d;
            }
         }
      }
   }

   cout << count << endl;   // 78
}
