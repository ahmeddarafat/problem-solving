// Problem Name: Longest Consecutive Sequence
// Problem Link: https://leetcode.com/problems/longest-consecutive-sequence/

/// Client
void main() {
  final s = Solution();

  print(s.longestConsecutive([100, 4, 200, 1, 3, 2]));
}

// -----------------------------------

/// Solution

class Solution {
  int longestConsecutive(List<int> nums) {
    if (nums.isEmpty) return 0;
    int counter = 1;
    int max = 1;
    nums.sort();

    for (int i = 1; i < nums.length; i++) {
      if (nums[i] == nums[i - 1]) {
        continue;
      } else if (nums[i] == nums[i - 1] + 1) {
        counter++;
      } else {
        if (counter > max) {
          max = counter;
        }
        counter = 1;
      }
    }
    return counter > max ? counter : max;
  }
}
