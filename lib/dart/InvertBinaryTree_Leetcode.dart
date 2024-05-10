// Problem Name: Invert Binary Tree
// Problem Link: https://leetcode.com/problems/invert-binary-tree/description/

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
  TreeNode? invertTree(TreeNode? root) {
    if (root == null) {
      return null;
    }

    final left = root.left;
    final right = root.right;
    root.left = invertTree(right);
    root.right = invertTree(left);
    return root;
  }
}

/// DFS (with stack)
class Solution2 {
  TreeNode? invertTree(TreeNode? root) {
    if (root == null) {
      return null;
    }

    final stack = Queue<TreeNode>();
    stack.addLast(root);

    while (stack.isNotEmpty) {
      final node = stack.removeLast();
      final left = node.left;
      node.left = node.right;
      node.right = left;

      if (node.left != null) {
        stack.addLast(node.left!);
      }
      if (node.right != null) {
        stack.addLast(node.right!);
      }
    }
    return root;
  }
}


/// BFS (with queue)
class Solutio3 {
  TreeNode? invertTree(TreeNode? root) {
    if (root == null) {
      return null;
    }

    final queue = Queue<TreeNode>();
    queue.addFirst(root);  // here the change

    while (queue.isNotEmpty) {
      final node = queue.removeLast();
      final left = node.left;
      node.left = node.right;
      node.right = left;

      if (node.left != null) {
        queue.addLast(node.left!);
      }
      if (node.right != null) {
        queue.addLast(node.right!);
      }
    }
    return root;
  }
}
