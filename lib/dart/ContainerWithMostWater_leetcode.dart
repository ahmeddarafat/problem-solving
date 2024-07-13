
// Problem Name: Container with most water
// Problem Link: https://leetcode.com/problems/container-with-most-water/description/

import 'dart:collection';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;

void main() {
  final s = Solution();
  s.maxArea([2, 3, 10, 5, 7, 8, 9]);
}

class Solution {
  int maxArea(List<int> height) {
    int max = 0;
    int left = 0;
    int right = height.length - 1;
    while (left < right) {
      int temp = (right - left) * math.min(height[left], height[right]);
      max = math.max(max, temp);
      if (height[left] < height[right]) {
        left++;
      } else {
        right--;
      }
    }

    return max;
  }
}
