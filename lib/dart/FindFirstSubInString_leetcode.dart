// Problem Name: Find the Index of the First Occurrence in a String
// Problem Link: https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/

import 'dart:ffi';
import 'dart:io';
import 'dart:math' as math;
import 'package:stack/stack.dart';

void main() {
  print(Solution().strStr("sadbutsad", "sad"));
  print(Solution().strStr("leetcode", "leeto"));
  print(Solution().strStr("mississippi", "issip"));
  print(Solution().strStr("hello", "ll"));
  print(Solution().strStr("mississippi", "pi"));
}

// -----------------------------------

// Solution

class Solution {
  int strStr(String haystack, String needle) {
    if (needle.length > haystack.length) return -1;
    int i = needle.length - 1;
    int j = needle.length - 1;
    int k = 1;
    while (i < haystack.length && j >= 0) {
      if (haystack[i] == needle[j]) {
        if (j == 0) {
          return i;
        }
        j--;
        i--;
        k++;
      } else {
        i += k;
        k = 1;
        j = needle.length - 1;
      }
    }

    return -1;
  }
}

// ----------------------------------------------------

// another solution

class Solution {
  int strStr(String haystack, String needle) {
    for (int i = 0;; i++) {
      for (int j = 0;; j++) {
        print("i: $i, j: $j");
        if (j == needle.length) return i;
        if (i + j == haystack.length) return -1;
        if (needle[j] != haystack[i + j]) break;
      }
    }
  }
}


// ----------------------------------------------------

// Draft

// class Solution {
//   int strStr(String haystack, String needle) {
//     int i = 0, j = 0, index = -1;
//     if (needle.length > haystack.length) return index;
//     while (i < haystack.length && j < needle.length) {
//       print("i: $i");
//       print("j: $j");
//       print("index: $index");
//       if (haystack[i] == needle[j]) {
//         if (j == 0) {
//           index = i;
//         }
//         j++;
//       } else {
//         index = -1;
//         j = 0;
//       }
//       i++;
//     }

//     return index;
//   }
// }
