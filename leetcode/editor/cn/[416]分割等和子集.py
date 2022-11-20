from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def canPartition(self, nums: List[int]) -> bool:
        nums_sum = sum(nums)
        half_sum = nums_sum // 2
        if half_sum * 2 != nums_sum:
            return False
        
        m = len(nums)
        # dp 定义：对于前 i 个物品(从1开始)，空间 j 的情况下，是否可以放满
        dp = [[False for _ in range(half_sum + 1)] for _ in range(m + 1)]
        for i in range(m + 1):
            dp[i][0] = True
        
        for i in range(1, m + 1):
            for j in range(1, half_sum + 1):
                if j - nums[i - 1] < 0:
                    dp[i][j] = dp[i - 1][j]
                else:
                    dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - nums[i - 1]])
        return dp[m][half_sum]


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    print(solution.canPartition([1, 5, 11, 5]))
    print(solution.canPartition([1, 2, 3, 5]))
