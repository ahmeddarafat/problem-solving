// Problem Name: Fibonacci Number
// Problem Link: https://leetcode.com/problems/fibonacci-number/description/

import 'dart:io';
import 'dart:math';

void main() {
  final s = Solution();
}

class Solution {
  int fib(int n) {
    if (n == 0) return 0;
    if (n == 1) return 1;
    return fib(n - 1) + fib(n - 2);
  }
}
