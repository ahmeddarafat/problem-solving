// Problem Name: Jewels and Stones
// Problem Link: https://leetcode.com/problems/jewels-and-stones/description/

import 'dart:collection';
import 'dart:io';
import 'dart:math';

void main() {}

class Solution {
  int numJewelsInStones(String jewels, String stones) {
    int count = 0;
    var hashSet = HashSet<String>.from(jewels.split(''));
    for (int i = 0; i < stones.length; i++) {
      if (hashSet.contains(stones[i])) {
        count++;
      }
    }
    return count;
  }
}

class Solution2 {
  int numJewelsInStones(String jewels, String stones) {
      return stones.split('').where(jewels.contains).length;
  }
}
