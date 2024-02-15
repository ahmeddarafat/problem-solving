// Problem Name: Merge two lists
// Problem Link: https://leetcode.com/problems/merge-two-sorted-lists/description/

import 'dart:io';
import 'dart:math';

void main() {}

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

// Recursion
class Solution {
  ListNode? mergeTwoLists(ListNode? list1, ListNode? list2) {
    if (list1 == null) return list2;
    if (list2 == null) return list1;

    if (list1.val < list2.val) {
      list1.next = mergeTwoLists(list1.next, list2);
      return list1;
    } else {
      list2.next = mergeTwoLists(list1, list2.next);
      return list2;
    }
  }
}

class Solution2 {
  ListNode? mergeTwoLists(ListNode? list1, ListNode? list2) {
    ListNode? head = ListNode();
    ListNode? current = head;
    while (list1 != null && list2 != null) {
      if (list1.val < list2.val) {
        current!.next = list1;
        list1 = list1.next;
      } else {
        current!.next = list2;
        list2 = list2.next;
      }
      current = current.next;
    }
    current!.next = (list1 == null) ? list2 : list1;
    return head.next;
  }
}
