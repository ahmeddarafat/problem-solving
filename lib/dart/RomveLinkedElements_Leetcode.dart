// Problem Name: Remove Linked List Elements
// Problem Link: https://leetcode.com/problems/remove-linked-list-elements/description/

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

class Solution {
  ListNode? removeElements(ListNode? head, int val) {
    while (head != null && head.val == val) {
      head = head.next;
    }

    if (head == null) return head;

    ListNode? current = head;

    while (current?.next != null) {
      if (current!.next!.val == val) {
        current.next = current.next?.next;
      } else {
        current = current.next;
      }
    }

    return head;
  }
}

/// Another Solution
/// with recursion
class Solution2 {
  ListNode? removeElements(ListNode? head, int val) {
    if (head == null) return head;
    head.next = removeElements(head.next, val);
    return head.val == val ? head.next : head;
  }
}
