// Problem Name: Power of Three
// Problem Link: https://leetcode.com/problems/power-of-three/description/

import 'dart:io';
import 'dart:math';

void main() {
  final s = Solution();
}

class Solution {
  bool isPowerOfThree(int n) {
    if (n == 0) return false;
    while (n % 3 == 0) {
      n = n ~/ 3;
    }
    return n == 1;
  }
}


/// Complexity Analysis
/// Time Complexity: O(log3(n))
/// Space Complexity: O(1)
