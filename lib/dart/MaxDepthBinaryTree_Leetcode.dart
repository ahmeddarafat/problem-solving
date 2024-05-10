// Problem Name: Maximum Depth of binary tree
// Problem Link: https://leetcode.com/problems/maximum-depth-of-binary-tree/description/

import 'dart:collection';
import 'dart:io';
import 'dart:math';

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
  int maxDepth(TreeNode? root) {
    final max = _getMax(root, 1);
    return max;
  }

  int _getMax(TreeNode? root, int max) {
    if (root == null) return max - 1;
    final left = _getMax(root.left, max + 1);
    final right = _getMax(root.right, max + 1);

    return left > right ? left : right;
  }
}
