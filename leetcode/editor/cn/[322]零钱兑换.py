from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def coinChange(self, coins: List[int], amount: int) -> int:
        m = len(coins)
        
        # 定义 dp，对前 i 个物品，空间 j 的情况下，最少可以凑满的方式
        dp = [[amount + 1 for _ in range(amount + 1)] for _ in range(m + 1)]
        
        # 前 i 个物品，空间 0 的情况下，没有可以凑出来的方法
        for i in range(m + 1):
            dp[i][0] = 0
        
        for i in range(1, m + 1):
            for j in range(1, amount + 1):
                if j - coins[i - 1] < 0:
                    dp[i][j] = dp[i - 1][j]
                else:
                    dp[i][j] = min(dp[i - 1][j], 1 + dp[i][j - coins[i - 1]])
        
        if dp[m][amount] == amount + 1:
            return -1
        else:
            return dp[m][amount]


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.coinChange([1, 2, 5], 11))
    print(solution.coinChange([2], 3))
