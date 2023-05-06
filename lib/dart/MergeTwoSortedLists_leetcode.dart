// Problem Name: Merge Two Sorted Lists
// Problem Link: https://leetcode.com/problems/merge-two-sorted-lists/

import 'dart:ffi';
import 'dart:io';
import 'dart:math' as math;
import 'package:stack/stack.dart';

void main() {
}

// -----------------------------------

// Solution
//  - using recursion

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

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
