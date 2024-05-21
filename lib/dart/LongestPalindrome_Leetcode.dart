// Problem Name: Longest-palindrome
// Problem Link: https://leetcode.com/problems/longest-palindrome/description/

import 'dart:collection';
import 'dart:io';
import 'dart:math' as math;

void main() {}

class Solution {
  int longestPalindrome(String s) {
    if (s.length == 1) return 1;
    var map = HashMap<String, int>();
    var list = s.split('');
    for (var char in list) {
      if (map.containsKey(char)) {
        map[char] = map[char]! + 1;
      } else {
        map[char] = 1;
      }
    }

    bool isThereOne = false;
    int result = 0;
    for (var key in map.keys) {
      int value = map[key]!;
      if (value > 1) {
        if (value.isEven) {
          result += value;
        } else {
          result += value - 1;
          isThereOne = true;
        }
      } else {
        isThereOne = true;
      }
    }

    if (isThereOne) {
      result++;
    }

    return result;
  }
}

class Solution2 {
  int longestPalindrome(String s) {
    Set<String> se = {};
    int palindrome = 0;
    for (var char in s.split('')) {
      if (se.contains(char)) {
        se.remove(char);
        palindrome += 2;
      } else {
        se.add(char);
      }
    }
    if (se.isNotEmpty) {
      palindrome++;
    }
    return palindrome;
  }
}
