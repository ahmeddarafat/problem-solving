// Problem Name: Power of Two
// Problem Link: https://leetcode.com/problems/power-of-two/description/

import 'dart:io';
import 'dart:math';

void main() {
  final s = Solution();
}

class Solution {
  bool isPowerOfTwo(int n) {
    if (n == 0) return false;
    if (n == 1) return true;
    var result = n / 2;
    if ((result - result.toInt()) > 0) {
      return false;
    } else {
      return isPowerOfTwo(result.toInt());
    }
  }
}

/// Complexity Analysis
/// Time Complexity: O(log n)
/// Space Complexity: O(1)

/// Another Solution
/// with binary operation

class Solution2 {
  bool isPowerOfTwo(int n) {
    return n > 0 && (n & n - 1 == 0);
  }
}

/// Explanation
///
/// 1 = 0b1          1-1 = 0b0      0b1 & 0b0 = 0b0  (0)  so is power of 2
/// 2 = 0b10         2-1 = 0b1      0b10 & 0b1 = 0b0  (0)  so is power of 2
/// 4 = 0b100        4-1 = 0b11     0b100 & 0b11 = 0b0 (0)  so is power of 2
/// 8 = 0b1000       8-1 = 0b111    0b1000 & 0b111 = 0b0(0)  so is power of 2
/// 16 = 0b10000     16-1 = 0b1111  0b10000 & 0b1111 = 0b0(0) so is power of 2
///
/// 3 = 0b11         3-1 = 0b10     0b11 & 0b10 = 0b10 (2)  so is not power of 2
/// 5 = 0b101        5-1 = 0b100    0b101 & 0b100 = 0b100(4) so is not power of 2
/// 6 = 0b110        6-1 = 0b101    0b110 & 0b101 = 0b100(4) so is not power of 2
/// 7 = 0b111        7-1 = 0b110    0b111 & 0b110 = 0b110(6) so is not power of 2
/// 9 = 0b1001       9-1 = 0b1000   0b1001 & 0b1000 = 0b1000(8) so is not power of 2
///
/// Complexity Analysis
/// Time Complexity: O(1)
/// Space Complexity: O(1)

class Solution3 {
  bool isPowerOfTwo(int n) {
    if (n == 0) return false;
    while (n % 2 == 0) {
      n = n ~/ 2;
    }
    return n == 1;
  }
}

/// Complexity Analysis
/// Time Complexity: O(log n)
/// Space Complexity: O(1)
