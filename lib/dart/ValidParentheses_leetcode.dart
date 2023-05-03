// Problem Name: Valid Parentheses
// Problem Link: https://leetcode.com/problems/valid-parentheses/

import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'package:stack/stack.dart';

void main() {
  print(Solution().isValid("((({[]})))"));
  print(Solution().isValid("(){}{}[]()"));
}

// -----------------------------------

// Solution
//   - using stack

class Solution {
  bool isValid(String s) {
    var stack = Stack<String>();
    bool isBalance = false;
    for (int i = 0; i < s.length; i++) {
      String c = s[i];
      if (c == '(' || c == '{' || c == '[') {
        stack.push(c);
      } else {
        if (stack.length != 0 && isMathingPair(stack.top(), c)) {
          stack.pop();
        } else {
          isBalance = false;
          break;
        }
      }
    }
    if (stack.length == 0) isBalance = true;
    return isBalance;
  }

  bool isMathingPair(String c1, String c2) {
    if (c1 == '(' && c2 == ')') {
      return true;
    } else if (c1 == '{' && c2 == '}') {
      return true;
    } else if (c1 == '[' && c2 == ']') {
      return true;
    } else {
      return false;
    }
  }
}

// ----------------------------------------------------

// another solution
//    - using stack

class Solution {
  bool isValid(String s) {
    Stack<String> stack = Stack<String>();
    for (String c in s.split("")) {
      if (c == '(') {
        stack.push(')');
      } else if (c == '{') {
        stack.push('}');
      } else if (c == '[') {
        stack.push(']');
      } else if (stack.isEmpty || stack.pop() != c) {
        return false;
      }
    }
    return stack.isEmpty;
  }
}
// -----------------------------------

// another soluiton

class Solution {
  bool isValid(String s) {
    String d1 = "()";
    String d2 = "{}";
    String d3 = "[]";
    while (s.isNotEmpty) {
      if (s.contains(d1)) {
        s = s.replaceAll(d1, '');
      } else if (s.contains(d2)) {
        s = s.replaceAll(d2, '');
      } else if (s.contains(d3)) {
        s = s.replaceAll(d3, '');
      } else {
        return false;
      }
    }
    return true;
  }
}
