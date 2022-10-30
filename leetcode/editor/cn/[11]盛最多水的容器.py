from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def maxArea(self, height: List[int]) -> int:
        # 边界都是闭的
        left, right, res = 0, len(height) - 1, 0
        while left < right:
            if height[left] < height[right]:
                res = max(res, min(height[left], height[right]) * (right - left))
                left += 1
            else:
                res = max(res, min(height[left], height[right]) * (right - left))
                right -= 1
        
        return res


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7]))
    print(solution.maxArea([1, 1]))
