
// Problem Name: Pascal's Triangle
// Problem Link: https://leetcode.com/problems/pascals-triangle/description/

import 'dart:io';
import 'dart:math';

void main() {
  final s = Solution();
}

class Solution {
  List<List<int>> generate(int numRows) {
    if (numRows == 0) return [];
    if (numRows == 1) {
      List<List<int>> result = [];
      result.add([1]);
      return result;
    }

    List<List<int>> prevRows = generate(numRows - 1);
    List<int> newRow = List.filled(numRows, 1);

    for (int i = 1; i < numRows - 1; i++) {
      newRow[i] = prevRows[numRows - 2][i - 1] + prevRows[numRows - 2][i];
    }

    prevRows.add(newRow);
    return prevRows;
  }
}

/// the Equation of pascal's triangle is C(n, k) = C(n-1, k-1) + C(n-1, k)
/// where C(n, k) is the value of the element in the nth row and kth column

class Solution2 {
  List<List<int>> generate(int numRows) {
    if (numRows == 0) return [];
    List<List<int>> result = [];

    for (int n = 0; n < numRows; n++) {
      List<int> row = [];
      for (int k = 0; k <= n; k++) {
        if (k == 0 || k == n) {
          row.add(1);
        } else {
          row.add(result[n - 1][k - 1] + result[n - 1][k]);
        }
      }
      result.add(row);
    }
    return result;
  }
}
