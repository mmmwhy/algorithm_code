from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def findLength(self, nums1: List[int], nums2: List[int]) -> int:
        # 定义: nums1[:i-1], nums2[:j-j] 的最长公共子数组的长度为 dp[i][j]
        m, n = len(nums1), len(nums2)
        dp = [[0 for _ in range(n + 1)] for _ in range(m + 1)]
        
        for i in range(1, m + 1):
            for j in range(1, n + 1):
                if nums1[i - 1] == nums2[j - 1]:
                    dp[i][j] = dp[i - 1][j - 1] + 1
        
        return max([max(row) for row in dp])


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    
    print(solution.findLength([1, 2, 3, 2, 1], [3, 2, 1, 4]), 3)
    print(solution.findLength([1, 1, 0, 0, 1], [1, 1, 0, 0, 0]), 4)
    print(solution.findLength([0, 0, 0, 0, 1], [1, 0, 0, 0, 0]), 4)
    print(solution.findLength([0, 0, 0, 0, 0], [0, 0, 0, 0, 0]), 5)
    print(solution.findLength([1, 2, 3, 2, 1], [3, 2, 1, 4, 7]), 3)
