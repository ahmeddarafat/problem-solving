
// Problem Name: Trapping Rain Water
// Problem Link: https://leetcode.com/problems/trapping-rain-water/description/

import 'dart:collection';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;

void main() {
  final s = Solution2();
  s.trap([0,1,0,2,1,0,1,3,2,1,2,1]);
}

/// Time Complexity  : O(n^2)
/// Space Complexity : O(1)
class Solution {
  int trap(List<int> height) {
    int water = 0;
    int left = 0;
    int right = 0;
    for (int i = 1; i < height.length - 1; i++) {
      left = i - 1;
      right = i + 1;
      int maxLeft = 0;
      int maxRight = 0;
      while (left > -1) {
        if (maxLeft < height[left]) {
          maxLeft = height[left];
        }
        left--;
      }
      while (right < height.length) {
        if (maxRight < height[right]) {
          maxRight = height[right];
        }
        right++;
      }
      int units = math.min(maxLeft, maxRight) - height[i];
      water += units > 0 ? units : 0;
    }

    return water;
  }
}

/// Time Complexity  : O(n)
/// Space Complexity : O(n)
class Solution2 {
  int trap(List<int> height) {
    int n = height.length;
    int water = 0;
    List<int> maxLefts = List.filled(n, 0);
    List<int> maxRights = List.filled(n, 0);
    for (int i = 1; i < n; i++) {
      maxLefts[i] = math.max(maxLefts[i - 1], height[i - 1]);
    }
    for (int i = n - 2; i >= 0; i--) {
      maxRights[i] = math.max(maxRights[i + 1], height[i + 1]);
    }

    print(maxLefts);
    print(maxRights);

    for (int i = 0; i < n; i++) {
      int units = math.min(maxLefts[i], maxRights[i]) - height[i];
      water += units > 0 ? units : 0;
    }

    return water;
  }
}
