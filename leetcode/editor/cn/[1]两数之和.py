from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        for idx, value in enumerate(nums):
            target_value = target - value
            for another_idx, another_value in enumerate(nums[idx + 1:]):
                if another_value == target_value:
                    return [idx, idx + 1 + another_idx]


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.twoSum([3, 2, 4], 6))
