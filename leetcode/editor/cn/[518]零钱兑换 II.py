from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def change(self, amount: int, coins: List[int]) -> int:
        m = len(coins)
        
        # 定义 dp，对前 i 个物品，空间 j 的情况下，有多少种凑满的方式
        dp = [[0 for _ in range(amount + 1)] for _ in range(m + 1)]
        
        for i in range(m + 1):
            # 只要不选择任何钱币，就可以凑出 0，这里不存在「目标和」问题中的负号情况。
            dp[i][0] = 1
        
        for i in range(1, m + 1):
            for j in range(1, amount + 1):
                if j - coins[i - 1] < 0:
                    dp[i][j] = dp[i - 1][j]
                else:
                    # 凑满方式分为：不使用第 i 个物品的凑满 + 使用第 i 个物品的凑满
                    dp[i][j] = dp[i - 1][j] + dp[i][j - coins[i - 1]]
        return dp[m][amount]


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.change(5, [1, 2, 5]))
    print(solution.change(3, [2]))
    print(solution.change(10, [10]))
