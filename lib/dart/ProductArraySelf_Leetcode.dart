// Problem Name: Product of Array Except Self
// Problem Link: https://leetcode.com/problems/product-of-array-except-self/

/// Client
void main() {
  final s = Solution3();
  print(s.productExceptSelf([1, 2, 3, 4]));
}

// -----------------------------------

/// Solution

/// 1. first solution
class Solution1 {
  List<int> productExceptSelf(List<int> nums) {
    final ans = List.filled(nums.length, 1);
    for (int i = 0; i < nums.length; i++) {
      for (int j = 0; j < nums.length; j++) {
        if (i == j) continue;
        print("i: $i , j: $j");
        ans[i] *= nums[j];
      }
    }
    return ans;
  }
}

/// 2. Dividing the product of array with the number
class Solution2 {
  List<int> productExceptSelf(List<int> nums) {
    int n = nums.length;
    var ans = List.filled(nums.length, 1);
    int pro = 1;
    for (int i in nums) {
      pro *= i;
    }

    for (int i = 0; i < n; i++) {
      ans[i] = pro ~/ nums[i];
    }
    return ans;
  }
}

/// 3. You must write an algorithm that runs in O(n) time,
///    and without using the division operation.
class Solution3 {
  List<int> productExceptSelf(List<int> nums) {
    int n = nums.length;
    final ans = List.filled(n, 1);
    for (int i = 1; i < n; i++) {
      ans[i] = ans[i - 1] * nums[i - 1];
    }
    int right = 1;
    for (int i = n - 1; i >= 0; i--) {
      ans[i] *= right;
      right *= nums[i];
    }

    return ans;
  }
}


// ----------------------------------------------------

/// Explanation
/// - 3rd Solution
/// 
/// Idea: 
/// - is multiply all numbers on the right then all numbers on the left
/// 
/// Steps:
/// 1.  arr: [1,2,3,4]
/// 2.  create ans list [1,1,1,1]
/// 3.  start form index 1 
/// 4.  multiply  arr[0] * ans[0]
/// 5.  ans  : [1,1,1,1]
/// 6.  then at ans[2] multiply arr[1] * ans[1]
/// 7.  ans  : [1,1,2,1]
/// 8.  so ans[2] = num[0] * num[1] * num[2]
/// 9.  and keep going through the list
/// 10. ans :  [1,1,2,6]
/// 11. then multiply all numbers on the left
/// 12. right = 1
/// 13. start index from num.length - 1
/// 14. ans[3] = right * ans[3]
/// 15. ans: [1,1,2,6]
/// 16. right = right * num[3] = 1 * 4 = 4
/// 17. and keep going through the list
/// 18. ans : [24,12.8,6]
