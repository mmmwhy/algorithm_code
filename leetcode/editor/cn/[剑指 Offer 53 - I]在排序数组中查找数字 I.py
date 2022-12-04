# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def search(self, nums: List[int], target: int) -> int:
        res = []
        for idx, value in enumerate(nums):
            if target == value:
                res.append(idx)
        return len(res)

# leetcode submit region end(Prohibit modification and deletion)
