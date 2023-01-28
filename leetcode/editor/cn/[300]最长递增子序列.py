from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def lengthOfLIS(self, nums: List[int]) -> int:
        # dp[i] 截止到 i 位置最长递增子序列长度是多少
        n = len(nums)
        dp = [1] * n
        
        for i in range(n):
            # 对于每一个位置 i，如果其之前的某个位置 j 所对应的数字小于位置 i 所对应的数字
            for j in range(i):
                if nums[j] < nums[i]:
                    dp[i] = max(dp[i], dp[j] + 1)
        
        return max(dp)


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.lengthOfLIS([1, 3, 6, 7, 9, 4, 10, 5, 6]))
    print(solution.lengthOfLIS([10, 9, 2, 5, 3, 7, 101, 18]))
    print(solution.lengthOfLIS([0, 1, 0, 3, 2, 3]))
    print(solution.lengthOfLIS([7, 7, 7, 7, 7, 7, 7]))
