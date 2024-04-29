// Problem Name: Palindrome Linked List
// Problem Link: https://leetcode.com/problems/palindrome-linked-list/description/

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
  bool isPalindrome(ListNode? head) {
    if (head == null || head.next == null) return true;
    List<int> values = [];

    while (head != null) {
      values.add(head.val);
      head = head.next;
    }
    int i = 0;
    int j = values.length - 1;
    while (i < j) {
      if (values[i] != values[j]) {
        return false;
      } else {
        i++;
        j--;
      }
    }

    return true;
  }
}

/// Another Solution
/// with Floyd's cycle detection
class Solution2 {
  bool isPalindrome(ListNode? head) {
    if (head == null || head.next == null) return true;

    ListNode? slow = head, fast = head, prev, temp;
    while (fast != null && fast.next != null) {
      slow = slow!.next;
      fast = fast.next!.next;
    }
    prev = slow;
    slow = slow!.next;
    prev!.next = null;
    while (slow != null) {
      temp = slow.next;
      slow.next = prev;
      prev = slow;
      slow = temp;
    }
    fast = head;
    slow = prev;
    /// check only slow pointer because the slow pointer will be null before 
    /// fast pointer in even list
    while (slow != null) {
      if (fast!.val != slow.val) return false;
      fast = fast.next;
      slow = slow.next;
    }
    return true;
  }
}
