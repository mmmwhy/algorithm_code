from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def findDuplicate(self, nums: List[int]) -> int:
        used_pos = [0] * len(nums)
        for i in nums:
            if used_pos[i] == 0:
                used_pos[i] = 1
            else:
                return i


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    print(solution.findDuplicate([1, 3, 4, 2, 2]))
    print(solution.findDuplicate([3, 1, 3, 4, 2]))
    print(solution.findDuplicate([2, 2, 2, 2, 2, 2]))
