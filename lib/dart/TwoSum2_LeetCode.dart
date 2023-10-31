// Problem Name: Two Sum II - Input Array Is Sorted
// Problem Link: https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/

void main() {
  final s = Solution();
  print(s.twoSum([1, 2, 3, 4, 5], 5));
}

// -----------------------------------

/// Solutions

class Solution {
  List<int> twoSum(List<int> numbers, int target) {
    List<int> answer = List.filled(2, 0);
    int p1 = 0, p2 = numbers.length - 1;
    while (p1 < p2) {
      if (numbers[p1] + numbers[p2] == target) {
        answer[0] = (p1 + 1);
        answer[1] = (p2 + 1);
        break;
      } else if (numbers[p1] + numbers[p2] < target) {
        p1++;
      } else {
        p2--;
      }
    }
    return answer;
  }
}
