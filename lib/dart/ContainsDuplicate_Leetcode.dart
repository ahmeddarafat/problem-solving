// Problem Name: Contains Duplicate
// Problem Link: https://leetcode.com/problems/contains-duplicate/

void main() {}

// -----------------------------------

/// Solution

/// 1. map
class Solution1 {
  bool containsDuplicate(List<int> nums) {
    var map = {};
    for (var n in nums) {
      if (map.containsKey(n)) return true;
      map[n] = 0;
    }

    return false;
  }
}

/// 2. set
class Solution2 {
  bool containsDuplicate(List<int> nums) {
    var set = <int>{};
    for (var n in nums) {
      if (set.contains(n)) return true;
      set.add(n);
    }

    return false;
  }
}

/// 3. nested loop
/// Time complexity: O((n∗(n+1))/2) ≈ O(n^2)
/// Space complexity: O(1)
class Solution3 {
  bool containsDuplicate(List<int> nums) {
    for (int i = 0; i < nums.length; i++) {
      for (int j = i + 1; j < nums.length; j++) {
        if (nums[i] == nums[j]) return true;
      }
    }
    return false;
  }
}
