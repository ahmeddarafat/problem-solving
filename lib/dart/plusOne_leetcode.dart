// Problem Name: Plus One
// Problem Link: https://leetcode.com/problems/plus-one/

void main() {
  final s = Solution();
  print(s.plusOne([1, 2, 3]));
  print(s.plusOne([4, 3, 2, 1]));
  print(s.plusOne([9]));
}

// -----------------------------------

// Solution
class Solution {
  List<int> plusOne(List<int> digits) {
    for (int i = digits.length - 1; i > -1; i--) {
      if (digits[i] < 9) {
        digits[i]++;
        break;
      } else {
        digits[i] = 0;
      }
      if (i == 0) {
        digits = digits..add(1);
        digits = digits.reversed.toList();
        // you can use
        // digits.insert(0, 1);
      }
    }

    return digits;
  }
}
