// Problem Name: Remove Duplicates from Sorted List
// Problem Link: https://leetcode.com/problems/remove-duplicates-from-sorted-list/description/

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
  ListNode? deleteDuplicates(ListNode? head) {
    if (head == null) return null;
    ListNode? p1 = head;
    ListNode? p2 = head.next;

    while (p1 != null && p2 != null) {
      if (p1.val == p2.val) {
        p1.next = p2.next;
      } else {
        p1 = p2;
      }
      p2 = p2.next;
    }

    return head;
  }
}

/// Another solution
/// with same logic but only one pointer
class Solutio2 {
  ListNode? deleteDuplicates(ListNode? head) {
    if (head == null) return null;
    ListNode? current = head;

    while (current != null && current.next != null) {
      if (current.val == current.next!.val) {
        current.next = current.next!.next;
      } else {
        current = current.next;
      }
    }

    return head;
  }
}

/// Another solution
/// with recursion

class Solution3 {
  ListNode? deleteDuplicates(ListNode? head) {
    if (head == null || head.next == null) return head;

    head.next = deleteDuplicates(head.next);

    return head.val == head.next!.val ? head.next : head;
  }
}
