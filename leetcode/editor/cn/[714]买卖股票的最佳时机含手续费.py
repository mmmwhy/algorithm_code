import math
from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def maxProfit(self, prices: List[int], fee: int) -> int:
        n = len(prices)
        # dp: 第 i 个时间最多交易 j 次，是否持有股票的收益
        dp = [[0, 0] for _ in range(n + 1)]
        dp[0][1] = -math.inf
        
        for i in range(1, n + 1):
            dp[i][0] = max(dp[i - 1][0], dp[i - 1][1] + prices[i - 1] - fee)
            dp[i][1] = max(dp[i - 1][1], dp[i - 1][0] - prices[i - 1])
        
        return dp[n][0]

# leetcode submit region end(Prohibit modification and deletion)
