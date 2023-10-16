// Problem Name: Valid Sudoku
// Problem Link: https://leetcode.com/problems/valid-sudoku/description/

import 'dart:collection';

/// Client
void main() {
  final s = Solution1();

  print(
    s.isValidSudoku(
      [
        ["8", "8", ".", ".", "7", ".", ".", ".", "."],
        ["6", ".", ".", "1", "9", "5", ".", ".", "."],
        [".", "9", "8", ".", ".", ".", ".", "6", "."],
        ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
        ["4", ".", ".", "8", ".", "3", ".", ".", "1"],
        ["7", ".", ".", ".", "2", ".", ".", ".", "6"],
        [".", "6", ".", ".", ".", ".", "2", "8", "."],
        [".", ".", ".", "4", "1", "9", ".", ".", "5"],
        [".", ".", ".", ".", "8", ".", ".", "7", "9"],
      ],
    ),
  );
}

// -----------------------------------

/// Solution

/// 1. Hash Set
class Solution1 {
  bool isValidSudoku(List<List<String>> board) {
    var set = HashSet<String>();
    for (int i = 0; i < 9; ++i) {
      for (int j = 0; j < 9; ++j) {
        if (board[i][j] != '.') {
          String value = "(${board[i][j]})";
          if (!set.add("$value in row ($i)") ||
              !set.add("$value in colum ($j)") ||
              !set.add("$value in grid (${i ~/ 3},${j ~/ 3})")) return false;
        }
      }
    }
    return true;
  }
}

/// 2. bitwise operateion
class Solution2 {
  bool isValidSudoku(List<List<String>> board) {
    var rows = List.filled(9, 0);
    var cols = List.filled(9, 0);
    var grids = List.filled(9, 0);

    for (int r = 0; r < 9; r++) {
      for (int c = 0; c < 9; c++) {
        if (board[r][c] == ".") continue;

        var idx = int.parse(board[r][c]) - 1;

        if ((rows[r] & (1 << idx)) != 0) return false;
        rows[r] |= 1 << idx;

        if ((cols[c] & (1 << idx)) != 0) return false;
        cols[c] |= 1 << idx;

        if ((grids[r ~/ 3 * 3 + c ~/ 3] & (1 << idx)) != 0) return false;
        grids[r ~/ 3 * 3 + c ~/ 3] |= 1 << idx;
      }
    }

    return true;
  }
}

// ----------------------------------------------------

/// Explanation
/// - 3st Solution
///
/// Idea:
/// - Using hash set
///
/// Steps:
/// 1. create hash set
/// 2. for loop though all number in board
/// 3. each number will be added to hash set 3 times:
///    (value) in row ()
///    (value) in column ()
///    (value) in grid (,)
/// 4. If the number formula is founded, so return false
/// 5. To divide the gird to 9 blocks, you use ~/ (integer division)
/// 6. the gird:
///           0      1       2
///         0,1,2  3,4,5   6,7,8
///        0
///     0  1
///        2
///        3
///     1  4
///        5
///        6
///     2  7
///        8
/// 
/// 7. so the index 4,7  in (4~/3, 7~/3) ==> (1,2) block

// ----------------------------------------------------

/// Draft

class Draft {
  bool isValidSudoku(List<List<String>> board) {
    int i = 0, j = 0;
    var set = <String>{};
    var list = <String>[];

    /// check all rows
    while (i < 9) {
      set = board[i].toSet();
      list = board[i].where((element) {
        return element != ".";
      }).toList();
      if (set.length != (list.length + 1)) return false;
      i++;
    }

    /// check all colums
    i = 0;
    set = <String>{};
    list = <String>[];
    while (i < 9) {
      while (j < 9) {
        set.add(board[j][i]);
        list.add(board[j][i]);
        j++;
      }
      list = list.where((element) {
        return element != ".";
      }).toList();
      if (set.length != (list.length + 1)) return false;
      set = <String>{};
      list = <String>[];
      i++;
    }

    return true;
  }
}
