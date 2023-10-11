// Problem Name: Climbing Stairs
// Problem Link: https://leetcode.com/problems/climbing-stairs/

void main() {
  final s = Solution();
  print(s.climbStairs(3));
  print(s.climbStairs(4));
  print(s.climbStairs(45));
}

// -----------------------------------

/// Solution

// Constraints:
// 1 <= n <= 45

/// 1. A fibonacci with recursion
///    - but it takes a long time
class Solution {
  int climbStairs(int n) {
    if (n == 1) return 1;
    if (n == 2) return 2;
    return climbStairs(n - 1) + climbStairs(n - 2);
  }
}

/// 2. A fibonacci without recursion
class Solution2 {
  int climbStairs(int n) {
    int a = 1, b = 1;
    while (n-- > 0) a = (b += a) - a;
    return a;
  }
}

/// 3. Memoization with list
class Solution3 {
  int climbStairs(int n) {
    if (n == 1) return 1;
    if (n == 2) return 2;
    var list = List.filled(n + 1, 0);
    list[1] = 1;
    list[2] = 2;
    for (int i = 3; i < n + 1; i++) {
      list[i] = list[i - 1] + list[i - 2];
    }
    return list[n];
  }
}

// ----------------------------------------------------

/// Explanation

/// 2. A Fibonacci without recursion

/// I have Fibonacci series 
/// ser = 1,1,2,3,5,8,13,21,....
/// And with two var (a,b) I can pass through this series
/// a = ser[0]
/// b = ser[1]
/// if ser[2] = ser[0] + ser[1]
/// and I need b = ser[2] & a = ser[1] and so on
/// so b = b + a (b += a)    ==> now b = ser[2] & a = ser[0]
/// then a = b - a           ==> now b = ser[2] & a = ser[1]
/// and so on ...  n times  (n-- > 0)
