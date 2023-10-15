// Problem Name: Top K Frequent Elements
// Problem Link: https://leetcode.com/problems/top-k-frequent-elements/

/// Client
void main() {
  final s = Solution();
  print(s.topKFrequent([1, 1, 1, 2, 2, 3], 2)); // [1,2]
}

// -----------------------------------

/// Solution

/// - bucket sort
class Solution {
  List<int> topKFrequent(List<int> nums, int k) {
    final result = <int>[];
    final valueCount = <int, dynamic>{};
    final bucket = List.generate(nums.length, (_) => <int>[]);

    for (int n in nums) {
      valueCount[n] = 1 + (valueCount[n] ?? 0);
    }

    for (int k in valueCount.keys) {
      bucket[valueCount[k] - 1].add(k);
    }

    for (int i = bucket.length - 1; i >= 0; i--) {
      for (final n in bucket[i]) {
        result.add(n);
        if (result.length == k) return result;
      }
    }
    return [];
  }
}
