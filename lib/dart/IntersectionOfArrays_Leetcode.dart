// Problem Name: Intersection of Two Arrays
// Problem Link: https://leetcode.com/problems/intersection-of-two-arrays/description/

import 'dart:io';
import 'dart:math';

void main() {
  final solution = Solution2();
}

class Solution {
  List<int> intersection(List<int> nums1, List<int> nums2) {
    List<int> ans = [];
    for (int i = 0; i < nums1.length; i++) {
      if (ans.contains(nums1[i])) {
        continue;
      }
      for (int j = 0; j < nums2.length; j++) {
        if (nums1[i] == nums2[j]) {
          ans.add(nums1[i]);
          break;
        }
      }
    }
    return ans;
  }
}

class Solution2 {
  List<int> intersection(List<int> nums1, List<int> nums2) {
    Set<int> ans = {};
    nums1.sort();
    nums2.sort();

    int p1 = 0, p2 = 0;

    while (p1 < nums1.length && p2 < nums2.length) {
      if (nums1[p1] == nums2[p2]) {
        ans.add(nums1[p1]);
        p1++;
        p2++;
      } else if (nums1[p1] < nums2[p2]) {
        p1++;
      } else {
        p2++;
      }
    }
    return ans.toList();
  }
}
