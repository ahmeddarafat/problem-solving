// Problem Name: Longest Common Prefix
// Problem Link: https://leetcode.com/problems/longest-common-prefix/

import 'dart:ffi';
import 'dart:io';
import 'dart:math';

void main() {
  print(Solution().longestCommonPrefix(["flower", "flow", "fl"]));
}

// class Solution {
//   String longestCommonPrefix(List<String> strs) {
//     String common = strs[0];
//     String word1 = strs[0];
//     for (int k = 1; k < strs.length; k++) {
//       String word2 = strs[k];
//       common = "";
//       int i = 0;
//       while (i < word1.length && i < word2.length) {
//         if (word1[i] == word2[i]) {
//           common += word1[i];
//         } else {
//           break;
//         }
//         i++;
//       }
//       word1 = common;
//     }

//     return common;
//   }
// }

// -----------------------------------

// another soluiton

class Solution {
  String longestCommonPrefix(List<String> strs) {
    String commonPrefix = strs.first;
    for (final word in strs) {
      while (!word.startsWith(commonPrefix)) {
        commonPrefix = commonPrefix.substring(0, commonPrefix.length - 1);
      }
    }
    return commonPrefix;
  }
}
