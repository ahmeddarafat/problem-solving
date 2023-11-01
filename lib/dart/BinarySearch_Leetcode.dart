// Problem Name: Binary Search
// Problem Link: https://leetcode.com/problems/binary-search/

void main() {
  final s = Solution();
  print(s.search([-1,0,3,5,9,12], 9));
}

// -----------------------------------

/// Solutions

class Solution {
  int search(List<int> nums, int target) {
    int start = 0;
    int end = nums.length - 1;
    int middle = (end + start) ~/ 2;
    while (start <= end) {
      if (nums[middle] == target) {
        return middle;
      } else if (nums[middle] > target) {
        end = middle - 1;
        middle = (end + start) ~/ 2;
      } else {
        start = middle + 1;
        middle = (end + start) ~/ 2;
      }
    }
    return -1;
  }
}
