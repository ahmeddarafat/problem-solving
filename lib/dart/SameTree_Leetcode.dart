// Problem Name: Same tree
// Problem Link: https://leetcode.com/problems/same-tree/description/

import 'dart:collection';
import 'dart:io';
import 'dart:math' as math;

void main() {}

// Definition for a binary tree node.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

/// DFS (recursion)
class Solution {
  var result = true;

  bool isSameTree(TreeNode? p, TreeNode? q) {
    isEqual(p, q);
    return result;
  }

  void isEqual(TreeNode? p, TreeNode? q) {
    if (p == null && q == null) return;
    if (!result) return;

    isEqual(p?.left, q?.left);
    isEqual(p?.right, q?.right);
    if (p?.val != q?.val) {
      result = false;
    }
  }
}

class Solution2 {
  bool isSameTree(TreeNode? p, TreeNode? q) {
    if (p == null && q == null) return true;
    if (p == null || q == null) return false;
    if (p.val == q.val) {
      return isSameTree(p.left, q.left) && isSameTree(p.right, q.right);  // "&&" because it maybe left same but right not sane
    }
    return false;
  }
}

// BFS (Queue)
class Solution3 {
  bool isSameTree(TreeNode? p, TreeNode? q) {
    if (p == null && q == null) return true;
    if (p == null || q == null) return false;
    final queue = Queue<TreeNode?>();
    queue.add(p);
    queue.add(q);
    while (queue.isNotEmpty) {
      var p = queue.removeFirst();
      var q = queue.removeFirst();
      var val1 = p?.val;
      var val2 = q?.val;
      if (val1 != val2) return false;
      queue.add(p?.left);
      queue.add(q?.left);
      queue.add(p?.right);
      queue.add(q?.right);
    }

    return false;
  }
}
