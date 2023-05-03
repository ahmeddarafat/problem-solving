// Problem Name: Find the Difference of Two Arrays
// Problem Link: https://leetcode.com/problems/find-the-difference-of-two-arrays/


import 'dart:io';
import 'dart:math';

void main() {
  print(Solution().findDifference([1, 2, 3, 3], [1, 1, 2, 2]));
}

class Solution {
  List<List<int>> findDifference(List<int> nums1, List<int> nums2) {
    nums1 = nums1.toSet().toList();
    nums2 = nums2.toSet().toList();
    print(nums1);
    print(nums2);
    List<List<int>> answer = [[], []];
    List<int> union = [];
    int i, j;
    for (i = 0; i < nums1.length; i++) {
      for (j = 0; j < nums2.length; j++) {
        if (nums1[i] == nums2[j]) {
          union.add(nums1[i]);
          break;
        }
      }
      if (j == nums2.length) {
        answer[0].add(nums1[i]);
      }
    }
    for (var num in union) {
      nums2.remove(num);
    }
    answer[1].addAll(nums2);

    return answer;
  }
}

// -----------------------------------

// another soluiton

class Solution {
  List<List<int>> findDifference(List<int> nums1, List<int> nums2) {
    Set<int> set1 = nums1.toSet();
    Set<int> set2 = nums2.toSet();
    List<int> n1 = set1.difference(set2).toList();
    List<int> n2 = set2.difference(set1).toList();
    return [n1, n2];
  }
}
