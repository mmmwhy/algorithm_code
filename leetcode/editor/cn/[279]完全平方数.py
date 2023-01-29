# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def numSquares(self, n: int) -> int:
        # 定义 dp[i] 为数字 i 需要的完全平方数的最小数量
        dp = [999999 for _ in range(n + 1)]
        dp[0] = 0
        
        # 当前 i 的值，仅依赖于 i - k^2，比如 i - 4、i - 9 、 i - 16
        for i in range(1, n + 1):
            # 可以取到 i
            for j in range(1, i + 1):
                if j * j > i:
                    break
                dp[i] = min(dp[i], dp[i - j * j] + 1)
        return dp[n]


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    print(solution.numSquares(1), 1)
    print(solution.numSquares(12), 3)
    print(solution.numSquares(13), 2)
