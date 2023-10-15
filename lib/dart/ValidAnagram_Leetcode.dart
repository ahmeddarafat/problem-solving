// Problem Name: Valid Anagram
// Problem Link: https://leetcode.com/problems/valid-anagram/

import 'dart:collection';

void main() {
  var s = "ss";
  print(s[0]);
  print(s[1]);
}

// -----------------------------------

/// Solution

/// 1. map
class Solution {
  bool isAnagram(String s, String t) {
    if (s.length != t.length) return false;

    var map = <String, dynamic>{};
    for (int i = 0; i < s.length; i++) {
      if (map.containsKey(s[i])) {
        map[s[i]] += 1;
      } else {
        map[s[i]] = 1;
      }
    }
    for (int i = 0; i < t.length; i++) {
      if (map.containsKey(t[i])) {
        map[t[i]] -= 1;
      } else {
        map[t[i]] = 1;
      }
    }
    for (var num in map.values) {
      if (num != 0) return false;
    }
    return true;
  }
}

/// 2. list
class Solution2 {
  bool isAnagram(String s, String t) {
    if (s.length != t.length) return false;

    final counter = List.filled(26, 0);

    for (int i = 0; i < s.length; i++) {
      counter[s[i].codeUnitAt(0) - 'a'.codeUnitAt(0)]++;
    }

    for (int i = 0; i < t.length; i++) {
      counter[t[i].codeUnitAt(0) - 'a'.codeUnitAt(0)]--;
    }

    for (int val in counter) {
      if (val != 0) return false;
    }

    return true;
  }
}
