// Problem Name: 3 Sum
// Problem Link: https://leetcode.com/problems/3sum/description/

class Solution {
  List<List<int>> threeSum(List<int> nums) {
    nums.sort(); // Sort the array in ascending order

    List<List<int>> result = [];

    for (int i = 0; i < nums.length - 2; i++) {
      if (i == 0 || (i > 0 && nums[i] != nums[i - 1])) {
        int left = i + 1;
        int right = nums.length - 1;
        int target = -nums[i]; // Find two numbers that sum up to -nums[i]

        while (left < right) {
          if (nums[left] + nums[right] == target) {
            result.add([nums[i], nums[left], nums[right]]);
            // Skip duplicates
            while (left < right && nums[left] == nums[left + 1]) left++;
            while (left < right && nums[right] == nums[right - 1]) right--;
            left++;
            right--;
          } else if (nums[left] + nums[right] < target) {
            left++;
          } else {
            right--;
          }
        }
      }
    }

    return result;
  }
}

