// Problem Name: Missing Number
// Problem Link: https://leetcode.com/problems/missing-number/description/

import 'dart:io';
import 'dart:math';

void main() {
  List<int> nums = [0, 1, 3];
  final solution = Solution();
  print(solution.missingNumber(nums));
}

class Solution {
  int missingNumber(List<int> nums) {
    int n = nums.length;
    int total = (n * (n + 1)) ~/ 2;
    // sum of all elements in the list
    int sum = nums.reduce((value, element) => value + element);
    return total - sum;
  }
}

/// Using XOR
class Solution2 {
  int missingNumber(List<int> nums) {
    int ans = 0;
    for (int i = 1; i <= nums.length; i++) {
      ans = ans ^ i ^ nums[i - 1];
    }
    return ans;
  }
}

/// Explanation
/// assume   a = 1, b = 2 ,....
/// the array is            [a, b, 0]  
/// the index+1 of array is [a, b, c]
/// so the missing number is c
/// 
/// if a ^ a = 0  & a ^ 0 = a & a ^ b ^ a = b
/// so a ^ b ^ c ^ a ^ b = c (the missing number)
