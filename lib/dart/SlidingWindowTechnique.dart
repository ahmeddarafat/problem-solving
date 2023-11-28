/// Client
void main() {
  final s1 = Solution1();
  final s2 = Solution2();
  final numbers = [1, 2, 4, 10, 2, 3, 0, 1, 20];

  print(s1.getMaxSublist(numbers, 4));
  print(s2.getMaxSublist(numbers, 4));
}

// -----------------------------------

/// 1st Solution (without sliding window technique)
/// - Big O : O(n^2)
class Solution1 {
  int getMaxSublist(List<int> numbers, int k) {
    if (k > numbers.length) return -1;
    int max = 0;

    for (int i = 0; i < numbers.length - k + 1; i++) {
      int currentMax = 0;

      for (int j = 0; j < k; j++) {
        currentMax += numbers[i + j];
      }

      currentMax > max ? max = currentMax : null;
    }

    return max;
  }
}

/// 2nd Solution (with sliding window technique)
/// - Big O : O(n)
class Solution2 {
  int getMaxSublist(List<int> numbers, int k) {
    if (k > numbers.length) return -1;
    int max = 0;
    int sumWindow = 0;

    for (int i = 0; i < k; i++) {
      max += numbers[i];
    }
    sumWindow = max;

    for (int i = 0; i < numbers.length - k; i++) {
      sumWindow = sumWindow - numbers[i] + numbers[i + k];
      sumWindow > max ? max = sumWindow : null;
    }

    return max;
  }
}
