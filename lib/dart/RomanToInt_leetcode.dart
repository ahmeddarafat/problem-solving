// Problem Name: Roman to Integer
// Problem Link: https://leetcode.com/problems/roman-to-integer/

import 'dart:ffi';
import 'dart:io';
import 'dart:math';

void main() {
  print(Solution().romanToInt("DCXXI"));
}

class Solution {
  List romanChars = ['I', 'V', 'X', 'L', 'C', 'D', 'M'];
  int romanToInt(String s) {
    int total = 0;
    int i;
    for (i = 1; i < s.length; i++) {
      if (romanChars.indexOf(s[i]) > romanChars.indexOf(s[i - 1])) {
        total -= num(s[i - 1]);
        total += num(s[i]);
        i++;
      } else {
        total += num(s[i - 1]);
      }
    }
    if (i == s.length) {
      total += num(s[s.length - 1]);
    }
    return total;
  }

  int num(String char) {
    switch (char) {
      case 'I':
        return 1;
      case 'V':
        return 5;
      case 'X':
        return 10;
      case 'L':
        return 50;
      case 'C':
        return 100;
      case 'D':
        return 500;
      case 'M':
        return 1000;
      default:
        return 0;
    }
  }
}

// -----------------------------------

// another soluiton

class Solution {
  int romanToInt(String s) {
    Map<String, int> translations = {
      "I": 1,
      "V": 5,
      "X": 10,
      "L": 50,
      "C": 100,
      "D": 500,
      "M": 1000
    };
    int number = 0;
    s = s.replaceAll("IV", "IIII").replaceAll("IX", "VIIII");
    s = s.replaceAll("XL", "XXXX").replaceAll("XC", "LXXXX");
    s = s.replaceAll("CD", "CCCC").replaceAll("CM", "DCCCC");
    for (int i = 0; i < s.length; i++) {
      number += translations[s[i]]!;
    }

    return number;
  }
}
