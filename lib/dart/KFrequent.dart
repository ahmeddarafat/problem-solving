/// Client
void main() {
  final s = Solution();
  print(s.kFrequent([1, 1, 1, 2, 2, 3, 3, 3, 4, 5, 5, 5], 3)); // [1, 3, 5]
}

// -----------------------------------

/// Solution

class Solution {
  List<int> kFrequent(List<int> nums, int k) {
    var map = <int, dynamic>{};
    List<int> list = [];
    for (var n in nums) {
      if (map.containsKey(n)) {
        map[n] += 1;
      } else {
        map[n] = 1;
      }
    }
    map.forEach((key, value) {
      if (value >= k) list.add(key);
    });

    return list;
  }
}
