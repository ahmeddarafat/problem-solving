
// Problem Name: Largest Rectangle in Histogram
// Problem Link: https://leetcode.com/problems/largest-rectangle-in-histogram/description/

import 'dart:collection';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;

void main() {
  final s = Solution2();
  print(s.largestRectangleArea([3,2, 1, 5, 6, 2, 3]));
}

/// Time Complexity  : O(1)
/// Space Complexity : O(n^2)
class Solution {
  int largestRectangleArea(List<int> heights) {
    int max = 0;
    for (int i = 0; i < heights.length; i++) {
      int minHight = heights[i];
      for (int j = i; j < heights.length; j++) {
        int value = heights[j];
        minHight = value < minHight ? value : minHight;
        int temp = (j - i + 1) * minHight;
        max = temp > max ? temp : max;
        print("value $value");
        print("minHight $minHight");
        print("temp $temp");
        print("max $max");
        print("------------------------");
      }
    }
    return max;
  }
}

/// Time Complexity  : O(n)
/// Space Complexity : O(n)
class Solution2 {
  int largestRectangleArea(List<int> heights) {
    int maxArea = 0;
    List<List<int>> stack = []; // pair: [index, height]

    for (int i = 0; i < heights.length; i++) {
      int h = heights[i];
      int start = i;
      while (stack.isNotEmpty && stack.last[1] > h) {
        List<int> pair = stack.removeLast();
        int index = pair[0];
        int height = pair[1];
        maxArea = math.max(maxArea, height * (i - index));
        start = index;
        print("stack $stack");
        print("maxArea $maxArea");
        print("------------------------");
      }
      stack.add([start, h]);
    }

    for (List<int> pair in stack) {
      int index = pair[0];
      int height = pair[1];
      maxArea = math.max(maxArea, height * (heights.length - index));
    }

    return maxArea;
  }
}
