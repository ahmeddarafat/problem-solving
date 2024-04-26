// ignore_for_file: unused_import

// Problem Name: Remove Element
// Problem Link: https://leetcode.com/problems/remove-element/description/

import 'dart:io';
import 'dart:math';

void main() {
  final s = Solution();
  print(s.removeElement([0, 1, 2, 2, 3, 4, 5], 2));
}

class Solution {
  int removeElement(List<int> nums, int val) {
    int cnt = 0;
    for (int i = 0; i < nums.length; i++) {
      if (nums[i] != val) {
        nums[cnt] = nums[i];
        cnt++;
      }
    }
    return cnt;
  }
}
