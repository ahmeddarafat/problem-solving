// Problem Name: Sqrt(x)
// Problem Link: https://leetcode.com/problems/sqrtx/

void main() {
  final s = Solution();
  print(s.mySqrt(9));
  print(s.mySqrt(8));
  print(s.mySqrt(4));
}

// -----------------------------------

/// Solution

class Solution {
  int mySqrt(int x) {
    int y = x;
    while (y * y > x) {
      y = ((y + x / y) / 2).floor();
    }
    return y;
  }
}

// --------------------------------------

/// Explanation

/// y = sqt(x)
/// y^2 = x
/// y^2 - x = 0
/// 
/// So, to get the variable (y) with given (x), 
/// You need to solve the equation (get the root of the equation),
/// because the problem asks you to solve it without built-in methods,
/// You have to solve it with an approximated method 
/// like "Newton Raphson Method"
/// The formula: x(n+1) = x(n) - f(x(n)) / f'(x(n))
/// 
/// assume f(y) = y^2 - x
/// so: y(n+1) = y(n) - f(y(n)) / f'(y(n))
/// 
/// According to the method you need to repeat the equation until you can find the approximated root
/// So, you should use while loop
/// The condition should stop when you find the root (when y^2 - x == 0) or (y^2 == x)
/// So, to make it approximated you can start with large y (y = x) and the condition ( y^2 > x)
/// 
/// if: y(n+1) = y(n) - f(y(n)) / f'(y(n))
/// then: f(y(n)) = y^2 - x
///       f'(y(n)) = 2 y
/// 
/// then: y =  y - ( y^2 - x) / 2y
///       y =  y - y/2 - x/2y 
///       y =  y/2 - x/2y
///       y = (y - x/y) / 2   
