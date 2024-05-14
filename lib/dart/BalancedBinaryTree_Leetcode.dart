// Problem Name: Balanced Binary Tree
// Problem Link: https://leetcode.com/problems/balanced-binary-tree/description/

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
  bool result = true;

  bool isBalanced(TreeNode? root) {
    maxDepth(root);
    return result;
  }

  int maxDepth(TreeNode? root) {
    if (root == null) return 0;
    int l = maxDepth(root.left);
    int r = maxDepth(root.right);
    if ((l - r).abs() > 1) result = false;
    return 1 + math.max(l, r);
  }
}
