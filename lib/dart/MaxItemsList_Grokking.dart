// Problem Name: max items in a list
// Problem Link: Grokking Algorithms

import 'dart:io';
import 'dart:math';

void main() {
  final s = Solution();
  final list = [7, 2, 6, 4, 5];
  print(s.max(list)); // 5
}

class Solution {
  int max(List<int> list) {
    if (list.isEmpty) return 0;
    return list[0] > max(list.sublist(1)) ? list[0] : max(list.sublist(1));
  }
}
