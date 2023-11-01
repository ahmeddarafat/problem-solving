// Problem Name: Search a 2D Matrix
// Problem Link: https://leetcode.com/problems/search-a-2d-matrix/

void main() {
  final s = Solution();
  print(s.searchMatrix([
    [1, 3, 5, 7],
    [10, 11, 16, 20],
    [23, 30, 34, 60]
  ], 3));
}

// -----------------------------------

/// Solutions

class Solution {
  bool searchMatrix(List<List<int>> matrix, int target) {
    int n = matrix.length, m = matrix[0].length;
    int start = 0;
    int end = n * m - 1;
    int middle = (end + start) ~/ 2;
    while (start <= end) {
      if (matrix[middle ~/ m][middle % m] == target) {
        return true;
      } else if (matrix[middle ~/ m][middle % m] > target) {
        end = middle - 1;
      } else {
        start = middle + 1;
      }
      middle = (end + start) ~/ 2;
    }
    return false;
  }
}

// ----------------------------------------------------

/// Explanation

// - Don't treat it as a 2D matrix, just treat it as a sorted list
// - n * m matrix convert to an array => matrix[x][y] => a[x * m + y]
// - an array convert to n * m matrix => a[x] =>matrix[x / m][x % m];
