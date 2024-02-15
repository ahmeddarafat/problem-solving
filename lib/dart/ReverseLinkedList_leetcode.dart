// Problem Name: reverse linked list
// Problem Link: https://leetcode.com/problems/reverse-linked-list/description/

import 'dart:io';
import 'dart:math';

void main() {}

class Solution {
  ListNode? reverseList(ListNode? head) {
    if (head == null) return null;

    ListNode? newHead;

    while (head != null) {
      if (newHead == null) {
        newHead = head;
        head = head.next;
        newHead.next = null;
      } else {
        var temp = newHead;
        newHead = head;
        head = head.next;
        newHead.next = temp;
      }
    }

    return newHead;
  }
}

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}
