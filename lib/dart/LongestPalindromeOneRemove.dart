
/// Problem: Given a string s, return true if the s can be palindrome after removing at most one character from it.
/// palindrome is a word that reads the same backward as forward.
/// Example: "atmmlt" => true  ||  remove 'a' => "tmlmt" or remove 'l' => "tmamt"
/// Example: "atmmltt" => false 

import 'dart:collection';
import 'dart:io';
import 'dart:math' as math;

void main() {}

class Solution {
  bool longestPalindromeWithOneRemove(String s) {
    if (s.length == 1) return true;

    final letters = HashMap<String, int>();
    for (var char in s.split('')) {
      if (letters.containsKey(char)) {
        letters[char] = letters[char]! + 1;
      } else {
        letters[char] = 1;
      }
    }

    int numberOfOdds = 0;
    for (var char in letters.keys) {
      if (letters[char]!.isOdd) {
        numberOfOdds++;
      }
    }

    return numberOfOdds < 3;
  }
}
