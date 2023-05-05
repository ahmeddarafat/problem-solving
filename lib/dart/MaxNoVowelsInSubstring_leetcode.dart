// Problem Name: Maximum Number of Vowels in a Substring of Given Length
// Problem Link: https://leetcode.com/problems/maximum-number-of-vowels-in-a-substring-of-given-length/

import 'dart:ffi';
import 'dart:io';
import 'dart:math' as math;
import 'package:stack/stack.dart';

void main() {
  print(Solution().maxVowels('rhythms', 4));
  print(Solution().maxVowels('aeiou', 2));
  print(Solution().maxVowels('leetcode', 3));
}

// -----------------------------------

// Solution

class Solution {
  // maybe, It will be better, if you use hashTable
  List vowels = ["a", "e", "i", "o", 'u'];
  int maxVowels(String s, int k) {
    int max = 0;
    int currentMax = 0;
    for (int i = 0; i < s.length; i++) {
      if (vowels.contains(s[i])) {
        currentMax++;
      }
      if (i >= k && vowels.contains(s[i - k])) {
        currentMax--;
      }
      max = math.max(max, currentMax);
    }
    return max;
  }
}

// ----------------------------------------------------

// another solution
//  - To avoid search algorithm at contains methods

class Solution {
  // - the vowels have 1 (a,e,i,o,u)
  List<int> vowels = [1,0,0,0,1,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0];
  int maxVowels(String s, int k) {
    int max = 0;
    int currentMax = 0;
    for (int i = 0; i < s.length; i++) {
        currentMax +=vowels[s[i].codeUnits[0] - "a".codeUnits[0]];

      if (i >= k) {
        currentMax -=vowels[s[i-k].codeUnitAt(0) - "a".codeUnitAt(0)];
      }
      max = math.max(max, currentMax);
    }
    return max;
  }
}
// -----------------------------------

// another soluiton
//   - not working for all cases (when s.length & k are very large)

class Solution {
  List vowels = ["a","e","i","o",'u'];
  int maxVowels(String s, int k) {
    int max = 0;
    for(int i = 0; i<s.length-k+1;i++){
      int currentMax = 0;
      for(int j= 0; j<k;j++){
        if(vowels.contains(s[i+j])){
          currentMax++;
        }
      }
      max = math.max(max, currentMax);
    }
    return max;
  }
}
