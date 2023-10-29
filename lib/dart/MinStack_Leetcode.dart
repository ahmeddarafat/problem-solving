// Problem Name: Min Stack
// Problem Link: https://leetcode.com/problems/min-stack/

import 'dart:math' as Math;

void main() {
  final stack = MinStack();
  stack.push(5);
  stack.push(5);
  stack.push(5);
  stack.pop();
  stack.pop();
  stack.pop();
  stack.push(-5);
  print(stack.top());
  print(stack.getMin());
  stack.push(-2147483647);
  print(stack.top());
  print(stack.getMin());
  stack.pop();
  print(stack.getMin());
}

// -----------------------------------

/// Solutions

// 1st solution (with an array)
class MinStack {
  late int pointer;
  late List<int> values;
  MinStack() {
    pointer = -1;
    values = List.empty(growable: true);
  }

  void push(int val) {
    if (pointer < values.length - 1) {
      values[++pointer] = val;
    } else {
      values.add(val);
      pointer++;
    }
  }

  void pop() {
    if (pointer > -1) {
      pointer--;
    }
  }

  int top() {
    if (pointer > -1) {
      return values[pointer];
    }
    return 0;
  }

  int getMin() {
    if (pointer > -1) {
      int min = values[pointer];
      for (int i = pointer; i > -1; i--) {
        min = values[i] < min ? values[i] : min;
      }
      return min;
    }
    return 0;
  }
}

// 2nd Solution (with 2 arrays)
class MinStack {
  List<int> stack = [];
  List<int> minStack = [];

  MinStack() {}

  void push(int val) {
    stack.add(val);

    if (minStack.isEmpty) {
      minStack.add(val);
    } else if (val < minStack.last) {
      minStack.add(val);
    } else {
      minStack.add(minStack.last);
    }
  }

  void pop() {
    stack.removeLast();
    minStack.removeLast();
  }

  int top() {
    return stack.last;
  }

  int getMin() {
    return minStack.last;
  }
}

// 3rd Solution (with linked list)
class Node {
  final int val;
  final int min;
  final Node? next;

  Node(this.val, this.min, this.next);
}

class MinStack {
  Node? head;

  void push(int x) {
    if (head == null) {
      head = Node(x, x, null);
    } else {
      head = Node(x, Math.min(x, head!.min), head);
    }
  }

  void pop() {
    head = head!.next;
  }

  int top() {
    return head!.val;
  }

  int getMin() {
    return head!.min;
  }
}
