// Problem Name: Majority Element
// Problem Link: https://leetcode.com/problems/majority-element/description/

import 'dart:io';
import 'dart:math';

void main() {
  final s = Solution();
}

class Solution {
  int majorityElement(List<int> nums) {
    if (nums.isEmpty) return -1;
    Map<int, int> map = {};
    for (int i = 0; i < nums.length; i++) {
      if (map.containsKey(nums[i])) {
        map[nums[i]] = map[nums[i]]! + 1;
      } else {
        map[nums[i]] = 1;
      }
    }
    int max = 0;
    int key = 0;
    for (var entry in map.entries) {
      if (entry.value > max) {
        max = entry.value;
        key = entry.key;
      }
    }

    return key;
  }
}
