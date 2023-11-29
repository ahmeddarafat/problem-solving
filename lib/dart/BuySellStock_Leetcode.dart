// Problem Name: Best Time to Buy and Sell Stock
// Problem Link: https://leetcode.com/problems/best-time-to-buy-and-sell-stock/

/// Client
void main() {
  final s = Solution();
  final numbers = [7, 1, 5, 3, 6, 4];

  print(s.maxProfit(numbers));
}

// -----------------------------------

/// Solution (with 2 pointer)
class Solution {
  int maxProfit(List<int> prices) {
    int maxProfit = 0;
    int left = 0, right = 1;

    while (right < prices.length) {
      int currentProfit = 0;
      currentProfit = prices[right] - prices[left];

      if (currentProfit > 0) {
        right++;
        currentProfit > maxProfit ? maxProfit = currentProfit : null;
      } else {
        left = right;
        right++;
      }
    }
    return maxProfit;
  }
}
