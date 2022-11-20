import math
from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        n = len(prices)
        # 定义，第i天最多交易k的情况下，是否持有的收益，但因为这里k是无穷的，所以不用考虑
        dp = [[0, 0] for _ in range(n + 1)]
        
        dp[0][1] = -math.inf
        for i in range(1, n + 1):
            dp[i][0] = max(dp[i - 1][0], dp[i - 1][1] + prices[i - 1])
            dp[i][1] = max(dp[i - 1][1], dp[i - 2][0] - prices[i - 1])  # 卖出后的冷冻期
        return dp[n][0]

# leetcode submit region end(Prohibit modification and deletion)
