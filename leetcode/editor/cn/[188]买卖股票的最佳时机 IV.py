import math
from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def maxProfit(self, k: int, prices: List[int]) -> int:
        n = len(prices)
        # 定义: 第 i 日最多 k 次交易，是否持有的收益
        dp = [[[0, 0] for _ in range(k + 1)] for _ in range(n + 1)]
        for i in range(n + 1):
            dp[i][0][0] = 0
            dp[i][0][1] = -math.inf
        
        for j in range(k + 1):
            dp[0][j][0] = 0
            dp[0][j][1] = -math.inf
        
        for i in range(1, n + 1):
            for j in range(1, k + 1):
                dp[i][j][0] = max(dp[i - 1][j][0], dp[i - 1][j][1] + prices[i - 1])
                dp[i][j][1] = max(dp[i - 1][j][1], dp[i - 1][j - 1][0] - prices[i - 1])
        
        return dp[n][k][0]


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.maxProfit(2, [3, 3, 5, 0, 0, 3, 1, 4]), 6)
