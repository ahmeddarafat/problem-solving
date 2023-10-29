// Problem Name: Generate Parentheses
// Problem Link: https://leetcode.com/problems/generate-parentheses/

void main() {}

// -----------------------------------

/// Solutions

class Solution {
  List<String> generateParenthesis(int n) {
    // holder for all valid resutls
    final list = <String>[];
    recSol(n, 0, 0, "", list);
    return list;
  }

  void recSol(int n, int open, int close, String str, List<String> list) {
    // Stop condition
    if (str.length == n * 2) {
      list.add(str);
    }
    if (open < n) {
      recSol(n, open + 1, close, "$str(", list);
    }
    if (open > close) {
      recSol(n, open, close + 1, "$str)", list);
    }
  }
}
