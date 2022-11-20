import math
from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        n = len(prices)  # 时间
        
        # 定义 dp 为第 i 个时间点，最多允许交易 j 次，当前状态为有&无持有
        # !!如果交易次数无限制，那么 k 和 k - 1 就没有什么区别!!
        dp = [[0, 0] for _ in range(n + 1)]
        
        # 第0个时间点，不应该持有股票，认为是错误情况
        dp[0][1] = -math.inf
        
        for i in range(1, n + 1):
            # 保持不持有  &  上个时间点持有，但是卖掉了
            dp[i][0] = max(dp[i - 1][0], dp[i - 1][1] + prices[i - 1])
            # 保持持有 & 上个时间点不持有，买入
            dp[i][1] = max(dp[i - 1][1], dp[i - 1][0] - prices[i - 1])
        return dp[n][0]


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.maxProfit([7, 1, 5, 3, 6, 4]), 7)
    print(solution.maxProfit([1, 2, 3, 4, 5]), 4)
    print(solution.maxProfit([7, 6, 4, 3, 1]), 0)
    print(solution.maxProfit([3, 3]))
    print(solution.maxProfit([1, 2]))
