from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def findLengthOfLCIS(self, nums: List[int]) -> int:
        max_length = 1
        
        temp_length = 1
        for index, num in enumerate(nums):
            if index == 0:
                continue
            if num > nums[index - 1]:
                temp_length += 1
            else:
                temp_length = 1
            
            max_length = max(max_length, temp_length)
        return max_length
# leetcode submit region end(Prohibit modification and deletion)
