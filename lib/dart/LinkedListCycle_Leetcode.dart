// Problem Name: Linked List Cycle
// Problem Link: https://leetcode.com/problems/linked-list-cycle/description/

import 'dart:io';
import 'dart:math';

void main() {
  final s = Solution();
}

/// Definition for singly-linked list.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

/// Floyd's cycle detection
class Solution {
  bool hasCycle(ListNode? head) {
    ListNode? fast = head;
    ListNode? slow = head;

    while (fast != null && fast.next != null) {
      fast = fast.next?.next;
      slow = slow?.next;

      if (fast?.val == slow?.val) return true;
    }

    return false;
  }
}
