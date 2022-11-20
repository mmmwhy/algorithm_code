import math
from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        n = len(prices)
        # 定义， 第 i 个时间点，最多允许交易 2 次下的收益
        dp = [[[0, 0] for _ in range(3)] for _ in range(n + 1)]
        
        for i in range(n + 1):
            dp[i][0][0] = 0  # 没有交易、也没有股票
            dp[i][0][1] = -math.inf  # 没有交易的时候，持有股票
        
        for j in range(3):
            dp[0][j][0] = 0  # 第 0 个时间点，未持有股票
            dp[0][j][1] = -math.inf  # 第 0 个时间点，不应持有股票
        
        for i in range(1, n + 1):
            for j in range(1, 3):
                dp[i][j][0] = max(dp[i - 1][j][0], dp[i - 1][j][1] + prices[i - 1])
                dp[i][j][1] = max(dp[i - 1][j][1], dp[i - 1][j - 1][0] - prices[i - 1])
        
        return dp[n][2][0]


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.maxProfit([3, 3, 5, 0, 0, 3, 1, 4]), 6)
    print(solution.maxProfit([1, 2, 3, 4, 5]), 4)
    print(solution.maxProfit([7, 6, 4, 3, 1]), 0)
    print(solution.maxProfit([1]), 0)
