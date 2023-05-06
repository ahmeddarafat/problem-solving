// Problem Name: Remove Duplicates from Sorted Array
// Problem Link: https://leetcode.com/problems/remove-duplicates-from-sorted-array/

import 'dart:ffi';
import 'dart:io';
import 'dart:math' as math;
import 'package:stack/stack.dart';

void main() {
  print(Solution().removeDuplicates([0, 0, 1, 1, 1, 2, 2, 3, 3, 4]));
}

// -----------------------------------

// Solution

class Solution {
  int removeDuplicates(List<int> nums) {
    int current = nums[0];
    int duplicates = 0;
    for (int i = 1; i < nums.length; i++) {
      if (current == nums[i]) {
        nums.removeAt(i--);
        duplicates++;
      } else {
        current = nums[i];
      }
    }
    for (int i = 1; i <= duplicates; i++) {
      nums.add(-101);
    }
    print(nums);
    return nums.length - duplicates;
  }
}

// ----------------------------------------------------

// another soluiton
//  - It's NOT necessary to delete the duplicate elements. The delete operation costs many time.

class Solution {
  int removeDuplicates(List<int> nums) {
    int count = 0;
    for (int i = 1; i < nums.length; i++) {
      if (nums[i] == nums[i - 1]) {
        count++;
      } else {
        nums[i - count] = nums[i];
      }
    }
    print(nums);
    return nums.length - count;
  }
}

// ----------------------------------------------------

// another solution
//  - Right Solution but not accepted in leetcode

class Solution {
  int removeDuplicates(List<int> nums) {
    nums = nums.toSet().toList();
    nums.sort();
    print(nums);
    return nums.length;
  }
}
