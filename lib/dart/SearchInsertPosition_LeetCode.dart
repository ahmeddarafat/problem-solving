/ Problem Name: search insert position
// Problem Link: https://leetcode.com/problems/search-insert-position/

import 'dart:io';
import 'dart:math';

void main() {}

class Solution {
  int searchInsert(List<int> nums, int target) {
    if (nums.isEmpty) return 0;

    int start = 0;
    int end = nums.length - 1;
    int middle = (start + end) ~/ 2;

    if (target > nums[end]) return end + 1;
    if (target < nums[start]) return start - 1;

    while (start < end) {
      middle = (start + end) ~/ 2;
      if (target == nums[middle]) {
        return middle;
      } else if (target > nums[middle]) {
        start = middle + 1;
      } else {
        end = middle - 1;
      }
    }

    if (target > nums[middle]) return middle + 1;
    return middle;
  }
}

/// Improvement

class Solution2 {
  int searchInsert(List<int> nums, int target) {
    if (nums.isEmpty) return 0;

    int start = 0;
    int end = nums.length - 1;
    int mid = (start + end) ~/ 2;

    while (start <= end) {
      mid = (start + end) ~/ 2;
      if (nums[mid] == target) {
        return mid;
      } else if (nums[mid] > target) {
        end = mid - 1;
      } else {
        start = mid + 1;
      }
    }

    return start;
  }
}
