// Problem Name: Dota2 Senate
// Problem Link: https://leetcode.com/problems/dota2-senate/

import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'package:stack/stack.dart';

void main() {
  print(Solution().predictPartyVictory("RD"));
  print(Solution().predictPartyVictory("DDRRR"));
  print(Solution().predictPartyVictory("DDRRR"));
}

// -----------------------------------

// Solution

class Solution {
  String predictPartyVictory(String senate) {
    int length = senate.length;
    while (senate.length > 1) {
      bool isBanned = false;
      bool bannedFromR = false;
      bool isBreak = false;
      for (int i = 0; i < senate.length; i++) {
        switch (senate[i]) {
          case "R":
            if (isBanned && !bannedFromR) {
              senate = senate.replaceRange(i, i + 1, "");
              senate += senate[0];
              senate = senate.replaceRange(0, 1, "");
              isBanned = false;
              isBreak = true;
            } else {
              isBanned = true;
              bannedFromR = true;
            }
            break;
          case "D":
            if (isBanned && bannedFromR) {
              senate = senate.replaceRange(i, i + 1, "");
              senate += senate[0];
              senate = senate.replaceRange(0, 1, "");
              isBanned = false;
              isBreak = true;
            } else {
              isBanned = true;
              bannedFromR = false;
            }
            break;
          default:
            break;
        }
        if (isBreak) {
          break;
        }
      }
      if (length != senate.length) {
        length = senate.length;
      } else {
        break;
      }
    }

    return senate[0] == "R" ? "Radiant" : "Dire";
  }
}
