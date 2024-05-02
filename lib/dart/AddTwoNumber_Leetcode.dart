// Problem Name: Add Two Numbers
// Problem Link: https://leetcode.com/problems/add-two-numbers/description/

import 'dart:io';
import 'dart:math';

void main() {
  final s = Solution();
}

// Definition for singly-linked list.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    if (l1 == null) return l2;
    if (l2 == null) return l1;

    ListNode? dummy = ListNode(0);
    ListNode? current = dummy;
    int carry = 0;

    while (l1 != null || l2 != null) {
      int x = l1?.val ?? 0;
      int y = l2?.val ?? 0;
      int sum = x + y + carry;
      carry = sum ~/ 10;
      current!.next = ListNode(sum % 10);
      current = current.next;

      l1 = l1?.next;
      l2 = l2?.next;
    }

    if (carry > 0) {
      current!.next = ListNode(carry);
    }

    return dummy.next;
  }
}
