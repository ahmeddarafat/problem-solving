// Problem Name: Number of Good Pairs
// Problem Link: https://leetcode.com/problems/number-of-good-pairs/description/

import 'dart:collection';
import 'dart:io';
import 'dart:math';

void main() {
  final s = Solution();
  List<int> nums = [1, 2, 3, 1, 1, 3];
  print(s.numIdenticalPairs(nums));
}

class Solution {
  double numIdenticalPairs(List<int> nums) {
    if (nums.isEmpty) return 0;

    double count = 0;
    var hashMap = HashMap<int, int>();
    for (int i = 0; i < nums.length; i++) {
      if (hashMap.containsKey(nums[i])) {
        hashMap[nums[i]] = hashMap[nums[i]]! + 1;
      } else {
        hashMap[nums[i]] = 1;
      }
    }
    print(hashMap);
    for (var value in hashMap.values) {
      if (value > 1) {
        count += value * (value - 1) / 2;
      }
    }

    return count;
  }
}
