import math
from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        # dp[时间][交易次数][1/0], 第 i 个时间点上，最多允许交易 j 次的情况下，持有&未持有的最大收益
        # 这里的交易次数是 1
        n = len(prices)
        dp = [[0, 0] for _ in range(n + 1)]
        
        dp[0][0] = 0  # 0 时间，交易 0 次
        dp[0][1] = -math.inf  # 不可能的情况
        
        for i in range(1, n + 1):
            dp[i][0] = max(dp[i - 1][0], dp[i - 1][1] + prices[i - 1])
            dp[i][1] = max(dp[i - 1][1], - prices[i - 1])
        return dp[n][0]


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.maxProfit([7, 6, 4, 3, 1]))
