import math
from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def minSubArrayLen(self, target: int, nums: List[int]) -> int:
        # left、right 都是闭合区间
        left, right, sum_nums = 0, 0, nums[0]
        min_length = math.inf
        
        while right < len(nums):
            if sum_nums >= target:
                min_length = min(min_length, right - left + 1)
                sum_nums -= nums[left]
                left += 1
            else:
                right += 1
                if right < len(nums):
                    sum_nums += nums[right]  # 闭合区间
        
        if min_length == math.inf:
            # 没有成功的迭代
            return 0
        
        return min_length


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.minSubArrayLen(7, [2, 3, 1, 2, 4, 3]))
    print(solution.minSubArrayLen(4, [1, 4, 4]))
    print(solution.minSubArrayLen(11, [1, 1, 1, 1, 1, 1, 1, 1]))
    # 11, 14, 9, 16, 10, 20
    print(solution.minSubArrayLen(80,
                                  [10, 5, 13, 4, 8, 4, 5, 11, 14, 9, 16, 10, 20, 8]))
