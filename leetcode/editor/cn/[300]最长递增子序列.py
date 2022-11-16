from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def lengthOfLIS(self, nums: List[int]) -> int:
        dp = [1] * (len(nums) + 1)
        for idx in range(1, len(nums)):
            temp_idx = idx - 1
            while temp_idx >= 0:
                if nums[temp_idx] < nums[idx]:
                    dp[idx] = max(dp[idx], dp[temp_idx] + 1)
                
                temp_idx -= 1
        return max(dp)


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.lengthOfLIS([1, 3, 6, 7, 9, 4, 10, 5, 6]))
    print(solution.lengthOfLIS([10, 9, 2, 5, 3, 7, 101, 18]))
    print(solution.lengthOfLIS([0, 1, 0, 3, 2, 3]))
    print(solution.lengthOfLIS([7, 7, 7, 7, 7, 7, 7]))
