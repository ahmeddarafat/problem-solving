// Problem Name: Power of Four
// Problem Link: https://leetcode.com/problems/power-of-four/description/

import 'dart:io';
import 'dart:math';

void main() {
  final s = Solution();
}

class Solution {
  bool isPowerOfFour(int n) {
    return n > 0  && (n & (n - 1)) == 0  && (n & 0x55555555) == n;
  }
}

/// Explanation
///
/// 4 = 0b100          4 - 1 = 3 = 0b011         0b100 & 0b011 = 0b000
/// 16 = 0b10000       16 - 1 = 15 = 0b01111      0b10000 & 0b01111 = 0b00000
/// 64 = 0b1000000     64 - 1 = 63 = 0b111111     0b1000000 & 0b111111 = 0b000000
/// 256 = 0b100000000  256 - 1 = 255 = 0b11111111 0b100000000 & 0b11111111 = 0b00000000
/// 
/// 2 = 0b10           2 - 1 = 1 = 0b01            0b10 & 0b01 = 0b00
/// 8 = 0b1000         8 - 1 = 7 = 0b0111           0b1000 & 0b0111 = 0b0000
/// 32 = 0b100000      32 - 1 = 31 = 0b011111       0b100000 & 0b011111 = 0b000000
/// 128 = 0b10000000   128 - 1 = 127 = 0b01111111   0b10000000 & 0b01111111 = 0b00000000
/// 
/// so if n is power of 4 and 2 then n & (n - 1) will be 0
/// but if you see the binary representation of 4 and 2, you will see that the only difference is that 4 has 1 at even places
/// so if n is power of 4 then n & 0x55555555 will be n
/// where 0x55555555 = 0b1010101010101010101010101010101  (32 bit)  

/// Complexity Analysis
/// Time Complexity: O(1)
/// Space Complexity: O(1)
