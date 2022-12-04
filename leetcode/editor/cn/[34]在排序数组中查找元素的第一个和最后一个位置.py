from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def searchRange(self, nums: List[int], target: int) -> List[int]:
        res = []
        for idx, value in enumerate(nums):
            if target == value:
                res.append(idx)
        if len(res) > 0:
            return [res[0], res[-1]]
        else:
            return [-1, -1]


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.searchRange([5, 7, 7, 8, 8, 10], 8), [3, 4])
    print(solution.searchRange([5, 7, 7, 8, 8, 10], 5), [0, 0])
    print(solution.searchRange([5, 7, 7, 8, 8, 10], 6), [-1, -1])
    print(solution.searchRange([], 0), [-1, -1])
