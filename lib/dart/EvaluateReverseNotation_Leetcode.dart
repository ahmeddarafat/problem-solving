// Problem Name: Evaluate Reverse Polish Notation
// Problem Link: https://leetcode.com/problems/evaluate-reverse-polish-notation/

void main() {}

// -----------------------------------

/// Solutions

// 2nd Solution (with 2 arrays)

class Solution {
  int evalRPN(List<String> tokens) {
    final stack = Stack();
    int second = 0;
    for (var token in tokens) {
      if (token == '+') {
        stack.push(stack.pop() + stack.pop());
      } else if (token == '-') {
        second = stack.pop();
        stack.push(stack.pop() - second);
      } else if (token == '*') {
        stack.push(stack.pop() * stack.pop());
      } else if (token == '/') {
        second = stack.pop();
        stack.push(stack.pop() ~/ second);
      } else {
        stack.push(int.parse(token));
      }
    }
    return stack.pop();
  }
}

class Stack {
  List<int> stack = [];

  MinStack() {}

  void push(int val) {
    stack.add(val);
  }

  int pop() {
    return stack.removeLast();
  }

  int top() {
    return stack.last;
  }
}
