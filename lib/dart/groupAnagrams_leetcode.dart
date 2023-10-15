// Problem Name: Group Anagrams
// Problem Link: https://leetcode.com/problems/group-anagrams/

void main() {
  final s = Solution();
  print(s.groupAnagrams(["eaaddddddddddt","tea","tan","ate","nat","bat"]));
  print(s.groupAnagrams(["bdddddddddd", "bbbbbbbbbbc"]));
}

// -----------------------------------

/// Solution

class Solution {
  List<List<String>> groupAnagrams(List<String> strs) {
    var map = <String, List<String>>{};
    for (var str in strs) {
      String code = getCode(str);
      if (map.containsKey(code)) {
        map[code]!.add(str);
      } else {
        map[code] = [str];
      }
    }

    return List.of(map.values, growable: false);
  }

  String getCode(String s) {
    final counter = List.filled(26, 0);

    for (int i = 0; i < s.length; i++) {
      counter[s[i].codeUnitAt(0) - 'a'.codeUnitAt(0)]++;
    }
    return counter.join(",");
  }
}
