// Problem Name: Sign of the Product of an Array
// Problem Link: https://leetcode.com/problems/sign-of-the-product-of-an-array/

import 'dart:io';
import 'dart:math';

void main() {}

class Solution {
  int arraySign(List<int> nums) {
    int totalNeg = 0;
    for (var num in nums) {
      if (num == 0) {
        return 0;
      } else if (num < 0) {
        totalNeg++;
      }
    }
    return totalNeg.isEven
        ? 1
        : totalNeg.isOdd
            ? -1
            : 0;
  }
}

// -----------------------------------

// another soluiton

class Solution {
  int arraySign(List<int> nums) {
    int sign = 1;
    for (int n in nums) {
      if (n == 0) {
        return 0;
      }
      if (n < 0) {
        sign = -sign;
      }
    }
    return sign;
  }
}
