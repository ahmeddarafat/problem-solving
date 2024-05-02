// Problem Name: count the number of items in a list
// Problem Link: Grokking Algorithms

import 'dart:io';
import 'dart:math';

void main() {
  final s = Solution();
  final list = [1, 2, 3, 4, 5];
  print(s.count(list)); // 5
}

class Solution {
  int count(List<int> list) {
    if (list.isEmpty) return 0;
    return 1 + count(list.sublist(1));
  }
}
