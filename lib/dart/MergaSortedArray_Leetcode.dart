// Problem Name: Merga Sorted Array
// Problem Link: https://leetcode.com/problems/merge-sorted-array/description/

import 'dart:io';
import 'dart:math';

void main() {
  final s = Solution();
}

class Solution {
  void merge(List<int> nums1, int m, List<int> nums2, int n) {
    int i = m - 1, j = n - 1;
    while (i > -1 && j > -1) {
      if (nums1[i] >= nums2[j]) {
        nums1[i + j + 1] = nums1[i];
        i--;
      } else {
        nums1[i + j + 1] = nums2[j];
        j--;
      }
    }
    while (j > -1) {
      nums1[j] = nums2[j];
      j--;
    }
  }
}
