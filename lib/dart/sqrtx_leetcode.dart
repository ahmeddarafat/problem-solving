// Problem Name: Sqrt(x)
// Problem Link: https://leetcode.com/problems/sqrtx/

void main() {
  final s = Solution();
  print(s.mySqrt(9));
  print(s.mySqrt(8));
  print(s.mySqrt(4));
}

// -----------------------------------

// Solution
class Solution {
  int mySqrt(int x) {
    int y = x;
    while (y * y > x) {
      y = ((y + x / y) / 2).floor();
    }
    return y;
  }
}
