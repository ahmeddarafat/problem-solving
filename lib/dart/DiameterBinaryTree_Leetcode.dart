// Problem Name: Diameter of Binary Tree
// Problem Link: https://leetcode.com/problems/diameter-of-binary-tree/description/

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
  int max = 0;

  int diameterOfBinaryTree(TreeNode? root) {
    maxDepth(root);
    return max;
  }

  int maxDepth(TreeNode? root) {
    if (root == null) return 0;

    int left = maxDepth(root.left);
    int right = maxDepth(root.right);

    max = math.max(max, left + right);

    return math.max(left, right) + 1;
  }
}
