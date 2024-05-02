// Problem Name: Sum Recursive
// Problem Link: Grokking Algorithms

import 'dart:io';
import 'dart:math';

void main() {
  final s = Solution();
}

class Solution {
  int sum(List<int> list) {
    if (list.isEmpty) return 0;
    return list[0] + sum(list.sublist(1));
  }
}
