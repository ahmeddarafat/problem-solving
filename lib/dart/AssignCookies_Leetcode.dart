// Problem Name: Assign Cookies
// Problem Link: https://leetcode.com/problems/assign-cookies/description/

import 'dart:collection';
import 'dart:io';
import 'dart:math' as math;

void main() {}

class Solution {
  int findContentChildren(List<int> g, List<int> s) {
    g.sort();
    s.sort();

    int contentChildren = 0;

    int i = 0;
    int j = 0;
    while (i < g.length && j < s.length) {
      if (s[j] >= g[i]) {
        contentChildren++;
        i++;
      }
      j++;
    }

    return contentChildren;
  }
}
