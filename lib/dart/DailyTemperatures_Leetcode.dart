// Problem Name: Daily Temperatures
// Problem Link: https://leetcode.com/problems/daily-temperatures/

import 'dart:collection';

void main() {
  final s = Solution2();
  print(s.dailyTemperatures([73, 74, 75, 71, 69, 72, 72, 76, 73]));
}

// -----------------------------------

/// Solutions

// 1st solution
// - Time Limit Exceeded
class Solution {
  List<int> dailyTemperatures(List<int> temperatures) {
    final answer = List.filled(temperatures.length, 0);
    int temp = 0;
    for (int i = 0; i < temperatures.length; i++) {
      for (int j = i + 1; j < temperatures.length; j++) {
        if (temperatures[i] < temperatures[j]) {
          temp++;
          break;
        } else {
          if (j == temperatures.length - 1) {
            temp = 0;
            break;
          }
          temp++;
        }
      }
      answer[i] = temp;
      temp = 0;
    }
    return answer;
  }
}

// 2nd solution
class Solution2 {
  List<int> dailyTemperatures(List<int> temperatures) {
    final answer = List.filled(temperatures.length, 0);
    final stack = Queue<Node>();
    for (int i = 0; i < temperatures.length; i++) {
      if (stack.isEmpty) {
        stack.addLast(Node(i, temperatures[i]));
        print(stack);
      } else {
        while (stack.isNotEmpty && stack.last.value < temperatures[i]) {
          int index = stack.last.index;
          answer[index] = i - index;
          stack.removeLast();
        }
        stack.addLast(Node(i, temperatures[i]));
      }
    }

    return answer;
  }
}

class Node {
  final int index;
  final int value;

  Node(this.index, this.value);

  @override
  String toString() {
    return "Node(index: $index, value: $value)";
  }
}
